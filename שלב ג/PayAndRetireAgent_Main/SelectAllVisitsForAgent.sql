SELECT Visit.Visit_ID, Visit.Date_of_visit, Visit.Apartment_ID, Apartment_Sale.Sale_ID, Apartment_Sale.Sign_Date, Apartment_Sale.Agent_Fee
FROM Visit
LEFT JOIN Apartment_Sale ON Visit.Visit_ID = Apartment_Sale.Visit_ID
WHERE Visit.Agent_ID = 993
AND Visit.Date_of_visit BETWEEN TO_DATE('01/01/2000', 'MM/DD/YYYY') AND 
TO_DATE('01/01/2030', 'MM/DD/YYYY');
