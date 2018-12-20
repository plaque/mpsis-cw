/* MPSiS 2018/2019 */
/* Model UFAP, N/L */

/* Decision variables */
var l >= 0;
var mi;

/* Objective function z */
maximize z: l - mi;

/* Constraints */
s.t. c1: 2*l - mi <= 2;
s.t. c2: l - 2*mi <= 2;
s.t. c3: 4*l <= 3 ;
