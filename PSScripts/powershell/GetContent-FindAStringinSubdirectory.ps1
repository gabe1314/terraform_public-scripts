Get-Content E:\terraform\logs\terraform_Plan.log -Tail 3 | Select-String -Pattern "The process cannot access the file because another process has locked" -AllMatches
