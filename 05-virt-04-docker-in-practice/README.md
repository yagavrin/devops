## Задача 2 (*)
Отчет о сканировании образа в yandex cloud container registry
![дз4р2](https://github.com/user-attachments/assets/4edda0d3-a546-4627-96cb-9bd24f06d29a)

## Задача 3
Запуск компоуз
![дз5р3](https://github.com/user-attachments/assets/66aafc0d-8b67-4b91-8129-9cefa17e528c)
Проверка работы с помощью curl, выполнение sql запроса
![дз5р3_sql](https://github.com/user-attachments/assets/4a971a98-75b6-41f4-805b-e35021d5d48e)
## Задача 4
Выполнение sql-запроса на Yandex Cloud ВМ
![дз5р4](https://github.com/user-attachments/assets/d2f3c541-3f0b-47ce-81f6-c5640cb494b7)
Ссылка на bash скрипт для деплоя

https://github.com/yagavrin/shvirtd-example-python/blob/main/deploy-script.sh

Ссылка на форк репозитория с ДЗ

https://github.com/yagavrin/shvirtd-example-python

## Задача 5 (*)
Так как образ schnitzler/mysqldump не поддерживает плагин caching_sha2_password, который нужен для авторизации на последней версии mysql сервера, было принято решение использовать оф. образ mysql, где уже установлен mysqldump

Ссылка на bash скрипт

https://github.com/yagavrin/shvirtd-example-python/blob/main/db_backup.sh

Список записанных дампов
![дз5р4_дамп](https://github.com/user-attachments/assets/00df873e-cd4b-4aa7-99ef-3e89487636ef)
Крон-таск
![дз5р4_крон](https://github.com/user-attachments/assets/bea8234e-ff54-41ae-8ac6-99e6f1c9ab6d)
## Задача 6
Ищем с помощью dive слой, где происходит копирование бинарного файла terraform

![дз5р6_дайв](https://github.com/user-attachments/assets/503db8d1-67bb-44d6-b02d-c83ac9e0d996)

Далее сохраняем образ в tar файл, распаковываем его и ищем нужный слой, еще раз распаковываем, получаем бинарный файл /bin/terraform
![дз5р6](https://github.com/user-attachments/assets/90103fda-9548-48f5-9aa4-349310ed0334)
## Задача 6.1
Запускаем контейнер terraform
![дз5р6_1_1](https://github.com/user-attachments/assets/2869defa-41bd-4762-b60b-f13d7124d1a7)
С помощью docker cp копируем файл на локальную машину
![дз5р6_1_2](https://github.com/user-attachments/assets/cee3c64a-91aa-4208-8f3c-c7a67183020b)
