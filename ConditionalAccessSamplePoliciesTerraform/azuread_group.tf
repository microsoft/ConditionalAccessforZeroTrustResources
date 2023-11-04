data "azuread_client_config" "current" {}

# Create a Local COnfig and array variables for Local Group Names
locals {
  persona_types = [
    "Internals",
    "Developers",
    "Externals",
    "Guests",
    "GuestAdmins",
    "CorpServiceAccounts",
    "Admins",
    "WorkloadIdentities",
  ]
  policy_types = [
    "BaseProtection",
    "AppProtection",
    "IdentityProtection",
    "DataProtection",
    "AttackSurfaceReduction",
  ]
  ring_types = [
    "Ring0",
    "Ring1",
    "Ring2",
    "Ring3",
  ]
  

  # Nested loop over both lists, and flatten the result.
  persona_type_policy_type = distinct(flatten([
    for persona_type in local.persona_types : [
      for policy_type in local.policy_types : {
        persona_type = persona_type
        policy_type  = policy_type
      }
    ]
  ]))

  persona_type_ring_type = distinct(flatten([
    for persona_type in local.persona_types : [
      for ring_type in local.ring_types : {
        persona_type = persona_type
        ring_type  = ring_type
      }
    ]
  ]))

}



resource "azuread_group" "CA-Persona-Rings" {
  # We need a map to use for_each, so we convert our list into a map by adding a unique key:
   for_each      = { for entry in local.persona_type_ring_type: "${entry.persona_type}.${entry.ring_type}" => entry }
  display_name  = "CA-Persona-${each.value.persona_type}-${each.value.ring_type}"
  security_enabled = true
  description = "Manually managed by Conditional Access administrators"

}

resource "azuread_group" "CA-Persona-Groups" {
  # We need a map to use for_each, so we convert our list into a map by adding a unique key:
  for_each      = toset(local.persona_types)
  display_name  = "CA-Persona-${each.value}"
  security_enabled = true
  description = "Manually managed by Conditional Access administrators"
  # if each.value == "Internals" {}
  types    =  ["DynamicMembership"] 

  dynamic_membership {
    enabled = true
    rule = each.value == "Internals" ? "user.employeeid -match \"\\d{5}$\"" : each.value == "Externals" ? "user.userPrincipalName -contains \"ext\"" : each.value == "Guests" ? "user.userType  -contains \"Guest\"" : each.value == "CorpServiceAccounts" ? "user.userPrincipalName -contains \"serviceAccounts\"" : each.value == "Admins" ? "user.userPrincipalName -contains \"admin\"" : each.value == "GuestAdmins" ? "user.userType  -contains \"Guest\" -and user.userPrincipalName -contains \"admins\" "   : "user.department -match \"${each.value}\""
    
  }

}


resource "azuread_group" "CA-Persona-Groups-Exclusions" {
  # We need a map to use for_each, so we convert our list into a map by adding a unique key:
  for_each      = { for entry in local.persona_type_policy_type: "${entry.persona_type}.${entry.policy_type}" => entry }
  display_name  = "CA-Persona-${each.value.persona_type}-${each.value.policy_type}-exclusions"
  security_enabled = true
  description = "Manually managed by Conditional Access administrators"

}



resource "azuread_group" "breakglass" {
  display_name     = "CA-Breakglass"
  
  security_enabled = true


}
