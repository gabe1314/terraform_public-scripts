Start-Transcript -path "E:\terraform\logs\terraformSDSLoginUAT.log" -append

Write-Host "Terraform init Starting" 

Start-Job -Name Job1 -ScriptBlock {terraform init} {Get-ExecutionPolicy} | Set-ExecutionPolicy -Force
        
    Wait-Job -Name Job1
      
Write-Host "Terraform Plan Starting" 
  Start-Job -Name Job2 -ScriptBlock {terraform plan}

    Wait-Job -Name Job2
  
 Write-Host "Terraform Applying changes, Please be patient while the changes are being made"
    terraform apply -auto-approve
    
       
    Stop-Transcript
echo "$(Get-Date -format T) - Terraform Updated"