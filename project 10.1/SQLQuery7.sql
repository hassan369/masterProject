/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[name]
      ,[email]
      ,[password]
      ,[isAdmin]
      ,[imgSrc]
  FROM [goalproject].[dbo].[users]