#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -17.97*x up 21.34*y
  direction 1.00*z
  location <0,0,50.00> look_at <0,0,0>}


light_source {<  2.00,   3.00,  40.00> color White
  area_light <0.70, 0, 0>, <0, 0.70, 0>, 3, 3
  adaptive 1 jitter}
// no fog
#declare simple = finish {phong 0.7}
#declare pale = finish {ambient 0.5 diffuse 0.85 roughness 0.001 specular 0.200 }
#declare intermediate = finish {ambient 0.3 diffuse 0.6 specular 0.1 roughness 0.04}
#declare vmd = finish {ambient 0.0 diffuse 0.65 phong 0.1 phong_size 40.0 specular 0.5 }
#declare jmol = finish {ambient 0.2 diffuse 0.6 specular 1 roughness 0.001 metallic}
#declare ase2 = finish {ambient 0.05 brilliance 3 diffuse 0.6 metallic specular 0.7 roughness 0.04 reflection 0.15}
#declare ase3 = finish {ambient 0.15 brilliance 2 diffuse 0.6 metallic specular 1.0 roughness 0.001 reflection 0.0}
#declare glass = finish {ambient 0.05 diffuse 0.3 specular 1.0 roughness 0.001}
#declare glass2 = finish {ambient 0.01 diffuse 0.3 specular 1.0 reflection 0.25 roughness 0.001}
#declare Rcell = 0.000;
#declare Rbond = 0.100;

#macro atom(LOC, R, COL, TRANS, FIN)
  sphere{LOC, R texture{pigment{color COL transmit TRANS} finish{FIN}}}
#end
#macro constrain(LOC, R, COL, TRANS FIN)
union{torus{R, Rcell rotate 45*z texture{pigment{color COL transmit TRANS} finish{FIN}}}
     torus{R, Rcell rotate -45*z texture{pigment{color COL transmit TRANS} finish{FIN}}}
     translate LOC}
#end

cylinder {<  8.55, -10.16, -25.95>, <  8.55, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.16, -25.95>, <  8.55,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55,  10.16, -25.95>, < -8.55,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.16, -25.95>, < -8.55, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55, -10.16, -25.95>, <  8.55,  10.16, -25.95>, Rcell pigment {Black}}
cylinder {<  8.55, -10.16,   0.00>, <  8.55,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.16,   0.00>, < -8.55,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.16, -25.95>, < -8.55,  10.16, -25.95>, Rcell pigment {Black}}
cylinder {<  8.55, -10.16, -25.95>, < -8.55, -10.16, -25.95>, Rcell pigment {Black}}
cylinder {<  8.55, -10.16,   0.00>, < -8.55, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.16,   0.00>, < -8.55,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.16, -25.95>, < -8.55,  10.16, -25.95>, Rcell pigment {Black}}
atom(< -1.13,  -8.13, -23.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<  1.43,  -8.13, -23.19>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #1
atom(<  1.13,  -6.10, -25.71>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(< -1.13,  -4.06, -23.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #3
atom(< -1.43,  -6.10, -25.35>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #4
atom(<  1.43,  -4.06, -23.19>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #5
atom(<  1.13,  -2.03, -25.71>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(< -1.13,  -0.00, -23.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(< -1.43,  -2.03, -25.35>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #8
atom(<  1.43,  -0.00, -23.19>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #9
atom(< -1.13,  -8.13, -19.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<  1.43,  -8.13, -18.86>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #11
atom(<  1.13,  -6.10, -21.39>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -1.13,  -4.06, -19.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(< -1.43,  -6.10, -21.03>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #14
atom(<  1.43,  -4.06, -18.86>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #15
atom(<  1.13,  -2.03, -21.39>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -1.13,  -0.00, -19.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(< -1.43,  -2.03, -21.03>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #18
atom(<  1.43,  -0.00, -18.86>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #19
atom(<  1.13,  -6.10, -17.06>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -1.43,  -6.10, -16.70>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #21
atom(<  1.13,  -2.03, -17.06>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -1.43,  -2.03, -16.70>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #23
cylinder {< -1.13,  -8.13, -23.55>, <  0.15,  -8.13, -23.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -8.13, -23.19>, <  0.15,  -8.13, -23.37>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -8.13, -23.55>, < -1.28,  -7.11, -24.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -25.35>, < -1.28,  -7.11, -24.45>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -8.13, -23.19>, <  1.28,  -7.11, -22.29>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -21.39>, <  1.28,  -7.11, -22.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -25.71>, < -0.15,  -6.10, -25.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -25.35>, < -0.15,  -6.10, -25.53>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -23.55>, < -1.28,  -5.08, -24.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -25.35>, < -1.28,  -5.08, -24.45>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -23.55>, <  0.15,  -4.06, -23.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -23.19>, <  0.15,  -4.06, -23.37>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -23.55>, < -1.28,  -3.05, -24.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -25.35>, < -1.28,  -3.05, -24.45>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -23.19>, <  1.28,  -5.08, -22.29>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -21.39>, <  1.28,  -5.08, -22.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -23.19>, <  1.28,  -3.05, -22.29>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -21.39>, <  1.28,  -3.05, -22.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -25.71>, < -0.15,  -2.03, -25.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -25.35>, < -0.15,  -2.03, -25.53>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -0.00, -23.55>, < -1.28,  -1.02, -24.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -25.35>, < -1.28,  -1.02, -24.45>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -0.00, -23.55>, <  0.15,  -0.00, -23.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -0.00, -23.19>, <  0.15,  -0.00, -23.37>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -0.00, -23.19>, <  1.28,  -1.02, -22.29>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -21.39>, <  1.28,  -1.02, -22.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -8.13, -19.22>, < -1.28,  -7.11, -20.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -21.03>, < -1.28,  -7.11, -20.13>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -8.13, -19.22>, <  0.15,  -8.13, -19.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -8.13, -18.86>, <  0.15,  -8.13, -19.04>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -8.13, -18.86>, <  1.28,  -7.11, -17.96>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -17.06>, <  1.28,  -7.11, -17.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -21.39>, < -0.15,  -6.10, -21.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -21.03>, < -0.15,  -6.10, -21.21>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -19.22>, < -1.28,  -5.08, -20.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -21.03>, < -1.28,  -5.08, -20.13>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -19.22>, < -1.28,  -3.05, -20.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -21.03>, < -1.28,  -3.05, -20.13>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -4.06, -19.22>, <  0.15,  -4.06, -19.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -18.86>, <  0.15,  -4.06, -19.04>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -18.86>, <  1.28,  -5.08, -17.96>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -17.06>, <  1.28,  -5.08, -17.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -4.06, -18.86>, <  1.28,  -3.05, -17.96>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -17.06>, <  1.28,  -3.05, -17.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -21.39>, < -0.15,  -2.03, -21.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -21.03>, < -0.15,  -2.03, -21.21>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -0.00, -19.22>, < -1.28,  -1.02, -20.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -21.03>, < -1.28,  -1.02, -20.13>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.13,  -0.00, -19.22>, <  0.15,  -0.00, -19.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -0.00, -18.86>, <  0.15,  -0.00, -19.04>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.43,  -0.00, -18.86>, <  1.28,  -1.02, -17.96>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -17.06>, <  1.28,  -1.02, -17.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -6.10, -17.06>, < -0.15,  -6.10, -16.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -6.10, -16.70>, < -0.15,  -6.10, -16.88>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  1.13,  -2.03, -17.06>, < -0.15,  -2.03, -16.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.43,  -2.03, -16.70>, < -0.15,  -2.03, -16.88>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
// no constraints
