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

    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.23.1018.1'

    Node localhost
    {
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA001-Global-BaseProtection-AllApps-AnyPlatform-BlockNonPersonas"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA001-Global-BaseProtection-AllApps-AnyPlatform-BlockNonPersonas";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-AzureServiceAccounts","CA-Persona-GuestAdmins","CA-Persona-Guests","CA-Persona-CorpServiceAccounts","CA-Persona-Externals","CA-Persona-Admins","CA-BreakGlassAccounts","CA-Persona-Global-BaseProtection-Exclusions","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-Internals");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "3e53010c-a9c7-4230-bc12-de24eda63f46";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @();
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @("All");
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA002-Global-AttackSurfaceReduction-VariousApps-AnyPlatform-Block"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA002-Global-AttackSurfaceReduction-VariousApps-AnyPlatform-Block";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "7f2437de-1a67-4baa-8a5d-fd6a235288d4";
            IncludeApplications                      = @("None");
            IncludeGroups                            = @();
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @("All");
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA100-Admins-BaseProtection-AllApps-AnyPlatform-MFAANDCompliant"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa","compliantDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA100-Admins-BaseProtection-AllApps-AnyPlatform-MFAANDCompliant";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("");
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Admins-BaseProtection-Exclusions","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "AND";
            Id                                       = "99b56601-10cc-4706-8b5b-3479ef3b0f4f";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA101-Admins-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA101-Admins-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-CorpServiceAccounts","CA-Persona-Admins-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "9646b0dd-302d-4f8b-a100-fd0a268dca18";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA102-Admins-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforMediumandHighUserRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa", "passwordChange");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA102-Admins-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforMediumandHighUserRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-BreakGlassAccounts","CA-Persona-Admins-IdentityProtection-Exclusions","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "AND";
            Id                                       = "fd9aba4f-0071-4eb2-b24d-d371a3643444";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @("high","medium");
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA103-Admins-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;

            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA103-Admins-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-Admins-IdentityProtection-Exclusions","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "d695b04f-1f3b-4ad0-a17a-c9a4314be67a";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high","medium");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA104-Admins-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA104-Admins-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Admins-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "34fb5388-591a-4cac-92bb-5c8d7423c17d";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA105-Admins-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA105-Admins-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-Admins-AppProtection-Exclusions","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "3b05a800-be5e-4244-820d-d8078d6ed1b1";
            IncludeApplications                      = @("d4ebce55-015a-49b5-a083-c84d1797ae8c");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";            
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA106-Admins-DataProtection-AllApps-iOSorAndroid-ClientAppandAPP"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("approvedApplication","CompliantApplication");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA106-Admins-DataProtection-AllApps-iOSorAndroid-ClientAppandAPP";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Admins-DataProtection-Exclusions","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "f8da41f4-6503-4aaa-9635-afd8928ad462";
            IncludeApplications                      = @("Office365");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("android","iOS");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA107-Admins-DataProtection-AllApps-AnyPlatform-SessionPolicy"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @();
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA107-Admins-DataProtection-AllApps-AnyPlatform-SessionPolicy";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Admins-DataProtection-Exclusions","CA-Persona-AzureServiceAccounts","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            Id                                       = "a427c2b2-004b-4c71-8b8a-a200357328ab";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $True;
            PersistentBrowserMode                    = "never";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "hours";
            SignInFrequencyValue                     = 4;
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA108-Admins-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA108-Admins-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Microsoft365ServiceAccounts","CA-Persona-AzureServiceAccounts","CA-Persona-Admins-AttackSurfaceReduction-Exclusions","CA-Persona-CorpServiceAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @("android","iOS","windows","windowsPhone","macOS","linux");
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "ef5c008e-5531-4926-8091-3f4f9c4873fa";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Admins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA200-Internals-BaseProtection-AllApps-AnyPlatform-CompliantorAADHJ"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA200-Internals-BaseProtection-AllApps-AnyPlatform-CompliantorAADHJ";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("d4ebce55-015a-49b5-a083-c84d1797ae8c");
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-BaseProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "9ae17a00-e7b9-4cde-afde-35bd2847a605";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA201-Internals-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA201-Internals-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "2114e5cb-0391-42c9-82f5-e0b6728803bd";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA202-Internals-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa","passwordChange");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA202-Internals-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "AND";
            Id                                       = "dc62ae2d-aac1-43ee-934b-c23fae9f8648";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @("high");
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA203-Internals-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA203-Internals-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "363db5da-09cd-4bc1-b408-1256ebf9891d";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA204-Internals-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA204-Internals-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "b1f05d88-a0ea-49d5-be5c-33efa51e0599";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA205-Internals-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA205-Internals-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-AppProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "798038cb-95d1-4d6e-81d5-50273a283c61";
            IncludeApplications                      = @("d4ebce55-015a-49b5-a083-c84d1797ae8c");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA206-Internals-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("approvedApplication","CompliantApplication");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA206-Internals-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Internals-AppProtection-Exclusions","CA-Persona-Internals-DataProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "5ddd39c2-22e8-428b-a363-db283a788c1e";
            IncludeApplications                      = @("Office365");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("android","iOS");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA207-Internals-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA207-Internals-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @("android","iOS","windows","macOS","linux");
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "1ad96a57-cf16-4c9d-b7b3-ba4e72d8d4ab";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Internals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA300-Externals-BaseProtection-AllApps-AnyPlatform-CompliantorAADHJ"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA300-Externals-BaseProtection-AllApps-AnyPlatform-CompliantorAADHJ";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-BaseProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "8931fd69-f3cb-4d11-9b7b-4d3f115e3d10";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA301-Externals-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA301-Externals-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "11e8d17d-8639-4f89-b64a-7c58726e75ac";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA302-Externals-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa","passwordChange");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA302-Externals-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "AND";
            Id                                       = "e4b4c23a-0d94-4dc7-b585-a33b668c638f";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @("high");
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA303-Externals-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA303-Externals-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "cf2f625c-626c-44bb-b080-9efbeae89672";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA304-Externals-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA304-Externals-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "65038464-4ae8-4b8c-b1f3-56f5d4b76999";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA305-Externals-AppProtection-MicrosoftIntuneEnrollment-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA305-Externals-AppProtection-MicrosoftIntuneEnrollment-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-AppProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "dd3c3c51-6766-440c-a783-20566b371e3c";
            IncludeApplications                      = @("d4ebce55-015a-49b5-a083-c84d1797ae8c");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";            
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA306-Externals-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("approvedApplication","CompliantApplication");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA306-Externals-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-AppProtection-Exclusions","CA-Persona-Externals-DataProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "34dae461-7bcd-48dc-ba06-8a3e9bca542c";
            IncludeApplications                      = @("Office365");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("android","iOS");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA307-Externals-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA307-Externals-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Externals-AttackSurfaceReduction-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @("android","iOS","windows","macOS","linux");
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "5b1f1637-c7e0-43f3-9228-f7a69bc296f4";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Externals");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA402-Guests-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighUserandSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA402-Guests-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighUserandSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Guests-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "3e1087c3-083e-4916-8268-94060e42a8a0";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high","medium");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA403-Guests-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA403-Guests-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Guests-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "566b1228-a8cf-446c-838c-0c9950f638a3";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA404-Guests-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonGuestAppAccess"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $True;
            CloudAppSecurityType                     = "monitorOnly";
            Credential                               = $Credscredential;
            DisplayName                              = "CA404-Guests-AttackSurfaceReduction-AllApps-AnyPlatform-BlockGuestAppAccess";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("2793995e-0a7d-40d7-bd35-6968ba142197","Office365");
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Guests-AttackSurfaceReduction-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "1b3bc8ab-71da-4364-9057-b325cb8f28cd";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA500-GuestAdmins-BaseProtection-AllApps-AnyPlatform-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA500-GuestAdmins-BaseProtection-AllApps-AnyPlatform-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-GuestAdmins");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "cabcface-763d-410d-a096-97a14267304f";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA502-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighUserandSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA502-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-MFAforMediumandHighUserandSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-GuestAdmins-IdentityProtection-Exclusions","CA-BreakGlassAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "fb067dc0-efd2-41b5-b612-99dfed715f16";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high","medium");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA503-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA503-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-GuestAdmins-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "bd372bd8-4f5c-438c-a5fb-dc418ac7abab";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA504-GuestAdmins-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonO365andAzureAccess"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @();
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $True;
            CloudAppSecurityType                     = "mcasConfigured";
            Credential                               = $Credscredential;
            DisplayName                              = "CA504-GuestAdmins-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonO365Access";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("797f4846-ba00-4fd7-ba43-dac1f8f63013","2793995e-0a7d-40d7-bd35-6968ba142197","Office365");
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            Id                                       = "c67cf334-003e-4879-92ea-034ccf9d6c37";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA600-Microsoft365ServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA600-Microsoft365ServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts");
            ExcludeLocations                         = @("AllTrusted");
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "8fc7f7da-46dc-4cef-8984-fdbc1b2870cf";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Microsoft365ServiceAccounts");
            IncludeLocations                         = @("All");
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA602-Microsoft365ServiceAccounts-AttackSurfaceReduction-O365-AnyPlatform-BlockNonO365"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA604-Microsoft365ServiceAccounts-AttackSurfaceReduction-O365-AnyPlatform-BlockNonO365";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("Office365");
            ExcludeGroups                            = @("CA-BreakGlassAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "b180a6e7-959a-408f-9d27-c0527626e803";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Microsoft365ServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA700-AzureServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA700-AzureServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-AzureServiceAccounts-Exclusions");
            ExcludeLocations                         = @("AllTrusted");
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "49b7156d-54af-400a-94da-f2d5d9904cf6";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-AzureServiceAccounts");
            IncludeLocations                         = @("All");
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA702-AzureServiceAccounts-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonAzure"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA704-AzureServiceAccounts-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonAzure";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("797f4846-ba00-4fd7-ba43-dac1f8f63013");
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-AzureServiceAccounts-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "277028ff-a351-456c-a65d-c1c79dee2408";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-AzureServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA800-CorpServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA800-CorpServiceAccounts-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-CorpServiceAccounts-Exclusions");
            ExcludeLocations                         = @("AllTrusted");
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "d0a2cf7b-6c43-4ec7-a259-95e1a388338b";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-CorpServiceAccounts");
            IncludeLocations                         = @("All");
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA802-CorpServiceAccounts-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonO365andAzure"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA802-CorpServiceAccounts-AttackSurfaceReduction-AllApps-AnyPlatform-BlockNonO365andAzure";
            Ensure                                   = "Present";
            ExcludeApplications                      = @("797f4846-ba00-4fd7-ba43-dac1f8f63013","Office365");
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-CorpServiceAccounts-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "cfdbaa3d-c28e-42b0-a3d7-04ec4f8dbc7b";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-CorpServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA401-Guests-IdentityProtection-AllApps-AnyPlatform-TOU-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA401-Guests-IdentityProtection-AllApps-AnyPlatform-TOU-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-GuestAdmins-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "0855b278-a4cc-448c-8efe-ef1a9b481af1";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA501-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA501-GuestAdmins-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-GuestAdmins-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "469189c5-2e1a-4851-b333-831357842f7f";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA405-Guests-ComplianceProtection-AllApps-AnyPlatform-RequireTOU"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA405-Guests-ComplianceProtection-AllApps-AnyPlatform-RequireTOU";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-Guests-Compliance-Exclusions","CA-BreakGlassAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "d21ddea3-49f8-4d41-afbb-dd1ede4c37c5";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA505-GuestAdmins-ComplianceProtection-AnyPlatform-RequireTOU"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            CustomAuthenticationFactors              = @();
            DeviceFilterRule                         = "";
            DisplayName                              = "CA505-GuestAdmins-ComplianceProtection-AnyPlatform-RequireTOU";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Guests-Compliance-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "b3bd1808-0316-47ac-a02c-e159340287de";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-GuestAdmins");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA601-Microsoft365ServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA601-Microsoft365ServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "56ad5cff-9efe-4adb-8539-3608ae3cfab1";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Microsoft365ServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA701-AzureServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA701-AzureServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-AzureServiceAccounts-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "a274b074-2138-4f97-b589-888451a188a8";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-AzureServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA801-CorpServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA801-CorpServiceAccounts-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-CorpServiceAccounts-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "681a4b42-207b-4236-aaba-6b7be1b5ef57";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-CorpServiceAccounts");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA900-WorkloadIdentities-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA900-WorkloadIdentities-BaseProtection-AllApps-AnyPlatform-BlockUntrustedLocations";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-WorkloadIdentities-Exclusions","CA-BreakGlassAccounts");
            ExcludeLocations                         = @("AllTrusted");
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "d1fc858f-96ed-4d04-873c-2d15cb5ad465";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-WorkloadIdentities");
            IncludeLocations                         = @("All");
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1000-Developers-BaseProtection-AllApps-AnyPlatform-ForwardToDefenderforCloudApps"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @();
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $True;
            CloudAppSecurityType                     = "mcasConfigured";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1000-Developers-BaseProtection-AllApps-AnyPlatform-ForwardToDefenderforCloudApps";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-BaseProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            Id                                       = "d1b792d9-8d92-4dd8-bc4d-08d062e85934";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1001-Developers-BaseProtection-AllApps-AnyPlatform-MFAfromUnamagedDevices"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1001-Developers-BaseProtection-AllApps-AnyPlatform-MFAfromUnamagedDevices";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-BaseProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "19bd434b-0ee6-4d02-9ed1-15d0301af466";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1002-Developers-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("compliantDevice","domainJoinedDevice");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1002-Developers-IdentityProtection-AllApps-AnyPlatform-CombinedRegistration";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "fb99d0ef-7279-42a7-84d9-4780ae5f0580";
            IncludeApplications                      = @();
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @("urn:user:registersecurityinfo");
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1003-Developers-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa","passwordChange");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1003-Developers-IdentityProtection-AllApps-AnyPlatform-MFAandPWDforHighUserRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "AND";
            Id                                       = "6289e358-d106-4f94-8895-8e864eb9a980";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @("high","medium");
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1004-Developers-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1004-Developers-IdentityProtection-AllApps-AnyPlatform-MFAforHighSignInRisk";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-IdentityProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "e136f350-9639-4f98-b45d-31319e526629";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True;
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @("high","medium");
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1005-Developers-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("exchangeActiveSync","other");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1005-Developers-IdentityProtection-AllApps-AnyPlatform-BlockLegacyAuth";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-Persona-Developers-IdentityProtection-Exclusions","CA-BreakGlassAccounts");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "6431c65c-d7f6-40bf-8a56-4afa1b2bab16";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1006-Developers-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1006-Developers-AppProtection-MicrosoftIntuneEnrollment-AnyPlatform-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-AppProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "f3e7f37e-4034-406f-ab87-ad88dfdecd79";
            IncludeApplications                      = @("d4ebce55-015a-49b5-a083-c84d1797ae8c");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $True
            SignInFrequencyType                      = "";
            SignInFrequencyValue                     = "";
            SignInFrequencyInterval                  = "everyTime";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1007-Developers-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("approvedApplication","CompliantApplication");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1007-Developers-DataandAppProtection-AllApps-iOSorAndroid-ClientAppORAPP";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-AppProtection-Exclusions","CA-Persona-Developers-DataProtection-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "a6928a84-2882-47a1-b608-19e2566c7b24";
            IncludeApplications                      = @("Office365");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("android","iOS");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA1008-Developers-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("block");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA1008-Developers-AttackSurfaceReduction-AllApps-AnyPlatform-BlockUnknownPlatforms";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @("CA-BreakGlassAccounts","CA-Persona-Developers-AttackSurfaceReduction-Exclusions");
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @("android","iOS","windows","macOS","linux");
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "cc92e749-0b45-4d69-8da5-7b9873ca8826";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Developers");
            IncludeLocations                         = @();
            IncludePlatforms                         = @("all");
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA400-Guests-BaseProtection-AllApps-AnyPlatform-MFA"
        {
            ApplicationEnforcedRestrictionsIsEnabled = $False;
            BuiltInControls                          = @("mfa");
            ClientAppTypes                           = @("all");
            CloudAppSecurityIsEnabled                = $False;
            CloudAppSecurityType                     = "";
            Credential                               = $Credscredential;
            DisplayName                              = "CA400-Guests-BaseProtection-AllApps-AnyPlatform-MFA";
            Ensure                                   = "Present";
            ExcludeApplications                      = @();
            ExcludeGroups                            = @();
            ExcludeLocations                         = @();
            ExcludePlatforms                         = @();
            ExcludeRoles                             = @();
            ExcludeUsers                             = @();
            GrantControlOperator                     = "OR";
            Id                                       = "8e19f8a3-de9a-4c13-88ea-95adc851c074";
            IncludeApplications                      = @("All");
            IncludeGroups                            = @("CA-Persona-Guests");
            IncludeLocations                         = @();
            IncludePlatforms                         = @();
            IncludeRoles                             = @();
            IncludeUserActions                       = @();
            IncludeUsers                             = @();
            PersistentBrowserIsEnabled               = $False;
            PersistentBrowserMode                    = "";
            SignInFrequencyIsEnabled                 = $False;
            SignInFrequencyType                      = "";
            SignInRiskLevels                         = @();
            State                                    = "disabled";
            UserRiskLevels                           = @();
        }
    }
}

M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
