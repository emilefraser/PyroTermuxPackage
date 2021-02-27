CREATE TABLE [Stats].[Scores] (
    [testid]    VARCHAR (10) NOT NULL,
    [studentid] VARCHAR (10) NOT NULL,
    [score]     TINYINT      NOT NULL,
    CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED ([testid] ASC, [studentid] ASC),
    CONSTRAINT [CHK_Scores_score] CHECK ([score]>=(0) AND [score]<=(100)),
    CONSTRAINT [FK_Scores_Tests] FOREIGN KEY ([testid]) REFERENCES [Stats].[Tests] ([testid])
);


GO
CREATE NONCLUSTERED INDEX [idx_nc_testid_score]
    ON [Stats].[Scores]([testid] ASC, [score] ASC);

