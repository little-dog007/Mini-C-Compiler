0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,102(0)<------jump to function
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
23: LDA 4,-1(4)<------sp++
24: LDC 1,0(0)<------load cint --->ax
25: ST 1,0(4)<------store ax --->[sp]
26: LD 2,0(4)<------load rightop to bx
27: LDA 4,1(4)<------sp++
28: LD 1,0(4)<------load leftop to ax
29: LDA 4,1(4)<------sp++
30: SUB 1,1,2<------op ==
31: JEQ 1,2(7)<------br if true
32: LDC 1,0(0)<------false case
33: LDA 7,1(7)<------unconditional jmp
34: LDC 1,1(0)<------true case
35: JEQ 1,49(0)<------if:jmp to else
36: LD 1,-1(5)<------local var:get value throught loc
37: LDA 4,-1(4)<------sp++
38: ST 1,0(4)<------laod ax-->[sp]
39: LD 1,0(4)<------return int,load return value [sp]---->ax
40: LDA 4,0(5)<------let sp == bp
41: LDA 4,2(4)<------pop prepare
42: LD 5,-2(4)<------pop old bp
43: LD 2,-1(4)<------because sp-1 store the return addr,but reutrn value must be store here
44: ST 2,-2(4)<------so we move return addr to sp-2
45: LDA 4,-1(4)<------sp++
46: ST 1,0(4)<------load return value --->[sp]
47: LD 7,-1(4)<------pop return addr
48: LDA 7,102(0)<------jmp to end
49: LD 1,-1(5)<------local var:get value throught loc
50: ST 1,-3(4)<------load bx -> sp+paramsnum
51: LDA 4,-4(4)<------store sp -> sp+paramnum
52: LD 1,-1(5)<------local var:get value throught loc
53: LDA 4,-1(4)<------sp++
54: ST 1,0(4)<------store int or arr ---->[sp]
55: LD 1,-1(5)<------local var:get value throught loc
56: LDA 4,-1(4)<------sp++
57: ST 1,0(4)<------store int or arr ---->[sp]
58: LD 1,-1(5)<------local var:get value throught loc
59: LDA 4,-1(4)<------sp++
60: ST 1,0(4)<------store int or arr ---->[sp]
61: LD 1,-1(5)<------local var:get value throught loc
62: LDA 4,-1(4)<------sp++
63: ST 1,0(4)<------store int or arr ---->[sp]
64: LD 2,0(4)<------load rightop to bx
65: LDA 4,1(4)<------sp++
66: LD 1,0(4)<------load leftop to ax
67: LDA 4,1(4)<------sp++
68: MUL 1,1,2<------op *1
69: LDA 4,-1(4)<------sp++
70: ST 1,0(4)<------load result of * to sp
71: LD 2,0(4)<------load rightop to bx
72: LDA 4,1(4)<------sp++
73: LD 1,0(4)<------load leftop to ax
74: LDA 4,1(4)<------sp++
75: DIV 1,1,2<------op /1
76: LDA 4,-1(4)<------sp++
77: ST 1,0(4)<------load result of / to sp
78: LD 2,0(4)<------load rightop to bx
79: LDA 4,1(4)<------sp++
80: LD 1,0(4)<------load leftop to ax
81: LDA 4,1(4)<------sp++
82: SUB 1,1,2<------op -1
83: LDA 4,-1(4)<------sp++
84: ST 1,0(4)<------load result of - to sp
85: LD 1,0(4)<------param is like x+y,return value store in sp,note now sp= sp+1
86: LDA 4,1(4)<------so we have to make sp-- to suit our call rule 
87: LDA 4,4(4)<------reset sp
88: ST 1,-4(4)<------load ax -> sp+paramsnum
89: LDA 1,3(7)<------store returned PC
90: LDA 4,-1(4)<------push prepare
91: ST 1,0(4)<------push returned PC
92: LDC 7,16(0)<------jump to function
93: LD 1,0(4)<------return int,load return value [sp]---->ax
94: LDA 4,0(5)<------let sp == bp
95: LDA 4,2(4)<------pop prepare
96: LD 5,-2(4)<------pop old bp
97: LD 2,-1(4)<------because sp-1 store the return addr,but reutrn value must be store here
98: ST 2,-2(4)<------so we move return addr to sp-2
99: LDA 4,-1(4)<------sp++
100: ST 1,0(4)<------load return value --->[sp]
101: LD 7,-1(4)<------pop return addr
102: LDA 4,-1(4)<------push prepare
103: ST 5,0(4)<------push old bp
104: LDA 5,0(4)<------let bp == sp
105: LDA 4,1(4)<------allocate for local variables
106: LDA 2,-1(5)<------local var:get addr throught loc
107: LDA 1,3(7)<------store returned PC
108: LDA 4,-1(4)<------push prepare
109: ST 1,0(4)<------push returned PC
110: LDC 7,8(0)<------jump to function
111: LDA 2,-1(5)<------local var:get addr throught loc
112: LDA 1,3(7)<------store returned PC
113: LDA 4,-1(4)<------push prepare
114: ST 1,0(4)<------push returned PC
115: LDC 7,8(0)<------jump to function
116: LD 1,-1(5)<------local var:get value throught loc
117: ST 1,-3(4)<------load bx -> sp+paramsnum
118: LD 1,-1(5)<------local var:get value throught loc
119: ST 1,-4(4)<------load bx -> sp+paramsnum
120: LDA 1,3(7)<------store returned PC
121: LDA 4,-1(4)<------push prepare
122: ST 1,0(4)<------push returned PC
123: LDC 7,16(0)<------jump to function
124: LD 1,0(4)<------param is func,return value store in sp,note now sp= sp+1
125: LDA 4,1(4)<------so we have to make sp-- to suit our call rule 
126: ST 1,-3(4)<------load ax -> sp+paramsnum
127: LDA 1,3(7)<------store returned PC
128: LDA 4,-1(4)<------push prepare
129: ST 1,0(4)<------push returned PC
130: LDC 7,12(0)<------jump to function
131: LDA 4,0(5)<------let sp == bp
132: LDA 4,2(4)<------pop prepare
133: LD 5,-2(4)<------pop old bp
134: LD 7,-1(4)<------pop return addr
