This folder has CA policies as Microsoft365DSC files as well as an Excel Spreadsheet.

Two sepeparate folders have Microsoft365DSC files for easy/automated deployment of CA groups and policies. 
Follow instructions in the readme file in the folders

See more here for a description on CA configured for Zero Trust

https://learn.microsoft.com/en-us/azure/architecture/guide/security/conditional-access-zero-trust

https://learn.microsoft.com/en-us/azure/architecture/guide/security/conditional-access-framework

https://www.linkedin.com/posts/claus-jespersen-25b0422_conditional-access-guidance-december-2021-ugcPost-6872879150634450944-TXP5?utm_source=linkedin_share&utm_medium=member_desktop_web

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


