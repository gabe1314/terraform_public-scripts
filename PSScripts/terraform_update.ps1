
$BasePath = "F:\SDS\terraform\scripts\environment\C33SDSAppStIP-uat\scripts"


Write-Host "Terraform Update starting"

if (Test-Path ($BasePath + "terraforminit.ps1"))
{
    Write-Host "Terraform init Starting"
    Invoke-Expression -command ($BasePath + "terraforminit.ps1")
}
else
{
    Write-Host "Terraform init Failed"
    $errorType = "Init fail"
}

 