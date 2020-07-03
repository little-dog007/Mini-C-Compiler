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
20: LDA 1,-2(5)<------local var:get arr addr throught loc
21: LDA 4,-1(4)<------assign:sp++
22: ST 1,0(4)<------assign:push leftOp to sp
23: LDA 4,-1(4)<------sp++
24: LDC 1,1(0)<------load cint --->ax
25: ST 1,0(4)<------store ax --->[sp]
26: LD 2,0(4)<------assign:load rightop form [sp]
27: LDA 4,1(4)<------sp--
28: LD 1,0(4)<------a；ssign:load leftop from [sp]
29: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
30: LD 1,-2(5)<------local var:get arr value throught loc
31: ST 1,-3(4)<------load bx -> sp+paramsnum
32: LDA 1,3(7)<------store returned PC
33: LDA 4,-1(4)<------push prepare
34: ST 1,0(4)<------push returned PC
35: LDC 7,12(0)<------jump to function
36: LDA 1,-4(5)<------local var:get arr addr throught loc
37: LDA 4,-1(4)<------assign:sp++
38: ST 1,0(4)<------assign:push leftOp to sp
39: LDA 4,-1(4)<------sp++
40: LDC 1,3(0)<------load cint --->ax
41: ST 1,0(4)<------store ax --->[sp]
42: LD 2,0(4)<------assign:load rightop form [sp]
43: LDA 4,1(4)<------sp--
44: LD 1,0(4)<------a；ssign:load leftop from [sp]
45: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
46: LD 1,-4(5)<------local var:get arr value throught loc
47: ST 1,-3(4)<------load bx -> sp+paramsnum
48: LDA 1,3(7)<------store returned PC
49: LDA 4,-1(4)<------push prepare
50: ST 1,0(4)<------push returned PC
51: LDC 7,12(0)<------jump to function
52: LDA 2,-3(5)<------local var:get arr addr throught loc
53: LDA 1,3(7)<------store returned PC
54: LDA 4,-1(4)<------push prepare
55: ST 1,0(4)<------push returned PC
56: LDC 7,8(0)<------jump to function
57: LD 1,-3(5)<------local var:get arr value throught loc
58: ST 1,-3(4)<------load bx -> sp+paramsnum
59: LDA 1,3(7)<------store returned PC
60: LDA 4,-1(4)<------push prepare
61: ST 1,0(4)<------push returned PC
62: LDC 7,12(0)<------jump to function
63: LDA 1,-1(5)<------local var:get arr addr throught loc
64: LDA 4,-1(4)<------assign:sp++
65: ST 1,0(4)<------assign:push leftOp to sp
66: LDA 4,-1(4)<------sp++
67: LDC 1,5(0)<------load cint --->ax
68: ST 1,0(4)<------store ax --->[sp]
69: LD 2,0(4)<------assign:load rightop form [sp]
70: LDA 4,1(4)<------sp--
71: LD 1,0(4)<------a；ssign:load leftop from [sp]
72: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
73: LD 1,-1(5)<------local var:get arr value throught loc
74: ST 1,-3(4)<------load bx -> sp+paramsnum
75: LDA 1,3(7)<------store returned PC
76: LDA 4,-1(4)<------push prepare
77: ST 1,0(4)<------push returned PC
78: LDC 7,12(0)<------jump to function
79: LDA 4,0(5)<------let sp == bp
80: LDA 4,2(4)<------pop prepare
81: LD 5,-2(4)<------pop old bp
82: LD 7,-1(4)<------pop return addr
