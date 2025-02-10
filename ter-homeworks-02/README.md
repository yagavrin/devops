## Задание 1

4. Ошибки:
    * platform_id = "standart-v4" Ошибка в слове "standart", так же у яндекса нет платофоры v4, исправляем на "standard-v3"
    * core_fraction = 5 для платформы "standard-v3 доступны уровни: 20/50/100
    * cores = 1 для платформы "standard-v3 доступно количество ядер vCPU:  2/4
6. Параметры preemptible = true (прерываемая ВМ) и core_fraction=5 (уровень производительности) подходят для учебных ВМ чтобы снизить их стоимость

Скриншот консоли

![ter-02_01console](https://github.com/user-attachments/assets/b4dd0022-5ca7-43eb-b5ef-c6a64778c2e8)

Скриншот панели управления

![ter-02_01yc](https://github.com/user-attachments/assets/b4731642-8b3e-4131-abe1-198ed6a2c18f)

## Задание 2

![ter-02_02](https://github.com/user-attachments/assets/73723ad2-b5d2-4637-a90f-215a6b083298)

## Задание 3

Добавлена ВМ netology-develop-platform-db

![ter-02_03](https://github.com/user-attachments/assets/9827d0d9-babe-4886-9b85-b50cc6f4732e)

## Задание 4

Вывод команды terraform output

![ter-02_04](https://github.com/user-attachments/assets/d7168451-4cdd-435b-a335-12aac616365c)

## Задание 7

![ter-02_07](https://github.com/user-attachments/assets/9945dbc3-ef03-470d-8482-580ecec57f58)

Вывод фразы "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks"

![изображение](https://github.com/user-attachments/assets/ed5542f1-36a5-4ef5-87d3-27cc09fab969)

## Задание 8

![изображение](https://github.com/user-attachments/assets/03938d5f-e6bf-4064-a445-ae949098f83b)

## Задание 9
Для подключения к серийной консоли потребовалось разрешить авторизацию по метаданным и использовать ssh ключ, незашифрованный паролем

`yc compute instance update   --name netology-develop-platform-db   --serial-port-settings ssh-authorization=INSTANCE_METADATA`

Подключение к серийной консоли:

`ssh -t -p 9600 -o IdentitiesOnly=yes -i ~/.ssh/test_yc epdllq8pqc68ir37tgik.ubuntu@serialssh.cloud.yandex.net`

Проверка доступа в интернет с включенным nat

![ter-02_09 cons](https://github.com/user-attachments/assets/290e496a-847a-4de2-a10a-b3eba22b8612)

Панель управления VPC

![ter-02_09 yc](https://github.com/user-attachments/assets/e9df0ed0-db6d-4bb3-b82b-d26d74929929)
