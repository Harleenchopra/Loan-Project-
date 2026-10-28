USE Loan;
GO

SELECT 
    dp.name AS DatabaseUser,
    dp.type_desc AS UserType
FROM sys.database_principals dp
WHERE dp.name = 'harleenchopra0';