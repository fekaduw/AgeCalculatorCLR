CREATE FUNCTION IsAgeUnderXYear(@dob nvarchar(max), @x int)
RETURNS bit
AS
EXTERNAL NAME AgeCalculator.Calculator.IsAgeUnderXYear

CREATE FUNCTION AgeCalculator(@dob nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME AgeCalculator.Calculator.AgeCalculator

CREATE FUNCTION IsAgeUnder6Months(@dob nvarchar(max))
RETURNS bit
AS
EXTERNAL NAME AgeCalculator.Calculator.IsAgeUnder6Months

--CREATE FUNCTION IsAgeUnderXYear(@dob nvarchar(max), @y int)
--RETURNS bit
--AS
--EXTERNAL NAME AgeCalculator.Calculator.IsAgeUnderXYear

CREATE FUNCTION IsAgeBetweenXAndYYears(@dob nvarchar(max), @x int, @y int)
RETURNS bit
AS
EXTERNAL NAME AgeCalculator.Calculator.IsAgeBetweenXAndYYears

--select dbo.IsAgeUnder6Months('29/1/2007'), 1)