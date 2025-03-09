Репозиторий с кодом:

https://github.com/yagavrin/devops/tree/main/08-ansible-02/playbook

5. Запустите ansible-lint site.yml и исправьте ошибки, если они есть.

![ans-02_lint](https://github.com/user-attachments/assets/81578be8-8fb8-4cec-bbc7-f5a56202b284)

6. Попробуйте запустить playbook на этом окружении с флагом --check.

![ans-02_check](https://github.com/user-attachments/assets/4957c00c-1f6d-4b76-9fc8-99efebc745b0)
 
7. Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены.

![ans-02_diff1](https://github.com/user-attachments/assets/55439497-746d-4932-b9e4-4f33f00e36f0)

8. Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.

![ans-02_diff2](https://github.com/user-attachments/assets/433a80a3-154e-41c4-a5e2-ac0357cd4cbc)
