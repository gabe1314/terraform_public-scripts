Get-ChildItem E:\terraform\logs\terraform_Plan.log -Recurse | Select-String -Pattern "The process cannot access the file because another process has locked a 
portion of the file" -SimpleMatch
