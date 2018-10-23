
$BasePath = "E:\SDS\UAT\"
$BasePathPublish = $BasePath + "WorkWeb\"

$env:Path += ";C:\Program Files (x86)\MSBuild\12.0\Bin\"

$errorType = "none"

#CMJSService

if (Test-Path ($BasePath + "DataAccess\CMJSService\obj\Debug\Package\CMJSService.zip"))
{   
    Write-Host "Cleaning Build"
    Remove-Item ($BasePath + "DataAccess\CMJSService\obj\Debug\Package\CMJSService.zip")
}

msbuild ($BasePath + "DataAccess\CMJSService\CMJSService.csproj") /t:Package /p:DeployIisAppPath="Default Web Site/CMJSService"

if (Test-Path ($BasePathPublish + "CMJSService.zip"))
{
    Write-Host "Cleaning Package"
    Remove-Item ($BasePathPublish + "CMJSService.zip")
}

Write-Host "Copying"

if (Test-Path ($BasePath + "DataAccess\CMJSService\obj\Debug\Package\CMJSService.zip"))
{
    Write-Host "Build Successfull"
    Copy-Item ($BasePath + "DataAccess\CMJSService\obj\Debug\Package\CMJSService.zip") ($BasePath + "WorkWeb\")
}
else
{
    Write-Host "Build Failed"
    $errorType = "Build CMJSService fail"
}

#CMCentral

if($errorType -eq "none")
{

if (Test-Path ($BasePath + "CMCentral\CMCentral\obj\Debug\Package\CMCentralWebApplication.zip"))
{   
    Write-Host "Cleaning Build"
    Remove-Item ($BasePath + "CMCentral\CMCentral\obj\Debug\Package\CMCentralWebApplication.zip")
}

msbuild ($BasePath + "CMCentral\CMCentral\CMCentralWebApplication.csproj") /t:Package /p:DeployIisAppPath="Default Web Site/Web"

if (Test-Path ($BasePathPublish + "CMCentralWebApplication.zip"))
{
    Write-Host "Cleaning Package"
    Remove-Item ($BasePathPublish + "CMCentralWebApplication.zip")
}

Write-Host "Copying"

if (Test-Path ($BasePath + "CMCentral\CMCentral\obj\Debug\Package\CMCentralWebApplication.zip"))
{
    Write-Host "Build Successfull"
    Copy-Item ($BasePath + "CMCentral\CMCentral\obj\Debug\Package\CMCentralWebApplication.zip") ($BasePath + "WorkWeb\")
}
else
{
    Write-Host "Build Failed"
    $errorType = "Build CMCentral fail"
}

}

#App

if($errorType -eq "none")
{

if (Test-Path ($BasePath + "cmMobile\Publish\obj\Debug\Package\website.zip"))
{   
    Write-Host "Cleaning Build"
    Remove-Item ($BasePath + "cmMobile\Publish\obj\Debug\Package\website.zip")
}

$PublishAppPath = $BasePath + "cmMobile\Publish\"

msbuild ($BasePath + "cmMobile\cmMobile.WebSite\website.publishproj") /t:Package /p:DeployIisAppPath="Default Web Site/App" /p:OutputPath="$PublishAppPath"

if (Test-Path ($BasePathPublish + "website.zip"))
{
    Write-Host "Cleaning Package"
    Remove-Item ($BasePathPublish + "website.zip")
}

Write-Host "Copying"

if (Test-Path ($BasePath + "cmMobile\Publish\obj\Debug\Package\website.zip"))
{
    Write-Host "Build Successfull"
    Copy-Item ($BasePath + "cmMobile\Publish\obj\Debug\Package\website.zip") ($BasePath + "WorkWeb\")
}
else
{
    Write-Host "Build Failed"
    $errorType = "Build App fail"
}

}

#CmMobile.JSService

if($errorType -eq "none")
{

if (Test-Path ($BasePath + "cmMobile\cmMobile.JSService\obj\Debug\Package\cmMobile.JSService.zip"))
{   
    Write-Host "Cleaning Build"
    Remove-Item ($BasePath + "cmMobile\cmMobile.JSService\obj\Debug\Package\cmMobile.JSService.zip")
}

msbuild ($BasePath + "cmMobile\cmMobile.JSService\cmMobile.JSService.csproj") /t:Package /p:DeployIisAppPath="Default Web Site/cmMobile.JSService"

if (Test-Path ($BasePathPublish + "cmMobile.JSService.zip"))
{
    Write-Host "Cleaning Package"
    Remove-Item ($BasePathPublish + "cmMobile.JSService.zip")
}

Write-Host "Copying"

if (Test-Path ($BasePath + "cmMobile\cmMobile.JSService\obj\Debug\Package\cmMobile.JSService.zip"))
{
    Write-Host "Build Successfull"
    Copy-Item ($BasePath + "cmMobile\cmMobile.JSService\obj\Debug\Package\cmMobile.JSService.zip") ($BasePath + "WorkWeb\")
}
else
{
    Write-Host "Build Failed"
    $errorType = "Build cmMobile.JSService fail"
}

}


if (Test-Path ($BasePathPublish + "BuildWeb.zip"))
{
    Write-Host "Cleaning Final Zip"
    Remove-Item ($BasePathPublish + "BuildWeb.zip")
}

if($errorType -eq "none")
{
    Write-Host "Compressing"
    Compress-Archive -LiteralPath ($BasePathPublish + "aws-windows-deployment-manifest.json") , ($BasePathPublish + "CMJSService.zip"), ($BasePathPublish + "CMCentralWebApplication.zip"), ($BasePathPublish + "website.zip"), ($BasePathPublish + "cmMobile.JSService.zip"), ($BasePathPublish + "DefaultWebSite.zip"), ($BasePathPublish + "SDS.GenericAPI.Service.zip"), ($BasePathPublish + ".ebextensions"), ($BasePathPublish + "project.json") -CompressionLevel Optimal -DestinationPath ($BasePathPublish + "BuildWeb.zip")
    Write-Host "Build OK"
}
else
{
    Write-Host $errorType
}
 