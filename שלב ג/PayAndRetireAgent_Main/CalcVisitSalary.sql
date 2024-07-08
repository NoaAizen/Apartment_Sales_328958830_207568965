CREATE OR REPLACE PROCEDURE calc_visit_salary1(
    p_start_date IN DATE,
    p_end_date IN DATE,
    p_agent_id IN NUMBER,
    p_visit_salary OUT NUMBER,
    p_ref_cursor OUT SYS_REFCURSOR
)
IS
    -- Variables to hold intermediate results
    v_visit_count NUMBER := 0;
    v_visit_rate NUMBER := 0;

    -- Cursor for counting visits
    CURSOR visit_cursor IS
        SELECT COUNT(*) AS visit_count
        FROM Visit
        WHERE Agent_ID = p_agent_id
        AND Date_of_visit BETWEEN p_start_date AND p_end_date;

    -- Cursor for getting visit rate
    CURSOR rate_cursor IS
        SELECT Visit_Rate
        FROM Agent_Person
        WHERE Agent_ID = p_agent_id;

BEGIN
    -- Open and fetch from the visit cursor
    OPEN visit_cursor;
    FETCH visit_cursor INTO v_visit_count;
    CLOSE visit_cursor;

    -- Open and fetch from the rate cursor
    OPEN rate_cursor;
    FETCH rate_cursor INTO v_visit_rate;
    CLOSE rate_cursor;

    -- Calculate the visit salary
    p_visit_salary := v_visit_count * v_visit_rate;

    -- Open the ref cursor for the visits
    OPEN p_ref_cursor FOR
        SELECT *
        FROM Visit
        WHERE Agent_ID = p_agent_id
        AND Date_of_visit BETWEEN p_start_date AND p_end_date;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_visit_salary := 0; -- Return 0 if no data found
        OPEN p_ref_cursor FOR SELECT * FROM Visit WHERE 1=0; -- Return an empty cursor
    WHEN OTHERS THEN
        RAISE; -- Raise any other exceptions
END;
/


-- Usage Example
DECLARE
    v_start_date DATE := TO_DATE('01/01/2000', 'MM/DD/YYYY');
    v_end_date DATE := TO_DATE('01/01/2020', 'MM/DD/YYYY');
    v_agent_id NUMBER := 999;  -- Example agent ID
    v_visit_salary NUMBER;
    v_ref_cursor SYS_REFCURSOR;
    v_visit_record Visit%ROWTYPE; -- Record to hold each visit row
BEGIN
    -- Call the procedure
    calc_visit_salary1(v_start_date, v_end_date, v_agent_id, v_visit_salary, v_ref_cursor);

    -- Output the visit salary
    DBMS_OUTPUT.PUT_LINE('Visit Salary: ' || v_visit_salary);

    -- Close the cursor
    CLOSE v_ref_cursor;
END;
/
