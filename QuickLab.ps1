Write-Host ""
Write-Host "========================================================="
Write-Host "QuickLab - AD Vulnerable Lab Deployment"
Write-Host "----------------------------------------"
Write-Host "This will configure a Win2019, Win10 AD network"
Write-Host "Use at own risk! Not for production use!"
Write-Host "========================================================="
Write-Host ""
Write-Host "==== Win 2019 Host ======================================"
Write-Host "1 - Configure Server identifier"
Write-Host "- IPv4: 10.10.10.10 Name: DC-01" 
Write-Host "2 - Set AD Domain"
Write-Host "- Domain: ACME.ORG Pwd: WeakPassword.123"
Write-Host "V - Deploy AD vulnerabilities"
Write-Host "=== Win 10 Host ========================================="
Write-Host "C - Configure client identifier"
Write-Host "- IPv4: 10.10.10.50 Name: WKS-01"
Write-Host "J - Join client to domain"
Write-Host "=== Any Host ============================================"
Write-Host "P - Set Powershell Logging on this host"
Write-Host "A - Set Windows Adavanced Audit Logging on this host"
Write-Host "S - Deploy Sysmon on this host"
Write-Host "D - Disable Defender on this Host"
Write-Host "========================================================="
Write-Host "Q - Quit"
$choice = Read-Host "`nEnter Choice"

switch ($choice) {
   '1'{
         $ScriptToRun= $PSScriptRoot+"\SVR-Step-1.ps1"
         &$ScriptToRun
   }
   '2'{
         $ScriptToRun= $PSScriptRoot+"\SVR-Step-2.ps1"
         &$ScriptToRun
   }
   'V'{
         $ScriptToRun= $PSScriptRoot+"\AD-Vul.ps1"
         &$ScriptToRun
   }
   'A'{
         $ScriptToRun= $PSScriptRoot+"\Audit-Logging.ps1"
         &$ScriptToRun
   }
   'P'{
         $ScriptToRun= $PSScriptRoot+"\Logging-PS.ps1"
         &$ScriptToRun
   }
   'D'{
         $ScriptToRun= $PSScriptRoot+"\Disable-Defender.ps1"
         &$ScriptToRun
   }
   'J'{
         $ScriptToRun= $PSScriptRoot+"\WKS-Step-2.ps1"
         &$ScriptToRun
   }
   'C'{
         $ScriptToRun= $PSScriptRoot+"\WKS-Step-1.ps1"
         &$ScriptToRun
   }
   'S'{
        $path = "c:\Tools"
        $sysmonpath = $PSScriptRoot+"\Sysmon.zip"
        New-Item -ItemType Directory -Force -Path $path | Out-Null;
        Expand-Archive $sysmonpath -DestinationPath $path
        Set-Location $path
        .\Sysmon64.exe -accepteula -i sysmonconfig.xml
   }
   'Q'{Return}
}