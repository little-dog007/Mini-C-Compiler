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
20: LDA 1,-1(5)<------local var:get addr throught loc
21: LDA 4,-1(4)<------assign:sp++
22: ST 1,0(4)<------assign:push leftOp to sp
23: LDA 4,-1(4)<------sp++
24: LDC 1,4(0)<------load cint --->ax
25: ST 1,0(4)<------store ax --->[sp]
26: LDA 4,-1(4)<------sp++
27: LDC 1,2(0)<------load cint --->ax
28: ST 1,0(4)<------store ax --->[sp]
29: LD 2,0(4)<------load rightop to bx
30: LDA 4,1(4)<------sp++
31: LD 1,0(4)<------load leftop to ax
32: LDA 4,1(4)<------sp++
33: SUB 1,1,2<------op -
34: LDA 4,-1(4)<------sp++
35: ST 1,0(4)<------load result of - to sp
36: LDA 4,-1(4)<------sp++
37: LDC 1,3(0)<------load cint --->ax
38: ST 1,0(4)<------store ax --->[sp]
39: LD 2,0(4)<------load rightop to bx
40: LDA 4,1(4)<------sp++
41: LD 1,0(4)<------load leftop to ax
42: LDA 4,1(4)<------sp++
43: MUL 1,1,2<------op *1
44: LDA 4,-1(4)<------sp++
45: ST 1,0(4)<------load result of * to sp
46: LDA 4,-1(4)<------sp++
47: LDC 1,2(0)<------load cint --->ax
48: ST 1,0(4)<------store ax --->[sp]
49: LD 2,0(4)<------load rightop to bx
50: LDA 4,1(4)<------sp++
51: LD 1,0(4)<------load leftop to ax
52: LDA 4,1(4)<------sp++
53: DIV 1,1,2<------op /1
54: LDA 4,-1(4)<------sp++
55: ST 1,0(4)<------load result of / to sp
56: LDA 4,-1(4)<------sp++
57: LDC 1,1(0)<------load cint --->ax
58: ST 1,0(4)<------store ax --->[sp]
59: LDA 4,-1(4)<------sp++
60: LDC 1,2(0)<------load cint --->ax
61: ST 1,0(4)<------store ax --->[sp]
62: LD 2,0(4)<------load rightop to bx
63: LDA 4,1(4)<------sp++
64: LD 1,0(4)<------load leftop to ax
65: LDA 4,1(4)<------sp++
66: MUL 1,1,2<------op *1
67: LDA 4,-1(4)<------sp++
68: ST 1,0(4)<------load result of * to sp
69: LD 2,0(4)<------load rightop to bx
70: LDA 4,1(4)<------sp++
71: LD 1,0(4)<------load leftop to ax
72: LDA 4,1(4)<------sp++
73: ADD 1,1,2<------op +1
74: LDA 4,-1(4)<------sp++
75: ST 1,0(4)<------load result of + to sp
76: LDA 4,-1(4)<------sp++
77: LDC 1,1(0)<------load cint --->ax
78: ST 1,0(4)<------store ax --->[sp]
79: LD 2,0(4)<------load rightop to bx
80: LDA 4,1(4)<------sp++
81: LD 1,0(4)<------load leftop to ax
82: LDA 4,1(4)<------sp++
83: SUB 1,1,2<------op -1
84: LDA 4,-1(4)<------sp++
85: ST 1,0(4)<------load result of - to sp
86: LD 2,0(4)<------assign:load rightop form [sp]
87: LDA 4,1(4)<------sp--
88: LD 1,0(4)<------a；ssign:load leftop from [sp]
89: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
90: LD 1,-1(5)<------local var:get value throught loc
91: ST 1,-3(4)<------load bx -> sp+paramsnum
92: LDA 1,3(7)<------store returned PC
93: LDA 4,-1(4)<------push prepare
94: ST 1,0(4)<------push returned PC
95: LDC 7,12(0)<------jump to function
96: LDA 4,0(5)<------let sp == bp
97: LDA 4,2(4)<------pop prepare
98: LD 5,-2(4)<------pop old bp
99: LD 7,-1(4)<------pop return addr
