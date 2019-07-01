param([string] $ZipFilePath)

Add-Type -AssemblyName System.IO.Compression.FileSystem

#$ZipFilePath
  
$zipfile= Get-ChildItem -Path  $ZipFilePath      -Name *.zip

#$zipfile


foreach ($1file in $zipfile)

{
    
    #$1file
    $Zipfile=$ZipFilePath +"\"+$1file
    #expand archice works for Version 5.0 onwwards.
    #Expand-Archive -Path $ZipFilePath\$1file -DestinationPath $ZipFilePath
    [System.IO.Compression.ZipFile]::ExtractToDirectory($Zipfile, $ZipFilePath)

    $String = $1file
    #$Regex = [Regex]::new("(?<=_)(.*)(?=.zip)")
    #$Match = $Regex.Match($String)
    #if($Match.Success)
     #   {  $datepart=$Match.Value
      #  }
    

     $start=$String.IndexOf("_")
     $end=$String.IndexOf(".zip")
     $datepart=$String.Substring($start+1,($end-$start)-1)
     #$datepart

    $filePath=Get-ChildItem -Path $ZipFilePath\*.TSV  -Name 

    foreach ($file in $filePath)
        {
        $newfile=$file.Substring(0,$file.Length-4)
        $newfile="Epsilon_" + $newfile + "_"+ $datepart +".TSV1"
        ren  $ZipFilePath\$file  $ZipFilePath\$newfile
        }

}

$filePath1=Get-ChildItem -Path $ZipFilePath\*.TSV1 -Name

    foreach ($file1 in $filePath1)
        {
        #$file1
        $newfile1=$file1.Substring(0,$file1.Length-5)
        #$newfile1
        $newfile1=$newfile1 + ".TSV"
        #$newfile1
        ren  $ZipFilePath\$file1  $ZipFilePath\$newfile1
        }

