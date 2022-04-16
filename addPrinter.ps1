# initialize
$COMPUTERS = @()
$done = $false

# enter PC name
Write-Host "Type and enter 'done', after last entry"
while ($done -eq $false){
    $readIn = Read-Host "Enter PC Name "
    if ($readIn -eq "done"){
        $done = $true # get ready to exit loop
        break        
    }
    elseif (!$readIn){
    # do nothing, don't add to $COMPUTERS array if the input is empty   
    }
    else {
        $COMPUTERS += $readIn # add to array
    }
}

# shows computers in array
$COMPUTERS

# enter printer name
$printer = Read-Host "Enter Printer Name "

# make function that uses nslookup or ping to ensure the PC is online/exists before proceeding, if not then remove it from the $COMPUTERS array

# action to take on PCs
$addRemove = Read-Host "1. Add Printer to PCs `n2. Remove Printer from PCs `n"

if ($addRemove -eq "1"){
    # add printer
    foreach ($computer in $COMPUTERS){
        # add network printers to remote computers
        printui /ga /c\\$computer /n$printer
    }
    Write-Host $printer "added to:" $COMPUTERS
}
else {
    # remove printer
    foreach($computer in $COMPUTERS){
        # remove network printers to remote computers
        printui /gd /c\\$computer /n$printer
    }
    Write-Host $printer "removed from:" $COMPUTERS
}

<#
# need to fix because it doesn't show which remote hosts
foreach ($computer in $COMPUTERS){
    printui /ge /c\\$computer
}
#>

pause