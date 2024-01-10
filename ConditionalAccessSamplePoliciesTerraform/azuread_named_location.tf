
resource "azuread_named_location" "AzureVnet-ip" {
  display_name = "AzureVnet-ip IP Named Location"
  ip {
    ip_ranges = [
      "1.1.1.1/32",
      "2.2.2.2/32",
    ]
    trusted = true
  }
}

resource "azuread_named_location" "TrustedLocation" {
  display_name = "Trusted Country"
  country {
    countries_and_regions = [
      "GB",
      "US",
    ]
    include_unknown_countries_and_regions = false
  }
}
