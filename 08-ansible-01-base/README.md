
  
1. Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook - some_fact: 12

![ans-01_00](https://github.com/user-attachments/assets/374b46fe-c3d6-4e34-b747-a103114a5b50)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.

![ans-01_02](https://github.com/user-attachments/assets/ec33a977-4f05-447b-b5e2-eb3d06d08e2a)

4. Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.

![ans-01_04](https://github.com/user-attachments/assets/862bd22d-a920-4d7b-9556-a02596ff5186)

5. Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.

![ans-01_05](https://github.com/user-attachments/assets/6165b5d4-b44b-42c8-8a87-872d60abeb85)

7. Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.

![ans-01_07](https://github.com/user-attachments/assets/bd23a95a-b1a4-49d0-a046-9f47a4b402ea)

8. Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.

Для группы local отображается "all default fact" из group_vars/all так как some_fact не определен для группы local

![ans-01_11](https://github.com/user-attachments/assets/8be48979-2a14-402b-88df-407adca96cdd)

