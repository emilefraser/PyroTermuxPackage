CREATE TABLE [Production].[Categories] (
    [categoryid]   INT            IDENTITY (1, 1) NOT NULL,
    [categoryname] NVARCHAR (15)  NOT NULL,
    [description]  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([categoryid] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_nc_categoryname]
    ON [Production].[Categories]([categoryname] ASC);

