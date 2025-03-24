---------------------------- MATH-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname MATH-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 40
name SCIENCE
vlan 333
name BLACKHOLE



int gi 0/1
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 40
interface gi 0/2
switchport mode access
switchport access vlan 333
shutdown
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30
exit



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable
exit



exit

---------------------------- SCIE-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname SCIE-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 40
name SCIENCE
vlan 333
name BLACKHOLE

int gi 0/1
switchport mode trunk
int range fa 0/1-4
switchport mode access
switchport access vlan 40
interface gi 0/2
switchport mode access
switchport access vlan 333
shutdown
interface range fa 0/5-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30
exit



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable
exit


---------------------------- PHAR-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname PHAR-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 50
name PHARMARCY
vlan 333
name BLACKHOLE



int gi 0/1
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 50
interface gi 0/2
switchport mode access
switchport access vlan 333
shutdown
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30
exit



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit


---------------------------- REKTOR-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname REKTOR-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 20
name REKTOR
vlan 30
name WLAN
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 20
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit


---------------------------- IT-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname IT-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 16
name WLAN_MANAGEMENT
vlan 10
name IT
vlan 30
name WLAN_REKTOR
VLAN 35
name WLAN_GUEST
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 10
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30
int fa 0/22
no shutdown
switchport mode access
switchport access vlan 15



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

---------------------------- LIBR-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname LIBR-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 60
name LIBRARY
vlan 30
name WLAN
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 60
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

---------------------------- LABS-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname LABS-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 70
name LABS
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 70
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

---------------------------- HALL-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname HALLS-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 75
name HALLS
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 75
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

---------------------------- ENGI-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname ENGI-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 80
name ENGINEERING
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 80
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

---------------------------- FORE-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname FORE-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 80
name FOREIGN
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 90
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 15



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit



---------------------------- SPOR-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname SPOR-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 95
name SPORTS
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 95
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30




int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit



---------------------------- APSC-ACCESS ----------------------------
en
conf t
no ip domain-lookup
hostname APSC-ACCESS
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 100
name APSC
vlan 333
name BLACKHOLE



int range gi 0/1-2
switchport mode trunk
int range fa 0/1-3
switchport mode access
switchport access vlan 100
interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown
int fa 0/21
no shutdown
switchport mode access
switchport access vlan 30



int range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable

exit

##########################################################################################

---------------------------- DIST-FACULTY1-1 ----------------------------
en
conf t
no ip domain-lookup
hostname DIST-FACULTY1-1
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 40
name SCIENCE
vlan 50
name PHARMARCY
vlan 333
name BLACKHOLE
exit



interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown

interface gigabitEthernet 0/1
no shutdown
description DIST-FACULTY1-1 to CORE-1
no switchport
ip address 10.5.0.54 255.255.255.252

interface gigabitEthernet 0/2
no shutdown
description DIST-FACULTY1-1 to CORE-2
no switchport
ip address 10.5.0.58 255.255.255.252
exit

interface fa 0/1
description MATH_STAT
switchport mode trunk
no shutdown

interface fa 0/2
description SCIENCE2
switchport mode trunk
no shutdown

interface fa 0/3
description FAC_PHARMACY
switchport mode trunk
no shutdown

int vlan30
ip address 10.30.32.1 255.255.252.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
exit

int vlan40
ip address 172.16.40.1 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
exit

int vlan50
ip address 172.16.50.1 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
exit



router ospf 1
router-id 2.2.2.3

network 10.5.0.52 0.0.0.3 area 0 
network 10.5.0.56 0.0.0.3 area 0 

network 10.30.32.0 0.0.15.255 area 0 

network 172.16.40.0 0.0.0.255 area 0
network 172.16.50.0 0.0.0.255 area 0

exit



---------------------------- DIST-ADMIN-1 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname DIST-ADMIN-1
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 10
name IT
vlan 15
name MANAGEMENT
vlan 20
name RECTOR
vlan 30
name WLAN_RECTOR
vlan 35
name WLAN_GUEST
vlan 333
name BLACKHOLE
exit



interface range fa 0/3-24
switchport mode access
switchport access vlan 333
shutdown

interface gigabitEthernet 0/1
description DIST-ADMIN-1 to CORE-1
no switchport
ip address 10.5.0.38 255.255.255.252

interface gigabitEthernet 0/2
description DIST-ADMIN-1 to CORE-2
no switchport
ip address 10.5.0.42 255.255.255.252
exit

interface fa 0/1
description RECTOR
switchport mode trunk
no shutdown

interface fa 0/2
description IT
switchport mode trunk
no shutdown

int vlan10
ip address 172.16.10.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 10 ip 172.16.10.1
standby 10 priority 110
standby 10 preempt
exit

int vlan20
ip address 172.16.20.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 20 ip 172.16.20.1
standby 20 priority 110
standby 20 preempt
exit

int vlan15
ip address 192.168.15.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 15 ip 192.168.15.1
standby 15 priority 110
standby 15 preempt
exit

int vlan30
ip address 10.30.16.2 255.240.0.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.16.1
standby 30 priority 110
standby 30 preempt
exit




router ospf 1
router-id 2.2.2.1

network 10.5.0.36 0.0.0.3 area 0
network 10.5.0.40 0.0.0.3 area 0

network 10.30.16.0 0.0.15.255 area 0

network 172.16.10.0 0.0.0.255 area 0
network 172.16.20.0 0.0.0.255 area 0
network 192.168.15.0 0.0.0.255 area 0

exit



exit


---------------------------- DIST-ADMIN-2 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname DIST-ADMIN-2
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 10
name IT
vlan 15
name MANAGEMENT
vlan 20
name RECTOR
vlan 30
name WLAN_RECTOR
vlan 35
name WLAN_GUEST
vlan 333
name BLACKHOLE
exit




interface range fa 0/3-24
switchport mode access
switchport access vlan 333
shutdown

interface gigabitEthernet 0/1
description DIST-ADMIN-2 to CORE-1
no switchport
ip address 10.5.0.46 255.255.255.252

interface gigabitEthernet 0/2
description DIST-ADMIN-2 to CORE-2
no switchport
ip address 10.5.0.50 255.255.255.252
exit

interface fa 0/1
description RECTOR
switchport mode trunk
no shutdown

interface fa 0/2
description IT
switchport mode trunk
no shutdown

int vlan10
ip address 172.16.10.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 10 ip 172.16.10.1
standby 10 priority 100
standby 10 preempt
exit

int vlan20
ip address 172.16.20.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 20 ip 172.16.20.1
standby 20 priority 100
standby 20 preempt
exit

int vlan15
ip address 192.168.15.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 15 ip 192.168.15.1
standby 15 priority 100
standby 15 preempt
exit


int vlan30
ip address 10.30.16.3 255.240.0.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.16.1
standby 30 priority 100
standby 30 preempt
exit




router ospf 1
router-id 2.2.2.1

network 10.5.0.36 0.0.0.3 area 0
network 10.5.0.40 0.0.0.3 area 0

network 10.30.16.0 0.0.15.255 area 0

network 172.16.10.0 0.0.0.255 area 0
network 172.16.20.0 0.0.0.255 area 0
network 192.168.15.0 0.0.0.255 area 0

exit



exit



---------------------------- DIST-LIBRARY-1 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname DIST-LIBRARY-1
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 60
name LIBRARY
vlan 70
name LABS
vlan 75
name HALLS
vlan 333
name BLACKHOLE



interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown

interface gigabitEthernet 0/1
description DIST-LIBRARY-1 to CORE-1
no switchport
ip address 10.5.0.70 255.255.255.252

interface gigabitEthernet 0/2
description DIST-LIBRARY-1 to CORE-2
no switchport
ip address 10.5.0.74 255.255.255.252
exit

interface fa 0/1
description LIBRARY
switchport mode trunk
no shutdown

interface fa 0/2
description LABS
switchport mode trunk
no shutdown

interface fa 0/3
description HALLS
switchport mode trunk
no shutdown



int vlan30
ip address 10.30.48.2 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.48.1
standby 30 priority 110
standby 30 preempt
exit

int vlan60  
ip address 172.16.60.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 60 ip 172.16.60.1
standby 60 priority 110
standby 60 preempt
exit

int vlan70
ip address 172.16.70.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 70 ip 172.16.70.1
standby 70 priority 110
standby 70 preempt
exit

int vlan75
ip address 172.16.75.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 75 ip 172.16.75.1
standby 75 priority 110
standby 75 preempt



router ospf 1
router-id 2.2.2.4

network 10.5.0.68 0.0.0.3 area 0
network 10.5.0.72 0.0.0.3 area 0

network 10.30.48.0 0.0.15.255 area 0
network 10.35.48.0 0.0.15.255 area 0

network 172.16.60.0 0.0.0.255 area 0
network 172.16.70.0 0.0.0.255 area 0
network 172.16.75.0 0.0.0.255 area 0

exit



exit




---------------------------- DIST-LIBRARY-2 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname DIST-LIBRARY-2
    banner motd #
    *****************************************************************
    *  UYARI: Bu sisteme yalnizca yetkili kullanicilar erisebilir.  *
    *  Sisteme yapina tum erisimler izlenmekte ve kaydedilmektedir. *
    *                                                               *
    *  Yetkisiz erişim 5237 sayili Türk Ceza Kanunu'nun             *
    *  243 ve 244. maddeleri kapsaminda suç teşkil eder.            *
    *                                                               *
    *  Bu sistemde işlenen kişisel veriler, 6698 sayili KVKK        *
    *  kapsaminda korunmaktadir.                                    *
    *                                                               *
    *  Sistemi kullanarak bu şartlari kabul etmiş sayilirsiniz.     *
    *  Yetkisiz erişim durumunda yasal işlem baslatilir.            *
    *****************************************************************
    #

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
vlan 60
name LIBRARY
vlan 70
name LABS
vlan 75
name HALLS
vlan 333
name BLACKHOLE



interface range fa 0/4-24
switchport mode access
switchport access vlan 333
shutdown

interface gigabitEthernet 0/1
description DIST-LIBRARY-2 to CORE-1
no switchport
ip address 10.5.0.78 255.255.255.252

interface gigabitEthernet 0/2
description DIST-LIBRARY-2 to CORE-2
no switchport
ip address 10.5.0.82 255.255.255.252
exit

interface fa 0/1
description LIBRARY
switchport mode trunk
no shutdown

interface fa 0/2
description LABS
switchport mode trunk
no shutdown

interface fa 0/3
description HALLS
switchport mode trunk
no shutdown

int vlan30
ip address 10.30.48.3 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.48.1
standby 30 priority 100
standby 30 preempt
exit

int vlan60
ip address 172.16.60.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 60 ip 172.16.60.1
standby 60 priority 100
standby 60 preempt
exit

int vlan70
ip address 172.16.70.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 70 ip 172.16.70.1
standby 70 priority 100
standby 70 preempt
exit

int vlan75
ip address 172.16.75.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 75 ip 172.16.75.1
standby 75 priority 100
standby 75 preempt



router ospf 1
router-id 2.2.2.5

network 10.5.0.76 0.0.0.3 area 0
network 10.5.0.80 0.0.0.3 area 0

network 10.30.48.0 0.0.15.255 area 0
network 10.35.48.0 0.0.15.255 area 0

network 172.16.60.0 0.0.0.255 area 0
network 172.16.70.0 0.0.0.255 area 0
network 172.16.75.0 0.0.0.255 area 0


exit



exit



---------------------------- HQ-CORE-1 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname HQ-CORE-1
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 10
name IT
vlan 15
name MANAGEMENT
vlan 20
name RECTOR
vlan 30
name WLAN
vlan 40
name SCIENCE
vlan 50
name PHARMARCY
vlan 60
name LIBRARY
vlan 70
name LABS
vlan 75
name HALLS
vlan 333
name BLACKHOLE



interface range gigabitEthernet 1/0/10-12
switchport mode trunk
interface range gigabitEthernet 1/0/6-9
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/0/13-19
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/0/22-24
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/1/1-4
switchport mode access
switchport access vlan 333
shutdown
exit

interface gigabitEthernet 1/0/20
switchport access vlan 30

interface gigabitEthernet 1/0/21
description HQ-CORE-1 to HQ-FRW
no switchport
ip address 10.5.0.29 255.255.255.252

interface range gigabitEthernet 1/0/10-12
channel-group 1 mode active
interface Port-channel 1
switchport mode trunk
exit

interface gigabitEthernet 1/0/1
description HQ-CORE-1 to DIST-ADMIN-1
no switchport
ip address 10.5.0.37 255.255.255.252

interface gigabitEthernet 1/0/2
description HQ-CORE-1 to DIST-ADMIN-2
no switchport
ip address 10.5.0.45 255.255.255.252

interface gigabitEthernet 1/0/3
description HQ-CORE-1 to DIST-FACULTY1-1
no switchport
ip address 10.5.0.53 255.255.255.252

interface gigabitEthernet 1/0/4
description HQ-CORE-1 to DIST-LIBRARY-1
no switchport
ip address 10.5.0.69 255.255.255.252

interface gigabitEthernet 1/0/5
description HQ-CORE-1 to DIST-LIBRARY-2
no switchport
ip address 10.5.0.77 255.255.255.252

int vlan30
ip address 10.30.0.1 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6




router ospf 1
router-id 1.1.1.1

network 10.5.0.28 0.0.0.3 area 0 
network 10.5.0.36 0.0.0.3 area 0 
network 10.5.0.44 0.0.0.3 area 0 
network 10.5.0.52 0.0.0.3 area 0 
network 10.5.0.68 0.0.0.3 area 0 
network 10.5.0.76 0.0.0.3 area 0 
network 10.30.0.0 0.0.0.255 area 0

exit



exit


---------------------------- HQ-CORE-2 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname HQ-CORE-2
banner motd #
************************************************************
*  UYARI: Bu sisteme yalnızca yetkili kullanıcılar erişebilir. *
*  Sisteme yapılan tüm erişimler izlenmekte ve kaydedilmektedir. *
*                                                            *
*  Yetkisiz erişim 5237 sayılı Türk Ceza Kanunu'nun         *
*  243 ve 244. maddeleri kapsamında suç teşkil eder.         *
*                                                            *
*  Bu sistemde işlenen kişisel veriler, 6698 sayılı KVKK     *
*  kapsamında korunmaktadır.                                *
*                                                            *
*  Sistemi kullanarak bu şartları kabul etmiş sayılırsınız.  *
*  Yetkisiz erişim durumunda yasal işlem başlatılır.         *
************************************************************
#

enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 10
name IT
vlan 15
name MANAGEMENT
vlan 20
name RECTOR
vlan 30
name WLAN
vlan 40
name SCIENCE
vlan 50
name PHARMARCY
vlan 60
name LIBRARY
vlan 70
name LABS
vlan 75
name HALLS
vlan 333
name BLACKHOLE



interface range gigabitEthernet 1/0/10-12
channel-group 1 mode passive
interface Port-channel 1
switchport mode trunk

interface range gigabitEthernet 1/0/6-9
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/0/13-19
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/0/22-24
switchport mode access
switchport access vlan 333
shutdown
interface range gigabitEthernet 1/1/1-4
switchport mode access
switchport access vlan 333
shutdown
exit

interface gigabitEthernet 1/0/21
description HQ-CORE-2 to HQ-FRW
no switchport
ip address 10.5.0.33 255.255.255.252

interface gigabitEthernet 1/0/1
description HQ-CORE-2 to DIST-ADMIN-1
no switchport
ip address 10.5.0.41 255.255.255.252

interface gigabitEthernet 1/0/2
description HQ-CORE-2 to DIST-ADMIN-2
no switchport
ip address 10.5.0.49 255.255.255.252

interface gigabitEthernet 1/0/3
description HQ-CORE-2 to DIST-FACULTY1-1
no switchport
ip address 10.5.0.57 255.255.255.252

interface gigabitEthernet 1/0/4
description HQ-CORE-2 to DIST-LIBRARY-1
no switchport
ip address 10.5.0.74 255.255.255.252

interface gigabitEthernet 1/0/5
description HQ-CORE-2 to DIST-LIBRARY-2
no switchport
ip address 10.5.0.82 255.255.255.252



router ospf 1
router-id 1.1.1.2

network 10.5.0.32 0.0.0.3 area 0 
network 10.5.0.40 0.0.0.3 area 0 
network 10.5.0.48 0.0.0.3 area 0 
network 10.5.0.56 0.0.0.3 area 0 
network 10.5.0.72 0.0.0.3 area 0 
network 10.5.0.80 0.0.0.3 area 0 

exit



exit






---------------------------- B-MLSW-1 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname B-MLSW-1
enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
VLAN 35
name WLAN_GUEST
vlan 80
name ENGINEERING
vlan 90
name FOREIGNLANGUAGES
vlan 95
name SPORTS
vlan 100
name APSC
vlan 333
name BLACKHOLE



interface range gigabitEthernet 1/0/10-11
channel-group 1 mode active
interface Port-channel 1
switchport mode trunk

interface range gi 1/0/5-9
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/0/12-20
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/0/22-24
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/1/1-4
switchport mode access
switchport access vlan 333
shutdown
exit

interface gigabitEthernet 1/0/21
description B-MLSW-1 to B-FRW
no switchport
ip address 10.5.5.29 255.255.255.252

interface gi 1/0/1 
description ENGINEERING
switchport mode trunk
no shutdown

interface gi 1/0/2
description FOREIGN
switchport mode trunk
no shutdown

interface gi 1/0/3
description SPORTS
switchport mode trunk
no shutdown

interface gi 1/0/4
description APSC
switchport mode trunk
no shutdown



int vlan30
ip address 10.30.64.2 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.64.1
standby 30 priority 110
standby 30 preempt
exit

int vlan35
ip address 10.35.64.2 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 35 ip 10.35.64.1
standby 35 priority 110
standby 35 preempt
exit

int vlan80
ip address 172.16.80.2 255.255.252.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 80 ip 172.16.80.1
standby 80 priority 110
standby 80 preempt
exit

int vlan90
ip address 172.16.90.2 255.255.252.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 90 ip 172.16.90.1
standby 90 priority 110
standby 90 preempt
exit

int vlan95
ip address 172.16.95.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 95 ip 172.16.95.1
standby 95 priority 110
standby 95 preempt
exit

int vlan100
ip address 172.16.100.2 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 100 ip 172.16.100.1
standby 100 priority 110
standby 100 preempt
exit



router ospf 15
router-id 2.2.2.11

network 10.5.5.28 0.0.0.3 area 0 

network 10.30.0.0 0.0.15.255 area 0
network 10.35.0.0 0.0.15.255 area 0

network 172.16.80.0 0.0.0.255 area 0
network 172.16.90.0 0.0.0.255 area 0
network 172.16.95.0 0.0.0.255 area 0
network 172.16.100.0 0.0.0.255 area 0

exit



exit


---------------------------- B-MLSW-2 ----------------------------
en
conf t
no ip domain-lookup
ip routing
hostname B-MLSW-2
enable secret admin123

line console 0
password admin123
login
exit

ip domain name oau.edu.tr
crypto key generate rsa
username admin password admin123
2048
line vty 0 15
login local
transport input ssh
exit

service password-encryption



vlan 15
name MANAGEMENT
vlan 30
name WLAN
VLAN 35
name WLAN_GUEST
vlan 80
name ENGINEERING
vlan 90
name FOREIGNLANGUAGES
vlan 95
name SPORTS
vlan 100
name APSC
vlan 333
name BLACKHOLE



interface range gigabitEthernet 1/0/10-11
channel-group 1 mode passive
interface Port-channel 1
switchport mode trunk

interface range gi 1/0/5-9
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/0/12-20
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/0/22-24
switchport mode access
switchport access vlan 333
shutdown
interface range gi 1/1/1-4
switchport mode access
switchport access vlan 333
shutdown
exit

interface gigabitEthernet 1/0/21
description B-MLSW-2 to B-FRW
no switchport
ip address 10.5.5.33 255.255.255.252
exit

interface gi 1/0/1 
description ENGINEERING
switchport mode trunk
no shutdown

interface gi 1/0/2
description FOREIGN
switchport mode trunk
no shutdown

interface gi 1/0/3
description SPORTS
switchport mode trunk
no shutdown

interface gi 1/0/4
description APSC
switchport mode trunk
no shutdown



int vlan30
ip address 10.30.64.3 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 30 ip 10.30.64.1
standby 30 priority 100
standby 30 preempt
exit

int vlan35
ip address 10.35.64.3 255.255.240.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 35 ip 10.35.64.1
standby 35 priority 100
standby 35 preempt
exit

int vlan80
ip address 172.16.80.3 255.255.252.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 80 ip 172.16.80.1
standby 80 priority 100
standby 80 preempt
exit

int vlan90
ip address 172.16.90.3 255.255.252.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 90 ip 172.16.90.1
standby 90 priority 100
standby 90 preempt
exit

int vlan95
ip address 172.16.95.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 95 ip 172.16.95.1
standby 95 priority 100
standby 95 preempt
exit

int vlan100
ip address 172.16.100.3 255.255.255.0
ip helper-address 10.20.20.5
ip helper-address 10.20.20.6
standby 100 ip 172.16.100.1
standby 100 priority 100
standby 100 preempt
exit



router ospf 15
router-id 2.2.2.12

network 10.5.5.32 0.0.0.3 area 0 

network 10.30.64.0 0.0.15.255 area 0
network 10.35.64.0 0.0.15.255 area 0

network 172.16.80.0 0.0.0.255 area 0
network 172.16.90.0 0.0.0.255 area 0
network 172.16.95.0 0.0.0.255 area 0
network 172.16.100.0 0.0.0.255 area 0

exit



exit





##########################################################################################
---------------------------- DMZ-SW ----------------------------
en
conf t
no ip domain-lookup
hostname DMZ-SW

interface range fa 0/1-24
spanning-tree portfast
spanning-tree bpduguard enable
exit


---------------------------- HQ-FRW ----------------------------
en

conf t
hostname HQ-FRW



int gig1/1
no shutdown
nameif INSIDE1
security-level 100
ip address 10.5.0.30 255.255.255.252
exit

int gig1/2
no shutdown
nameif INSIDE2
security-level 100
ip address 10.5.0.34 255.255.255.252
exit

int gig1/3 
no shutdown
nameif DMZ
security-level 70
ip address 10.20.20.1 255.255.255.224
exit

int gig1/4
no shutdown
nameif OUTSIDE
security-level 0
ip address 192.0.2.1 255.255.255.252
exit

int gig1/5
shutdown
int gig1/6
shutdown
int gig1/7
shutdown
int gig1/8
shutdown
exit



router ospf 15
router-id 4.1.0.1

network 10.5.0.28 255.255.255.252 area 0 
network 10.5.0.32 255.255.255.252 area 0 
network 192.0.2.0 255.255.255.252 area 0 
network 10.20.20.0 255.255.255.224 area 0 

exit



route OUTSIDE 0.0.0.0 0.0.0.0 192.0.2.2

conf t
object network INSIDE1-OUTSIDE
subnet 192.168.0.0 255.255.248.0
nat (INSIDE1,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE1a-OUTSIDE
subnet 192.168.0.0 255.255.248.0
nat (INSIDE2,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE2-OUTSIDE
subnet 172.16.0.0 255.255.0.0
nat (INSIDE1,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE2a-OUTSIDE
subnet 172.16.0.0 255.255.0.0
nat (INSIDE2,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE3-OUTSIDE
subnet 10.0.0.0 255.192.0.0
nat (INSIDE1,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE3a-OUTSIDE
subnet 10.0.0.0 255.192.0.0
nat (INSIDE2,OUTSIDE) dynamic interface
exit


conf t
access-list RESOURCE-ACCESS extended permit icmp any any
access-list RESOURCE-ACCESS extended permit udp any any eq 67
access-list RESOURCE-ACCESS extended permit udp any any eq 68
access-list RESOURCE-ACCESS extended permit udp any any eq 53
access-list RESOURCE-ACCESS extended permit tcp any any eq 53
access-list RESOURCE-ACCESS extended permit tcp any any eq 80
access-list RESOURCE-ACCESS extended permit tcp any any eq 25
access-list RESOURCE-ACCESS extended permit tcp any any eq 20
access-list RESOURCE-ACCESS extended permit tcp any any eq 21
access-group RESOURCE-ACCESS in interface DMZ
access-group RESOURCE-ACCESS in interface OUTSIDE

access-list TEST-ICMP extended permit icmp any any
access-list TEST-ICMP extended permit udp any any eq 67
access-list TEST-ICMP extended permit udp any any eq 68
access-list TEST-ICMP extended permit udp any any eq 53
access-list TEST-ICMP extended permit tcp any any eq 53
access-list TEST-ICMP extended permit tcp any any eq 80
access-list TEST-ICMP extended permit tcp any any eq 25
access-list TEST-ICMP extended permit tcp any any eq 20
access-list TEST-ICMP extended permit tcp any any eq 21
access-group TEST-ICMP in interface INSIDE1
access-group TEST-ICMP in interface INSIDE2

access-list res-access extended permit udp any any eq 5246
access-list res-access extended permit udp any any eq 5247
access-list res-access extended permit udp any any eq 12222
access-list res-access extended permit udp any any eq 12223


exit




---------------------------- B-FRW ----------------------------
en

conf t
hostname B-FRW


int gig1/1
no shutdown
nameif INSIDE1
security-level 100
ip address 10.5.5.30 255.255.255.252
exit

int gig1/2
no shutdown
nameif INSIDE2
security-level 100
ip address 10.5.5.34 255.255.255.252
exit

int gig1/3 
no shutdown
nameif OUTSIDE
security-level 0
ip address 192.0.2.5 255.255.255.252
exit

int gig1/4
shutdown
int gig1/5
shutdown
int gig1/6
shutdown
int gig1/7
shutdown
int gig1/8
shutdown
exit



router ospf 15
router-id 4.2.0.1

network 10.5.5.28 255.255.255.252 area 0 
network 10.5.5.32 255.255.255.252 area 0 
network 192.0.2.4 255.255.255.252 area 0 

exit



route OUTSIDE 0.0.0.0 0.0.0.0 192.0.2.6

conf t
object network INSIDE1-OUTSIDE
subnet 172.16.0.0 255.255.0.0
nat (INSIDE1,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE1a-OUTSIDE
subnet 172.16.0.0 255.255.0.0
nat (INSIDE2,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE2-OUTSIDE
subnet 10.0.0.0 255.192.0.0
nat (INSIDE1,OUTSIDE) dynamic interface
exit

conf t
object network INSIDE2a-OUTSIDE
subnet 10.0.0.0 255.192.0.0
nat (INSIDE2,OUTSIDE) dynamic interface
exit


conf t
access-list RESOURCE-ACCESS extended permit icmp any any
access-list RESOURCE-ACCESS extended permit udp any any eq 67
access-list RESOURCE-ACCESS extended permit udp any any eq 68
access-list RESOURCE-ACCESS extended permit udp any any eq 53
access-list RESOURCE-ACCESS extended permit tcp any any eq 53
access-list RESOURCE-ACCESS extended permit tcp any any eq 80
access-list RESOURCE-ACCESS extended permit tcp any any eq 25
access-list RESOURCE-ACCESS extended permit tcp any any eq 20
access-list RESOURCE-ACCESS extended permit tcp any any eq 21
access-group RESOURCE-ACCESS in interface OUTSIDE
exit

conf t
access-list TEST-ICMP extended permit icmp any any
access-list TEST-ICMP extended permit udp any any eq 67
access-list TEST-ICMP extended permit udp any any eq 68
access-list TEST-ICMP extended permit udp any any eq 53
access-list TEST-ICMP extended permit tcp any any eq 53
access-list TEST-ICMP extended permit tcp any any eq 80
access-list TEST-ICMP extended permit tcp any any eq 25
access-list TEST-ICMP extended permit tcp any any eq 20
access-list TEST-ICMP extended permit tcp any any eq 21
access-group TEST-ICMP in interface INSIDE1
access-group TEST-ICMP in interface INSIDE2

access-list res-access extended permit udp any any eq 5246
access-list res-access extended permit udp any any eq 5247
access-list res-access extended permit udp any any eq 12222
access-list res-access extended permit udp any any eq 12223


exit


---------------------------- HQ-ISP ----------------------------
en
conf t
hostname HQ-ISP

int gig0/0
ip address 192.0.2.2 255.255.255.252
no shutdown

int serial 0/3/0
ip address 198.51.100.2 255.255.255.252
no shutdown




router ospf 15
router-id 5.1.0.1

network 198.51.100.0 255.255.255.252 area 0 
network 192.0.2.0 255.255.255.252 area 0 

exit



---------------------------- BRANCH-ISP ----------------------------
en
conf t
hostname BRANCH-ISP

int gig0/0
ip address 192.0.2.6 255.255.255.252
no shutdown

int serial 0/3/0
ip address 203.0.113.2 255.255.255.252
no shutdown




router ospf 15
router-id 5.2.0.1

network 203.0.113.0 255.255.255.252 area 0 
network 192.0.2.4 255.255.255.252 area 0 

exit


---------------------------- INTERNET ----------------------------
en
conf t

int serial 0/3/0
ip address 198.51.100.1 255.255.255.252
no shutdown

int serial 0/3/1
ip address 203.0.113.1 255.255.255.252
no shutdown

int gig 0/2
ip address 8.0.0.1 255.0.0.0
no shutdown

router ospf 15
router-id 10.10.10.10

network 203.0.113.0 0.0.0.3 area 0 
network 198.51.100.0 0.0.0.3 area 0 

exit
