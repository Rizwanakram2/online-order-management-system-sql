use OnlineOrderDB;

Create or Alter trigger trg_low_stock_alert
on products
after update
as 
BEGIN 
    Insert into StockAlert(productId,ProductName,CurrentStock,  AlertMessage)
    SELECT 
        ProductID,
        ProductName,
        stock_Quantity,
        'Stock is low for product ' + ProductName + '. Current stock is ' + CAST(stock_Quantity AS varchar(10)) + '. Please restock.'
    FROM inserted
    WHERE Stock_Quantity < 10;
END;
Go

Update products
Set stock_Quantity = 5
Where ProductID = 1;

drop TRIGGER trg_low_stock_alert;
Select * from StockAlert;
select * from Products;