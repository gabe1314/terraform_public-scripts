Start-Transcript -path "E:\terraform\logs\terraform_Plan.log" -append

Write-Host "Terraform init Starting" 

    Start-Job -Name Job1 -ScriptBlock {terraform init -lock=false -input=false}
        
        Wait-Job -Name Job1

Write-Host "Terraform Init completed Successful" 


Write-Host "Terraform Automation Starting" 
    
    if(Get-Content E:\terraform\logs\terraform_Plan.log -Tail 3 | Select-String -Pattern "The process cannot access the file because another process has locked" -AllMatches)
    
    {
 Stop-Process -Name terraform

{

else
}
    
    Write-Host "Terraform Planning will now start" 
        terraform plan -lock=false -out=tfplan -input=false

    Write-Host "Waiting to Apply"
        Start-Sleep -Seconds 15    
        terraform apply tfplan -lock=false -input=false
}
    Stop-Transcript
echo "$(Get-Date -format T) - Terraform Updated"
