# QuickADLab
Scripts to quickly deploy a small vulnerable AD lab for research and development purposes.

## Purpose
The script aims to quickly configure a simple AD network that incorporates a number of vulnerabilities i.e. misconfigurations. Ideal for those wanting to learn how to attack or defend AD.

## Use Cases
Research i.e. detection, telemetry, security tools
AD offence and defence

## Limitations
All configuration changes are made to the host rather than GPO. Any changes made to a GPO could overwrite the local configuration.
Not designed for scale or production environments
No event forwarding is configured

## Credits
- Vulnerable AD - WazeHell [https://github.com/WazeHell/vulnerable-AD]
- Audit - Jeff Starke [https://github.com/Starke427/Windows-Security-Policy]
- Sysmon - MS SysInternals [https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon]
- Olaf Hartong - Sysmon Modular [https://github.com/olafhartong/sysmon-modular]
- Disable Defender - [https://bidouillesecurity.com/disable-windows-defender-in-powershell]

## Getting Started
- Download ISOs from MS Evaluation Centre - https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019
- Install Windows 2019 as a VM and create a snapshot
- Install Windows 10 as a VM and create a snapshot
- Ensure Windows 10 and Windows 2019 are on the same network as host only

## Deploying QuickADLab
### Windows 2019 Server
- Create a folder on Win2019 i.e. C:\Lab. Copy the files to this location
- Open Powershell CLI as Administrator and navigate to the folder where the QuickADLab files were copied to. Execute the following command:

PowerShell.exe -ExecutionPolicy Bypass -File .\QuickLab.ps1

- Enter 1 to configure the IP, Then Enter 2 to create the AD. Note the host will restart several times to apply changes.
- Log into the Ad host using ‘WeakPassword.123’
- Continue with applying the vulnerabilties and disabling defender.

### Windows 10 Client
- Create a folder on Win10 i.e. C:\Lab. Copy the files to this location
- Open Powershell CLI as Administrator and navigate to the folder where the QuickADLab files were copied to. Execute the following command:

PowerShell.exe -ExecutionPolicy Bypass -File .\QuickLab.ps1

- Enter C to configure the workstation IPv4. Then enter J to join the workstation to the domain
- Continue with disabling defender, applying PS logging, sysmon deployment and AD audit logging

## To Do
- Incorporate further vulnerabilities
- - SMB write, credential overlap
- Add BadBlood
- Add additional AD server plus other services such as certificates
