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
26: LDA 4,-1(4)<------sp++
27: ST 1,0(4)<------store int or arr ---->[sp]
28: LDA 4,-1(4)<------sp++
29: LDC 1,0(0)<------load cint --->ax
30: ST 1,0(4)<------store ax --->[sp]
31: LD 2,0(4)<------load rightop to bx
32: LDA 4,1(4)<------sp++
33: LD 1,0(4)<------load leftop to ax
34: LDA 4,1(4)<------sp++
35: SUB 1,1,2<------op !=
36: JNE 1,2(7)<------br if true
37: LDC 1,0(0)<------false case
38: LDA 7,1(7)<------unconditional jmp
39: LDC 1,1(0)<------true case
40: JEQ 1,122(0)<------jump to end
41: LD 1,-1(5)<------local var:get value throught loc
42: LDA 4,-1(4)<------sp++
43: ST 1,0(4)<------store int or arr ---->[sp]
44: LDA 4,-1(4)<------sp++
45: LDC 1,10(0)<------load cint --->ax
46: ST 1,0(4)<------store ax --->[sp]
47: LD 2,0(4)<------load rightop to bx
48: LDA 4,1(4)<------sp++
49: LD 1,0(4)<------load leftop to ax
50: LDA 4,1(4)<------sp++
51: SUB 1,1,2<------op >
52: JGT 1,2(7)<------br if true
53: LDC 1,0(0)<------false case
54: LDA 7,1(7)<------unconditional jmp
55: LDC 1,1(0)<------true case
56: JEQ 1,87(0)<------if:jmp to else
57: LD 1,-1(5)<------local var:get value throught loc
58: LDA 4,-1(4)<------sp++
59: ST 1,0(4)<------store int or arr ---->[sp]
60: LDA 4,-1(4)<------sp++
61: LDC 1,11(0)<------load cint --->ax
62: ST 1,0(4)<------store ax --->[sp]
63: LD 2,0(4)<------load rightop to bx
64: LDA 4,1(4)<------sp++
65: LD 1,0(4)<------load leftop to ax
66: LDA 4,1(4)<------sp++
67: SUB 1,1,2<------op ==
68: JEQ 1,2(7)<------br if true
69: LDC 1,0(0)<------false case
70: LDA 7,1(7)<------unconditional jmp
71: LDC 1,1(0)<------true case
72: JEQ 1,80(0)<------if:jmp to else
73: LDC 1,11(0)<------load cint -->bx
74: ST 1,-3(4)<------load bx -> sp+paramsnum
75: LDA 1,3(7)<------store returned PC
76: LDA 4,-1(4)<------push prepare
77: ST 1,0(4)<------push returned PC
78: LDC 7,12(0)<------jump to function
79: LDA 7,86(0)<------jmp to end
80: LDC 1,22(0)<------load cint -->bx
81: ST 1,-3(4)<------load bx -> sp+paramsnum
82: LDA 1,3(7)<------store returned PC
83: LDA 4,-1(4)<------push prepare
84: ST 1,0(4)<------push returned PC
85: LDC 7,12(0)<------jump to function
86: LDA 7,116(0)<------jmp to end
87: LD 1,-1(5)<------local var:get value throught loc
88: LDA 4,-1(4)<------sp++
89: ST 1,0(4)<------store int or arr ---->[sp]
90: LDA 4,-1(4)<------sp++
91: LDC 1,5(0)<------load cint --->ax
92: ST 1,0(4)<------store ax --->[sp]
93: LD 2,0(4)<------load rightop to bx
94: LDA 4,1(4)<------sp++
95: LD 1,0(4)<------load leftop to ax
96: LDA 4,1(4)<------sp++
97: SUB 1,1,2<------op ==
98: JEQ 1,2(7)<------br if true
99: LDC 1,0(0)<------false case
100: LDA 7,1(7)<------unconditional jmp
101: LDC 1,1(0)<------true case
102: JEQ 1,110(0)<------if:jmp to else
103: LDC 1,5(0)<------load cint -->bx
104: ST 1,-3(4)<------load bx -> sp+paramsnum
105: LDA 1,3(7)<------store returned PC
106: LDA 4,-1(4)<------push prepare
107: ST 1,0(4)<------push returned PC
108: LDC 7,12(0)<------jump to function
109: LDA 7,116(0)<------jmp to end
110: LDC 1,6(0)<------load cint -->bx
111: ST 1,-3(4)<------load bx -> sp+paramsnum
112: LDA 1,3(7)<------store returned PC
113: LDA 4,-1(4)<------push prepare
114: ST 1,0(4)<------push returned PC
115: LDC 7,12(0)<------jump to function
116: LDA 2,-1(5)<------local var:get addr throught loc
117: LDA 1,3(7)<------store returned PC
118: LDA 4,-1(4)<------push prepare
119: ST 1,0(4)<------push returned PC
120: LDC 7,8(0)<------jump to function
121: LDA 7,25(0)<------jump to test
122: LDA 4,0(5)<------let sp == bp
123: LDA 4,2(4)<------pop prepare
124: LD 5,-2(4)<------pop old bp
125: LD 7,-1(4)<------pop return addr
