

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}RG"
  location = var.location
}



