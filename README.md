# Описание плейбука site.yml
Данный плейбук предназначен для развертывания и настройки сервисов clickhouse+lighthouse и vector на докер контейнерах с системой debian 11
Установка осуществляется при помощи ролей:
- roles/python-role
- roles/required-role
- roles/nginx-role
- roles/lighthouse-role
- roles/clickhouse-role
- roles/vector-role

* Технические требования к запуску плейбука:
1. Запущенны докер контейнеры с именами vec, lg и ch из образа debian:11 в качестве managed host
 - строки запуска докер-контейнеров:
```shell
sudo docker run -d --rm --name vec debian:11 sleep 50000000000
sudo docker run -d --rm --name ch -p8123:8123 debian:11 sleep 5000000
sudo docker run -d --rm --name lh -p80:80 debian:11 sleep 5000000
```
2. Установленный ansible
* Проверить наличие и версию ansible можно при помощи команды:
```shell
ansible-playbook --version
```
3. Плейбук следует запускать из директории `playbook` предварительно зайдя в нее при помощи команды `cd playbook`
* Ансибл в качестве параметров принимает файлы inventory/prod.yml и site.yml
* Строка запуска плейбука должна выглядеть следующим образом:
```shell
ansible-playbook -i inventory/prod.yml site.yml
```
