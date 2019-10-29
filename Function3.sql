--CREATE FUNCTION IsAgeUnderXYear(@dob nvarchar(max), @x int)
--RETURNS bit
--AS
--EXTERNAL NAME AgeCalculator.Calculator.IsAgeUnderXYear

CREATE FUNCTION GetYear(@ethiopianDate nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME EthiopianToGregorian.DateConverter.GetYear

--select case when dbo.GetMonth(null)=2006 then 1 else 0 end
--select dbo.EthiopianToGregorian(null)