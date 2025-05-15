# Домашнее задание к занятию «Конфигурация приложений»

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/nginx-deployment.yml

2. Решить возникшую проблему с помощью ConfigMap.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/multitool-configmap.yml

3. Продемонстрировать, что pod стартовал и оба конейнера работают.

![12-kuber-23-3](https://github.com/user-attachments/assets/740ea2a8-cce6-40b4-8012-3754cc3ab5b6)

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/nginx-configmap.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/nginx-service.yml

![12-kuber-23-4](https://github.com/user-attachments/assets/1006d165-6a7d-4671-b0e0-3be320a77945)

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/ssl-deployment.yml

2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/ssl-configmap.yml

4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/ingress.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.3/src/ssl-service.yml

![12-kuber-23-2-4](https://github.com/user-attachments/assets/940517df-3956-4793-9e33-373216b3911e)

![12-kuber-23-2-4-1](https://github.com/user-attachments/assets/1b826603-7992-4aff-9c10-b1fe59cc82b3)

