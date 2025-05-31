# Домашнее задание к занятию «Как работает сеть в K8s»


### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа

1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.

https://github.com/yagavrin/devops/tree/main/12-kuber-homeworks-3.3/src

3. Разместить поды в namespace App.

![12-kuber-33-1-1](https://github.com/user-attachments/assets/891196e0-ff20-428d-a4f8-a2e71834079e)

4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.

5. Продемонстрировать, что трафик разрешён и запрещён.

![12-kuber-33-1-2](https://github.com/user-attachments/assets/65febdd8-5a5e-4b5f-b737-20e6dab59343)

![12-kuber-33-1-3](https://github.com/user-attachments/assets/7cfeca35-6c40-4e9b-8516-b28ff621a824)
