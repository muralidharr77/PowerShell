foreach ($1file in $zipfile)

{
    
    $1file

    Expand-Archive -Path C:\dumps\projects\PS_Scripts\uncompress\datafiles\$1file -DestinationPath C:\dumps\projects\PS_Scripts\uncompress\datafiles


    $String = $1file
    $Regex = [Regex]::new("(?<=_)(.*)(?=.zip)")
    $Match = $Regex.Match($String)
    if($Match.Success)
        {  $datepart=$Match.Value
        }
    $datepart

    $filePath=Get-ChildItem -Path C:\dumps\projects\PS_Scripts\uncompress\datafiles\*.TSV -Name

    foreach ($file in $filePath)
        {
        $newfile=$file.Substring(0,$file.Length-4)
        $newfile="Epsilon_" + $newfile + "_"+ $datepart +".TSV1"
        ren  C:\dumps\projects\PS_Scripts\uncompress\datafiles\$file  C:\dumps\projects\PS_Scripts\uncompress\datafiles\$newfile
        }

}

$filePath1=Get-ChildItem -Path C:\dumps\projects\PS_Scripts\uncompress\datafiles\*.TSV1 -Name

    foreach ($file1 in $filePath1)
        {
        #$file1
        $newfile1=$file1.Substring(0,$file1.Length-5)
        #$newfile1
        $newfile1=$newfile1 + ".TSV"
        #$newfile1
        ren  C:\dumps\projects\PS_Scripts\uncompress\datafiles\$file1  C:\dumps\projects\PS_Scripts\uncompress\datafiles\$newfile1
        }