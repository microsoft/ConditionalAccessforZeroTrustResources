# This helper script is a script that documents the logical names of users, groups and named locations from a CA policies export
# When you export CA policies from Entra ID, they are typically shown as GUIDs which is difficult to read.
# The script assumes that you have Microsoft.Graph PowerShell module installed (or Microsoft.Graph.Beta) for PowerShell 7.
# Author: Claus Jespersen, Principal Security Consultant, Microsoft
# Date: February 2024

# Connect to Microsoft Graph with the necessary scopes in a PowerShell 7 session 
$tenantId = '<yourentraidtenantid>'  
$adminUser = '<yourentraidadminaccount>'  
$scopes = "Policy.Read.All", "Group.Read.All", "User.Read.All", "Application.Read.All"  
  
# Initiate interactive login  
# select-mgprofile -name 'beta'
Connect-MgGraph -TenantId $tenantId -Scopes $scopes 
  
# Get CA Policies  
$response = Get-MgIdentityConditionalAccessPolicy

# Iterate over each policy
foreach ($policy in $response) {
    write-host $policy.displayname
    # Convert group IDs to display names
    foreach ($spId in $policy.Conditions.Applications.IncludeApplications) {
        if ($spId -match '^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$') {
            $spObj = Get-Mgserviceprincipal -filter "appId eq '$spId'"
            Write-Host "Include App ID: $spId, App Name: $($spObj.DisplayName)"
        } else {
            Write-Host "Include App ID: $spId"
        }
    }

    foreach ($spId in $policy.Conditions.Applications.ExcludeApplications) {
        if ($spId -match '^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$') {
            $spObj = Get-Mgserviceprincipal -filter "appId eq '$spId'"
            Write-Host "Exclude App ID: $spId, App Name: $($spObj.DisplayName)"
        } else {
            Write-Host "Exclude App ID: $spId"
        }
    }

   # Convert named location IDs to display names
    foreach ($locationId in $policy.Conditions.Locations.IncludeLocations) {
        if ($locationId -match '^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$') {
            $location = Get-MgIdentityConditionalAccessNamedLocation -NamedLocationId $locationId
            Write-Host "Include Location ID: $locationId, Location Name: $($location.DisplayName)"
        }
    }

    foreach ($locationId in $policy.Conditions.Locations.ExcludeLocations) {
        if ($locationId -match '^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$') {
            $location = Get-MgIdentityConditionalAccessNamedLocation -NamedLocationId $locationId
            Write-Host "Exclude Location ID: $locationId, Location Name: $($location.DisplayName)"
        }
    }

    # Convert terms of use IDs to display names
    foreach ($termsOfUseId in $policy.Conditions.TermsOfUse.Ids) {
       if ($termsOfUseId -match '^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$') {
        $termsOfUse = Get-MgIdentityConditionAccessPolicyTermsOfUse -TermsOfUseId $termsOfUseId
        Write-Host "Terms of Use ID: $termsOfUseId, Terms of Use Name: $($termsOfUse.DisplayName)"
        }
    }
}
