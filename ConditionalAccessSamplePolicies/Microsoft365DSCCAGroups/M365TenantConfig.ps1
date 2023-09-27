# Generated with Microsoft365DSC version 1.22.420.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]
    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.23.809.1'

    Node localhost
    {
        AADGroup d0a321e6-2056-40d8-a074-cddacdc52a9b
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-CorpServiceAccounts-Exclusions";
            DisplayName          = "CA-Persona-CorpServiceAccounts-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "006f7c69-51f9-4527-808c-fdc57b8085aa";
            MailEnabled          = $False;
            MailNickname         = "0f49e42b-b";
            SecurityEnabled      = $True;
        }
        AADGroup 94963329-6b47-4f62-83b1-9f578ff8a2f4
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals-AppProtection-Exclusions";
            DisplayName          = "CA-Persona-Internals-AppProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "00958819-5cf9-4730-8271-62ac92d52f5e";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals-AppProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup f369f8a9-92eb-40ef-86db-10ad20473165
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-Compliance-Exclusions";
            DisplayName          = "CA-Persona-Admins-Compliance-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "0731b01b-3540-4c7f-9ede-54f0ab0968b0";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-Compliance-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 780d9a44-7bfd-49e9-83a7-4805f134be72
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Guests-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "077cff4d-b51e-49b9-8233-38fbc8d09883";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
    
        AADGroup 9a90990c-d8a6-4430-accb-a99b4687e60b
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-Externals-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "0bab285a-40d2-4f95-b642-d0d0bdeaaee2";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 5f60f810-4105-40da-b810-6564c4c4aae4
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-AzureServiceAccounts-Exclusions";
            DisplayName          = "CA-Persona-AzureServiceAccounts-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "0c447386-5696-4003-a0e3-bd7ddcda1ff0";
            MailEnabled          = $False;
            MailNickname         = "ce3032b0-0";
            SecurityEnabled      = $True;
        }
  
        AADGroup 44d5ed68-db00-44ff-b79c-be16af20bb54
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests-Compliance-Exclusions";
            DisplayName          = "CA-Persona-Guests-Compliance-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "0f763609-e71c-480d-beae-f85e7af5b9a5";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests-Compliance-Exclusions";
            SecurityEnabled      = $True;
        }

        AADGroup f4c81252-d2ae-45ad-9a04-4427ead4595a
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-AzureServiceAccounts";
            DisplayName          = "CA-Persona-AzureServiceAccounts";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "23766005-fbeb-4379-ad34-b683c89d6c5c";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-AzureServiceAccounts";
            SecurityEnabled      = $True;
        }
   
        AADGroup ed71be07-e5c6-4a7e-8443-006804bbcdb0
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers-DataProtection-Exclusions";
            DisplayName          = "CA-Persona-Developers-DataProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "354fcc6d-49ac-43de-a83a-8a57c2a327f7";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers-DataProtection-Exclusions";
            SecurityEnabled      = $True;
        }
     
                   
        AADGroup 7d7442c3-7e6a-4f20-ba0c-9e3beef97d16
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Developers-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4689111e-b2a2-496a-b8cb-044bd1633659";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup 2880941b-d7bc-447b-b5f6-341032f8b592
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-WorkloadIdendtities-Exclusions";
            DisplayName          = "CA-Persona-WorkloadIdentities-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "47fd3fad-555c-4551-9ff2-5bc82bdc6f38";
            MailEnabled          = $False;
            MailNickname         = "b0d3e2f2-0";
            SecurityEnabled      = $True;
        }
        AADGroup 5b14ccd0-2b23-4c9a-ba93-65c89ccff868
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Admins-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4bbb763d-86ff-4d50-933b-645a8af56523";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup ae28c066-1563-449a-92fe-b415026e9eb9
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Microsoft365ServiceAccounts";
            DisplayName          = "CA-Persona-Microsoft365ServiceAccounts";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4bcfd5bb-c1fb-4ee7-bae2-e3293dbd18ba";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Microsoft365ServiceAccounts";
            SecurityEnabled      = $True;
        }
       
        AADGroup 9550f428-485e-44f9-a6a7-fce6b9316bdc
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals";
            DisplayName          = "CA-Persona-Externals";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "4f93f838-ed9e-41c4-9dce-7a123395d7ca";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals";
            SecurityEnabled      = $True;
        }
        
        AADGroup 2f265a48-d06c-4b40-bca4-0387db50ed72
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-GuestAdmins-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-GuestAdmins-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "510179af-dfea-43c0-acfe-db4d06bb0f35";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-GuestAdmins-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
               
        AADGroup a854f9c1-1c3f-40e8-b4ba-c11fe379c944
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals-AppProtection-Exclusions";
            DisplayName          = "CA-Persona-Externals-AppProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "551c11ad-66ac-434a-a6c0-12f3de30107a";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals-AppProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 25ddc58e-bc40-4526-98d7-a648ce9f45a9
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Internals-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "572f519d-8c5f-46dc-81f1-d112a7d78d7e";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup ea74551b-e6a6-425c-a43e-6d11fba7b86e
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-Internals-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "58e39d92-b809-45e6-9236-f7c034f56344";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup 1c6a2127-904b-4fa6-b7b3-df8e3301da86
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals-DataProtection-Exclusions";
            DisplayName          = "CA-Persona-Internals-DataProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "5a9ce8de-6736-41ea-90fe-186c65bb8d30";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals-DataProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup 3cacfa14-b336-48a6-9e59-ad78c7e08200
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Global-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Global-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "70abc3f6-5edf-4f57-a6b4-942d4a820e17";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Global-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup ba6ca005-c56a-410a-a7c3-d013360adf22
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-Guests-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "76dbeab3-1081-4fe2-ab1d-71e86d42b65d";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup 33ab9e57-1aa8-4d03-beed-92d5b05fe6e5
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals";
            DisplayName          = "CA-Persona-Internals";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "7b17e974-3395-40ab-943d-6726acf51780";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals";
            SecurityEnabled      = $True;
        }
        
        AADGroup 3308f65a-03ad-4e4d-a12b-830ee46a5645
        {
            Credential           = $Credscredential;
            DisplayName          = "CA-Persona-GuestAdmins";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "7fc7c22f-3f8a-4f26-a671-e89d0ace2405";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-GuestAdmins";
            SecurityEnabled      = $True;
        }
        AADGroup ebbbfaf8-d399-4381-995f-2871a2285a95
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-GuestAdmins-Compliance-Exclusions";
            DisplayName          = "CA-Persona-GuestAdmins-Compliance-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "7ffcaa31-19a2-4f6b-9d52-618f62e2367a";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-GuestAdmins-Compliance-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup c70718c2-bce5-4683-ba27-38e0106231f2
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-DataProtection-Exclusions";
            DisplayName          = "CA-Persona-Admins-DataProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "85e18f03-1730-46b4-b3e8-beb6ce4b7a26";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-DataProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup ac468b00-b739-4691-83e0-74c652b2d5d6
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Guests-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "87bc7138-1141-4882-b736-458a73846e59";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup c3132290-2470-4d83-9afa-1c655ac68523
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-GuestAdmins-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-GuestAdmins-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "8b8a20df-ba39-4fb2-a791-b393c22562fd";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-GuestAdmins-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 4f63e373-2eba-4c4b-b2be-3e6b8299bdd0
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-Admins-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "8e82fc70-b895-45fc-9c2f-7b8fec6614c2";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 465cc582-c300-40db-8e50-779407263e92
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests";
            DisplayName          = "CA-Persona-Guests";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "8f342b30-7789-4e9a-a45a-eebdd9db387d";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests";
            SecurityEnabled      = $True;
        }
       
        AADGroup e95a0372-a841-4637-a6b3-ecbb7e2467b9
        {
            Credential           = $Credscredential;
            Description          = "Group used to assign GIT for Windows app.";
            DisplayName          = "PAW-CSM-Apps-Git-For-Windows-User-Available";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "929efef5-2ba9-4d43-9f1b-999d6111dcff";
            MailEnabled          = $False;
            MailNickname         = "PAW-CSM-Apps-Git-For-Windows-User-Available";
            SecurityEnabled      = $True;
        }
        
        AADGroup 0d5decf9-6d35-4fd4-8ced-998771743817
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Admins-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "957b8bbf-8306-48c1-bba7-220324d5dce7";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
       
        AADGroup 15b4f7b5-20ad-4654-a8f2-33020c878e96
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Developers-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "96b61aca-7a23-4085-bd38-89c5b5acd3b7";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
       
        AADGroup 60a9bdda-46d6-450c-8a22-326294cfeb0a
        {
            Credential           = $Credscredential;
            Description          = "CA-BreakGlassAccounts";
            DisplayName          = "CA-BreakGlassAccounts";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "9a8ee0ae-4bd1-4131-9905-f651bec7581f";
            MailEnabled          = $False;
            MailNickname         = "CA-BreakGlassAccounts";
            SecurityEnabled      = $True;
        }
        AADGroup 1bf7ccdd-2f4a-418b-bf9a-8ae03a09f97b
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins";
            DisplayName          = "CA-Persona-Admins";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "9e39dc6e-d356-4d37-8abb-ababe69b3614";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins";
            SecurityEnabled      = $True;
        }
        
        AADGroup 3fc44f68-9b7d-496f-b1e0-f1c113b23415
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers-AppProtection-Exclusions";
            DisplayName          = "CA-Persona-Developers-AppProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "9f589e0d-cccd-4e58-83cd-ac59cb668630";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers-AppProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup a7af2e15-233c-4567-b782-f8376711d953
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-CorpServiceAccounts";
            DisplayName          = "CA-Persona-CorpServiceAccounts";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "a0490538-f35e-4d48-aeac-db9791d94d77";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-CorpServiceAccounts";
            SecurityEnabled      = $True;
        }
        AADGroup 651d05f1-dd30-4d9c-b795-f6ee7677edf9
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-On-PremisesServiceAccounts";
            DisplayName          = "CA-Persona-OnPremisesServiceAccounts";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "a153865d-6027-4d97-9a7b-5726d7ccf672";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-OnPremisesServiceAccounts";
            SecurityEnabled      = $True;
        }
        
        AADGroup 23d69357-4243-4a03-a824-a24f6e032084
        {
            Credential           = $Credscredential;
            Description          = "Group used to assign VS Code app.";
            DisplayName          = "PAW-CSM-Apps-VS-Code-User-Available";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "b083e0a2-4cef-4284-b771-0a0a87c67311";
            MailEnabled          = $False;
            MailNickname         = "PAW-CSM-Apps-VS-Code-User-Available";
            SecurityEnabled      = $True;
        }
        AADGroup 6288497d-ea64-4137-9009-b1804358d3b9
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers-IdentityProtection-Exclusions";
            DisplayName          = "CA-Persona-Developers-IdentityProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "b123ffa2-3aad-414c-a125-e15e4856b848";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers-IdentityProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup 0a93b328-ea00-4657-93e7-f285571b2215
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Externals-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "b43cdd8b-e0ad-4cac-8765-84503437fec1";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup d69749f0-e259-4fa4-9b1e-0f6e7bf413c0
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Global-BaseProtection-Exclusions";
            DisplayName          = "CA-Persona-Global-BaseProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "b58e89b3-f7a4-455b-957b-4f2e718f7dfc";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Global-BaseProtection-Exclusions";
            SecurityEnabled      = $True;
        }
       
        AADGroup 15d09d00-f14e-4f3b-9952-4634e7f0e360
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-WorkloadIdentities";
            DisplayName          = "CA-Persona-WorkloadIdentities";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "c0a099c2-8730-4ae6-b7ec-8137bfdc89e6";
            MailEnabled          = $False;
            MailNickname         = "a5b3e62b-0";
            SecurityEnabled      = $True;
        }
        
        AADGroup 5cd3cdb5-5b36-476f-9d23-6a27e4061ebd
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals-DataProtection-Exclusions";
            DisplayName          = "CA-Persona-Externals-DataProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "c6e25feb-1650-4c3c-a4d1-1620a895f587";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals-DataProtection-Exclusions";
            SecurityEnabled      = $True;
        }
       
       
        AADGroup 32362f5c-9eb9-4401-842d-25e96dc9bbb7
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Guests-DataProtection-Exclusions";
            DisplayName          = "CA-Persona-Guests-DataProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "d34511f4-ff96-41cf-a131-a9fba674d6ac";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Guests-DataProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup a0bbbe48-20c8-4596-a161-a01fc7e2bd7f
        {
            Credential                    = $Credscredential;
            DisplayName                   = "CA-Pesona-GuestUsersAsDynamicGroup";
            Ensure                        = "Present";
            GroupTypes                    = @("DynamicMembership");
            Id                            = "e1f7c2e4-28a2-49c5-9351-0b4cd3bb75e1";
            MailEnabled                   = $False;
            MailNickname                  = "CA-Pesona-GuestUsersAsDynamicGroup";
            MembershipRule                = "(user.objectId -ne null) -and (user.userType -eq `"Guest`")";
            MembershipRuleProcessingState = "On";
            SecurityEnabled               = $True;
        }
        
        AADGroup 57637d93-ca17-42ea-a335-37d20ac77125
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Internals-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Internals-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "e8194b04-6c24-4a30-8ab2-5acbdcc0fe42";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Internals-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        
       
        AADGroup 64b9ebb7-4e24-4f90-8be2-26f33f5157f7
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Global";
            DisplayName          = "CA-Persona-Global";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "f069bf74-2f4b-48bd-9a77-552128fe0db7";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Global";
            SecurityEnabled      = $True;
        }
        
        AADGroup 2d959723-ce72-43e2-b14c-54f07ac18ace
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-GuestAdmins-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-GuestAdmins-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "f35dac3e-3e20-4344-b9a5-f5d379b308cd";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-GuestAdmins-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        
        AADGroup 9e6b8742-4c33-4aeb-9faf-2ee3e4076045
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Admins-AppProtection-Exclusions";
            DisplayName          = "CA-Persona-Admins-AppProtection-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "fd5a39c5-231c-4721-8adb-bc06d30f4735";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Admins-AppProtection-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup b686aab5-f214-4870-82a5-ec66f1cf0dcc
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Externals-AttackSurfaceReduction-Exclusions";
            DisplayName          = "CA-Persona-Externals-AttackSurfaceReduction-Exclusions";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "fddf81e1-0514-48f1-844b-872e7205c01d";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Externals-AttackSurfaceReduction-Exclusions";
            SecurityEnabled      = $True;
        }
        AADGroup f49c018b-224f-45b0-b8ca-dca0dfc0f1cf
        {
            Credential           = $Credscredential;
            Description          = "CA-Persona-Developers";
            DisplayName          = "CA-Persona-Developers";
            Ensure               = "Present";
            GroupTypes           = @();
            Id                   = "fe425131-891a-48ff-a002-fce886cbf252";
            MailEnabled          = $False;
            MailNickname         = "CA-Persona-Developers";
            SecurityEnabled      = $True;
        }
    }
}
M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
