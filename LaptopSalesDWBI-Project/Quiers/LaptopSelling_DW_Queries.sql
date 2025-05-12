-- Procedure for DimLaptopBrand table

CREATE PROCEDURE dbo.UpdateDimLaptopBrand
    @Brand_ID INT,
    @Brand_Name NVARCHAR(50),
    @Country NVARCHAR(50)
   
AS
BEGIN
    -- Check if the record exists
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.DimLaptopBrand
        WHERE AlternateBrandID = @Brand_ID
    )
    BEGIN
        -- Insert new record
        INSERT INTO dbo.DimLaptopBrand (
            AlternateBrandID,
            Brand_Name,
	    Country,
            InsertedDate,
            ModifiedDate
        )
        VALUES (
            @Brand_ID,
            @Brand_Name,
            @Country,
            GETDATE(),
            GETDATE()
        );
    END
    ELSE
    BEGIN
        -- Update only if data has changed
        UPDATE dbo.DimLaptopBrand
        SET
            Brand_Name = @Brand_Name,
            Country = @Country,
            ModifiedDate = GETDATE()
        WHERE
            AlternateBrandID = @Brand_ID
            AND (
                Brand_Name <> @Brand_Name
                OR Country <> @Country
               
            );
    END
END;



select * from Dbo.DimLaptopBrand;

update Laptop_Selling_Staging_DB.dbo.StgLaptopBrand
set
    Country = 'China'
WHERE 
    Brand_ID = 7;





-- Procedure for DimLaptopModel table

CREATE PROCEDURE dbo.UpdateDimLaptopModel
    @Model_ID INT,
    @Brand_ID INT,
    @Model_Name NVARCHAR(50),
    @Processor_Type NVARCHAR(50),
    @RAM_Size NVARCHAR(50), 
    @Storage_Size NVARCHAR(50),
    @Screen_Size NVARCHAR(50)
   
AS
BEGIN
    -- Check if the record exists
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.DimLaptopModel
        WHERE AlternateModelID = @Model_ID
    )
    BEGIN
        -- Insert new record
        INSERT INTO dbo.DimLaptopModel (
            AlternateModelID,
            BrandKey,
            Model_Name,
            Processor_Type,
            RAM_Size,
            Storage_Size,
            Screen_Size,
            InsertedDate,
            ModifiedDate
        )
        VALUES (
            @Model_ID,
            @Brand_ID,
            @Model_Name,
            @Processor_Type,
            @RAM_Size, 
            @Storage_Size,
            @Screen_Size,
            GETDATE(),
            GETDATE()
        );
    END
    ELSE
    BEGIN
        -- Update only if data has changed
        UPDATE dbo.DimLaptopModel
        SET
            BrandKey = @Brand_ID,
            Model_Name = @Model_Name,
            Processor_Type = @Processor_Type, 
            RAM_Size = @RAM_Size,
            Storage_Size = @Storage_Size,
            Screen_Size = @Screen_Size,
            ModifiedDate = GETDATE()
        WHERE
            AlternateModelID = @Model_ID
            AND (
                  BrandKey <> @Brand_ID OR
                  Model_Name <> @Model_Name OR
                  Processor_Type <> @Processor_Type OR
                  RAM_Size <> @RAM_Size OR
                  Storage_Size <> @Storage_Size OR
                  Screen_Size <> @Screen_Size
               
            );
    END
END;



select * from Dbo.DimLaptopModel;

update Laptop_Selling_Staging_DB.dbo.StgLaptopModel
set
    RAM_Size = '16GB'
WHERE 
    Model_ID = 10;





-- Procedure for DimStore table

CREATE PROCEDURE dbo.UpdateDimStore
    @Store_ID INT,
    @Store_Location NVARCHAR(50),
    @Store_Manager NVARCHAR(50),
    @Store_Phone INT  
AS
BEGIN
    -- Check if the record exists
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.DimStore 
        WHERE AlternateStoreID = @Store_ID
    )
    BEGIN
        -- Insert new record
        INSERT INTO dbo.DimStore (
            AlternateStoreID,
            Store_Location,
            Store_Manager,
            Store_Phone,
            InsertedDate,
            ModifiedDate
        )
        VALUES (
            @Store_ID,
            @Store_Location,
            @Store_Manager,
            @Store_Phone,
            GETDATE(),
            GETDATE()
        );
    END
    ELSE
    BEGIN
        -- Update only if data has changed
        UPDATE dbo.DimStore
        SET
            Store_Location = @Store_Location,
            Store_Manager = @Store_Manager,
            Store_Phone = @Store_Phone,
            ModifiedDate = GETDATE()
        WHERE
            AlternateStoreID = @Store_ID
            AND (
                Store_Location <> @Store_Location
                OR Store_Manager <> @Store_Manager
                OR Store_Phone <> @Store_Phone
            );
    END
END;


select * from Dbo.DimStore;

update Laptop_Selling_Staging_DB.dbo.StgStore
set
    Store_Location = 'Malabe'
WHERE 
    Store_ID = 6;





-- DimCustomer

select * from dbo.DimCustomer;

update Laptop_Selling_Staging_DB.dbo.StgCustomer
set
    Address = '111, Kandy Road, Malabe'
WHERE 
    Customer_ID = 1

select * from dbo.DimCustomer
where AlternateCustomerID = 1;

update Laptop_Selling_Staging_DB.dbo.StgCustomer
set
    Phone_Number = 77111111
WHERE 
    Customer_ID = 2;

select * from dbo.DimCustomer
where AlternateCustomerID = 2;





-- DimLaptop

select * from dbo.DimLaptop;
select * from Laptop_Selling_Staging_DB.dbo.StgLaptop

update Laptop_Selling_Staging_DB.dbo.StgLaptop
set
    Price = 16000.00
WHERE 
    Laptop_ID = 1;

select * from dbo.DimLaptop
where AlternateLaptopID = 1;

update Laptop_Selling_Staging_DB.dbo.StgLaptop
set
    Discount = 7
WHERE 
    Laptop_ID = 2;

select * from dbo.DimLaptop
where AlternateLaptopID = 2;

update Laptop_Selling_Staging_DB.dbo.StgLaptop
set
    Price = 17840.00 , Discount = 3
WHERE 
    Laptop_ID = 3;

select * from dbo.DimLaptop
where AlternateLaptopID = 3;





-- DimSupplier

select * from dbo.DimSupplier;

update Laptop_Selling_Staging_DB.dbo.StgSupplierDetails
set
    Supplier_Rating = 4.5
WHERE 
    Supplier_ID = 1;

select * from dbo.DimSupplier
where AlternateSupplierID = 1;





-- FactSalesTransaction

select * from dbo.FactSalesTransaction




-- Step 6: ETL development – Accumulating fact tables

alter table dbo.FactSalesTransaction
add
    accm_txn_create_time datetime null,
    accm_txn_complete_time datetime null,
    txn_process_time_hours int null;

select * from dbo.FactSalesTransaction;

create table Laptop_Selling_Staging_DB.dbo.TxnUpdateData (
	AlternateTransactionID int PRIMARY KEY,
    accm_txn_complete_time datetime
);

insert into Laptop_Selling_Staging_DB.dbo.TxnUpdateData (AlternateTransactionID, accm_txn_complete_time)
values 
    (1, '2025-05-14 09:15:00'),
    (2, '2025-05-16 02:30:00'),
	(3, '2025-05-22 11:11:00');
	

insert into Laptop_Selling_Staging_DB.dbo.TxnUpdateData (AlternateTransactionID, accm_txn_complete_time)
values 
    (4, '2025-05-29 12:00:00');

insert into Laptop_Selling_Staging_DB.dbo.TxnUpdateData (AlternateTransactionID, accm_txn_complete_time)
values 
    (10, '2025-06-09 10:00:00');

select * from Laptop_Selling_Staging_DB.dbo.TxnUpdateData;

select * from dbo.FactSalesTransaction;































