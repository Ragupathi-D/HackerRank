/*
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT 
    company.company_code,
    any_value(company.founder),
    count( distinct lead_manager.lead_manager_code ),
    count( distinct senior_manager.senior_manager_code ),
    count( distinct manager.manager_code ),
    count( distinct employee.employee_code )

FROM company
INNER JOIN
    lead_manager USING ( company_code )
INNER JOIN 
    senior_manager USING ( company_code, lead_manager_code )
INNER JOIN 
    manager USING ( company_code, lead_manager_code, senior_manager_code )
INNER JOIN
    employee USING ( company_code, lead_manager_code, senior_manager_code, manager_code )
GROUP BY company.company_code
