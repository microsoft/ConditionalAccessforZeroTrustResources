param 
( 
    [Parameter(Mandatory = $true)] 
    [String]$CertificateThumbprint, 
    [String]$ApplicationId, 
    [String]$TenantId 
)  

Configuration M365TenantConfig 
{ 
    Import-DSCResource -ModuleName Microsoft365DSC 
    Update-M365DSCDependencies 
    Node localhost 
    { 
        AADConditionalAccessPolicy "AADConditionalAccessPolicy-CA001-Global-BaseProtection-AllApps-AnyPlatform-BlockNonPersonas" 
        { 
            CertificateThumbprint      = $CertificateThumbprint; 
            ApplicationId              = $ApplicationId; 
            TenantId                   = $TenantId; 
            ApplicationEnforcedRestrictionsIsEnabled = $False; 
            BuiltInControls                          = @("block"); 
            ClientAppTypes                           = @("all"); 
            CloudAppSecurityIsEnabled                = $False; 
            CloudAppSecurityType                     = ""; 
            DisplayName                              = "CA001-Global-BaseProtection-AllApps-AnyPlatform-BlockNonPersonas"; 
            Ensure                                   = "Present"; 
            ExcludeApplications                      = @(); 
            ExcludeGroups                            = @(); 
            ExcludeLocations                         = @(); 
            ExcludePlatforms                         = @(); 
            ExcludeRoles                             = @(); 
            ExcludeUsers                             = @(); 
            GrantControlOperator                     = "OR"; 
            Id                                       = "3e53010c-a9c7-4230-bc12-de24eda63f46"; 
            IncludeApplications                      = @("All"); 
            IncludeGroups                            = @(); 
            IncludeLocations                         = @(); 
            IncludePlatforms                         = @("all"); 
            IncludeRoles                             = @(); 
            IncludeUserActions                       = @(); 
            IncludeUsers                             = @("All"); 
            PersistentBrowserIsEnabled               = $False; 
            PersistentBrowserMode                    = ""; 
            SignInFrequencyIsEnabled                 = $False; 
            SignInFrequencyType                      = ""; 
            SignInRiskLevels                         = @(); 
            State                                    = "disabled"; 
            UserRiskLevels                           = @(); 
        }
      }
    }
