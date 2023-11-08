#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.94*x up 18.44*y
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

cylinder {< -5.07,  -8.78, -18.23>, < 15.21,  -8.78, -18.23>, Rcell pigment {Black}}
cylinder {<-15.21,   8.78, -18.23>, <  5.07,   8.78, -18.23>, Rcell pigment {Black}}
cylinder {<-15.21,   8.78,   0.00>, <  5.07,   8.78,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.78,   0.00>, < 15.21,  -8.78,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.78, -18.23>, <-15.21,   8.78, -18.23>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.78, -18.23>, <  5.07,   8.78, -18.23>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.78,   0.00>, <  5.07,   8.78,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.78,   0.00>, <-15.21,   8.78,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.78, -18.23>, < -5.07,  -8.78,   0.00>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.78, -18.23>, < 15.21,  -8.78,   0.00>, Rcell pigment {Black}}
cylinder {<  5.07,   8.78, -18.23>, <  5.07,   8.78,   0.00>, Rcell pigment {Black}}
cylinder {<-15.21,   8.78, -18.23>, <-15.21,   8.78,   0.00>, Rcell pigment {Black}}
atom(< -3.38,  -5.85,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #0
atom(< -1.69,  -4.88,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #1
atom(< -1.69,  -4.88, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(< -3.38,  -1.95,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #3
atom(< -3.38,  -1.95, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(<  0.00,  -5.85,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #5
atom(<  1.69,  -4.88,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #6
atom(<  1.69,  -4.88, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(< -1.69,  -2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #8
atom(<  0.00,  -1.95,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #9
atom(<  0.00,  -1.95, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< -3.38,   0.00,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #11
atom(< -1.69,   0.98,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #12
atom(< -1.69,   0.98, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(< -3.38,   3.90,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #14
atom(< -3.38,   3.90, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(<  3.38,  -5.85,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #16
atom(<  5.07,  -4.88,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #17
atom(<  5.07,  -4.88, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<  1.69,  -2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #19
atom(<  3.38,  -1.95,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #20
atom(<  3.38,  -1.95, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #21
atom(<  0.00,   0.00,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #22
atom(<  1.69,   0.98,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #23
atom(<  1.69,   0.98, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(< -1.69,   2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #25
atom(<  0.00,   3.90,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #26
atom(<  0.00,   3.90, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #27
atom(<  6.76,  -5.85,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #28
atom(<  8.45,  -4.88,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #29
atom(<  8.45,  -4.88, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #30
atom(<  5.07,  -2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #31
atom(<  6.76,  -1.95,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #32
atom(<  6.76,  -1.95, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #33
atom(<  3.38,   0.00,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #34
atom(<  5.07,   0.98,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #35
atom(<  5.07,   0.98, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #36
atom(<  1.69,   2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #37
atom(<  3.38,   3.90,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #38
atom(<  3.38,   3.90, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #39
atom(<  8.45,  -2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #40
atom(<  6.76,   0.00,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #41
atom(<  8.45,   0.98,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #42
atom(<  8.45,   0.98, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #43
atom(<  5.07,   2.93,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #44
atom(<  6.76,   3.90,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #45
atom(<  6.76,   3.90, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #46
cylinder {< -3.38,  -5.85,  -9.14>, < -2.53,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88,  -7.42>, < -2.53,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.85,  -9.14>, < -1.69,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, < -1.69,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.85,  -9.14>, < -2.53,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -2.53,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.85,  -9.14>, < -2.53,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88, -10.70>, < -2.53,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88,  -7.42>, < -0.84,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, < -0.84,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88,  -7.42>, < -1.69,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -1.69,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88, -10.70>, < -0.84,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, < -0.84,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.88, -10.70>, < -1.69,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -1.69,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.95,  -7.42>, < -2.53,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -2.53,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.95,  -7.42>, < -3.38,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -3.38,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.95, -10.70>, < -2.53,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -2.53,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.95, -10.70>, < -3.38,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -3.38,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, <  0.84,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  0.84,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, < -0.84,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -0.84,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, <  0.84,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88,  -7.42>, <  0.84,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, <  0.84,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88, -10.70>, <  0.84,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.85,  -9.14>, <  1.69,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  1.69,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88,  -7.42>, <  1.69,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  1.69,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88,  -7.42>, <  2.53,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  2.53,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88, -10.70>, <  1.69,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  1.69,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.88, -10.70>, <  2.53,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  2.53,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, <  0.00,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  0.00,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -0.84,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95,  -7.42>, < -0.84,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -0.84,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95, -10.70>, < -0.84,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -2.53,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -2.53,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.93,  -9.14>, < -0.84,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, < -0.84,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95,  -7.42>, <  0.84,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  0.84,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95,  -7.42>, <  0.00,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.00,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95, -10.70>, <  0.84,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  0.84,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.95, -10.70>, <  0.00,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.00,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -2.53,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98, -10.70>, < -2.53,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -2.53,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -2.53,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -2.53,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98,  -7.42>, < -2.53,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.00,  -9.14>, < -1.69,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, < -1.69,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98,  -7.42>, < -1.69,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -1.69,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98,  -7.42>, < -0.84,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, < -0.84,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98, -10.70>, < -1.69,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -1.69,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   0.98, -10.70>, < -0.84,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, < -0.84,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   3.90,  -7.42>, < -2.53,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -2.53,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   3.90, -10.70>, < -2.53,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -2.53,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  2.53,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  2.53,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  5.07,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  5.07,  -5.85,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  4.22,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88,  -7.42>, <  4.22,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  4.22,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88, -10.70>, <  4.22,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.85,  -9.14>, <  4.22,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  4.22,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88,  -7.42>, <  5.91,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  5.91,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88,  -7.42>, <  5.07,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.07,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88, -10.70>, <  5.91,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  5.91,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.88, -10.70>, <  5.07,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.07,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  0.84,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.84,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  2.53,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95, -10.70>, <  2.53,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  2.53,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95,  -7.42>, <  2.53,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  3.38,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  3.38,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.93,  -9.14>, <  2.53,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  2.53,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95,  -7.42>, <  4.22,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  4.22,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95,  -7.42>, <  3.38,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  3.38,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95, -10.70>, <  4.22,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  4.22,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.95, -10.70>, <  3.38,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  3.38,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, < -0.84,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -0.84,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.84,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98,  -7.42>, <  0.84,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.84,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98, -10.70>, <  0.84,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  1.69,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  1.69,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.00,  -9.14>, <  0.84,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  0.84,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98,  -7.42>, <  2.53,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  2.53,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98,  -7.42>, <  1.69,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  1.69,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98, -10.70>, <  2.53,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  2.53,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   0.98, -10.70>, <  1.69,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  1.69,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -0.84,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   3.90, -10.70>, < -0.84,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, < -0.84,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   3.90,  -7.42>, < -0.84,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   2.93,  -9.14>, <  0.00,   2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  0.00,   2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   3.90,  -7.42>, <  0.84,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  0.84,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   3.90, -10.70>, <  0.84,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  0.84,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  7.60,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  7.60,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  7.60,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.88, -10.70>, <  7.60,  -5.37,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  5.91,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.91,  -4.39,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.85,  -9.14>, <  7.60,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.88,  -7.42>, <  7.60,  -5.37,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.88,  -7.42>, <  8.45,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  8.45,  -3.90,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.88, -10.70>, <  8.45,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  8.45,  -3.90,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  6.76,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  6.76,  -2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.91,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95,  -7.42>, <  5.91,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.91,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95, -10.70>, <  5.91,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  4.22,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  4.22,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.93,  -9.14>, <  5.91,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  5.91,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95,  -7.42>, <  7.60,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  7.60,  -2.44,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95,  -7.42>, <  6.76,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  6.76,  -0.98,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95, -10.70>, <  7.60,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  7.60,  -2.44,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.95, -10.70>, <  6.76,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  6.76,  -0.98,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  5.07,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  5.07,   0.00,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  4.22,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98,  -7.42>, <  4.22,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  4.22,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98, -10.70>, <  4.22,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  2.53,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  2.53,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.00,  -9.14>, <  4.22,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  4.22,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98,  -7.42>, <  5.91,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  5.91,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98,  -7.42>, <  5.07,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  5.07,   1.95,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98, -10.70>, <  5.91,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  5.91,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   0.98, -10.70>, <  5.07,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  5.07,   1.95,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  2.53,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   3.90, -10.70>, <  2.53,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  2.53,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   3.90,  -7.42>, <  2.53,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   2.93,  -9.14>, <  3.38,   2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  3.38,   2.93,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   3.90,  -7.42>, <  4.22,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  4.22,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   3.90, -10.70>, <  4.22,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  4.22,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.93,  -9.14>, <  7.60,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  7.60,  -1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  7.60,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,   0.98,  -7.42>, <  7.60,   0.49,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  7.60,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,   0.98, -10.70>, <  7.60,   0.49,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.00,  -9.14>, <  5.91,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  5.91,   1.46,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  5.91,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   3.90,  -7.42>, <  5.91,   3.41,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   2.93,  -9.14>, <  5.91,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   3.90, -10.70>, <  5.91,   3.41,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
