$domain = "acme"
$password = "WeakPassword.123" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
Restart-Computer -Force