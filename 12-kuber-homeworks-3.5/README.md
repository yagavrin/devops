# Домашнее задание к занятию Troubleshooting

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.

  * Под web-consumer находится в неймспейсе web, но пытается обратится по доменному имени `auth-db` к сервису в другом неймспейсе data

![12-kuber-35-1](https://github.com/user-attachments/assets/9dae4ce1-e97d-4844-9f12-3a239b8a697b)


3. Исправить проблему, описать, что сделано.

  * Исправлен адрес в команде пода web-consumer c `auth-db` на `auth-db.data`

4. Продемонстрировать, что проблема решена.

![12-kuber-35-2](https://github.com/user-attachments/assets/ffde869b-7cff-4e32-8ccf-c57b0b7cdd5b)



