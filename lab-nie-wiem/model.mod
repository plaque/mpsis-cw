/* MPSiS 2018/2019 */
/* Model UFAP, N/L */

/* Number of vertexes, edges, dispositions */
param i_count, integer, >= 1, default 3;

/* Sets of vertexes, edges and dispositions */
set I, default {1..i_count};

/* Decision variables */
var x{i in I} >= 0;

/* Objective function z */
minimize z: 2*x[1] + 2*x[2] + 3*x[3];

/* Constraints */
s.t. c1: 2*x[1] + x[2] +4*x[3] >= 1;
s.t. c2: x[1] + 2*x[2] = 1;
