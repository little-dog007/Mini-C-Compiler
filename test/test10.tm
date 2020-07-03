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
46: LDC 1,2(0)<------load cint -->bx
47: ST 1,-3(4)<------load bx -> sp+paramsnum
48: LDC 1,2(0)<------load cint -->bx
49: ST 1,-4(4)<------load bx -> sp+paramsnum
50: LDA 1,3(7)<------store returned PC
51: LDA 4,-1(4)<------push prepare
52: ST 1,0(4)<------push returned PC
53: LDC 7,16(0)<------jump to function
54: LD 1,0(4)<------param is func,return value store in sp,note now sp= sp+1
55: LDA 4,1(4)<------so we have to make sp-- to suit our call rule 
56: ST 1,-3(4)<------load ax -> sp+paramsnum
57: LDA 1,3(7)<------store returned PC
58: LDA 4,-1(4)<------push prepare
59: ST 1,0(4)<------push returned PC
60: LDC 7,12(0)<------jump to function
61: LDA 1,-1(5)<------local var:get addr throught loc
62: LDA 4,-1(4)<------assign:sp++
63: ST 1,0(4)<------assign:push leftOp to sp
64: LDC 1,1(0)<------load cint -->bx
65: ST 1,-3(4)<------load bx -> sp+paramsnum
66: LDC 1,1(0)<------load cint -->bx
67: ST 1,-3(4)<------load bx -> sp+paramsnum
68: LDC 1,2(0)<------load cint -->bx
69: ST 1,-4(4)<------load bx -> sp+paramsnum
70: LDA 1,3(7)<------store returned PC
71: LDA 4,-1(4)<------push prepare
72: ST 1,0(4)<------push returned PC
73: LDC 7,16(0)<------jump to function
74: LD 1,0(4)<------param is func,return value store in sp,note now sp= sp+1
75: LDA 4,1(4)<------so we have to make sp-- to suit our call rule 
76: ST 1,-4(4)<------load ax -> sp+paramsnum
77: LDA 1,3(7)<------store returned PC
78: LDA 4,-1(4)<------push prepare
79: ST 1,0(4)<------push returned PC
80: LDC 7,16(0)<------jump to function
81: LD 2,0(4)<------assign:load rightop form [sp]
82: LDA 4,1(4)<------sp--
83: LD 1,0(4)<------a；ssign:load leftop from [sp]
84: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
85: LD 1,-1(5)<------local var:get value throught loc
86: ST 1,-3(4)<------load bx -> sp+paramsnum
87: LDA 1,3(7)<------store returned PC
88: LDA 4,-1(4)<------push prepare
89: ST 1,0(4)<------push returned PC
90: LDC 7,12(0)<------jump to function
91: LDA 4,0(5)<------let sp == bp
92: LDA 4,2(4)<------pop prepare
93: LD 5,-2(4)<------pop old bp
94: LD 7,-1(4)<------pop return addr
