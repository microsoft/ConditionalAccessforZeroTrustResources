This folder has a file that is a Microsoft365DSC file format. You can use it to automatically apply CA policies in your Azure AD tenant according to
the CA framework configured for Zero Trust. Follow the process below
- verify that CA related groups have been created following guidelines in Microsoft365DSCCAGroups\readme.md
- Use Windows 10/11
- Launch a terminal with "Windows Powershell" as local admin
- install Microsoft365DSC with dependencies. See more at https://microsoft365dsc.com 
- create a local folder <m365dsccapoliciesfolder> and change to this folder
- download ConfigurationData.psd1 to same folder
- execute .\M365TenantConfig.ps1 -Credential $creds, where $creds has your AAD user with permissions to create AAD CA policies
  WARNING!!! This creates a local mof file with the password stored, so if you continue applying this policy using a user, 
  you should/must delete the file straight after applying CA policies or rather use a service principal with Microsoft365.
- execute update-m365dscallowedgraphscopes -resourcenamelist @('AADConditionalAccessPolicy') -type Update
- execute Start-DSCConfiguration <m365dsccapoliciesfolder>\m365tenantconfig -wait -force
- verify in AAD portal that you have the CA policies created (if not and you get an error, verify CA policies for this user, and consider using SP instead
- for policies that have Terms Of Use associated (Combined registration policies and Guest compliance policies), change grant controls from MFA to TOU after you have created a TOU PDF file.                                                        
