# MPSiS 2018/2019
# Model UFAP, L-P

#based on https://upel.agh.edu.pl/wiet/pluginfile.php/39003/mod_resource/content/1/mpsis_konspekt_w3.pdf point no. 9
#and previous work by Konrad Adamczyk


/* Number of vertexes, edges, dispositions */
param E_count, integer, >= 0;
param D_count, integer, >= 0;
param P_count, integer, >= 0; ## don't know what about the index from conspect lecture 2 ufap L-P

/* Sets of vertexes, edges and dispositions */
set E, default {1..E_count};
set D, default {1..D_count};
set P, default {1..P_count};

/* Requirements */
param h{d in D} >= 0;

/* KSI xD */
param KSI{e in E} >= 0;

/* delta */
param delta{e in E, d in D, p in P}

/* don't know what about that */
param c{e in E} >= 0;

/* Decision variables */
var x{d in D, p in P} >= 0;

/* Objective function 'z' */
minimize z: sum{e in E} KSI[e]*(sum{p in P} x[d,p]); #analogous to previous example, so don't sure if correct

/* Constraints */
s.t. c1{p in P} : sum{d in D} x[d,p] == h[d];
s.t. c2{e in E} : sum{d in D} sum{p in P} delta[e,d,p]*x[d,p] <= c[e]; #c is y in lecture conspect

#s.t. c1{d in D, v in V : v == s[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == h[d];
#s.t. c2{d in D, v in V : v <> s[d] and v <> t[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == 0;
#s.t. c3{d in D, v in V : v == t[d]} : sum{e in E} (A[e,v]*x[e,d] - B[e,v]*x[e,d]) == -h[d];
#s.t. c4{e in E} : sum{d in D} x[e,d] <= c[e];


### didn't look after that

printf{e in E, v in V} "A[%d,%d] = %d, B[%d,%d] = %d\n", e, v, A[e, v], e, v, B[e, v];
printf{e in E} "KSI[%d] = %d, c[%d] = %d\n", e, KSI[e], e, c[e];
printf{d in D} "s[%d] = %d, t[%d] = %d, h[%d] = %d\n", d, s[d], d, t[d], d, h[d];

end;
