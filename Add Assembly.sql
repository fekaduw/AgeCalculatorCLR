EXEC dbo.sp_changedbowner @loginame = N'sa', @map = false

--CREATE ASSEMBLY EthiopianGregorianDate FROM 'D:\Projects\EthioDateConverterCLR\bin\Debug\EthioDateConverterCLR.dll' WITH permission_set = UNSAFE
--CREATE ASSEMBLY AgeCalculator FROM 'D:\Projects\AgeCalculatorCLR\AgeCalculatorCLR\bin\Debug\AgeCalculatorCLR.dll' WITH permission_set = UNSAFE
CREATE ASSEMBLY PregnantWoman FROM 'D:\Projects\PregnantWomanCLR\PregnantWomanCLR\PregnantWomanCLR\bin\Debug\PregnantWomanCLR.dll' WITH permission_set = UNSAFE
