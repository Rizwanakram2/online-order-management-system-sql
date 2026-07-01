use OnlineOrderDB;

select * from Products;

create or alter trigger max_stock_level
on Products
after UPDATE,INSERT
AS
begin
IF EXISTS(select 1 from Products where Stock_QUANTITY > 100)
 BEGIN
 RAISERROR ('we can not keep over stock', 16,1)
 ROLLBACK
 END
 end;

 update Products
 SET Stock_QUANTITY= 101 where ProductID=3;

 drop trigger max_stock_level