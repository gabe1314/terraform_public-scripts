This repo is creating a PowerShell scrip to Automate the Terraform process with a PowerShell Script.  

Currently I've created a script to Automate the Terraform Process and deal with an issue with the process locking the terraform.tfstate file which is only happening in Windows. In Mac and Ubunut I can usually use a -lock=false but in Windows this command is not working and will not unlock the process. 



Terraform Init |
        |
        --> Terraform Plan 
                  |
                  |
                  -->-- Terraform Apply 



The Fix I found for this manually is to run the following:

Stop-Process -Name terraform

___________________________

Next I'm having the script delete the tfstate, tfstate.backup and the tfstate.lock.info files so that the Environment will be able to update even when no changes are made. 

___________________________

Workflow for PowerShell Script


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
