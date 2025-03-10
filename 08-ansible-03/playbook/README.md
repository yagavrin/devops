# Ansible Playbook для установки ClickHouse и Vector

Данный Ansible Playbook предназначен для автоматизации установки и настройки ClickHouse и Vector на RHEL серверах. Playbook состоит из двух частей: установка ClickHouse и установка Vector.

## Зависимости

- **ansible 2.17.8**
- **python 3.10.12**

## Описание Playbook

### Установка ClickHouse

Playbook выполняет следующие задачи для установки ClickHouse:

1. Загрузка пакетов ClickHouse: Playbook загружает необходимые пакеты ClickHouse с официального сайта. Если загрузка основного пакета не удается, выполняется резервный вариант загрузки.

2. Установка пакетов ClickHouse: После загрузки пакетов, Playbook устанавливает их с помощью yum.

3. Создание базы данных: После успешной установки, Playbook создает базу данных logs в ClickHouse.

### Установка Vector

Playbook выполняет следующие задачи для установки Vector:

1. Загрузка пакета Vector: Playbook загружает бинарный пакет Vector с официального сайта.

2. Установка пакета Vector: После загрузки, Playbook устанавливает пакет Vector с помощью yum.

3. Настройка Vector: Playbook создает директорию для конфигурации Vector и копирует шаблон конфигурации vector.toml.j2 в /etc/vector.

4. Перезапуск Vector: После настройки, Playbook перезапускает службу Vector для применения изменений.


## Запуск Playbook

Для запуска Playbook выполните команду:

`ansible-playbook -i inventory/prod.yml site.yml`

## Параметры Playbook

### Глобальные переменные

- `ansible_user`: Пользователь для ssh подключения.

### Group_vars для ClickHouse

- `clickhouse_version`: Версия ClickHouse, которая будет установлена. По умолчанию: "22.3.3.44".

- `clickhouse_packages`: Список пакетов ClickHouse, которые будут установлены. По умолчанию:
```
clickhouse_packages:
  - clickhouse-client
  - clickhouse-server
  - clickhouse-common-static
```

### Group_vars для Vector

- `vector_version`: Версия Vector, которая будет установлена. По умолчанию: "0.45.0".

- `vector_log_path`: Путь к логам, которые будут обрабатываться Vector. По умолчанию: `/var/log/myapp/*.log`.

## Inventory

Inventory файл для конфигурации подключения. По умолчанию `inventory/prod.yml`:

```
all:
  hosts:
    clickhouse-01:
      ansible_host: <remote-server>
    vector-01:
      ansible_host: <remote-server>
  children:
    clickhouse:
      children:
        clickhouse_prod:
          hosts:
            clickhouse-01:
    vector:
      children:
        vector_prod:
          hosts:
            vector-01:
  vars:
    ansible_user: user
```

## Обратная связь

Если у вас есть вопросы или предложения по улучшению этого Playbook, пожалуйста, создайте issue в репозитории.
