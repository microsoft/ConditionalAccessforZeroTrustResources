[CmdletBinding()] 

param ( 
    [Parameter(Mandatory = $True)] 
    [string]$m365cert, 
    [string]$dsccertificate 
) 

Install-Module -Name Microsoft365Dsc -force -AllowClobber 
Update-M365DSCDependencies 
Import-Module Microsoft365Dsc 
$location = Get-Location 
$m365configcertStringBase64 = $m365cert 
$m365configcertByteArray = [System.Convert]::FromBase64String($m365configcertStringBase64) 
[System.IO.File]::WriteAllBytes("$location/m365configcert.pfx", $m365configcertByteArray) 
$m365configcert = [System.Security.Cryptography.X509Certificates.X509Certificate2]($m365configcertByteArray) 
$m365configcertThumbprint = $m365configcert.Thumbprint 
Import-PfxCertificate -FilePath $location/m365configcert.pfx -CertStoreLocation Cert:\LocalMachine\My 
$m365configcert.Dispose() 
$m365configcert = $null 
Remove-Item "$location/m365configcert.pfx" 
$dsccertStringBase64 = $dsccertificate 
$dsccertByteArray = [System.Convert]::FromBase64String($dsccertStringBase64) 
[System.IO.File]::WriteAllBytes("$location/dsccert.pfx", $dsccertByteArray) 
$dsccert = [System.Security.Cryptography.X509Certificates.X509Certificate2]($dsccertByteArray) 
$dsccertThumbprint = $dsccert.Thumbprint 
Import-PfxCertificate -FilePath $location/dsccert.pfx -CertStoreLocation Cert:\LocalMachine\My 
$dsccert.Dispose() 
$dsccert = $null 
Remove-Item "$location/dsccert.pfx" 
winrm quickconfig -force 

Configuration ConfigureLCM 
{ 
    param ( 
        [Parameter(Mandatory = $True)] 
        [string]$dsccertThumbprint 
    ) 
    Import-DscResource -ModuleName PsDesiredStateConfiguration 
    node localhost 
    { 
        LocalConfigurationManager 
            { 
                CertificateId = $dsccertThumbprint 
            } 
    } 
} 

ConfigureLCM -dsccertThumbprint $dsccertThumbprint 
set-DscLocalConfigurationManager -Path $location\ConfigureLCM -force -verbose 
Start-DscConfiguration -ComputerName localhost -Path m365tenantconfig -Wait -Force -verbose 

 
