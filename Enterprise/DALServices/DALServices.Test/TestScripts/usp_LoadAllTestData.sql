-- Disable all constraints so we can load data
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

-- Delete all data from tables
DELETE FROM [dbo].[Organization]
DELETE FROM [dbo].[User]
DELETE FROM [dbo].[UserAreaCoverage]
DELETE FROM [dbo].[UserNotification]
DELETE FROM [dbo].[UserContact]
DELETE FROM [dbo].[Location]
DELETE FROM [dbo].[Asset]
DELETE FROM [dbo].[Request]
DELETE FROM [dbo].[WorkOrder]
DELETE FROM [dbo].[WorkOrderItem]
DELETE FROM [dbo].[WorkOrderAssignment]
DELETE FROM [dbo].[ProductCategory]
DELETE FROM [dbo].[Product]
DELETE FROM [generic].[Address]
DELETE FROM [generic].[AddressLocation]
DELETE FROM [generic].[AddressUse_XREF]
DELETE FROM [generic].[Comment]
DELETE FROM [generic].[Event]
DELETE FROM [generic].[File]
DELETE FROM [generic].[Lookup]
DELETE FROM [generic].[LookupGroup]
DELETE FROM [inspection].[Exterior]
DELETE FROM [inspection].[ForSale]
DELETE FROM [inspection].[Inspection]
DELETE FROM [inspection].[Interior]
DELETE FROM [inspection].[Loss]
DELETE FROM [inspection].[Maintenance]
DELETE FROM [inspection].[PropertyDamage]
DELETE FROM [inspection].[Renter]

-- Reseed the identity column starting values
DBCC CHECKIDENT('[dbo].[Organization]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[User]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserAreaCoverage]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserNotification]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserContact]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Location]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Asset]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Request]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[WorkOrder]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[WorkOrderItem]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[WorkOrderAssignment]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[ProductCategory]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Product]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Address]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Comment]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Event]', RESEED, 0)
DBCC CHECKIDENT('[generic].[File]', RESEED, 0)
DBCC CHECKIDENT('[generic].[LookupGroup]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Lookup]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Event]', RESEED, 0)

-- Insert the test data
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Bank of the Outer Galactic Empire', 'BOGE', 3, 1)
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Oort Cloud Savings and Loan',       'OCSL', 3, 1)
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Ronaks Thrifty Mortgage Emporium',  'RTME', 3, 1)

INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'John',    'Carter',    NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'Kantos',  'Kan',       NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'Mors',    'Kajak',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Spiro',   'Agnew',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Donald',  'Rumsfeld',  NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Richard', 'Nixon',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Philip',  'Fry',       NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Hermes',  'Conrad',    NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Bender',  'Rodriguez', NULL, 8, NULL)

INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(1, '75656', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(2, '76021', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(3, '76022', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(4, '75287', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(5, '75227', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(6, '75236', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(7, '75212', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(8, '75220', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(9, '75217', 0)

INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(1, DATEADD(day, -2,  GETDATE()), DATEADD(day, -1, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(1, DATEADD(day, -1,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(2, DATEADD(day, -3,  GETDATE()), DATEADD(day, -2, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(2, DATEADD(day, -2,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(3, DATEADD(day, -4,  GETDATE()), DATEADD(day, -3, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(3, DATEADD(day, -3,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(4, DATEADD(day, -5,  GETDATE()), DATEADD(day, -4, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(4, DATEADD(day, -4,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(5, DATEADD(day, -6,  GETDATE()), DATEADD(day, -5, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(5, DATEADD(day, -5,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(6, DATEADD(day, -7,  GETDATE()), DATEADD(day, -6, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(6, DATEADD(day, -6,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(7, DATEADD(day, -8,  GETDATE()), DATEADD(day, -7, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(7, DATEADD(day, -7,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(8, DATEADD(day, -9,  GETDATE()), DATEADD(day, -8, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(8, DATEADD(day, -8,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(9, DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(9, DATEADD(day, -9,  GETDATE()), NULL)

INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, '8172681301',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, '8172681302',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, 'JCarter@barsoom.com', 32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, '8172681303',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, '8172681304',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, 'KKan@barsoom.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, '8172681305',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, '8172681306',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, 'MKajak@barsoom.com',  32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, '8172681307',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, '8172681308',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, 'SAgnew@imnac.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, '8172681309',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, '8172681310',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, 'DRumsfeld@imnac.com', 32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, '8172681311',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, '8172681312',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, 'RNixon@imnac.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, '8172681313',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, '8172681314',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, 'PFry@rtme.com',       32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, '8172681315',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, '8172681316',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, 'HConrad@rtme.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, '8172681317',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, '8172681318',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, 'BRodriguez@rtme.com', 32, 0)

INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Bank of the Outer Galactic Empire', 'BOGE01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Greater Helium Branch',             'BOGE02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Wastelands Branch',                 'BOGE03', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Oort Cloud Savings and Loan',       'OCSL01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Lower Hades Mercury Branch',        'OCSL02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Rings of Saturn Branch',            'OCSL03', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'Ronaks Thrifty Mortgage Emporium',  'RTME01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'Arlen South Branch',                'RTME02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'North Arlen Branch',                'RTME03', 12)

INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000001', '123456', 18, 'Amy Wong',          '2143453001', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000002', '234567', 18, 'Hubert Farnsworth', '2143453002', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000003', '345678', 18, 'Joe Melman',        '2143453003', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000004', '456789', 18, 'Barbados Slim',     '2143453004', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000005', '567890', 18, 'Jettro Heller',     '2143453005', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000006', '678901', 18, 'Pepper Potts',      '2143453006', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000007', '789012', 18, 'Leo Wong',          '2143453007', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000008', '890123', 18, 'Inez Wong',         '2143453008', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000009', '901234', 18, 'Zapp Brannigan',    '2143453009', NULL, NULL, NULL)

INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -2,  GETDATE()), 'BOGE-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -3,  GETDATE()), 'BOGE-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -4,  GETDATE()), 'BOGE-Req03')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -5,  GETDATE()), 'OCSL-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -6,  GETDATE()), 'OCSL-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -7,  GETDATE()), 'OCSL-Req03')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -8,  GETDATE()), 'RTME-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -9,  GETDATE()), 'RTME-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -10, GETDATE()), 'RTME-Req03')

INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(1, 1, DATEADD(DAY, -2,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(2, 2, DATEADD(DAY, -3,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(3, 3, DATEADD(DAY, -4,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(4, 4, DATEADD(DAY, -5,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(5, 5, DATEADD(DAY, -6,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(6, 6, DATEADD(DAY, -7,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(7, 7, DATEADD(DAY, -8,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(8, 8, DATEADD(DAY, -9,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(9, 9, DATEADD(DAY, -10, GETDATE()))

INSERT INTO [dbo].[ProductCategory]([Name] ,[Code])VALUES('Maintenance', 'MANT')
INSERT INTO [dbo].[ProductCategory]([Name] ,[Code])VALUES('Inspection',  'INSP')

INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Flush Galactic Dust Filtration System',             'MANT01', '123',   150.00,   15.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Reseal Outer Shell Seams with Dark Matter Sealant', 'MANT02', '124',  3700.00,  370.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Replace Power Core Pellets',                        'MANT03', '125', 15000.00,   35.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Resurface Landing Zone',                            'MANT04', '126',   250.00,   25.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Change Life Support Core Modules',                  'MANT05', '127',   735.00,  700.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Airlock',                                   'INSP01', '128',    85.00,    5.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Check Power Core for Radiation Leakage',            'INSP02', '129',  1500.00, 1200.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Life Support Air Filters',                  'INSP03', '130',    25.00,   15.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect BabelFish Tank Filtration System',          'INSP04', '131',   400.00,   40.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Outer Shell for Micro-Black Hole Openings', 'INSP05', '132',   350.00,  300.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Something Clever', 'MAINT01', '132',   350.00,  300.00)

INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  1, 1,   150.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  2, 1,  3700.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  4, 1,   250.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2,  9, 1,   400.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2, 10, 1,   350.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2,  1, 1,   150.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  5, 1,   735.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  6, 1,    85.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  8, 1,    25.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4,  2, 1,  3700.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4,  9, 1,   400.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4, 10, 1,   350.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  1, 1,   150.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  2, 1,  3700.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  3, 1, 15000.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  4, 1,   250.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  5, 1,   735.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  6, 1,    85.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7,  8, 1,    25.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7,  9, 1,   400.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7, 10, 1,   350.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  6, 1,    85.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  7, 1,  1500.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  8, 1,    25.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  3, 1, 15000.00, DATEADD(DAY, -10, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  4, 1,   250.00, DATEADD(DAY, -10, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  9, 1,   400.00, DATEADD(DAY, -10, GETDATE()))

INSERT INTO [dbo].[WorkOrderAssignment] ([WorkOrderID] ,[UserID] ,[EventDate] ,[StatusID]) VALUES(1, 1, '02/03/2013', 1)
INSERT INTO [dbo].[WorkOrderAssignment] ([WorkOrderID] ,[UserID] ,[EventDate] ,[StatusID]) VALUES(1, 2, '02/04/2013', 2)
INSERT INTO [dbo].[WorkOrderAssignment] ([WorkOrderID] ,[UserID] ,[EventDate] ,[StatusID]) VALUES(2, 3, '02/05/2013', 3)
INSERT INTO [dbo].[WorkOrderAssignment] ([WorkOrderID] ,[UserID] ,[EventDate] ,[StatusID]) VALUES(4, 4, '02/06/2013', 4)
INSERT INTO [dbo].[WorkOrderAssignment] ([WorkOrderID] ,[UserID] ,[EventDate] ,[StatusID]) VALUES(5, 5, '02/07/2013', 5)

INSERT INTO [generic].[LookupGroup]([Name])VALUES ('OrganizationStatus')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('OrganizationType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('UserStatus')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LocationType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LocationAddressType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LoanType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('MortgagorType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('AssetAddressType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('UserContactType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('FileType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('CommentType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('AddressUseType')

INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(1,  'Active',       NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(1,  'Inactive',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2,  'Customer',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2,  'Contractor',   NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2,  'Employee',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2,  'Auditor',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2,  'Investor',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(3,  'Active',       NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(3,  'Inactive',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(4,  'Department',   NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(5,  'Billing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(5,  'Mailing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'FHA',          172)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'VA',           173)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'CONVENTIONAL', 174)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'UNINSURED',    175)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'UNKNOWN',      176)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'OTHER',        297)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'PRIV',         298)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'REO',          403)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'FANNIE MAE',   416)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'FREDDIE MAC',  417)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'REVERSE',      456)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6,  'USDA',         717)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(7,  'Mortgagor',	 NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(7,  'Co-Mortgagor', NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8,  'Physical',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8,  'Mailing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8,  'Other',        NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9,  'Phone',        NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9,  'Fax',          NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9,  'EMail',        NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(10, '.doc',         NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(10, '.jpg',         NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(10, '.pdf',         NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(11, 'User',         NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(11, 'Manager',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(11, 'Executive',    NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(11, 'Auditor',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(12, 'Mailing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(12, 'Billing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(12, 'Physical',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(12, 'Personal',     NULL)

INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(1, 24, '123 Asteroid Alley',       '', 'Hallows End',           'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(2, 24, '234 Quaking Bluff Twist',  '', 'New Haven',             'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(3, 24, '345 Honey Acorn Trace',    '', 'Treachers Landing',     'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(4, 24, '456 Turning Rise Estates', '', 'T-Bone Junction',       'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(5, 24, '567 Noble Zephyr Avenue',  '', 'Tetanus',               'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(6, 24, '678 Island Pike Road',     '', 'Angelic Ruins',         'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(7, 24, '789 Big Rabbit Meadow',    '', 'Sanders Gorge',         'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(8, 24, '890 Jagged Squirrel Road', '', 'Roads End',             'TX', '75656')
INSERT INTO [generic].[Address]([ParentID] ,[EntityID] ,[Street] ,[Suite] ,[City] ,[State] ,[Zip])VALUES(9, 24, '901 Blue Island Ridge',    '', 'Scorched Snake Canyon', 'TX', '75656')

INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(1, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(2, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(3, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(4, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(5, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(6, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(7, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(8, 3)
INSERT INTO [generic].[AddressUse_XREF]([AddressID] ,[TypeID])VALUES(9, 3)

INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(1, '123', 'Asteroid Alley',       'Hallows End',           'TX', '75656', 0xE6100000010C7445292158B343408D2AC3B81B2653C0, 39.401127,        -76.595442)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(2, '234', 'Quaking Bluff Twist',  'New Haven',             'TX', '75656', 0xE6100000010CC7F1E8EB9E093E4005227A0819F256C0, 30.0375812,       -91.7827779)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(3, '345', 'Honey Acorn Trace',    'Treachers Landing',     'TX', '75656', 0xE6100000010C0000000075243C4000000080859C54C0, 28.1424102783203, -82.4456481933594)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(4, '456', 'Turning Rise Estates', 'T-Bone Junction',       'TX', '75656', 0xE6100000010C00000040E85D4340000000A0875F53C0, 38.7336502075195, -77.4926528930664)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(5, '567', 'Noble Zephyr Avenue',  'Tetanus',               'TX', '75656', 0xE6100000010C00000040FE184740000000C0FEC65DC0, 46.1952590942383, -119.109298706055)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(6, '678', 'Island Pike Road',     'Angelic Ruins',         'TX', '75656', 0xE6100000010C0000002026774140000000A0DF1C5EC0, 34.930850982666,  -120.451148986816)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(7, '789', 'Big Rabbit Meadow',    'Sanders Gorge',         'TX', '75656', 0xE6100000010CFB761211FE3541407CD11E2FA4EC5DC0, 34.421816,        -119.697521)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(8, '890', 'Jagged Squirrel Road', 'Roads End',             'TX', '75656', 0xE6100000010C7451E3946FB34340FC83EDCC292653C0, 39.4018427,       -76.5963013)
INSERT INTO [generic].[AddressLocation]([AddressID] ,[BuildingNumber] ,[StreetName] ,[City] ,[State] ,[Zip] ,[GeoCode] ,[Lattitude] ,[Longitude])VALUES(9, '901', 'Blue Island Ridge',    'Scorched Snake Canyon', 'TX', '75656', 0xE6100000010C85FE53BB70B343400E7CB19C292653C0, 39.4018778,       -76.5962898)

INSERT INTO [generic].[Comment]([ParentID] ,[EntityID] ,[UserID] ,[TypeID] ,[Value])VALUES(7, 24, 7, 36, 'What a dump.')

INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(1, 24, '\\Resources\2012\12\01', 'picture01.jpg', 150.50, 35, 'Micro-Black Hole Penetrations')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(2, 24, '\\Resources\2012\12\01', 'picture02.jpg', 150.50, 35, 'Nuclear Goo Leakage from Power Core')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(3, 24, '\\Resources\2012\12\01', 'picture03.jpg', 150.50, 35, 'Dead BabelFish in Dirty Tank')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(4, 24, '\\Resources\2012\12\01', 'picture04.jpg', 150.50, 35, 'Dead Renters Due To Bad Life Support')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(5, 24, '\\Resources\2012\12\01', 'picture05.jpg', 150.50, 35, 'Slick Landing Zone')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(6, 24, '\\Resources\2012\12\01', 'picture06.jpg', 150.50, 35, 'Clogged Galactic Dust Filters')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(7, 24, '\\Resources\2012\12\01', 'picture07.jpg', 150.50, 35, 'Worn Outer Shell Seams')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(8, 24, '\\Resources\2012\12\01', 'picture08.jpg', 150.50, 35, 'Missing Outer Shel Seam Seal')
INSERT INTO [generic].[File]([ParentID] ,[EntityID] ,[ParentFolder] ,[Name] ,[Size] ,[TypeID] ,[Caption])VALUES(9, 24, '\\Resources\2012\12\01', 'picture09.jpg', 150.50, 35, 'Ruptured Power Core')

INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (1 ,20 ,30 ,40 ,'02/01/2013') 
INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (2 ,21 ,31 ,41 ,'02/02/2013') 
INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (3 ,22 ,32 ,42 ,'02/03/2013') 
INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (4 ,23 ,33 ,43 ,'02/04/2013') 
INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (5 ,24 ,34 ,44 ,'02/05/2013') 
INSERT INTO [generic].[Event] ([ParentID] ,[EntityID] ,[TypeID] ,[UserID] ,[EventDate]) VALUES (6 ,25 ,35 ,45 ,'02/06/2013') 

--INSERT INTO [inspection].[Exterior]([WorkOrderID] ,[ConstructionType_Lookup] ,[BuildingType_Lookup] ,[Stories_Lookup] ,[PrimaryColor_Lookup] ,[RoofType_Lookup] ,[PoolOnSite] ,[PoolSecured] ,[PoolDrained] ,[DoorTagStatus_Lookup] ,[ContactMade] ,[Occupancy_Lookup] ,[OccupancyVerifiedBy_Lookup] ,[PropertyCondition_Lookup] ,[NeighborhoodCondition_Lookup] ,[EMV_Lookup] ,[Electric_Lookup] ,[Water_Lookup] ,[Gas_Lookup] ,[PersonalPropertyOnSite] ,[IsWinterized] ,[idWinterizedByType] ,[WinterizedDate] ,[HowLongVacant] ,[HazardsExist])VALUES(

--INSERT INTO [inspection].[ForSale]([WorkOrderID] ,[PropertyForSaleBy_Lookup] ,[RealtorName] ,[RealtorPhone] ,[idActiveListing] ,[ListPrice] ,[DaysOnMarket])VALUES(

--INSERT INTO [inspection].[Inspection]([WorkOrderID] ,[DateInserted] ,[TypeID] ,[UserIDCompletedBy])VALUES(

--INSERT INTO [inspection].[Interior]([WorkOrderID] ,[idInteriorStatus] ,[idHeatSource] ,[idPropaneVolume] ,[ContactName] ,[ContactNumber] ,[idMaintained])VALUES(

--INSERT INTO [inspection].[Loss]([WorkOrderID] ,[LossType] ,[LossPercentCompleted] ,[LossCompletedToSatisfaction] ,[LossSatisfactionNotes] ,[LossCompletedRepairs] ,[LossAdditionalRepairsNeeded] ,[LossUnableToCompleteBecause] ,[PercentageCompleted] ,[PercentageCompletedNotes] ,[EstimatedCompletionDate])VALUES(

--INSERT INTO [inspection].[Maintenance]([WorkOrderID] ,[ChangeLocks] ,[ReplaceGlass] ,[BoardSecure] ,[Winterize] ,[CutGrass] ,[GrassHeightInches] ,[DrainPool] ,[RemoveDebris] ,[RecommendedOther])VALUES(

--INSERT INTO [inspection].[PropertyDamage]([WorkOrderID] ,[Vandalized] ,[FireDamage] ,[LiabilityHazard] ,[StormDamage] ,[FloodDamage] ,[FreezeDamage] ,[RoofLeak] ,[Neglected] ,[EarthquakeDamage] ,[CityViolation] ,[Mold] ,[BrokenWindows] ,[BurstPipes] ,[StructuralDamage])VALUES(

--INSERT INTO [inspection].[Renter]([WorkOrderID] ,[RenterName] ,[RenterPhone] ,[RentPaidTo] ,[RentPaidToAddress] ,[RentCurrent] ,[RentAmountMonthly])VALUES(

-- Enable all constraints
EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all'
