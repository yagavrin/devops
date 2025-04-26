# Домашнее задание к занятию «Базовые объекты K8S»

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod. https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-02/src/hello-world-pod.yml

  * Список подов

![12-kuber-02-pod-get](https://github.com/user-attachments/assets/0c1420d3-ea22-4378-afb2-ee0f4f1bf10a)
   
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![12-kuber-02-pod-curl](https://github.com/user-attachments/assets/9b50af4a-c3c5-42f7-ae81-161da65c2aca)

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web. https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-02/src/netology-web-pod.yml

2. Создать Service с именем netology-svc и подключить к netology-web. https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-02/src/netology-svc-service.yml

  * Список сервисов

![12-kuber-02-svc-get](https://github.com/user-attachments/assets/9bfcbc5a-b62e-4a1a-ac83-736f53c2cdf5)

3. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![12-kuber-02-svc-curl](https://github.com/user-attachments/assets/432ad952-191d-475e-8179-ec773f7b1835)
