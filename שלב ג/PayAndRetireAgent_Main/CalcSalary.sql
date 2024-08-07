CREATE OR REPLACE FUNCTION calc_salary(p_start_date DATE, p_end_date DATE, p_agent_id NUMBER)
RETURN NUMBER
IS
    v_visit_salary NUMBER;
    v_sale_salary NUMBER;
    v_ref_cursor SYS_REFCURSOR;
    v_visit_record Visit%ROWTYPE; -- Record to hold each visit row
BEGIN
    -- Call the calc_visit_salary procedure
    calc_visit_salary1(p_start_date, p_end_date, p_agent_id, v_visit_salary, v_ref_cursor);
    
    -- Print the visit salary value
    DBMS_OUTPUT.PUT_LINE('Visit Salary: ' || v_visit_salary);
    
    -- Close the ref cursor
    CLOSE v_ref_cursor;

    -- Call the calc_sale_salary function
    v_sale_salary := calc_sale_salary(p_start_date, p_end_date, p_agent_id);
    
    -- Print the sale salary value
    DBMS_OUTPUT.PUT_LINE('Sale Salary: ' || v_sale_salary);
    
    -- Return the sum of both salaries
    RETURN v_visit_salary + v_sale_salary;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Handle any other exceptions
        IF v_ref_cursor%ISOPEN THEN
            CLOSE v_ref_cursor;
        END IF;
        RAISE;
END;
/

--Usage example

DECLARE
    v_start_date DATE := TO_DATE('01/01/2000', 'MM/DD/YYYY');
    v_end_date DATE := TO_DATE('01/01/2030', 'MM/DD/YYYY');
    v_agent_id NUMBER := 999;
    v_total_salary NUMBER;
BEGIN
    v_total_salary := calc_salary(v_start_date, v_end_date, v_agent_id);
    DBMS_OUTPUT.PUT_LINE('Total Salary for Agent ' || v_agent_id || ' from ' || v_start_date || ' to ' || v_end_date || ': ' || v_total_salary);
END;
/

