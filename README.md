# 🏦 Loan Default Analysis — Power BI Dashboard

An end-to-end data analytics project that explores loan applicants' demographic and financial profiles to understand **who borrows, how much they borrow, and who is most likely to default**. The data is stored in **SQL Server** and analysed in **Power BI** using DAX measures, calculated groupings and an interactive three-page report.

---

## 📌 Project Objectives

- Measure the overall **default rate** and how it changes over time
- Identify which **employment types, age groups and credit-score bands** carry the most risk
- Understand how **loan purpose, education, marital status, mortgage and dependents** influence loan amounts
- Track **year-over-year (YoY)** and **year-to-date (YTD)** trends in lending and defaults
- Drill down into loan amounts by **income bracket** and **employment type**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Microsoft SQL Server** (SSMS) | Hosting the `Loan` database and managing user access |
| **Power BI Desktop** | Data modelling, DAX measures and dashboard design |
| **DAX** | Default rates, averages, medians, YoY and YTD calculations |
| **Power Query** | Data cleaning and creating grouped columns |

---

## 📂 Repository Structure

```
├── Project_Loan.pbix         # Power BI report (3 pages)
├── SQLQuery_for_Loan.sql     # SQL Server script for the Loan database
└── README.md
```

---

## 🗃️ Data Model

The model is built around one fact table plus three dedicated measure tables (one per report page) to keep the DAX organised.

| Table | Description |
|-------|-------------|
| `Loan_default` | Main dataset: one row per loan with applicant and loan details |
| `Measure Table 1` | Measures for the *Loan Default & Overview* page |
| `Measure Table 2` | Measures for the *Applicants Demographics & Financial Profile* page |
| `Measure Table 3` | Measures for the *Financial Risk Metrics* page |

**Key fields used:** `LoanAmount`, `LoanPurpose`, `EmploymentType`, `Education`, `MaritalStatus`, `HasMortgage`, `HasDependents`, `Year`

**Custom groupings created:**
- **Age Groups**: applicants bucketed by age (e.g. Adult, Middle-Age Adult)
- **Credit Score Bins**: credit scores grouped into categories
- **Income Bracket**: income grouped into ranges

---

## 🗄️ SQL Server Setup

The data is loaded into a SQL Server database named **`Loan`**, which Power BI connects to as its source.
`SQLQuery_for_Loan.sql` checks that the database user exists in the `Loan` database and shows its user type, so you can confirm the account has access before connecting from Power BI:

```sql
USE Loan;
GO

SELECT
    dp.name      AS DatabaseUser,
    dp.type_desc AS UserType
FROM sys.database_principals dp
WHERE dp.name = '<your_database_user>';
```

---

## 📊 Dashboard Pages

### 1️⃣ Loan Default & Overview
<img width="1161" height="651" alt="image" src="https://github.com/user-attachments/assets/4341e437-abf8-4204-83b0-c5d30eaad125" />

A high-level view of lending activity and default behaviour.
- **Loan Amount by Purpose**
- **Average Income by Employment Type**
- **Default Rate (%) by Employment Type**
- **Average Loan Amount by Age Group**
- **Default Rate (%) by Year**

### 2️⃣ Applicants Demographics & Financial Profile
<img width="1165" height="648" alt="image" src="https://github.com/user-attachments/assets/dfd65103-07fb-479e-993d-8380e192d6ab" />

How applicant characteristics relate to borrowing.
- **Median Loan Amount by Credit Score Category**
- **Average Loan Amount (High Credit Score)** by Marital Status and Age Group (donut chart)
- **Total Loan (Adults) by Credit Score Bins**
- **Loans for Middle-Aged Adults** by Mortgage and Dependents status
- **Number of Loans by Education Type**

### 3️⃣ Financial Risk Metrics
<img width="1163" height="652" alt="image" src="https://github.com/user-attachments/assets/4ea91079-1cca-43dc-9beb-88bd000c8bab" />

Trend and drill-down analysis for risk monitoring.
- **YoY Loan Amount Change (%)**: growth or decline in total lending each year
- **YoY Default Loans Change (%)**: change in the number of defaults each year
- **YTD Loan Amount** by Credit Score Bin and Marital Status (ribbon chart)
- **Decomposition Tree**: total loan amount broken down by Income Bracket → Employment Type

## 🧮 DAX Measures

| Page | Measure |
|------|---------|
| Overview | `Loan Amount by Purpose`, `Average Income by Employment type`, `Default Rate by Employment Type`, `Average Loan by Age Group`, `Default Rate by Year` |
| Demographics | `Median by Credit Score Bins`, `Average Loan Amt (High Credit)`, `Total Loan (credit Bins)`, `Total Loan (Middle Age)`, `Loan by Education Type` |
| Risk Metrics | `YOY Loan Amount Change`, `YOY Default Loans Change`, `YTD Loan Amount` |

---

<!-- Add your LinkedIn / portfolio links -->

⭐ If you found this project useful, consider giving it a star!
