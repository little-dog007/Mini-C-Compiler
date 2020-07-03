0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,26(0)<------jump to function
7: HALT 0,0,0<------END of PROGRAM
8: IN 1,0,0<------input func:read input into ax
9: ST 1,0,2<------store input value to mem
10: LDA 4,1(4)<------pop prepare
11: LD 7,-1(4)<------pop return addr
12: LD 1,-2(4)<------output func:load param into ax
13: OUT 1,0,0<------output using ax
14: LDA 4,1(4)<------pop prepare
15: LD 7,-1(4)<------pop return addr
16: LDA 1,-1(5)<------local var:get addr throught loc
17: LDA 4,-1(4)<------assign:sp++
18: ST 1,0(4)<------assign:push leftOp to sp
19: LDA 4,-1(4)<------sp++
20: LDC 1,4(0)<------load cint --->ax
21: ST 1,0(4)<------store ax --->[sp]
22: LD 2,0(4)<------assign:load rightop form [sp]
23: LDA 4,1(4)<------sp--
24: LD 1,0(4)<------a；ssign:load leftop from [sp]
25: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
26: LDA 4,-1(4)<------push prepare
27: ST 5,0(4)<------push old bp
28: LDA 5,0(4)<------let bp == sp
29: LDA 4,1(4)<------allocate for local variables
30: LD 1,-1(5)<------local var:get value throught loc
31: ST 1,-3(4)<------load bx -> sp+paramsnum
32: LDA 1,3(7)<------store returned PC
33: LDA 4,-1(4)<------push prepare
34: ST 1,0(4)<------push returned PC
35: LDC 7,12(0)<------jump to function
36: LDA 1,-1(5)<------local var:get addr throught loc
37: LDA 4,-1(4)<------assign:sp++
38: ST 1,0(4)<------assign:push leftOp to sp
39: LDA 4,-1(4)<------sp++
40: LDC 1,5(0)<------load cint --->ax
41: ST 1,0(4)<------store ax --->[sp]
42: LD 2,0(4)<------assign:load rightop form [sp]
43: LDA 4,1(4)<------sp--
44: LD 1,0(4)<------a；ssign:load leftop from [sp]
45: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
46: LD 1,-1(5)<------local var:get value throught loc
47: ST 1,-3(4)<------load bx -> sp+paramsnum
48: LDA 1,3(7)<------store returned PC
49: LDA 4,-1(4)<------push prepare
50: ST 1,0(4)<------push returned PC
51: LDC 7,12(0)<------jump to function
52: LDA 4,0(5)<------let sp == bp
53: LDA 4,2(4)<------pop prepare
54: LD 5,-2(4)<------pop old bp
55: LD 7,-1(4)<------pop return addr
