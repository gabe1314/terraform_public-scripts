Start-Transcript -path "E:\terraform\logs\terraform_Plan.log" -append

#Get Terraform Process 
$terraform = Get-Process terraform -ErrorAction SilentlyContinue
if ($terraform){
#try gracefully first 
$terraform.CloseMainWindow()
#kill after five seconds 
Sleep 5
if (!$terraform.HasExited) {
  $terraform | Stop-Process -Force
  }
 }
 Remove-Variable terraform



Write-Host "Terraform init Starting" 

    Start-Job -Name Job1 -ScriptBlock {terraform init -lock=false -input=false}
        
        Wait-Job -Name Job1

Write-Host "Terraform Init completed Successful" 
