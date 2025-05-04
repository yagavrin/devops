# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-05/src/frontend-deployment.yml

2. Создать Deployment приложения _backend_ из образа multitool. 

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-05/src/backend-deployment.yml

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-05/src/frontend-service.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-05/src/backend-service.yml

4. Продемонстрировать, что приложения видят друг друга с помощью Service.

![12-kuber-05-1b](https://github.com/user-attachments/assets/d70ea8fd-16f7-4951-8776-960081c2c9ad)

![12-kuber-05-1f](https://github.com/user-attachments/assets/5781a6c3-bde6-4dea-aa37-7ec167988a67)


------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-05/src/ingress.yml

3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

![12-kuber-05-2f](https://github.com/user-attachments/assets/40d879cd-8e87-41e0-8048-82ba0202ee33)

![12-kuber-05-2b](https://github.com/user-attachments/assets/9d3cffaf-5b92-4df2-ad02-8e6bc2a53162)
