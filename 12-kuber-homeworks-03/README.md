# Домашнее задание к занятию «Запуск приложений в K8S»

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
   
  * https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-03/src/nginx-deployment.yml
    
  ![12-kuber-03-1-1](https://github.com/user-attachments/assets/7751a34b-7199-4b27-b982-5ff5c4d4a061)

2. После запуска увеличить количество реплик работающего приложения до 2.

3. Продемонстрировать количество подов до и после масштабирования.

   ![12-kuber-03-1-2](https://github.com/user-attachments/assets/3b4a57bb-af74-4ebd-bdd3-012bad43f390)
   
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
   
  * https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-03/src/nginx-multitool-svc.yml

  ![12-kuber-03-1-4](https://github.com/user-attachments/assets/35c80141-45ed-4d00-98c1-662af06509e0)

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.
   
  * https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-03/src/multitool-pod.yml
    
  ![12-kuber-03-1-5](https://github.com/user-attachments/assets/b905f27a-6e3f-4b6a-a98f-28f7245d2ed7)


------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
   
  * https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-03/src/probe-nginx-dep.yml

2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.

  ![12-kuber-03-2-1](https://github.com/user-attachments/assets/cd0e142c-a1fa-4824-8174-7c82b3d5b092)
   
3. Создать и запустить Service. Убедиться, что Init запустился.
   
  * https://github.com/yagavrin/devops/blob/main/12-kuber-homeworks-03/src/probe-nginx-svc.yml
    
4. Продемонстрировать состояние пода до и после запуска сервиса.

  ![12-kuber-03-2-4](https://github.com/user-attachments/assets/4e88f37d-06b9-4107-b1a4-3aa163d74835)

