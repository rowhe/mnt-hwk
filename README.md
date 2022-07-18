# Описание плейбука site.yml
Данный плейбук предназначен для развертывания и настройки сервисов clickhouse и vector на докер контейнере с системой debian 11

* Технические требования к запуску плейбука:
 - Запущенный докер контейнер с именем deb11 из образа debian:11 в качестве managed host
 - строка запуска докер-контейнера:
```shell
sudo docker run -d --rm --name deb11 debian:11 sleep 50000000000
```
1. Установленный ansible
2. Проверить наличие и версию ansible можно при помощи команды:
```shell
ansible-playbook --version
```
* Ансибл в качестве параметров принимает файлы inventory/prod.yml и site.yml 
* Строка запуска плейбука должна выглядеть следующим образом:
```shell
ansible-playbook -i inventory/prod.yml site.yml
```
