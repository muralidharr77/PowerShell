$excelFile = "C:\dumps\projects\PS_Scripts\convertExceltoCSV\" + "IAR" + ".xlsx"
    $E = New-Object -ComObject Excel.Application
    $E.Visible = $false
    $E.DisplayAlerts = $false
    $wb = $E.Workbooks.Open($excelFile)
    foreach ($ws in $wb.Worksheets)
    {
        $n = $excelFileName + "_" + $ws.Name
        $ws.SaveAs("C:\dumps\projects\PS_Scripts\convertExceltoCSV\" + $n + ".csv", 6)
    }
    $E.Quit()