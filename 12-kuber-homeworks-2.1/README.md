# Домашнее задание к занятию «Хранение в K8s. Часть 1»

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.1/src/vol-deployment.yml

4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.

![12-kuber-21-1](https://github.com/user-attachments/assets/80aadb7d-520b-4765-b3b4-7dc5620e0d3b)

### Задание 2

1. Создать DaemonSet приложения, состоящего из multitool.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.1/src/daemonset.yml

3. Продемонстрировать возможность чтения файла изнутри пода.

![12-kuber-21-2](https://github.com/user-attachments/assets/18ac57eb-81f1-4780-9a82-406de871bf45)
