# RossarioAgro_infra
## RossarioAgro Infra repository

### bastion_IP = 35.198.167.169
### someinternalhost_IP = 10.156.0.3
### vpn-host https://84.201.175.20.sslip.io

## ДЗ по модулю Знакомство с облачной инфраструктурой. Yandex.Cloud
Для подключения к хосту без внешнего IP в одну команду необходимо использовать bastion как jump хост:
```
	ssh -J appuser@<bastion jump host> appuser@<dest host without public ip>
  ```

Для подключения вида ```ssh someinternalhost``` необходимо внести следующие правки в файл (создать alias) ``` ~/.ssh/config:```
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
```
При этом bastion так же используется как jump хост, но так же можно настроить на bastion-хосте VPN.
