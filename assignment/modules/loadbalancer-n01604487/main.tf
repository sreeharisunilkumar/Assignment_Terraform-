resource "azurerm_public_ip" "lb_pip" {
  name                = "${var.load_balancer_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"

  tags = var.tags
}

resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "BackendAddressPool"
}

resource "azurerm_lb_probe" "lbprobe" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "http_probe"
  protocol        = "Http"
  port            = 80
  request_path    = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lbrule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "http_rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.bpepool.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "linux_vms" {
  count = length(var.vm_nic_ids)
  network_interface_id        = var.vm_nic_ids[count.index]
  ip_configuration_name       = "internal"
  backend_address_pool_id     = azurerm_lb_backend_address_pool.bpepool.id
}
