This folder has CA policies as Microsoft365DSC files as well as an Excel Spreadsheet.

Two sepeparate folders have Microsoft365DSC files for easy/automated deployment of CA groups and policies. 
Follow instructions in the readme file in the folders. 

Please notice that the policies have not yet been fully aligned with latest changes from October 2023, that relate to admin policies and using sign-in frequency everytime where supported.

See more here for a description on CA configured for Zero Trust

https://learn.microsoft.com/en-us/azure/architecture/guide/security/conditional-access-zero-trust

https://learn.microsoft.com/en-us/azure/architecture/guide/security/conditional-access-framework

Prerequisites for Microsoft365DSC usage

- An account with Global Administrator privileges
- Pre-creation of the break glass/emergency admin accounts
- An account with a PowerShell execution policy of unrestricted
- A device with PowerShell Remoting enabled, internet access, and PowerShell 4.0 or greater installed
- Microsoft Graph for PowerShell app registration is available in the Azure AD tenant
- Device with WinRM configured with a HTTPS listener

Verify MS Graph grant permissions

Update-M365DSCAllowedGraphScopes or Connect with the Microsoft Graph API and grant admin consent when prompted
Connect-MgGraph -TenantId "Azure AD tenant id guid" -Scopes 

https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions/


