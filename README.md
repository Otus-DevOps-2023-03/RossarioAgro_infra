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
