function ShowBanner {
    $banner  = @()
    $banner+= $Global:Spacing + 'Vulnerable AD Lab Configuration'
    $banner+= $Global:Spacing + '--------------------------------' 
    $banner+= $Global:Spacing + 'Note: This will configure AD with an IPv4, Domain, and misconfigurations'                                               
    $banner | foreach-object {
        Write-Host $_
    }                             
}

function SetDC{
    Write-Host '[+] Set IPv4'
    $IP = "10.10.10.10"
    $MaskBits = 24 # This means subnet mask = 255.255.255.0
    $Gateway = "10.10.10.1"
    $Dns = "10.10.10.10"
    $IPType = "IPv4"
    # Retrieve the network adapter that you want to configure
    $adapter = Get-NetAdapter | ? {$_.Status -eq "up"}
    # Remove any existing IP, gateway from our ipv4 adapter
    If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
    $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
    }
    If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
    $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
    }
    # Configure the IP address and default gateway
    $adapter | New-NetIPAddress `
    -AddressFamily $IPType `
    -IPAddress $IP `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway
    # Configure the DNS client server IP addresses
    $adapter | Set-DnsClientServerAddress -ServerAddresses $DNS

    Write-Host '[+] Rename computer'
    Rename-Computer -NewName "DC-01" -restart
}

function Invoke-ADDeploy{
    ShowBanner
    SetDC
}

Invoke-ADDeploy