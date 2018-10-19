Start-Transcript -path "E:\terraform\logs\terraformSDSLoginUAT.log" -append

Write-Host "Terraform init Starting" 

    Start-Job -Name Job1 -ScriptBlock {terraform init -lock=false -input=false}
        
        Wait-Job -Name Job1

Write-Host "Terraform Init completed Successful" 
        
    
Write-Host "Terraform Planning will now start" 
    terraform plan -lock=false -out=tfplan -input=false

    Write-Host "Waiting to Apply"
   Start-Sleep -Seconds 15
    

   Terraform apply -lock=false -input=false tfplan

    Stop-Transcript
echo "$(Get-Date -format T) - Terraform Updated"