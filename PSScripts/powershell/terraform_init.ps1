Start-Transcript -path "E:\terraform\logs\terraformInit.log" -append

Write-Host "Terraform init Starting" 

    Start-Job -Name Job1 -ScriptBlock {terraform init -lock=false -input=false}
        
        Wait-Job -Name Job1

Write-Host "Terraform Init completed Successful" 
        