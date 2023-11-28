[CmdletBinding()] 
param ( 
    [Parameter(Mandatory = $True)] 
    [string]$m365cert 
) 
$m365configcertStringBase64 = $m365cert 
$m365configcertByteArray = [System.Convert]::FromBase64String($m365configcertStringBase64) 
$m365configcert = [System.Security.Cryptography.X509Certificates.X509Certificate2]($m365configcertByteArray) 
$m365configcertThumbprint = $m365configcert.Thumbprint 
. .\ConfigureMicrosoft365.ps1 -CertificateThumbprint $m365configcertThumbprint -TenantId $env:TenantId -ApplicationId $env:ApplicationId 
