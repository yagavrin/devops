# Домашнее задание к занятию «Хранение в K8s. Часть 2»

### Задание 1

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/pv-deployment.yml

2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/pv.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/pvc-nfs.yaml

3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 

![12-kuber-22-3](https://github.com/user-attachments/assets/cbcd9ce5-0cca-475a-8c2d-fe5824d92698)

4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.

  * PVC, который был привязан к PV был удален, но PV еще содержит файлы. Поэтому PV получает статус Released, файлы продолжают хранится на диске ноды.

![12-kuber-22-4](https://github.com/user-attachments/assets/3cd92092-6325-454d-92c9-a010e9097339)

5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.

  * У PV установлена по умолчанию reclaimPolicy: Retain, поэтому PV получает статус Released. Файлы хранятся на диске ноды вне кластера, поэтому Kubernetes с такой конфигурацией ничего с ними не делает. Далее требуется вручную очистить/еще как-то использовать эти файлы.

![12-kuber-22-5](https://github.com/user-attachments/assets/44630710-eec9-4ae0-bb29-3ff139cd0855)

### Задание 2

1. Включить и настроить NFS-сервер на MicroK8S.

![12-kuber-22-2-1](https://github.com/user-attachments/assets/0e8fd913-78cf-4340-a10c-8bc636970781)

2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/nfs-deployment.yml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/pvc-nfs.yaml

https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-2.2/src/sc-nfs.yaml

3. Продемонстрировать возможность чтения и записи файла изнутри пода. 

![12-kuber-22-2-3](https://github.com/user-attachments/assets/481c705c-7c5c-427a-9eb8-86328c59378f)

