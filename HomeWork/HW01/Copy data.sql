DBCC CLONEDATABASE ('AdventureWorks', 'AdventureWorksClone');
go

USE [master];
GO
ALTER DATABASE [AdventureWorksClone] SET READ_WRITE WITH NO_WAIT;
GO

/*Export - Import wizard*/

USE [AdventureWorksClone];
GO