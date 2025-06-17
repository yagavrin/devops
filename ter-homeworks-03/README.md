Ссылка на репозиторий: 

https://github.com/yagavrin/devops/tree/terraform-03/ter-homeworks-03

## Задание 1

Cкриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud

![ter-03_01](https://github.com/user-attachments/assets/3bc66f66-8a04-44cb-90f2-c46191833024)

## Задание 2

ВМ count-vm.tf и for_each-vm.tf

![ter-03_02](https://github.com/user-attachments/assets/acab3713-ef17-4bb3-8722-e92acf186fc2)

## Задание 4

Сгененрированный inventory-файл для ansible

![ter-03_04](https://github.com/user-attachments/assets/44a414e3-8bb2-45dd-9fc0-3c57c94c9082)

## Задание 5* (необязательное)

Cкриншот вывода команды terrafrom output

![ter-03_05](https://github.com/user-attachments/assets/f1ced8ab-fe80-41af-a300-98d1ecc1800c)

## Задание 7* (необязательное)

Выражение для terraform console, которое удалит из данной переменной 3 элемент из: subnet_ids и subnet_zones

```
merge(local.test_vpc, {
    subnet_ids = concat(
      slice(local.test_vpc.subnet_ids, 0, 2), slice(local.test_vpc.subnet_ids, 3, length(local.test_vpc.subnet_ids))
    ),
    subnet_zones = concat(
      slice(local.test_vpc.subnet_zones, 0, 2), slice(local.test_vpc.subnet_zones, 3, length(local.test_vpc.subnet_zones))
    )
  })
```

![ter-03_07](https://github.com/user-attachments/assets/cb436af7-f0e8-432c-8eee-9f1c30c0d0d8)


## Задание 8* (необязательное)

Исправленный шаблон. Была неверно поставлена фигурная скобка и лишний пробел у platform_id

```
[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"]} platform_id=${i["platform_id"]}
%{~ endfor ~}
```

## Задание 9* (необязательное)

Terraform выражения, которые сформируют списки
```
[for i in range(1, 100) : i < 10 ? "rc0${i}" : "rc${i}"]
[for i in range(1, 100) : i < 10 ? "rc0${i}" : "rc${i}" if i == 19 ? true : can(regex(".*[^0789]$", i))]
```
