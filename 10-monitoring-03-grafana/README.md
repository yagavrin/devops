# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Задание повышенной сложности

Исходные файлы находятся в папке `src` https://github.com/yagavrin/devops/tree/main/10-monitoring-03-grafana/src

Для запуска компоуз необходимо поместить конфиг прометеуса `prometheus.yml` в папку `~/prometheus_config`. Данные для входа в Grafana находятся в `.env` файле

## Задание 1

Cкриншот веб-интерфейса grafana со списком подключенных Datasource.

![10-grafana_1](https://github.com/user-attachments/assets/e0135eda-5828-42d7-ad95-d0fe85e83570)

## Задание 2

Создайте Dashboard и в ней создайте Panels:

* утилизация CPU для nodeexporter (в процентах, 100-idle); `100 - (avg by (instance) (rate(node_cpu_seconds_total{job="node_exporter",mode="idle"}[1m])) * 100)`
* CPULA 1/5/15; `node_load1{job="node_exporter"}`, `node_load5{job="node_exporter"}`, `node_load15{job="node_exporter"}`
* количество свободной оперативной памяти; `node_memory_MemFree_bytes`
* количество места на файловой системе. `node_filesystem_free_bytes{fstype!="", mountpoint="/"}`

Cкриншот получившейся Dashboard.

![10-grafana_2](https://github.com/user-attachments/assets/509ae245-5025-41f1-b859-c1ea6e2be911)

## Задание 3

Cкриншоты тестовых событий из Telegram канала нотификаций

![10-grafana_tg_alert](https://github.com/user-attachments/assets/bec16de2-1070-42bd-879f-2db877f1ff45)

![10-grafana_2_tg](https://github.com/user-attachments/assets/4cf488ec-e195-44e8-9f97-6310b91c65f2)


## Задание 4

Файл Dashboard https://github.com/yagavrin/devops/blob/main/10-monitoring-03-grafana/grafana_node_model.json
