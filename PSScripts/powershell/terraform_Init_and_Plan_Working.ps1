Write-Host "Terraform init Starting" 

Start-Job -Name Job1 -ScriptBlock {terraform init}
        
    Wait-Job -Name Job1

    
    terraform plan 
   
   Start-Sleep -Seconds 45

   Terraform apply -auto-approve