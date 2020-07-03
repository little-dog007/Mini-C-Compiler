0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,98(0)<------jump to function
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
21: ST 1,-3(4)<------load bx -> sp+paramsnum
22: LDA 1,3(7)<------store returned PC
23: LDA 4,-1(4)<------push prepare
24: ST 1,0(4)<------push returned PC
25: LDC 7,12(0)<------jump to function
26: LDA 4,0(5)<------let sp == bp
27: LDA 4,2(4)<------pop prepare
28: LD 5,-2(4)<------pop old bp
29: LD 7,-1(4)<------pop return addr
30: LDA 4,-1(4)<------push prepare
31: ST 5,0(4)<------push old bp
32: LDA 5,0(4)<------let bp == sp
33: LDA 4,1(4)<------allocate for local variables
34: LDA 1,-1(5)<------local var:get addr throught loc
35: LDA 4,-1(4)<------assign:sp++
36: ST 1,0(4)<------assign:push leftOp to sp
37: LD 1,-1(5)<------local var:get value throught loc
38: LDA 4,-1(4)<------sp++
39: ST 1,0(4)<------store int or arr ---->[sp]
40: LD 1,-1(5)<------local var:get value throught loc
41: LDA 4,-1(4)<------sp++
42: ST 1,0(4)<------store int or arr ---->[sp]
43: LD 2,0(4)<------load rightop to bx
44: LDA 4,1(4)<------sp++
45: LD 1,0(4)<------load leftop to ax
46: LDA 4,1(4)<------sp++
47: ADD 1,1,2<------op +
48: LDA 4,-1(4)<------sp++
49: ST 1,0(4)<------load result of + to sp
50: LD 2,0(4)<------assign:load rightop form [sp]
51: LDA 4,1(4)<------sp--
52: LD 1,0(4)<------a；ssign:load leftop from [sp]
53: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
54: LD 1,-1(5)<------local var:get value throught loc
55: ST 1,-3(4)<------load bx -> sp+paramsnum
56: LDA 1,3(7)<------store returned PC
57: LDA 4,-1(4)<------push prepare
58: ST 1,0(4)<------push returned PC
59: LDC 7,12(0)<------jump to function
60: LDA 4,0(5)<------let sp == bp
61: LDA 4,2(4)<------pop prepare
62: LD 5,-2(4)<------pop old bp
63: LD 7,-1(4)<------pop return addr
64: LDA 4,-1(4)<------push prepare
65: ST 5,0(4)<------push old bp
66: LDA 5,0(4)<------let bp == sp
67: LDA 4,1(4)<------allocate for local variables
68: LDA 1,-1(5)<------local var:get addr throught loc
69: LDA 4,-1(4)<------assign:sp++
70: ST 1,0(4)<------assign:push leftOp to sp
71: LD 1,-1(5)<------local var:get value throught loc
72: LDA 4,-1(4)<------sp++
73: ST 1,0(4)<------store int or arr ---->[sp]
74: LD 1,-1(5)<------local var:get value throught loc
75: LDA 4,-1(4)<------sp++
76: ST 1,0(4)<------store int or arr ---->[sp]
77: LD 2,0(4)<------load rightop to bx
78: LDA 4,1(4)<------sp++
79: LD 1,0(4)<------load leftop to ax
80: LDA 4,1(4)<------sp++
81: ADD 1,1,2<------op +1
82: LDA 4,-1(4)<------sp++
83: ST 1,0(4)<------load result of + to sp
84: LD 2,0(4)<------assign:load rightop form [sp]
85: LDA 4,1(4)<------sp--
86: LD 1,0(4)<------a；ssign:load leftop from [sp]
87: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
88: LD 1,-1(5)<------local var:get value throught loc
89: ST 1,-3(4)<------load bx -> sp+paramsnum
90: LDA 1,3(7)<------store returned PC
91: LDA 4,-1(4)<------push prepare
92: ST 1,0(4)<------push returned PC
93: LDC 7,12(0)<------jump to function
94: LDA 4,0(5)<------let sp == bp
95: LDA 4,2(4)<------pop prepare
96: LD 5,-2(4)<------pop old bp
97: LD 7,-1(4)<------pop return addr
98: LDA 4,-1(4)<------push prepare
99: ST 5,0(4)<------push old bp
100: LDA 5,0(4)<------let bp == sp
101: LDA 4,1(4)<------allocate for local variables
102: LDA 1,-1(5)<------local var:get addr throught loc
103: LDA 4,-1(4)<------assign:sp++
104: ST 1,0(4)<------assign:push leftOp to sp
105: LDA 4,-1(4)<------sp++
106: LDC 1,100(0)<------load cint --->ax
107: ST 1,0(4)<------store ax --->[sp]
108: LD 2,0(4)<------assign:load rightop form [sp]
109: LDA 4,1(4)<------sp--
110: LD 1,0(4)<------a；ssign:load leftop from [sp]
111: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
112: LDA 1,-1(5)<------local var:get arr addr throught loc
113: LDA 4,-1(4)<------assign:sp++
114: ST 1,0(4)<------assign:push leftOp to sp
115: LDA 4,-1(4)<------sp++
116: LDC 1,1(0)<------load cint --->ax
117: ST 1,0(4)<------store ax --->[sp]
118: LD 2,0(4)<------assign:load rightop form [sp]
119: LDA 4,1(4)<------sp--
120: LD 1,0(4)<------a；ssign:load leftop from [sp]
121: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
122: LDA 1,-2(5)<------local var:get arr addr throught loc
123: LDA 4,-1(4)<------assign:sp++
124: ST 1,0(4)<------assign:push leftOp to sp
125: LDA 4,-1(4)<------sp++
126: LDC 1,2(0)<------load cint --->ax
127: ST 1,0(4)<------store ax --->[sp]
128: LD 2,0(4)<------assign:load rightop form [sp]
129: LDA 4,1(4)<------sp--
130: LD 1,0(4)<------a；ssign:load leftop from [sp]
131: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
132: LDA 1,-3(5)<------local var:get arr addr throught loc
133: LDA 4,-1(4)<------assign:sp++
134: ST 1,0(4)<------assign:push leftOp to sp
135: LDA 4,-1(4)<------sp++
136: LDC 1,3(0)<------load cint --->ax
137: ST 1,0(4)<------store ax --->[sp]
138: LD 2,0(4)<------assign:load rightop form [sp]
139: LDA 4,1(4)<------sp--
140: LD 1,0(4)<------a；ssign:load leftop from [sp]
141: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
142: LDA 1,3(7)<------store returned PC
143: LDA 4,-1(4)<------push prepare
144: ST 1,0(4)<------push returned PC
145: LDC 7,16(0)<------jump to function
146: LD 1,-1(5)<------local var:get arr value throught loc
147: ST 1,-3(4)<------load bx -> sp+paramsnum
148: LDA 1,3(7)<------store returned PC
149: LDA 4,-1(4)<------push prepare
150: ST 1,0(4)<------push returned PC
151: LDC 7,30(0)<------jump to function
152: LDA 1,3(7)<------store returned PC
153: LDA 4,-1(4)<------push prepare
154: ST 1,0(4)<------push returned PC
155: LDC 7,16(0)<------jump to function
156: LD 1,-2(5)<------local var:get arr value throught loc
157: ST 1,-3(4)<------load bx -> sp+paramsnum
158: LD 1,-3(5)<------local var:get arr value throught loc
159: ST 1,-4(4)<------load bx -> sp+paramsnum
160: LDA 1,3(7)<------store returned PC
161: LDA 4,-1(4)<------push prepare
162: ST 1,0(4)<------push returned PC
163: LDC 7,64(0)<------jump to function
164: LDA 4,0(5)<------let sp == bp
165: LDA 4,2(4)<------pop prepare
166: LD 5,-2(4)<------pop old bp
167: LD 7,-1(4)<------pop return addr
