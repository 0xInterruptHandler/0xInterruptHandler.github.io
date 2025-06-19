---
title: Instalar nethunter en termux
date: '2024-04-16-16 11:17:32'
comments: true
categories: [Pentesting]
tags: [termux, nethunter]
mermaid: true
---


- https://www.kali.org/docs/nethunter/nethunter-rootless/ 
- https://kali.download/nethunter-images/current/rootfs/


# First 
For Storage permission
``` 
termux-setup-storage 
``` 


For updating packages
``` 
apt update && apt upgrade
``` 

for Downloading tools 
``` 
apt install git 
``` 

``` 
pkg install wget -y
```

For Zip files 
``` 
apt-get install zip && apt-get install unzip
``` 

For installing python
``` 
apt install python && apt install python2 
``` 
 
# Second

 
download via wget:
``` 
wget -O install-nethunter-termux https://offs.ec/2MceZWr
``` 


To give execution permissions:
``` 
chmod+x install-nethunter-termux
``` 

run :
``` 
./install-nethunter-termux
``` 



start nethunter cli: 
``` 
nethunter
``` 

set kex pass
``` 
nethunter kex passwd
``` 
start nh gui :
``` 
 nethunter kex &
``` 

stop nh gui 
``` 
nethunter kex stop
``` 

shortcut for nethunter : 

``` 
nh
``` 
 

# Commands for apt in termux

Installing packages from APT repository: 

Install package: :
``` 
 pkg install [package name] 
``` 
 
Remove package:  
``` 
pkg uninstall [package name] 
``` 
 
List all packages:  
``` 
pkg list-all 
``` 
 

Upgrading packages:
``` 
pkg upgrade
``` 
 