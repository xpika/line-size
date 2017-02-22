# line-size

```
cat testfile.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
---
the
rain
in
spain
```

```
$ cat testfile.txt | line-size
0 56 Lorem ipsum dolor sit amet, consectetur adipiscing..
1 3 ---
2 3 the
3 4 rain
4 2 in
5 5 spain
```
