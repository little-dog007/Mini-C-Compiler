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
29: LDC 1,1(0)<------load cint --->ax
30: ST 1,0(4)<------store ax --->[sp]
31: LD 2,0(4)<------load rightop to bx
32: LDA 4,1(4)<------sp++
33: LD 1,0(4)<------load leftop to ax
34: LDA 4,1(4)<------sp++
35: SUB 1,1,2<------op ==
36: JEQ 1,2(7)<------br if true
37: LDC 1,0(0)<------false case
38: LDA 7,1(7)<------unconditional jmp
39: LDC 1,1(0)<------true case
40: JEQ 1,48(0)<------if:jmp to else
41: LDC 1,0(0)<------load cint -->bx
42: ST 1,-3(4)<------load bx -> sp+paramsnum
43: LDA 1,3(7)<------store returned PC
44: LDA 4,-1(4)<------push prepare
45: ST 1,0(4)<------push returned PC
46: LDC 7,12(0)<------jump to function
47: LDA 7,54(0)<------jmp to end
48: LDC 1,1(0)<------load cint -->bx
49: ST 1,-3(4)<------load bx -> sp+paramsnum
50: LDA 1,3(7)<------store returned PC
51: LDA 4,-1(4)<------push prepare
52: ST 1,0(4)<------push returned PC
53: LDC 7,12(0)<------jump to function
54: LDC 1,1(0)<------load cint -->bx
55: ST 1,-3(4)<------load bx -> sp+paramsnum
56: LDA 1,3(7)<------store returned PC
57: LDA 4,-1(4)<------push prepare
58: ST 1,0(4)<------push returned PC
59: LDC 7,12(0)<------jump to function
60: LDA 4,0(5)<------let sp == bp
61: LDA 4,2(4)<------pop prepare
62: LD 5,-2(4)<------pop old bp
63: LD 7,-1(4)<------pop return addr
