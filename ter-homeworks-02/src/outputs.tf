output "vm_instances" {
    description = "Information about all VMs"

    value = {
        for instance in [yandex_compute_instance.platform, yandex_compute_instance.platform_db] : instance.name => {
            instance_name = instance.name
            external_ip   = instance.network_interface[0].nat_ip_address
            fqdn          = instance.fqdn
        }
    }
}