output "vm_instances" {
    description = "Information about VMs count and for_each"

    value = {
        platform = [
            for instance in yandex_compute_instance.platform : {
                name = instance.name
                id   = instance.id
                fqdn = instance.fqdn
            }
        ]
        db = [
            for instance in yandex_compute_instance.db : {
                name = instance.name
                id   = instance.id
                fqdn = instance.fqdn
            }
        ]
    }
}