---
title: Bitwise
date: '2023-04-16 11:17:32'
comments: true
categories: [Programming]
tags: [electronics ]
---

# OR

Pone cada bit a 1 si uno de los dos bits es 1.

```javascript
// 1 = 00000001
// 2 = 00000010

console.log(1 | 2);
// 3 = 00000011
```

# Bitwise AND

Pone cada bit a 1 si ambos bits son 1.

```javascript
// 1 = 00000001
// 2 = 00000010

console.log(1 & 2);
// 0 = 00000000
```

# Bitwise XOR

Pone cada bit a 1 si sólo uno de los dos bits es 1.


```javascript
// 10 = 00001010

console.log(1 ^ 2);
// 6 = 000000110
```

# Bitwise NOT

Invierte todos los bits.

# Shift Left

Añadir n ceros a la derecha, es decir, eliminar n bits de la izquierda. (binario a número)

```
00000 111 (7) << 1 = 0000 111 0 (14)
00000 101 (5) << 3 = 00 101 000 (40)
```

# Shift Right

Añadir n ceros a la izquierda, es decir, eliminar n bits de la derecha. (binario a número)

```
00 101010 (42) >> 4 = 000000 10 (2)
00000 111  (7) >> 1 = 000000 11 (3)
00 110011 (51) >> 3 = 00000 110 (6)
```
