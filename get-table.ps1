# Must be run on server with sql invoke-sqlcmd enabled
# This example grabs thread activity from MSDB and dumps it to a CSV in the same directory
# Requires SQL server snapins

Add-PSSnapin SqlServerCmdletSnapin100
Add-PSSnapin SqlServerProviderSnapin100

$SQLquery =@"

select * from sys.dm_os_threads

"@

$result = invoke-sqlcmd -query $SQLquery -serverinstance "SERVER" -database MSDB
$result |export-csv THREADLIST.csv -notypeinformation