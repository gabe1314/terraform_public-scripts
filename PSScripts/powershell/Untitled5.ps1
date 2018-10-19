Start-Transcript -path "E:\terraform\l\terraformSDSLoginUAT.log" -append

Write-Host "Terraform init Starting" 

Start-Job -Name Job1 -ScriptBlock {terraform init}
        
    Wait-Job -Name Job1

    Write-Host "Terraform Plan Starting" 
   Start-Job -Name Job2 -ScriptBlock {terraform plan}
   Wait-Job -Name Job2

   

       
    Stop-Transcript
echo "$(Get-Date -format T) - Terraform Updated"