0: LD 6,0(0)<------load from location 0
1: ST 0,0(0)<------clear location 0
2: LDA 4,0(6)<------allocate for global variables
3: LDA 1,3(7)<------store returned PC
4: LDA 4,-1(4)<------push prepare
5: ST 1,0(4)<------push returned PC
6: LDC 7,293(0)<------jump to function
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
23: LD 1,-1(5)<------local var:get value throught loc
24: LDA 4,-1(4)<------sp++
25: ST 1,0(4)<------store int or arr ---->[sp]
26: LD 2,0(4)<------assign:load rightop form [sp]
27: LDA 4,1(4)<------sp--
28: LD 1,0(4)<------a；ssign:load leftop from [sp]
29: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
30: LDA 1,-1(5)<------local var:get addr throught loc
31: LDA 4,-1(4)<------assign:sp++
32: ST 1,0(4)<------assign:push leftOp to sp
33: LD 1,-1(5)<------get a of x[a] --> bx
34: LDA 2,-1(5)<------x[a] load addr of x 
35: SUB 2,2,1<------get addr of x[a]
36: LD 1,0(2)<------get x[a] value
37: LDA 4,-1(4)<------sp++
38: ST 1,0(4)<------store int or arr ---->[sp]
39: LD 2,0(4)<------assign:load rightop form [sp]
40: LDA 4,1(4)<------sp--
41: LD 1,0(4)<------a；ssign:load leftop from [sp]
42: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
43: LDA 1,-1(5)<------local var:get addr throught loc
44: LDA 4,-1(4)<------assign:sp++
45: ST 1,0(4)<------assign:push leftOp to sp
46: LD 1,-1(5)<------local var:get value throught loc
47: LDA 4,-1(4)<------sp++
48: ST 1,0(4)<------store int or arr ---->[sp]
49: LDA 4,-1(4)<------sp++
50: LDC 1,1(0)<------load cint --->ax
51: ST 1,0(4)<------store ax --->[sp]
52: LD 2,0(4)<------load rightop to bx
53: LDA 4,1(4)<------sp++
54: LD 1,0(4)<------load leftop to ax
55: LDA 4,1(4)<------sp++
56: ADD 1,1,2<------op +
57: LDA 4,-1(4)<------sp++
58: ST 1,0(4)<------load result of + to sp
59: LD 2,0(4)<------assign:load rightop form [sp]
60: LDA 4,1(4)<------sp--
61: LD 1,0(4)<------a；ssign:load leftop from [sp]
62: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
63: LD 1,-1(5)<------local var:get value throught loc
64: LDA 4,-1(4)<------sp++
65: ST 1,0(4)<------store int or arr ---->[sp]
66: LD 1,-1(5)<------local var:get value throught loc
67: LDA 4,-1(4)<------sp++
68: ST 1,0(4)<------store int or arr ---->[sp]
69: LD 2,0(4)<------load rightop to bx
70: LDA 4,1(4)<------sp++
71: LD 1,0(4)<------load leftop to ax
72: LDA 4,1(4)<------sp++
73: SUB 1,1,2<------op <
74: JLT 1,2(7)<------br if true
75: LDC 1,0(0)<------false case
76: LDA 7,1(7)<------unconditional jmp
77: LDC 1,1(0)<------true case
78: JEQ 1,143(0)<------jump to end
79: LD 1,-1(5)<------get a of x[a] --> bx
80: LDA 2,-1(5)<------x[a] load addr of x 
81: SUB 2,2,1<------get addr of x[a]
82: LD 1,0(2)<------get x[a] value
83: LDA 4,-1(4)<------sp++
84: ST 1,0(4)<------store int or arr ---->[sp]
85: LD 1,-1(5)<------local var:get value throught loc
86: LDA 4,-1(4)<------sp++
87: ST 1,0(4)<------store int or arr ---->[sp]
88: LD 2,0(4)<------load rightop to bx
89: LDA 4,1(4)<------sp++
90: LD 1,0(4)<------load leftop to ax
91: LDA 4,1(4)<------sp++
92: SUB 1,1,2<------op <
93: JLT 1,2(7)<------br if true
94: LDC 1,0(0)<------false case
95: LDA 7,1(7)<------unconditional jmp
96: LDC 1,1(0)<------true case
97: JEQ 1,122(0)<------if:jmp to else
98: LDA 1,-1(5)<------local var:get addr throught loc
99: LDA 4,-1(4)<------assign:sp++
100: ST 1,0(4)<------assign:push leftOp to sp
101: LD 1,-1(5)<------get a of x[a] --> bx
102: LDA 2,-1(5)<------x[a] load addr of x 
103: SUB 2,2,1<------get addr of x[a]
104: LD 1,0(2)<------get x[a] value
105: LDA 4,-1(4)<------sp++
106: ST 1,0(4)<------store int or arr ---->[sp]
107: LD 2,0(4)<------assign:load rightop form [sp]
108: LDA 4,1(4)<------sp--
109: LD 1,0(4)<------a；ssign:load leftop from [sp]
110: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
111: LDA 1,-1(5)<------local var:get addr throught loc
112: LDA 4,-1(4)<------assign:sp++
113: ST 1,0(4)<------assign:push leftOp to sp
114: LD 1,-1(5)<------local var:get value throught loc
115: LDA 4,-1(4)<------sp++
116: ST 1,0(4)<------store int or arr ---->[sp]
117: LD 2,0(4)<------assign:load rightop form [sp]
118: LDA 4,1(4)<------sp--
119: LD 1,0(4)<------a；ssign:load leftop from [sp]
120: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
121: LDA 4,0(4)<------nop  nop  nop
122: LDA 1,-1(5)<------local var:get addr throught loc
123: LDA 4,-1(4)<------assign:sp++
124: ST 1,0(4)<------assign:push leftOp to sp
125: LD 1,-1(5)<------local var:get value throught loc
126: LDA 4,-1(4)<------sp++
127: ST 1,0(4)<------store int or arr ---->[sp]
128: LDA 4,-1(4)<------sp++
129: LDC 1,1(0)<------load cint --->ax
130: ST 1,0(4)<------store ax --->[sp]
131: LD 2,0(4)<------load rightop to bx
132: LDA 4,1(4)<------sp++
133: LD 1,0(4)<------load leftop to ax
134: LDA 4,1(4)<------sp++
135: ADD 1,1,2<------op +
136: LDA 4,-1(4)<------sp++
137: ST 1,0(4)<------load result of + to sp
138: LD 2,0(4)<------assign:load rightop form [sp]
139: LDA 4,1(4)<------sp--
140: LD 1,0(4)<------a；ssign:load leftop from [sp]
141: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
142: LDA 7,63(0)<------jump to test
143: LD 1,-1(5)<------local var:get value throught loc
144: LDA 4,-1(4)<------sp++
145: ST 1,0(4)<------laod ax-->[sp]
146: LD 1,0(4)<------return int,load return value [sp]---->ax
147: LDA 4,0(5)<------let sp == bp
148: LDA 4,2(4)<------pop prepare
149: LD 5,-2(4)<------pop old bp
150: LD 2,-1(4)<------because sp-1 store the return addr,but reutrn value must be store here
151: ST 2,-2(4)<------so we move return addr to sp-2
152: LDA 4,-1(4)<------sp++
153: ST 1,0(4)<------load return value --->[sp]
154: LD 7,-1(4)<------pop return addr
155: LDA 4,-1(4)<------push prepare
156: ST 5,0(4)<------push old bp
157: LDA 5,0(4)<------let bp == sp
158: LDA 4,1(4)<------allocate for local variables
159: LDA 1,-1(5)<------local var:get addr throught loc
160: LDA 4,-1(4)<------assign:sp++
161: ST 1,0(4)<------assign:push leftOp to sp
162: LD 1,-1(5)<------local var:get value throught loc
163: LDA 4,-1(4)<------sp++
164: ST 1,0(4)<------store int or arr ---->[sp]
165: LD 2,0(4)<------assign:load rightop form [sp]
166: LDA 4,1(4)<------sp--
167: LD 1,0(4)<------a；ssign:load leftop from [sp]
168: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
169: LD 1,-1(5)<------local var:get arr value throught loc
170: ST 1,-3(4)<------load bx -> sp+paramsnum
171: LDA 1,3(7)<------store returned PC
172: LDA 4,-1(4)<------push prepare
173: ST 1,0(4)<------push returned PC
174: LDC 7,12(0)<------jump to function
175: LD 1,-2(5)<------local var:get arr value throught loc
176: ST 1,-3(4)<------load bx -> sp+paramsnum
177: LDA 1,3(7)<------store returned PC
178: LDA 4,-1(4)<------push prepare
179: ST 1,0(4)<------push returned PC
180: LDC 7,12(0)<------jump to function
181: LD 1,-3(5)<------local var:get arr value throught loc
182: ST 1,-3(4)<------load bx -> sp+paramsnum
183: LDA 1,3(7)<------store returned PC
184: LDA 4,-1(4)<------push prepare
185: ST 1,0(4)<------push returned PC
186: LDC 7,12(0)<------jump to function
187: LD 1,-1(5)<------local var:get value throught loc
188: LDA 4,-1(4)<------sp++
189: ST 1,0(4)<------store int or arr ---->[sp]
190: LD 1,-1(5)<------local var:get value throught loc
191: LDA 4,-1(4)<------sp++
192: ST 1,0(4)<------store int or arr ---->[sp]
193: LDA 4,-1(4)<------sp++
194: LDC 1,1(0)<------load cint --->ax
195: ST 1,0(4)<------store ax --->[sp]
196: LD 2,0(4)<------load rightop to bx
197: LDA 4,1(4)<------sp++
198: LD 1,0(4)<------load leftop to ax
199: LDA 4,1(4)<------sp++
200: SUB 1,1,2<------op -
201: LDA 4,-1(4)<------sp++
202: ST 1,0(4)<------load result of - to sp
203: LD 2,0(4)<------load rightop to bx
204: LDA 4,1(4)<------sp++
205: LD 1,0(4)<------load leftop to ax
206: LDA 4,1(4)<------sp++
207: SUB 1,1,2<------op <
208: JLT 1,2(7)<------br if true
209: LDC 1,0(0)<------false case
210: LDA 7,1(7)<------unconditional jmp
211: LDC 1,1(0)<------true case
212: JEQ 1,289(0)<------jump to end
213: LDA 1,-1(5)<------local var:get addr throught loc
214: LDA 4,-1(4)<------assign:sp++
215: ST 1,0(4)<------assign:push leftOp to sp
216: LD 1,-1(5)<------local var:get value throught loc
217: ST 1,-3(4)<------load bx -> sp+paramsnum
218: LD 1,-1(5)<------local var:get value throught loc
219: ST 1,-4(4)<------load bx -> sp+paramsnum
220: LDA 1,3(7)<------store returned PC
221: LDA 4,-1(4)<------push prepare
222: ST 1,0(4)<------push returned PC
223: LDC 7,16(0)<------jump to function
224: LD 2,0(4)<------assign:load rightop form [sp]
225: LDA 4,1(4)<------sp--
226: LD 1,0(4)<------a；ssign:load leftop from [sp]
227: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
228: LDA 1,-1(5)<------local var:get addr throught loc
229: LDA 4,-1(4)<------assign:sp++
230: ST 1,0(4)<------assign:push leftOp to sp
231: LD 1,-1(5)<------get a of x[a] --> bx
232: LDA 2,-1(5)<------x[a] load addr of x 
233: SUB 2,2,1<------get addr of x[a]
234: LD 1,0(2)<------get x[a] value
235: LDA 4,-1(4)<------sp++
236: ST 1,0(4)<------store int or arr ---->[sp]
237: LD 2,0(4)<------assign:load rightop form [sp]
238: LDA 4,1(4)<------sp--
239: LD 1,0(4)<------a；ssign:load leftop from [sp]
240: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
241: LD 1,-1(5)<------get value of a
242: LDA 2,-1(5)<------get addr of x
243: SUB 1,2,1<------ax = bx - ax
244: LDA 4,-1(4)<------assign:sp++
245: ST 1,0(4)<------assign:push leftOp to sp
246: LD 1,-1(5)<------get a of x[a] --> bx
247: LDA 2,-1(5)<------x[a] load addr of x 
248: SUB 2,2,1<------get addr of x[a]
249: LD 1,0(2)<------get x[a] value
250: LDA 4,-1(4)<------sp++
251: ST 1,0(4)<------store int or arr ---->[sp]
252: LD 2,0(4)<------assign:load rightop form [sp]
253: LDA 4,1(4)<------sp--
254: LD 1,0(4)<------a；ssign:load leftop from [sp]
255: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
256: LD 1,-1(5)<------get value of a
257: LDA 2,-1(5)<------get addr of x
258: SUB 1,2,1<------ax = bx - ax
259: LDA 4,-1(4)<------assign:sp++
260: ST 1,0(4)<------assign:push leftOp to sp
261: LD 1,-1(5)<------local var:get value throught loc
262: LDA 4,-1(4)<------sp++
263: ST 1,0(4)<------store int or arr ---->[sp]
264: LD 2,0(4)<------assign:load rightop form [sp]
265: LDA 4,1(4)<------sp--
266: LD 1,0(4)<------a；ssign:load leftop from [sp]
267: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
268: LDA 1,-1(5)<------local var:get addr throught loc
269: LDA 4,-1(4)<------assign:sp++
270: ST 1,0(4)<------assign:push leftOp to sp
271: LD 1,-1(5)<------local var:get value throught loc
272: LDA 4,-1(4)<------sp++
273: ST 1,0(4)<------store int or arr ---->[sp]
274: LDA 4,-1(4)<------sp++
275: LDC 1,1(0)<------load cint --->ax
276: ST 1,0(4)<------store ax --->[sp]
277: LD 2,0(4)<------load rightop to bx
278: LDA 4,1(4)<------sp++
279: LD 1,0(4)<------load leftop to ax
280: LDA 4,1(4)<------sp++
281: ADD 1,1,2<------op +
282: LDA 4,-1(4)<------sp++
283: ST 1,0(4)<------load result of + to sp
284: LD 2,0(4)<------assign:load rightop form [sp]
285: LDA 4,1(4)<------sp--
286: LD 1,0(4)<------a；ssign:load leftop from [sp]
287: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
288: LDA 7,187(0)<------jump to test
289: LDA 4,0(5)<------let sp == bp
290: LDA 4,2(4)<------pop prepare
291: LD 5,-2(4)<------pop old bp
292: LD 7,-1(4)<------pop return addr
293: LDA 4,-1(4)<------push prepare
294: ST 5,0(4)<------push old bp
295: LDA 5,0(4)<------let bp == sp
296: LDA 4,1(4)<------allocate for local variables
297: LDA 1,-1(5)<------local var:get addr throught loc
298: LDA 4,-1(4)<------assign:sp++
299: ST 1,0(4)<------assign:push leftOp to sp
300: LDA 4,-1(4)<------sp++
301: LDC 1,0(0)<------load cint --->ax
302: ST 1,0(4)<------store ax --->[sp]
303: LD 2,0(4)<------assign:load rightop form [sp]
304: LDA 4,1(4)<------sp--
305: LD 1,0(4)<------a；ssign:load leftop from [sp]
306: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
307: LD 1,-1(5)<------local var:get value throught loc
308: LDA 4,-1(4)<------sp++
309: ST 1,0(4)<------store int or arr ---->[sp]
310: LDA 4,-1(4)<------sp++
311: LDC 1,5(0)<------load cint --->ax
312: ST 1,0(4)<------store ax --->[sp]
313: LD 2,0(4)<------load rightop to bx
314: LDA 4,1(4)<------sp++
315: LD 1,0(4)<------load leftop to ax
316: LDA 4,1(4)<------sp++
317: SUB 1,1,2<------op <
318: JLT 1,2(7)<------br if true
319: LDC 1,0(0)<------false case
320: LDA 7,1(7)<------unconditional jmp
321: LDC 1,1(0)<------true case
322: JEQ 1,351(0)<------jump to end
323: LD 1,-1(5)<------get value of a
324: LDA 2,-1(5)<------get addr of x
325: SUB 2,2,1<------ax = bx - ax
326: LDA 1,3(7)<------store returned PC
327: LDA 4,-1(4)<------push prepare
328: ST 1,0(4)<------push returned PC
329: LDC 7,8(0)<------jump to function
330: LDA 1,-1(5)<------local var:get addr throught loc
331: LDA 4,-1(4)<------assign:sp++
332: ST 1,0(4)<------assign:push leftOp to sp
333: LD 1,-1(5)<------local var:get value throught loc
334: LDA 4,-1(4)<------sp++
335: ST 1,0(4)<------store int or arr ---->[sp]
336: LDA 4,-1(4)<------sp++
337: LDC 1,1(0)<------load cint --->ax
338: ST 1,0(4)<------store ax --->[sp]
339: LD 2,0(4)<------load rightop to bx
340: LDA 4,1(4)<------sp++
341: LD 1,0(4)<------load leftop to ax
342: LDA 4,1(4)<------sp++
343: ADD 1,1,2<------op +
344: LDA 4,-1(4)<------sp++
345: ST 1,0(4)<------load result of + to sp
346: LD 2,0(4)<------assign:load rightop form [sp]
347: LDA 4,1(4)<------sp--
348: LD 1,0(4)<------a；ssign:load leftop from [sp]
349: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
350: LDA 7,307(0)<------jump to test
351: LDC 1,0(0)<------load cint -->bx
352: ST 1,-3(4)<------load bx -> sp+paramsnum
353: LDC 1,5(0)<------load cint -->bx
354: ST 1,-4(4)<------load bx -> sp+paramsnum
355: LDA 1,3(7)<------store returned PC
356: LDA 4,-1(4)<------push prepare
357: ST 1,0(4)<------push returned PC
358: LDC 7,155(0)<------jump to function
359: LDA 1,-1(5)<------local var:get addr throught loc
360: LDA 4,-1(4)<------assign:sp++
361: ST 1,0(4)<------assign:push leftOp to sp
362: LDA 4,-1(4)<------sp++
363: LDC 1,0(0)<------load cint --->ax
364: ST 1,0(4)<------store ax --->[sp]
365: LD 2,0(4)<------assign:load rightop form [sp]
366: LDA 4,1(4)<------sp--
367: LD 1,0(4)<------a；ssign:load leftop from [sp]
368: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
369: LD 1,-1(5)<------local var:get value throught loc
370: LDA 4,-1(4)<------sp++
371: ST 1,0(4)<------store int or arr ---->[sp]
372: LDA 4,-1(4)<------sp++
373: LDC 1,5(0)<------load cint --->ax
374: ST 1,0(4)<------store ax --->[sp]
375: LD 2,0(4)<------load rightop to bx
376: LDA 4,1(4)<------sp++
377: LD 1,0(4)<------load leftop to ax
378: LDA 4,1(4)<------sp++
379: SUB 1,1,2<------op <
380: JLT 1,2(7)<------br if true
381: LDC 1,0(0)<------false case
382: LDA 7,1(7)<------unconditional jmp
383: LDC 1,1(0)<------true case
384: JEQ 1,415(0)<------jump to end
385: LD 1,-1(5)<------get a of x[a] --> bx
386: LDA 2,-1(5)<------x[a] load addr of x 
387: SUB 2,2,1<------get addr of x[a]
388: LD 1,0(2)<------get x[a] value
389: ST 1,-3(4)<------load bx -> sp+paramsnum
390: LDA 1,3(7)<------store returned PC
391: LDA 4,-1(4)<------push prepare
392: ST 1,0(4)<------push returned PC
393: LDC 7,12(0)<------jump to function
394: LDA 1,-1(5)<------local var:get addr throught loc
395: LDA 4,-1(4)<------assign:sp++
396: ST 1,0(4)<------assign:push leftOp to sp
397: LD 1,-1(5)<------local var:get value throught loc
398: LDA 4,-1(4)<------sp++
399: ST 1,0(4)<------store int or arr ---->[sp]
400: LDA 4,-1(4)<------sp++
401: LDC 1,1(0)<------load cint --->ax
402: ST 1,0(4)<------store ax --->[sp]
403: LD 2,0(4)<------load rightop to bx
404: LDA 4,1(4)<------sp++
405: LD 1,0(4)<------load leftop to ax
406: LDA 4,1(4)<------sp++
407: ADD 1,1,2<------op +
408: LDA 4,-1(4)<------sp++
409: ST 1,0(4)<------load result of + to sp
410: LD 2,0(4)<------assign:load rightop form [sp]
411: LDA 4,1(4)<------sp--
412: LD 1,0(4)<------a；ssign:load leftop from [sp]
413: ST 2,0(1)<------assign:stroe value of bx ---> [ax]
414: LDA 7,369(0)<------jump to test
415: LDA 4,0(5)<------let sp == bp
416: LDA 4,2(4)<------pop prepare
417: LD 5,-2(4)<------pop old bp
418: LD 7,-1(4)<------pop return addr
