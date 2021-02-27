CREATE TABLE [Sales].[Shippers] (
    [shipperid]   INT           IDENTITY (1, 1) NOT NULL,
    [companyname] NVARCHAR (40) NOT NULL,
    [phone]       NVARCHAR (24) NOT NULL,
    CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED ([shipperid] ASC)
);

