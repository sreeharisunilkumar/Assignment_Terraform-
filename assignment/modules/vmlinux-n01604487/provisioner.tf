resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.n01604487-vm

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]

    connection {
      type     = "ssh"
      user     = var.admin_username
      private_key = file(var.priv_key)
      host     = azurerm_public_ip.n01604487_pip[each.key].fqdn
    }
  }
}
