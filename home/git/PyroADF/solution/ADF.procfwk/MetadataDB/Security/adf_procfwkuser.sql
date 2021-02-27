DROP ROLE IF EXISTS [adf_procfwkuser]
GO

CREATE ROLE [adf_procfwkuser];
GO

GRANT 
	EXECUTE, 
	SELECT
ON SCHEMA::[procfwk] TO [adf_procfwkuser];
GO