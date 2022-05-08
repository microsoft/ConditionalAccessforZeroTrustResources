This folder has an Excel spreadsheet with suggested CA policies.
Also two sepeparate folders have Microsoft365DSC files for easy/automated deployment of CA groups and policies. 
I have not been able to get it working with groups and CA policies in one policy, hence two separate. Follow instructions in the readme file in the folders

See more here for a description on CA configured for Zero Trust
https://docs.microsoft.com/en-us/azure/architecture/guide/security/conditional-access-zero-trust?msclkid=d1768a34ceda11ec9b6c8f244f8d05bd 

https://www.linkedin.com/posts/claus-jespersen-25b0422_conditional-access-guidance-december-2021-ugcPost-6872879150634450944-TXP5?utm_source=linkedin_share&utm_medium=member_desktop_web

Prerequisites for Microsoft365DSC usage

- An account with Global Administrator privileges
- Pre-creation of the break glass/emergency admin accounts
- An account with a PowerShell execution policy of unrestricted
- A device with PowerShell Remoting enabled, internet access, and PowerShell 4.0 or greater installed
- Microsoft Graph for PowerShell app registration is available in the Azure AD tenant
- Device with WinRM configured with a HTTPS listener

Verify MS Graph grant permissions

Connect with the Microsoft Graph API and grant admin consent when prompted
https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions/

Connect-MgGraph -TenantId "Azure AD tenant id guid" -Scopes 
