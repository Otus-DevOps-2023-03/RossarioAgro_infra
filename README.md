### ДЗ по модулю PACKER


```
testapp_IP = 130.193.38.240
testapp_port = 9292
```

Создать ветку packer-base

Перенести файлы предыдущего ДЗ в configscripts

Установил Packer на локальную машину

Создал сервисный аккаунт, делегировал права аккаунту для Packer

Создал шаблон описания образа VM с предустановленным Ruby и MongoDB

Сбилдил образ с приложением внутри

Параметризировал шаблон

Выполнил все доп.задания

### ДЗ по модулю Основные сервисы Yandex Cloud


```
testapp_IP = 84.252.128.120
testapp_port = 9292
```

Установил и настроил yc CLI для работы с аккаунтом,
создадал хост с помощью CLI,
установил на нем ruby для работы приложения,
установил и запустил MongoDB,
задеплоил тестовое приложение, запустил и проверил его работу.
Все необходимые команды завернул в скрипты.
Создал скрипт для создания инстанса с уже запущенным приложением.

Два варианта запуска инстанса:

Первый:

    ```
    yc compute instance create \
        --name reddit-app \
        --hostname reddit-app \
        --memory=4 \
        --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
        --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
        --metadata serial-port-enable=1 \
        --ssh-key ~/.ssh/appuser.pub
    ```
    Далее Скопировать на созданную ВМ файлы:

    - ```install_ruby.sh```
    - ```install_mongodb.sh```
    - ```deploy.sh```
    - ```startup.sh```

    Запустить скрипт ```startup.sh```

Второй:

Запустить скрипт ```yc_instance_init.sh```

---
### ДЗ по модулю Знакомство с облачной инфраструктурой. Yandex.Cloud
bastion_IP = 158.160.106.34

someinternalhost_IP = 10.128.0.18

vpn-host https://158.160.106.34.sslip.io

Для подключения к хосту без внешнего IP в одну команду необходимо использовать bastion как jump хост:
```
	ssh -J appuser@bastion appuser@someinternalhost
  ```

Для подключения вида ```ssh someinternalhost``` необходимо внести следующие правки в файл (создать alias) ``` ~/.ssh/config:```
```
### Jump host
Host bastion
  HostName 158.160.106.34
  user appuser

##### Destination host
Host someinternalhost
  HostName 10.128.0.18
  ProxyJump bastion
  user appuser
```
При этом bastion так же используется как jump хост, но так же можно настроить на bastion-хосте VPN.
