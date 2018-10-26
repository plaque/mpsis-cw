# MPSiS 2018/2019
# Model UFAP, N/L

/* Number of vertexes, edges, dispositions */
param V_count, integer, >= 1;
param E_count, integer, >= 1;
param D_count, integer, >= 1;

/* Sets of vertexes, edges and dispositions */
set V, default {1..V_count};
set E, default {1..E_count};
set D, default {1..D_count};

/* Requirements */
param h{d in D}, integer, >= 0;
param s{d in D}, integer, >= 0;
param t{d in D}, integer, >= 0;

/* Aev, Bev as params */
param A{e in E, v in V}, integer, >= 0, default 0;
param B{e in E, v in V}, integer, >= 0, default 0;

/* Capacity */
param c{e in E}, integer, >= 1, default 5;

/* KSI xD */
param KSI{e in E}, integer, >= 0;

/* Decision variables */
var x{e in E, d in D}, integer, >= 0;
var y{e in E}, integer, >= 0;

/* Objective function 'z' */
minimize z: sum{e in E} KSI[e]*y[e];

/* Constraints */
s.t. C1{v in V, d in D}: if (v == s[d]) then (sum{e in E} (x[e, d] * A[e, v] - x[e, d] * B[e, v])) == h[d];
s.t. C2{v in V, d in D}: if (v == t[d]) then (sum{e in E} (x[e, d] * A[e, v] - x[e, d] * B[e, v])) == -h[d];
s.t. C3{v in V, d in D}: if (v != t[d] and v != s[d]) then (sum{e in E} (x[e, d] * A[e, v] - x[e, d] * B[e, v])) == 0;
s.t. C4{e in E}: (sum{d in D} x[e,d]) == y[e];
s.t. C5{e in E}: y[e] <= c[e];


printf{e in E, v in V} "A[%d,%d] = %d, B[%d,%d] = %d\n", e, v, A[e, v], e, v, B[e, v];
printf{e in E} "KSI[%d] = %d, c[%d] = %d\n", e, KSI[e], e, c[e];
printf{d in D} "s[%d] = %d, t[%d] = %d, h[%d] = %d\n", d, s[d], d, t[d], d, h[d];

end;
