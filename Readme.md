This repo is creating a PowerShell scrip to Automate the Terraform process with a PowerShell Script.  

Currently I'm having an issue with the process locking the terraform.tfstate file which is only happening in Windows. In Mac and Ubunut I can usually use a -lock=false but in Windows this command is not working and will not unlock the process. 



Terraform Init |
        |
        --> Terraform Plan 
                  |
                  |
                  -->-- Terraform Apply 



The Fix I found for this manually is to run the following:

Stop-Process -Name terraform

Once terraform is stopped, I can then run the terraform_Init_and_Plan_ApplyWorking.ps1 successfully. 

The script I'm trying to get working to get working to deal with the below error is Terraform_Automation-Error.ps1. 


Workflow for PowerShell Script 

"If" when you run the Terraform init command there is an error that is recorded to the log file in  E:\terraform\logs\terraform_Plan.log 

Terraform needs to be stopped

or "Else"

Run the Terraform init command and continue the Terraform automation process. 


If 

Terraform Init ->(Has Error in Log) 
                                  |
                                  -> Terraform Stop
                                                  |
                                                  -> Else
                                                        |
                                                         ->
                                                           |
                                                           |
                                                            --> Terraform Plan 
                                                                              |
                                                                              |
                                                                              -->-- Terraform Apply 


____________________________________________________________________

Please help to contribute to this script and I thank you in advance. 
____________________________________________________________________

Error Log
---------


PS F:\sds\terraform\environment\C33SDSWSStIP-uat> F:\SDS\terraform\scripts\powershell\Terraform_plan.ps1
Transcript started, output file is E:\terraform\logs\terraform_Plan.log
Terraform init Starting

Id     Name            PSJobTypeName   State         HasMoreData     Location             Command                  
--     ----            -------------   -----         -----------     --------             -------                  
23     Job1            BackgroundJob   Running       True            localhost            terraform init -lock=f...
1      Job1            BackgroundJob   Completed     True            localhost            terraform init           
3      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
5      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
7      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
9      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
11     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
13     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
15     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
17     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
19     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
21     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
23     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
Terraform Init completed Successful
Terraform Automation Starting
Transcript stopped, output file is E:\terraform\logs\terraform_Plan.log
1:54:06 PM - Terraform Updated



PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform init
terraform : [31mError refreshing state: read terraform.tfstate: The process cannot access the file because another 
process has locked a portion of the file.[0m[0m
At line:1 char:1
+ terraform init
+ ~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31mError refr...e file.[0m[0m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 

PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform init -lock=false -input=false
terraform : [31mError refreshing state: read terraform.tfstate: The process cannot access the file because another 
process has locked a portion of the file.[0m[0m
At line:1 char:1
+ terraform init -lock=false -input=false
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31mError refr...e file.[0m[0m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 

PS F:\sds\terraform\environment\C33SDSWSStIP-uat> F:\SDS\terraform\scripts\powershell\Terraform_plan.ps1
Transcript started, output file is E:\terraform\logs\terraform_Plan.log
Terraform init Starting

Id     Name            PSJobTypeName   State         HasMoreData     Location             Command                  
--     ----            -------------   -----         -----------     --------             -------                  
25     Job1            BackgroundJob   Running       True            localhost            terraform init -lock=f...
1      Job1            BackgroundJob   Completed     True            localhost            terraform init           
3      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
5      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
7      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
9      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
11     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
13     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
15     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
17     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
19     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
21     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
23     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
25     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
Terraform Init completed Successful
Terraform Automation Starting
Transcript stopped, output file is E:\terraform\logs\terraform_Plan.log
1:54:52 PM - Terraform Updated



PS F:\sds\terraform\environment\C33SDSWSStIP-uat> F:\SDS\terraform\scripts\powershell\terraform_init.ps1
Transcript started, output file is E:\terraform\logs\terraformInit.log
Terraform init Starting

Id     Name            PSJobTypeName   State         HasMoreData     Location             Command                  
--     ----            -------------   -----         -----------     --------             -------                  
27     Job1            BackgroundJob   Running       True            localhost            terraform init -lock=f...
1      Job1            BackgroundJob   Completed     True            localhost            terraform init           
3      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
5      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
7      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
9      Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
11     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
13     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
15     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
17     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
19     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
21     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
23     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
25     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
27     Job1            BackgroundJob   Completed     True            localhost            terraform init -lock=f...
Terraform Init completed Successful



PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform plan 
terraform : [31m
At line:1 char:1
+ terraform plan
+ ~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
[1m[31mError: [0m[0m[1mError locking state: Error acquiring the state lock: The process cannot access the file 
because another process has locked a portion of the file.
Lock Info:
  ID:        45e104c4-3c62-39fb-7163-043f7ad1ce7b
  Path:      terraform.tfstate
  Operation: OperationTypeApply
  Who:       SIGUE\adm-gsandoval1@C33FILESRV01
  Version:   0.11.8
  Created:   2018-10-18 23:48:05.6089964 +0000 UTC
  Info:      
Terraform acquires a state lock to protect the state from being written
by multiple users at the same time. Please resolve the issue above and try
again. For most commands, you can disable locking with the "-lock=false"
flag, but this is not recommended.[0m
[0m[0m[0m

PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform plan -lock=false
terraform : [31m
At line:1 char:1
+ terraform plan -lock=false
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
[1m[31mError: [0m[0m[1mError loading state: read terraform.tfstate: The process cannot access the file because 
another process has locked a portion of the file.[0m
[0m[0m[0m

PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform init
terraform : [31mError refreshing state: read terraform.tfstate: The process cannot access the file because another process has locked a 
portion of the file.[0m[0m
At line:1 char:1
+ terraform init
+ ~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31mError refr...e file.[0m[0m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 

PS F:\sds\terraform\environment\C33SDSWSStIP-uat> terraform init -lock=false
terraform : [31mError refreshing state: read terraform.tfstate: The process cannot access the file because another process has locked a 
portion of the file.[0m[0m
At line:1 char:1
+ terraform init -lock=false
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31mError refr...e file.[0m[0m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 