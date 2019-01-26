USE [ContosoRetailDW]
GO

CREATE VIEW [olap].[vDimProduct]
AS
SELECT	[ProductKey] = [ProductKey] +0 
      ,	p.[ProductLabel]
      ,	p.[ProductName]
      ,	p.[ProductDescription]
      ,	p.[Manufacturer]
      ,	p.[BrandName]
      ,	p.[ClassID]
      ,	p.[ClassName]
      ,	p.[StyleID]
      ,	p.[StyleName]
      ,	p.[ColorID]
      ,	p.[ColorName]

	  , s.[ProductSubcategoryKey]
      ,	s.[ProductSubcategoryLabel]
      ,	s.[ProductSubcategoryName]
      ,	s.[ProductSubcategoryDescription]

	  , c. [ProductCategoryKey]
      ,	c.[ProductCategoryLabel]
      ,	c.[ProductCategoryName]
      ,	c.[ProductCategoryDescription]
FROM	
			[dbo].[DimProduct]				AS p
INNER JOIN	[dbo].[DimProductSubcategory]	AS s	
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN	[dbo].[DimProductCategory]		AS c	
	ON s.ProductCategoryKey = c.ProductCategoryKey

------------------------------------------------------------------------------------	
	
	
	CREATE VIEW [vFactInventory]
AS
	SELECT	
		[InventoryKey]
	,	[DateKey]
	,	[StoreKey]
	,	[ProductKey]
	,	[CurrencyKey]
	,	[OnHandQuantity]
	,	[OnOrderQuantity]
	,	[SafetyStockQuantity]
	,	[UnitCost]
	,	[DaysInStock]
	,	[MinDayInStock]
	,	[MaxDayInStock]
	FROM [dbo].[FactInventory]