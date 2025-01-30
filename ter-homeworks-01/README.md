
## Чек-лист готовности к домашнему заданию

![ter-01_00](https://github.com/user-attachments/assets/c91afd8c-2db4-4797-82c5-77a4272166b2)

## Задание 1

2. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию? В файле personal.auto.tfvars

3. Найдите в state-файле секретное содержимое созданного ресурса random_password: "result": "GRNCL98H25LWKjNh",

4. Объясните, в чём заключаются намеренно допущенные ошибки:
- All resource blocks must have 2 labels (type, name). Нужно добавить название ресурса, чтобы можно было обратиться к нему в дальнейшем

- A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes. Имя не может начинаться с цифры (1nginx)

- A managed resource "random_password" "random_string_FAKE" has not been declared in the root module. Некорректное название ресурса random_string 

- This object has no argument, nested block, or exported attribute named "resulT". Did you mean "result" Некорректное обращение к результату ресурса random_string
5. Исправленный фрагмент кода и вывод команды `docker ps`
  
```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
```

![ter-01_01](https://github.com/user-attachments/assets/e8b10151-de99-4ffb-b538-001acdc99f39)

6. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? Опасность применения. Если конфигурация Terraform содержит логические ошибки, они будут применены автоматически без возможности проверки. Можно удалить критичные ресурсы или что-то сломать. Ключ может использоваться в пайплайнах CI/CD или скриптах автоматизации, тк команда не требует подтверждения, либо после terraform plan, когда проверен список изменений.

![ter-01_01-2](https://github.com/user-attachments/assets/b7fcb6ff-4b81-407d-b1c6-f3c20744273b)

7. Уничтожьте созданные ресурсы с помощью terraform

```
{
  "version": 4,
  "terraform_version": "1.10.5",
  "serial": 11,
  "lineage": "6811389f-ac3e-bcd5-8a20-809f6b01d0ff",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. Объясните, почему при этом не был удалён docker-образ nginx:latest. Причина в ключе keep_locally.

```
resource "docker_image" {
  name         = "nginx:latest"
  keep_locally = true
}
```

keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

## Задание 2*

6. Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды env. Запишите ваш финальный код в репозиторий.

Ссылка на код: 
   
![ter-02_01](https://github.com/user-attachments/assets/ec250fd5-17d0-4003-9c20-15305eddfacd)

## Задание 3*

1. Установите opentofu(fork terraform с лицензией Mozilla Public License, version 2.0) любой версии

![изображение](https://github.com/user-attachments/assets/746c1b9e-f82e-4b4c-a7f2-c719ef654c05)

2. Попробуйте выполнить тот же код с помощью tofu apply, а не terraform apply. Команда выполняется успешно, изменений в коде не требуется.

