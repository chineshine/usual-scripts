param(
    [String]$workspace,
    [switch]$useCurrent
    )
if($useCurrent){
    $workspace=Get-Location
}
if([String]::IsNullOrEmpty($workspace)){
    throw "you should define the workspace which script should work"
}

#Set-Location -Path $workspace

"remove *.iml files which belong to idea"
ls $workspace | Where-Object {$_.BaseName -like "*.iml"} | rm -Force
