---
title: Fix error in mounting
date: '2024-06-16 11:17:32'
comments: true
categories: [Tutorials]
tags: [linux, solución-errores, sistema]
---
 
# Solution

## Open "Disks"
 ![Image](/assets/img/posts/image01.png)
 

## Then disable `User sesssion defaults` and press OK
![Image](/assets/img/posts/image02.png)
 
 

## finally execute
```bash
$ systemctl daemon-reload
```
 
