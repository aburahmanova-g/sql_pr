use POJECT

create table customers (
    customerid int primary key,
    fullname varchar(100),
    dob date,
    email varchar(100),
    phonenumber varchar(20),
    address varchar(200),
    nationalid varchar(20),
    taxid varchar(20),
    employmentstatus varchar(50),
    annualincome numeric(12,2),
    createdat date,
    updatedat date
);
create table accounts (
    accountid int primary key,
    customerid int,
    accounttype varchar(30),
    balance numeric(14,2),
    currency varchar(3),
    status varchar(20),
    branchid int,
    createddate date
);
create table transactions (
    transactionid int primary key,
    accountid int,
    transactiontype varchar(30),
    amount numeric(14,2),
    currency varchar(3),
    transactiondate timestamp,
    status varchar(20),
    country varchar(50)
);
create table branches (
    branchid int primary key,
    branchname varchar(100),
    address varchar(200),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    managerid int,
    contactnumber varchar(20)
);
create table employees (
    employeeid int primary key,
    branchid int,
    fullname varchar(100),
    position varchar(50),
    department varchar(50),
    salary numeric(14,2),
    hiredate date,
    status varchar(20)
);
create table creditcards (
    cardid int primary key,
    customerid int,
    cardnumber varchar(20),
    cardtype varchar(20),
    cvv varchar(5),
    expirydate date,
    creditlimit numeric(14,2),
    status varchar(20)
);
create table creditcardtransactions (
    transactionid int primary key,
    cardid int,
    merchant varchar(100),
    amount numeric(14,2),
    currency varchar(3),
    transactiondate timestamp,
    status varchar(20)
);
create table onlinebankingusers (
    userid int primary key,
    customerid int,
    username varchar(50),
    passwordhash varchar(200),
    lastlogin timestamp
);
create table billpayments (
    paymentid int primary key,
    customerid int,
    billername varchar(100),
    amount numeric(14,2),
    paymentdate date,
    status varchar(20)
);
create table mobilebankingtransactions (
    transactionid int primary key,
    customerid int,
    deviceid varchar(50),
    appversion varchar(20),
    transactiontype varchar(30),
    amount numeric(14,2),
    transactiondate timestamp
);
create table loans (
    loanid int primary key,
    customerid int,
    loantype varchar(30),
    amount numeric(14,2),
    interestrate numeric(5,2),
    startdate date,
    enddate date,
    status varchar(20)
);
create table loanpayments (
    paymentid int primary key,
    loanid int,
    amountpaid numeric(14,2),
    paymentdate date,
    remainingbalance numeric(14,2)
);
create table creditscores (
    customerid int primary key,
    creditscore int,
    updatedat date
);
create table debtcollection (
    debtid int primary key,
    customerid int,
    amountdue numeric(14,2),
    duedate date,
    collectorassigned varchar(100)
);
create table kyc (
    kycid int primary key,
    customerid int,
    documenttype varchar(50),
    documentnumber varchar(50),
    verifiedby varchar(100)
);
create table frauddetection (
    fraudid int primary key,
    customerid int,
    transactionid int,
    risklevel varchar(20),
    reporteddate date
);
create table amlcases (
    caseid int primary key,
    customerid int,
    casetype varchar(50),
    status varchar(20),
    investigatorid int
);
create table regulatoryreports (
    reportid int primary key,
    reporttype varchar(50),
    submissiondate date
);
create table departments (
    departmentid int primary key,
    departmentname varchar(100),
    managerid int
);
create table salaries (
    salaryid int primary key,
    employeeid int,
    basesalary numeric(14,2),
    bonus numeric(14,2),
    deductions numeric(14,2),
    paymentdate date
);
create table employeeattendance (
    attendanceid int primary key,
    employeeid int,
    checkintime datetime,
    checkouttime datetime,
    totalhours numeric(5,2)
);
create table investments (
    investmentid int primary key,
    customerid int,
    investmenttype varchar(50),
    amount numeric(14,2),
    roi numeric(5,2),
    maturitydate date
);
create table stocktradingaccounts (
    accountid int primary key,
    customerid int,
    brokeragefirm varchar(100),
    totalinvested numeric(14,2),
    currentvalue numeric(14,2)
);
create table foreignexchange (
    fxid int primary key,
    customerid int,
    currencypair varchar(10),
    exchangerate numeric(10,4),
    amountexchanged numeric(14,2)
);
create table insurancepolicies (
    policyid int primary key,
    customerid int,
    insurancetype varchar(50),
    premiumamount numeric(14,2),
    coverageamount numeric(14,2)
);
create table claims (
    claimid int primary key,
    policyid int,
    claimamount numeric(14,2),
    status varchar(20),
    fileddate date
);
create table useraccesslogs (
    logid int primary key,
    userid int,
    actiontype varchar(50),
    logtimestamp timestamp
);
create table cybersecurityincidents (
    incidentid int primary key,
    affectedsystem varchar(100),
    reporteddate date,
    resolutionstatus varchar(50)
);
create table merchants (
    merchantid int primary key,
    merchantname varchar(100),
    industry varchar(50),
    location varchar(100),
    customerid int
);
create table merchanttransactions (
    transactionid int primary key,
    merchantid int,
    amount numeric(14,2),
    paymentmethod varchar(30),
    transactiondate date
);

create table #numbers (
    n int
);

insert into #numbers (n) values
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),
(16),(17),(18),(19),(20);

insert into customers (
    customerid, fullname, dob, email, phonenumber,
    address, nationalid, taxid, employmentstatus,
    annualincome, createdat, updatedat
)
select
    row_number() over (order by (select null)) as customerid,
    'customer ' + cast(row_number() over (order by (select null)) as varchar),
    '1985-01-01',
    'customer' + cast(row_number() over (order by (select null)) as varchar) + '@mail.com',
    '998900000' + right('0000' + cast(row_number() over (order by (select null)) as varchar),4),
    'tashkent',
    'nid' + cast(row_number() over (order by (select null)) as varchar),
    'tin' + cast(row_number() over (order by (select null)) as varchar),
    'employed',
    15000,
    '2023-01-01',
    '2023-01-01'
from #numbers n1
cross join #numbers n2
cross join #numbers n3
where (n1.n * 100 + n2.n * 10 + n3.n) <= 2000;

insert into accounts (
    accountid,
    customerid,
    accounttype,
    balance,
    currency,
    status,
    branchid,
    createddate
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    case when rn % 2 = 0 then 'checking' else 'savings' end,
    10000,
    'usd',
    'active',
    ((rn - 1) % 10) + 1,
    '2023-01-01'
from (
    select
        row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 4000;

insert into transactions (
    transactionid,
    accountid,
    transactiontype,
    amount,
    currency,
    status,
    country
)
select
    rn,
    ((rn - 1) % 4000) + 1,
    case rn % 4
        when 0 then 'deposit'
        when 1 then 'withdrawal'
        when 2 then 'transfer'
        else 'payment'
    end,
    12000,
    'usd',
    'completed',
    'ref' + cast(rn as varchar)
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 10000;

insert into branches (
    branchid,
    branchname,
    city,
    country
)
select
    rn,
    'branch ' + cast(rn as varchar),
    'city ' + cast(rn as varchar),
    'uzbekistan'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers
) t
where rn <= 10;

insert into employees (
    employeeid, branchid,
    fullname, position,
    department, salary,
    hiredate, status
)
select
    rn,
    ((rn - 1) % 10) + 1,
    'employee ' + cast(rn as varchar),
    'officer',
    'retail',
    1000,
    '2020-01-01',
    'active'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
) t
where rn <= 100;

insert into creditcards (
    cardid, customerid,
    cardnumber, cardtype,
    cvv, expirydate,
    creditlimit, status
)
select
    rn,
    rn,
    '400000000000' + right('0000' + cast(rn as varchar),4),
    'visa',
    '123',
    '2027-12-31',
    5000,
    'active'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;

insert into creditcardtransactions (
    transactionid, cardid,
    merchant, amount,
    currency, status
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    'merchant ' + cast(rn as varchar),
    300,
    'usd',
    'completed'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 10000;

insert into onlinebankingusers (
    userid, customerid,
    username, passwordhash
)
select
    rn,
    rn,
    'user' + cast(rn as varchar),
    'hash123'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into onlinebankingusers (
    userid,
    customerid,
    username,
    passwordhash
)
select
    rn + isnull((select max(userid) from onlinebankingusers), 0),
    rn,
    'user' + cast(rn + isnull((select max(userid) from onlinebankingusers), 0) as varchar),
    'hash123'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into mobilebankingtransactions (
    transactionid, customerid,
    deviceid, appversion,
    transactiontype, amount
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    'android',
    '1.0.0',
    'transfer',
    500
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 8000;
insert into loans (
    loanid,
    customerid,
    loantype,
    amount,
    interestrate,
    startdate,
    enddate,
    status
)
select
    rn,
    rn,
    case rn % 4
        when 0 then 'mortgage'
        when 1 then 'personal'
        when 2 then 'auto'
        else 'business'
    end,
    20000,
    18,
    '2023-01-01',
    '2026-01-01',
    case when rn % 3 = 0 then 'closed' else 'active' end
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into loanpayments (
    paymentid,
    loanid,
    amountpaid,
    paymentdate,
    remainingbalance
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    1000,
    '2023-02-01',
    19000
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 4000;

insert into creditscores (
    customerid,
    creditscore,
    updatedat
)
select
    rn,
    600 + (rn % 150),
    '2024-01-01'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into debtcollection (
    debtid,
    customerid,
    amountdue,
    duedate,
    collectorassigned
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    3000,
    '2024-06-01',
    'collection team'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
) t
where rn <= 500;
insert into kyc (
    kycid,
    customerid,
    documenttype,
    documentnumber,
    verifiedby
)
select
    rn,
    rn,
    'passport',
    'p' + cast(rn as varchar),
    'kyc officer'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into frauddetection (
    fraudid,
    customerid,
    transactionid,
    risklevel,
    reporteddate
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    ((rn - 1) % 10000) + 1,
    case when rn % 2 = 0 then 'high' else 'medium' end,
    '2024-01-10'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 1000;
insert into amlcases (
    caseid,
    customerid,
    casetype,
    status,
    investigatorid
)
select
    rn,
    ((rn - 1) % 2000) + 1,
    'suspicious activity',
    'open',
    ((rn - 1) % 100) + 1
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
) t
where rn <= 300;
insert into regulatoryreports (
    reportid,
    reporttype,
    submissiondate
)
select
    rn,
    'monthly report',
    '2024-01-31'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers
) t
where rn <= 50;

insert into departments (
    departmentid,
    departmentname,
    managerid
)
select
    rn + isnull((select max(departmentid) from departments), 0),
    'department ' + cast(rn + isnull((select max(departmentid) from departments), 0) as varchar),
    rn
from (
    select row_number() over (order by (select null)) as rn
    from #numbers
) t
where rn <= 10;
insert into salaries (
    salaryid,
    employeeid,
    basesalary,
    bonus,
    deductions,
    paymentdate
)
select
    rn + isnull((select max(salaryid) from salaries), 0),
    rn,
    1000,
    200,
    50,
    '2024-01-31'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
) t
where rn <= 100;
insert into employeeattendance (
    attendanceid,
    employeeid,
    checkintime,
    checkouttime,
    totalhours
)
select
    rn + isnull((select max(attendanceid) from employeeattendance), 0),
    ((rn - 1) % 100) + 1,
    '2024-01-10 09:00:00',
    '2024-01-10 18:00:00',
    9
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 2000;
insert into investments (
    investmentid,
    customerid,
    investmenttype,
    amount,
    roi,
    maturitydate
)
select
    rn + isnull((select max(investmentid) from investments), 0),
    ((rn - 1) % 2000) + 1,
    'fixed deposit',
    5000,
    7,
    '2026-12-31'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 1500;
insert into stocktradingaccounts (
    accountid,
    customerid,
    brokeragefirm,
    totalinvested,
    currentvalue
)
select
    rn + isnull((select max(accountid) from stocktradingaccounts), 0),
    ((rn - 1) % 2000) + 1,
    'global broker',
    10000,
    12000
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 1000;
insert into foreignexchange (
    fxid,
    customerid,
    currencypair,
    exchangerate,
    amountexchanged
)
select
    rn + isnull((select max(fxid) from foreignexchange), 0),
    ((rn - 1) % 2000) + 1,
    'usd/eur',
    0.92,
    1000
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 3000;

insert into insurancepolicies (
    policyid,
    customerid,
    insurancetype,
    premiumamount,
    coverageamount
)
select
    rn + isnull((select max(policyid) from insurancepolicies), 0),
    ((rn - 1) % 2000) + 1,
    'life',
    300,
    20000
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 1200;
insert into claims (
    claimid,
    policyid,
    claimamount,
    status,
    fileddate
)
select
    rn + isnull((select max(claimid) from claims), 0),
    ((rn - 1) % 1200) + 1,
    5000,
    'approved',
    '2024-02-01'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
) t
where rn <= 400;
insert into useraccesslogs (
    logid,
    userid,
    actiontype
)
select
    rn + isnull((select max(logid) from useraccesslogs), 0),
    ((rn - 1) % 2000) + 1,
    'login'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 5000;
insert into cybersecurityincidents (
    incidentid,
    affectedsystem,
    reporteddate,
    resolutionstatus
)
select
    rn + isnull((select max(incidentid) from cybersecurityincidents), 0),
    'online banking',
    '2024-01-20',
    'resolved'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers
) t
where rn <= 50;
insert into merchants (
    merchantid,
    merchantname,
    industry,
    location,
    customerid
)
select
    rn + isnull((select max(merchantid) from merchants), 0),
    'merchant ' + cast(rn + isnull((select max(merchantid) from merchants), 0) as varchar),
    'retail',
    'tashkent',
    ((rn - 1) % 2000) + 1
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
) t
where rn <= 500;
insert into merchanttransactions (
    transactionid,
    merchantid,
    amount,
    paymentmethod,
    transactiondate
)
select
    rn + isnull((select max(transactionid) from merchanttransactions), 0),
    ((rn - 1) % 500) + 1,
    750,
    'card',
    '2024-02-10'
from (
    select row_number() over (order by (select null)) as rn
    from #numbers n1
    cross join #numbers n2
    cross join #numbers n3
    cross join #numbers n4
) t
where rn <= 3000;


--������������� ������� (KPI)

--1. ���-3 ������� � ����� ������� ��������� �������� �� ���� ������
select top 3
    c.customerid,
    c.fullname,
    sum(a.balance) as total_balance
from customers c
join accounts a
    on a.customerid = c.customerid
group by
    c.customerid,
    c.fullname
order by
    total_balance desc;


--2. �������, � ������� ����� ������ ��������� �������
select
    c.customerid,
    c.fullname,
    count(l.loanid) as active_loans
from customers c
join loans l
    on l.customerid = c.customerid
where l.status = 'active'
group by
    c.customerid,
    c.fullname
having count(l.loanid) > 1;


--3. ����������, ���������� ��� �������������
select
    f.fraudid,
    t.transactionid,
    t.amount,
    t.currency,
    t.status,
    f.risklevel
from frauddetection f
join transactions t
    on t.transactionid = f.transactionid;


--4. ����� ����� �������� �������� �� ������� �������
select
    b.branchid,
    b.branchname,
    sum(l.amount) as total_loan_amount
from loans l
join customers c
    on c.customerid = l.customerid
join accounts a
    on a.customerid = c.customerid
join branches b
    on b.branchid = a.branchid
group by
    b.branchid,
    b.branchname
order by
    total_loan_amount desc;


--5. ������� � ����������� �������� ������������ (> 10 000$) ����� ��� �� 1 ���
select distinct
    c.customerid,
    c.fullname
from transactions t1
join transactions t2
on t1.accountid = t2.accountid
   and t1.transactionid <> t2.transactionid
   and abs(datediff(minute, t1.transactiondate, t2.transactiondate)) <= 60
join accounts a
on a.accountid = t1.accountid
join customers c
on c.customerid = a.customerid
where t1.amount > 10000
    and t2.amount > 10000;


--6. �������, ����������� ���������� �� ������ ����� � ������� 10 �����
select distinct
    c.customerid,
    c.fullname
from transactions t1
join transactions t2
    on t1.accountid = t2.accountid
   and t1.transactionid <> t2.transactionid
   and t1.country <> t2.country
   and abs(datediff(minute, t1.transactiondate, t2.transactiondate)) <= 10
join accounts a
    on a.accountid = t1.accountid
join customers c
    on c.customerid = a.customerid;


-- ����� ��� ������� accounts
ALTER TABLE accounts 
ADD CONSTRAINT fk_accounts_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

ALTER TABLE accounts 
ADD CONSTRAINT fk_accounts_branches 
FOREIGN KEY (branchid) REFERENCES branches(branchid);

-- ����� ��� ������� transactions
ALTER TABLE transactions 
ADD CONSTRAINT fk_transactions_accounts 
FOREIGN KEY (accountid) REFERENCES accounts(accountid);

-- ����� ��� ������� employees
ALTER TABLE employees 
ADD CONSTRAINT fk_employees_branches 
FOREIGN KEY (branchid) REFERENCES branches(branchid);

-- ����� ��� ������� creditcards
ALTER TABLE creditcards 
ADD CONSTRAINT fk_creditcards_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� creditcardtransactions
ALTER TABLE creditcardtransactions 
ADD CONSTRAINT fk_cct_creditcards 
FOREIGN KEY (cardid) REFERENCES creditcards(cardid);

-- ����� ��� ������� onlinebankingusers
ALTER TABLE onlinebankingusers 
ADD CONSTRAINT fk_online_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� billpayments
ALTER TABLE billpayments 
ADD CONSTRAINT fk_bill_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� mobilebankingtransactions
ALTER TABLE mobilebankingtransactions 
ADD CONSTRAINT fk_mobile_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� loans
ALTER TABLE loans 
ADD CONSTRAINT fk_loans_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� loanpayments
ALTER TABLE loanpayments 
ADD CONSTRAINT fk_loanpayments_loans 
FOREIGN KEY (loanid) REFERENCES loans(loanid);

-- ����� ��� ������� creditscores
ALTER TABLE creditscores 
ADD CONSTRAINT fk_creditscores_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� debtcollection
ALTER TABLE debtcollection 
ADD CONSTRAINT fk_debt_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� kyc
ALTER TABLE kyc 
ADD CONSTRAINT fk_kyc_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� frauddetection
ALTER TABLE frauddetection 
ADD CONSTRAINT fk_fraud_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

ALTER TABLE frauddetection 
ADD CONSTRAINT fk_fraud_transactions 
FOREIGN KEY (transactionid) REFERENCES transactions(transactionid);

-- ����� ��� ������� amlcases
ALTER TABLE amlcases 
ADD CONSTRAINT fk_aml_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

ALTER TABLE amlcases 
ADD CONSTRAINT fk_aml_employees 
FOREIGN KEY (investigatorid) REFERENCES employees(employeeid);

-- ����� ��� ������� departments
ALTER TABLE departments 
ADD CONSTRAINT fk_dept_employees 
FOREIGN KEY (managerid) REFERENCES employees(employeeid);

-- ����� ��� ������� salaries
ALTER TABLE salaries 
ADD CONSTRAINT fk_salaries_employees 
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

-- ����� ��� ������� employeeattendance
ALTER TABLE employeeattendance 
ADD CONSTRAINT fk_attendance_employees 
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

-- ����� ��� ������� investments
ALTER TABLE investments 
ADD CONSTRAINT fk_investments_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� stocktradingaccounts
ALTER TABLE stocktradingaccounts 
ADD CONSTRAINT fk_stock_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� foreignexchange
ALTER TABLE foreignexchange 
ADD CONSTRAINT fk_fx_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� insurancepolicies
ALTER TABLE insurancepolicies 
ADD CONSTRAINT fk_insurance_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� claims
ALTER TABLE claims 
ADD CONSTRAINT fk_claims_policies 
FOREIGN KEY (policyid) REFERENCES insurancepolicies(policyid);

-- ����� ��� ������� useraccesslogs
ALTER TABLE useraccesslogs 
ADD CONSTRAINT fk_logs_users 
FOREIGN KEY (userid) REFERENCES onlinebankingusers(userid);

-- ����� ��� ������� merchants
ALTER TABLE merchants 
ADD CONSTRAINT fk_merchants_customers 
FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- ����� ��� ������� merchanttransactions
ALTER TABLE merchanttransactions 
ADD CONSTRAINT fk_merchtrans_merchants 
FOREIGN KEY (merchantid) REFERENCES merchants(merchantid);