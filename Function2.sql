CREATE FUNCTION GetDay(@ethiopianDate nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME EthiopianGregorianDate.DateConverter.GetDay --EthiopianToGregorian

CREATE FUNCTION GetMonth(@ethiopianDate nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME EthiopianGregorianDate.DateConverter.GetMonth --EthiopianToGregorian

CREATE FUNCTION GetYear(@ethiopianDate nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME EthiopianGregorianDate.DateConverter.GetYear --EthiopianToGregorian

CREATE FUNCTION EthiopianToGregorian(@ethiopianDate nvarchar(max))
RETURNS datetime
AS
EXTERNAL NAME EthiopianGregorianDate.DateConverter.EthiopianToGregorian

CREATE FUNCTION GregorianToEthiopian(@gregorianDate nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME EthiopianGregorianDate.DateConverter.GregorianToEthiopian


--select case when dbo.GetDay(null)=2006 then 1 else 0 end
--select dbo.EthiopianToGregorian('5/7/2007')
--select dbo.GetDay('2/13/2007')
--select dbo.GregorianToEthiopian('7/21/2015')