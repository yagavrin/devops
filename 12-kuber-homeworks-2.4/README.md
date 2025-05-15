# Домашнее задание к занятию «Управление доступом»

### Задание 1. Создайте конфигурацию для подключения пользователя

2. Настройте конфигурационный файл kubectl для подключения.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.4/src/csr.yml

3. Создайте роли и все необходимые настройки для пользователя.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.4/src/role.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.4/src/role-binding.yml

![12-kuber-24-1](https://github.com/user-attachments/assets/31901d8c-c220-4db9-b8a5-0b373ac7c4c0)

4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).

![12-kuber-24-2](https://github.com/user-attachments/assets/08fc70c9-0c59-48cf-b7da-524712e00826)

![12-kuber-24-3](https://github.com/user-attachments/assets/5835aa2e-354f-49a7-a2c0-708f2e145271)

![12-kuber-24-4](https://github.com/user-attachments/assets/6a4b7b99-a44b-4817-b7bf-6dca49d69f91)
