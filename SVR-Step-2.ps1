    $newPass = "WeakPassword.123"
    $secpass=ConvertTo-SecureString $newPass -AsPlainText -Force   
    $UserAccount = Get-LocalUser -Name "administrator"
    $UserAccount | Set-LocalUser -Password $secpass
    
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
    Import-Module ADDSDeployment

    Write-Host '[+] Set domain'
    $dmnname = "acme.org"
    $dmnnetbios = "ACME"
    Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012R2" -DomainName $dmnname -DomainNetbiosName $dmnnetbios -ForestMode "Win2012R2" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -SafeModeAdministratorPassword $secpass -Force:$true
    #Restart-Computer -Force