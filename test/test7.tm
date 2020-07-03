0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,42(0)<------jump to function
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
20: LD 1,-1(5)<------local var:get value throught loc
21: LDA 4,-1(4)<------sp++
22: ST 1,0(4)<------store int or arr ---->[sp]
23: LD 1,-1(5)<------local var:get value throught loc
24: LDA 4,-1(4)<------sp++
25: ST 1,0(4)<------store int or arr ---->[sp]
26: LD 2,0(4)<------load rightop to bx
27: LDA 4,1(4)<------sp++
28: LD 1,0(4)<------load leftop to ax
29: LDA 4,1(4)<------sp++
30: ADD 1,1,2<------op +
31: LDA 4,-1(4)<------sp++
32: ST 1,0(4)<------load result of + to sp
33: LD 1,0(4)<------return int,load return value [sp]---->ax
34: LDA 4,0(5)<------let sp == bp
35: LDA 4,2(4)<------pop prepare
36: LD 5,-2(4)<------pop old bp
37: LD 2,-1(4)<------because sp-1 store the return addr,but reutrn value must be store here
38: ST 2,-2(4)<------so we move return addr to sp-2
39: LDA 4,-1(4)<------sp++
40: ST 1,0(4)<------load return value --->[sp]
41: LD 7,-1(4)<------pop return addr
42: LDA 4,-1(4)<------push prepare
43: ST 5,0(4)<------push old bp
44: LDA 5,0(4)<------let bp == sp
45: LDA 4,1(4)<------allocate for local variables
46: LDA 1,-1(5)<------local var:get addr throught loc
47: LDA 4,-1(4)<------assign:sp++
48: ST 1,0(4)<------assign:push leftOp to sp
49: LDC 1,1(0)<------load cint -->bx
50: ST 1,-3(4)<------load bx -> sp+paramsnum
51: LDC 1,2(0)<------load cint -->bx
52: ST 1,-4(4)<------load bx -> sp+paramsnum
53: LDA 1,3(7)<------store returned PC
54: LDA 4,-1(4)<------push prepare
55: ST 1,0(4)<------push returned PC
56: LDC 7,16(0)<------jump to function
57: LD 2,0(4)<------assign:load rightop form [sp]
58: LDA 4,1(4)<------sp--
59: LD 1,0(4)<------a；ssign:load leftop from [sp]
60: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
61: LD 1,-1(5)<------local var:get value throught loc
62: ST 1,-3(4)<------load bx -> sp+paramsnum
63: LDA 1,3(7)<------store returned PC
64: LDA 4,-1(4)<------push prepare
65: ST 1,0(4)<------push returned PC
66: LDC 7,12(0)<------jump to function
67: LDA 2,-1(5)<------local var:get addr throught loc
68: LDA 1,3(7)<------store returned PC
69: LDA 4,-1(4)<------push prepare
70: ST 1,0(4)<------push returned PC
71: LDC 7,8(0)<------jump to function
72: LDA 2,-1(5)<------local var:get addr throught loc
73: LDA 1,3(7)<------store returned PC
74: LDA 4,-1(4)<------push prepare
75: ST 1,0(4)<------push returned PC
76: LDC 7,8(0)<------jump to function
77: LDA 1,-1(5)<------local var:get addr throught loc
78: LDA 4,-1(4)<------assign:sp++
79: ST 1,0(4)<------assign:push leftOp to sp
80: LD 1,-1(5)<------local var:get value throught loc
81: ST 1,-3(4)<------load bx -> sp+paramsnum
82: LD 1,-1(5)<------local var:get value throught loc
83: ST 1,-4(4)<------load bx -> sp+paramsnum
84: LDA 1,3(7)<------store returned PC
85: LDA 4,-1(4)<------push prepare
86: ST 1,0(4)<------push returned PC
87: LDC 7,16(0)<------jump to function
88: LD 2,0(4)<------assign:load rightop form [sp]
89: LDA 4,1(4)<------sp--
90: LD 1,0(4)<------a；ssign:load leftop from [sp]
91: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
92: LD 1,-1(5)<------local var:get value throught loc
93: ST 1,-3(4)<------load bx -> sp+paramsnum
94: LDA 1,3(7)<------store returned PC
95: LDA 4,-1(4)<------push prepare
96: ST 1,0(4)<------push returned PC
97: LDC 7,12(0)<------jump to function
98: LDA 4,0(5)<------let sp == bp
99: LDA 4,2(4)<------pop prepare
100: LD 5,-2(4)<------pop old bp
101: LD 7,-1(4)<------pop return addr
