# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

![ci-04-setup_agent3](https://github.com/user-attachments/assets/e9c7d129-1668-4d72-a410-e4da76c339f8)

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![09-ci-04-1](https://github.com/user-attachments/assets/982adb8d-c56c-43c2-92bc-73d78684f31a)

![09-ci-04-1d](https://github.com/user-attachments/assets/6879747d-df45-480a-8e69-1efbb3d9e050)

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![09-ci-04-2](https://github.com/user-attachments/assets/2e4e2775-975a-41bd-9bce-2e17a4592727)

![09-ci-04-2d](https://github.com/user-attachments/assets/cd41f92f-553b-42ad-9437-3a85b095332d)

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.

![09-ci-04-3](https://github.com/user-attachments/assets/169558fa-4358-4ef6-8ac1-a4dafa2f4dc9)

![09-ci-04-4](https://github.com/user-attachments/assets/72da8b6b-39d8-4c11-81e3-34200ed1ebfe)

5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).

6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.

![09-ci-04-6](https://github.com/user-attachments/assets/ef9a6fe2-2ae6-4e4a-8b65-cbeb0f538ba0)

7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.

![изображение](https://github.com/user-attachments/assets/d283eed0-bb7f-4289-9139-d6165b9bac3c)

![09-ci-04-7](https://github.com/user-attachments/assets/b063dfd5-587a-4ca2-831d-47b8da98a29f)




8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.

https://github.com/yagavrin/vector-role

