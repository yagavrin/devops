# Домашнее задание к занятию 12 «GitLab»

## Основная часть

### DevOps

Файл `gitlab-ci.yml`

```
stages:
  - build
  - deploy

image: docker:28.0

services:
  - name: docker:28.0-dind
    command: ["--insecure-registry=130.193.44.179:5005"]
variables:

  DOCKER_HOST: tcp://docker:2375

  DOCKER_TLS_CERTDIR: ""
builder:
  stage: build
  script:
    - docker build -t python-api:latest .
  except:
    - main

deployer:
  stage: deploy
  script:
    - docker build -t $CI_REGISTRY_IMAGE:gitlab-$CI_COMMIT_SHORT_SHA .
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker push $CI_REGISTRY_IMAGE:gitlab-$CI_COMMIT_SHORT_SHA
  only:
    - main

```

`Dockerfile`

```
FROM python:3.11-slim-bookworm
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY ./python_api/python-api.py .
CMD ["python3", "python-api.py"]
```

Процесс сборки:

![09-gitlab-dev-pipe](https://github.com/user-attachments/assets/7c88e063-76f6-4358-a02e-b9925be29d67)

### Product Owner

Текст Issue

![09-gitlab-issue](https://github.com/user-attachments/assets/959c3253-4def-4033-b404-7bb5b7bf0054)


### Developer

Merge Request

![09-gitlab-d-mr](https://github.com/user-attachments/assets/10d2d11c-495d-418b-8760-7c69f2a4fb91)

Успешная сборка после мержа

![09-gitlab-d-merge](https://github.com/user-attachments/assets/803f92f8-9c32-4dbf-af8a-9f5f3747154b)

### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.

![09-gitlab-test-curl](https://github.com/user-attachments/assets/99ab60e2-8912-4bec-ae62-25dbc54804b9)

2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

![09-gitlab-test-close](https://github.com/user-attachments/assets/b08d1468-7094-4f4c-a8b7-4890f9ff3d55)


