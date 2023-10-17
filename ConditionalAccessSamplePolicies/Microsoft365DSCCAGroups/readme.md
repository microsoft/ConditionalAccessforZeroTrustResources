This folder has a file that is a Microsoft365DSC file format. You can use it to automatically apply CA related groups in your Azure AD tenant. 
These are the groups that are used in the CA configure for Zero Trust approach. Follow the process below
- Use Windows 10/11
- Launch a terminal with "Windows Powershell" as local admin
- install Microsoft365DSC with dependencies. See more at https://microsoft365dsc.com 
- create a local folder <m365dscgroupsfolder> and change to this folder
- download ConfigurationData.psd1 to same folder
- execute .\M365TenantConfig.ps1 -Credential $creds, where $creds has your AAD user with permissions to create AAD groups.
  WARNING!!! This creates a local mof file with the password stored, so if you continue applying this policy using a user, 
  you should/must delete the file straight after applying groups and/or CA policies or rather use a service principal with Microsoft365.
- execute connect-mggraph -scopes group.readwrite.all with the CA Admin for the tenant as credential.
- execute Start-DSCConfiguration <m365dscgroupsfolder>\m365tenantconfig -wait -force
- verify in AAD portal that you have the CA related groups created (if not and you get an error, verify CA policies for this user, and consider using SP instead
- Continue applying CA policies following the guidelines in MicrosoftDSCCAPolicies\readme.md    
