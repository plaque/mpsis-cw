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

/* Objective function 'z' */
minimize z: sum{e in E, d in D} x[e,d]*KSI[e];

/* Constraints */
s.t. C1: forall{v in V, d in D : v == s[d]} (sum{e in E} (x[e, d] * A[e, v] - x[e, d] * B[e, v])) == h[d];
s.t. C2: forall{v in V, d in D : v == t[d]} (sum{e in E} (x[e, d] * A[e, v] - x[e, d] * B[e, v])) == -h[d];
s.t. C3: forall{v in V, d in D : v != t[d] and v != s[d]} sum{e in E} x[e, d] * A[e, v] - x[e, d] * B[e, v] == 0;
s.t. C4: forall{e in E} sum{d in D} x[e,d] <= c[e];
