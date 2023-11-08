#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -17.97*x up 23.01*y
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

cylinder {<  8.55, -10.96, -26.89>, <  8.55, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.96, -26.89>, <  8.55,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55,  10.96, -26.89>, < -8.55,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.96, -26.89>, < -8.55, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55, -10.96, -26.89>, <  8.55,  10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  8.55, -10.96,   0.00>, <  8.55,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.96,   0.00>, < -8.55,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -8.55, -10.96, -26.89>, < -8.55,  10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  8.55, -10.96, -26.89>, < -8.55, -10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  8.55, -10.96,   0.00>, < -8.55, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.96,   0.00>, < -8.55,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  8.55,  10.96, -26.89>, < -8.55,  10.96, -26.89>, Rcell pigment {Black}}
atom(< -1.07,  -9.13, -24.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<  1.28,  -9.13, -23.92>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(< -1.07,  -5.48, -24.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<  1.28,  -5.48, -23.92>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(< -1.07,  -1.83, -24.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<  1.28,  -1.83, -23.92>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(< -1.07,   1.83, -24.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<  1.28,   1.83, -23.92>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(< -1.07,  -9.13, -20.03>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<  1.28,  -9.13, -19.44>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #9
atom(<  1.07,  -7.30, -22.27>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(< -1.07,  -5.48, -20.03>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(< -1.28,  -7.30, -21.68>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #12
atom(<  1.28,  -5.48, -19.44>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #13
atom(<  1.07,  -3.65, -22.27>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -1.07,  -1.83, -20.03>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(< -1.28,  -3.65, -21.68>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #16
atom(<  1.28,  -1.83, -19.44>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #17
atom(<  1.07,  -0.00, -22.27>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -1.07,   1.83, -20.03>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #19
atom(< -1.28,  -0.00, -21.68>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #20
atom(<  1.28,   1.83, -19.44>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #21
atom(< -1.07,  -9.13, -15.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(<  1.28,  -9.13, -14.95>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(<  1.07,  -7.30, -17.79>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -1.07,  -5.48, -15.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -1.28,  -7.30, -17.20>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(<  1.28,  -5.48, -14.95>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(<  1.07,  -3.65, -17.79>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -1.07,  -1.83, -15.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -1.28,  -3.65, -17.20>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(<  1.28,  -1.83, -14.95>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(<  1.07,  -0.00, -17.79>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(< -1.07,   1.83, -15.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(< -1.28,  -0.00, -17.20>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(<  1.28,   1.83, -14.95>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(<  1.07,  -7.30, -13.31>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -1.28,  -7.30, -12.71>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #37
atom(<  1.07,  -3.65, -13.31>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #38
atom(< -1.28,  -3.65, -12.71>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(<  1.07,  -0.00, -13.31>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(< -1.28,  -0.00, -12.71>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #41
cylinder {< -1.07,  -9.13, -24.51>, <  0.11,  -9.13, -24.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -23.92>, <  0.11,  -9.13, -24.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -23.92>, <  1.17,  -8.22, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -22.27>, <  1.17,  -8.22, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -24.51>, <  0.11,  -5.48, -24.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -23.92>, <  0.11,  -5.48, -24.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -23.92>, <  1.17,  -4.57, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -22.27>, <  1.17,  -4.57, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -23.92>, <  1.17,  -6.39, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -22.27>, <  1.17,  -6.39, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -24.51>, <  0.11,  -1.83, -24.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -23.92>, <  0.11,  -1.83, -24.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -23.92>, <  1.17,  -2.74, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -22.27>, <  1.17,  -2.74, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -23.92>, <  1.17,  -0.91, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -22.27>, <  1.17,  -0.91, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,   1.83, -24.51>, <  0.11,   1.83, -24.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -23.92>, <  0.11,   1.83, -24.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -23.92>, <  1.17,   0.91, -23.10>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -22.27>, <  1.17,   0.91, -23.10>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -9.13, -20.03>, < -1.17,  -8.22, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -21.68>, < -1.17,  -8.22, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -9.13, -20.03>, <  0.11,  -9.13, -19.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -19.44>, <  0.11,  -9.13, -19.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -19.44>, <  1.17,  -8.22, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -17.79>, <  1.17,  -8.22, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -22.27>, < -0.11,  -7.30, -21.97>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -21.68>, < -0.11,  -7.30, -21.97>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -20.03>, < -1.17,  -6.39, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -21.68>, < -1.17,  -6.39, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -20.03>, < -1.17,  -4.57, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -21.68>, < -1.17,  -4.57, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -20.03>, <  0.11,  -5.48, -19.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -19.44>, <  0.11,  -5.48, -19.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -19.44>, <  1.17,  -6.39, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -17.79>, <  1.17,  -6.39, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -19.44>, <  1.17,  -4.57, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -17.79>, <  1.17,  -4.57, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -22.27>, < -0.11,  -3.65, -21.97>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -21.68>, < -0.11,  -3.65, -21.97>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -20.03>, < -1.17,  -2.74, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -21.68>, < -1.17,  -2.74, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -20.03>, < -1.17,  -0.91, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -21.68>, < -1.17,  -0.91, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -20.03>, <  0.11,  -1.83, -19.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -19.44>, <  0.11,  -1.83, -19.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -19.44>, <  1.17,  -2.74, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -17.79>, <  1.17,  -2.74, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -19.44>, <  1.17,  -0.91, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -17.79>, <  1.17,  -0.91, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -22.27>, < -0.11,  -0.00, -21.97>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -21.68>, < -0.11,  -0.00, -21.97>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,   1.83, -20.03>, < -1.17,   0.91, -20.85>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -21.68>, < -1.17,   0.91, -20.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,   1.83, -20.03>, <  0.11,   1.83, -19.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -19.44>, <  0.11,   1.83, -19.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -19.44>, <  1.17,   0.91, -18.61>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -17.79>, <  1.17,   0.91, -18.61>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -9.13, -15.55>, <  0.11,  -9.13, -15.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -14.95>, <  0.11,  -9.13, -15.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -9.13, -15.55>, < -1.17,  -8.22, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -17.20>, < -1.17,  -8.22, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -9.13, -14.95>, <  1.17,  -8.22, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -13.31>, <  1.17,  -8.22, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -17.79>, < -0.11,  -7.30, -17.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -17.20>, < -0.11,  -7.30, -17.49>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -15.55>, < -1.17,  -6.39, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -17.20>, < -1.17,  -6.39, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -15.55>, <  0.11,  -5.48, -15.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -14.95>, <  0.11,  -5.48, -15.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -5.48, -15.55>, < -1.17,  -4.57, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -17.20>, < -1.17,  -4.57, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -14.95>, <  1.17,  -6.39, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -13.31>, <  1.17,  -6.39, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -5.48, -14.95>, <  1.17,  -4.57, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -13.31>, <  1.17,  -4.57, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -17.79>, < -0.11,  -3.65, -17.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -17.20>, < -0.11,  -3.65, -17.49>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -15.55>, < -1.17,  -2.74, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -17.20>, < -1.17,  -2.74, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -15.55>, <  0.11,  -1.83, -15.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -14.95>, <  0.11,  -1.83, -15.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,  -1.83, -15.55>, < -1.17,  -0.91, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -17.20>, < -1.17,  -0.91, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -14.95>, <  1.17,  -2.74, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -13.31>, <  1.17,  -2.74, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.83, -14.95>, <  1.17,  -0.91, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -13.31>, <  1.17,  -0.91, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -17.79>, < -0.11,  -0.00, -17.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -17.20>, < -0.11,  -0.00, -17.49>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,   1.83, -15.55>, < -1.17,   0.91, -16.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -17.20>, < -1.17,   0.91, -16.37>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.07,   1.83, -15.55>, <  0.11,   1.83, -15.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -14.95>, <  0.11,   1.83, -15.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.83, -14.95>, <  1.17,   0.91, -14.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -13.31>, <  1.17,   0.91, -14.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -7.30, -13.31>, < -0.11,  -7.30, -13.01>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -7.30, -12.71>, < -0.11,  -7.30, -13.01>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -3.65, -13.31>, < -0.11,  -3.65, -13.01>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.65, -12.71>, < -0.11,  -3.65, -13.01>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -0.00, -13.31>, < -0.11,  -0.00, -13.01>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -0.00, -12.71>, < -0.11,  -0.00, -13.01>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
