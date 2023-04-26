# RossarioAgro_infra
RossarioAgro Infra repository

## ДЗ по модулю Знакомство с облачной инфраструктурой. Yandex.Cloud
Для подключения к хосту без внешнего IP в одну команду необходимо использовать bastion как jump хост:
```
	ssh -J appuser@<bastion jump host> appuser@<dest host without public ip>
  ```

Для подключения вида ```ssh someinternalhost``` необходимо внести следующие правки в файл (создать alias) ```/.ssh/config:```
```
### Jump host
Host bastion
  HostName 0.0.0.0
  user appuser

##### Destination host
Host someinternalhost
  HostName 1.1.1.1
  ProxyJump bastion
  user appuser
