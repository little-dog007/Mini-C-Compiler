0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,16(0)<------jump to function
7: HALT 0,0,0<------END of PROGRAM
8: IN 1,0,0<------input func:read input into ax
9: ST 1,0,2<------store input value to mem
10: LDA 4,1(4)<------pop prepare
11: LD 7,-1(4)<------pop return addr
12: LD 1,-2(4)<------output func:load param into ax
13: OUT 1,0,0<------output using ax
14: LDA 4,1(4)<------pop prepare
15: LD 7,-1(4)<------pop return addr
16: LDA 4,-1(4)<------push prepare
17: ST 5,0(4)<------push old bp
18: LDA 5,0(4)<------let bp == sp
19: LDA 4,1(4)<------allocate for local variables
20: LDA 2,-1(5)<------local var:get addr throught loc
21: LDA 1,3(7)<------store returned PC
22: LDA 4,-1(4)<------push prepare
23: ST 1,0(4)<------push returned PC
24: LDC 7,8(0)<------jump to function
25: LD 1,-1(5)<------local var:get value throught loc
26: ST 1,-3(4)<------load bx -> sp+paramsnum
27: LDA 1,3(7)<------store returned PC
28: LDA 4,-1(4)<------push prepare
29: ST 1,0(4)<------push returned PC
30: LDC 7,12(0)<------jump to function
