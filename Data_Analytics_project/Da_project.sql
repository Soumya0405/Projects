use Bank;
select * from finance_1;
 -- Year wise loan amount Stats
SELECT
  YEAR(STR_TO_DATE(issue_d, "%b-%yy")) AS 'Years',
  SUM(loan_amnt) AS 'Loan Amount'
FROM Finance_1
GROUP BY Years
ORDER BY Years;

-- Grade and sub grade wise revol_bal
SELECT 
    Finance_1.Sub_grade,
    SUM(f_2.revol_bal) as 'Total Revol Bal'
FROM Finance_1
JOIN f_2 ON Finance_1.ï»¿id = f_2.ï»¿id
GROUP BY Finance_1.Sub_grade
ORDER BY Finance_1.Sub_grade;


-- Total Payment for Verified Status Vs Total Payment for Non Verified Status
Select
    finance_1.Verification_status,
    ROUND(SUM(f_2.total_pymnt)) as `Total Payment`
FROM finance_1
JOIN f_2 ON finance_1.ï»¿id = f_2.ï»¿id
WHERE finance_1.verification_status IN ('Verified', 'Not Verified')
GROUP BY finance_1.Verification_status;


-- State wise and month wise loan status
SELECT addr_state, last_credit_pull_d, MAX(loan_status) AS loan_status
FROM Finance_1
INNER JOIN F_2 ON Finance_1.ï»¿id= F_2.ï»¿id
GROUP BY addr_state, last_credit_pull_d
ORDER BY addr_state;


-- Home ownership Vs last payment date stats
Select
YEAR(STR_TO_DATE(f_2.last_pymnt_d, "%b-%yy")) as 'Years'
,finance_1.home_ownership
,round(sum(f_2.last_pymnt_amnt)) as 'Total_Payment'
from finance_1 join f_2 on finance_1.ï»¿id = f_2.ï»¿id
where finance_1.home_ownership in ('RENT', 'MORTGAGE', 'OWN')
group by finance_1.home_ownership, years
having round(sum(f_2.last_pymnt_amnt)) != 0
order by YEAR(STR_TO_DATE(f_2.last_pymnt_d, "%b-%yy")), round(sum(f_2.last_pymnt_amnt)) desc;

