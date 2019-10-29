CREATE FUNCTION GetEDDInEthiopianCalendar(@LMP nvarchar(max))
RETURNS nvarchar(max)
AS
EXTERNAL NAME PregnantWoman.PregnantWoman.GetEDDInEthiopianCalendar

CREATE FUNCTION GetEDDInGregorianCalendar(@LMP nvarchar(max))
RETURNS datetime
AS
EXTERNAL NAME PregnantWoman.PregnantWoman.GetEDDInGregorianCalendar


--select dbo.GetEDDInEthiopianCalendar('29/1/2007')
--select dbo.GetEDDInGregorianCalendar('1/10/2007') --2016-03-15 00:00:00.000
--select dbo.EthiopianToGregorian('1/4/2008') --2015-05-09 00:00:00.000
--select dbo.EthiopianToGregorian('12/11/2008')
