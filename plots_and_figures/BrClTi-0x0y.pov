#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.94*x up 19.28*y
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

cylinder {< -5.07,  -8.38, -18.23>, < 15.21,  -8.38, -18.23>, Rcell pigment {Black}}
cylinder {<-15.21,   9.18, -18.23>, <  5.07,   9.18, -18.23>, Rcell pigment {Black}}
cylinder {<-15.21,   9.18,   0.00>, <  5.07,   9.18,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.38,   0.00>, < 15.21,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.38, -18.23>, <-15.21,   9.18, -18.23>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.38, -18.23>, <  5.07,   9.18, -18.23>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.38,   0.00>, <  5.07,   9.18,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.38,   0.00>, <-15.21,   9.18,   0.00>, Rcell pigment {Black}}
cylinder {< -5.07,  -8.38, -18.23>, < -5.07,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {< 15.21,  -8.38, -18.23>, < 15.21,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {<  5.07,   9.18, -18.23>, <  5.07,   9.18,   0.00>, Rcell pigment {Black}}
cylinder {<-15.21,   9.18, -18.23>, <-15.21,   9.18,   0.00>, Rcell pigment {Black}}
atom(< -5.07,  -8.38,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #0
atom(< -3.38,  -7.40,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #1
atom(< -3.38,  -7.40, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(< -5.07,  -4.48,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #3
atom(< -5.07,  -4.48, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(< -1.69,  -8.38,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #5
atom(< -0.00,  -7.40,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #6
atom(< -0.00,  -7.40, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(< -3.38,  -5.45,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #8
atom(< -1.69,  -4.48,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #9
atom(< -1.69,  -4.48, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< -5.07,  -2.53,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #11
atom(< -3.38,  -1.55,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #12
atom(< -3.38,  -1.55, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(< -5.07,   1.38,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #14
atom(< -5.07,   1.38, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(<  1.69,  -8.38,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #16
atom(<  3.38,  -7.40,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #17
atom(<  3.38,  -7.40, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<  0.00,  -5.45,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #19
atom(<  1.69,  -4.48,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #20
atom(<  1.69,  -4.48, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #21
atom(< -1.69,  -2.53,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #22
atom(<  0.00,  -1.55,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #23
atom(<  0.00,  -1.55, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(< -3.38,   0.40,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #25
atom(< -1.69,   1.38,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #26
atom(< -1.69,   1.38, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #27
atom(<  5.07,  -8.38,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #28
atom(<  6.76,  -7.40,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #29
atom(<  6.76,  -7.40, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #30
atom(<  3.38,  -5.45,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #31
atom(<  5.07,  -4.48,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #32
atom(<  5.07,  -4.48, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #33
atom(<  1.69,  -2.53,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #34
atom(<  3.38,  -1.55,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #35
atom(<  3.38,  -1.55, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #36
atom(<  0.00,   0.40,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #37
atom(<  1.69,   1.38,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #38
atom(<  1.69,   1.38, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #39
atom(<  8.45,  -8.38,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #40
atom(<  6.76,  -5.45,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #41
atom(<  8.45,  -4.48,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #42
atom(<  8.45,  -4.48, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #43
atom(<  5.07,  -2.53,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #44
atom(<  6.76,  -1.55,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #45
atom(<  6.76,  -1.55, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #46
atom(<  3.38,   0.40,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #47
atom(<  5.07,   1.38,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #48
atom(<  5.07,   1.38, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #49
atom(<  8.45,  -2.53,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #50
atom(<  6.76,   0.40,  -9.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #51
atom(<  8.45,   1.38,  -7.42>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #52
atom(<  8.45,   1.38, -10.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #53
cylinder {< -5.07,  -8.38,  -9.14>, < -4.22,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40,  -7.42>, < -4.22,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -8.38,  -9.14>, < -4.22,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40, -10.70>, < -4.22,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -8.38,  -9.14>, < -4.22,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -4.22,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -8.38,  -9.14>, < -3.38,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -3.38,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40,  -7.42>, < -3.38,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -3.38,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40,  -7.42>, < -2.53,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -2.53,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40, -10.70>, < -3.38,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -3.38,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -7.40, -10.70>, < -2.53,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -2.53,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -4.48,  -7.42>, < -4.22,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -4.22,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -4.48,  -7.42>, < -5.07,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -5.07,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -4.48, -10.70>, < -4.22,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -4.22,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -4.48, -10.70>, < -5.07,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -5.07,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -0.84,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40,  -7.42>, < -0.84,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -0.84,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.84,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -2.53,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -2.53,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, < -0.84,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40, -10.70>, < -0.84,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -8.38,  -9.14>, <  0.00,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  0.00,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40,  -7.42>, < -0.00,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.00,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40,  -7.42>, <  0.84,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  0.84,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40, -10.70>, < -0.00,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.00,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.40, -10.70>, <  0.84,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  0.84,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -1.69,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -1.69,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -4.22,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -4.22,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -2.53,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48,  -7.42>, < -2.53,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -2.53,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48, -10.70>, < -2.53,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -5.45,  -9.14>, < -2.53,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -2.53,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48,  -7.42>, < -0.84,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.84,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48,  -7.42>, < -1.69,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -1.69,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48, -10.70>, < -0.84,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.84,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.48, -10.70>, < -1.69,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -1.69,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -4.22,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -4.22,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -4.22,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55, -10.70>, < -4.22,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -4.22,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55,  -7.42>, < -4.22,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,  -2.53,  -9.14>, < -3.38,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -3.38,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55,  -7.42>, < -3.38,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -3.38,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55,  -7.42>, < -2.53,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -2.53,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55, -10.70>, < -3.38,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -3.38,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,  -1.55, -10.70>, < -2.53,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -2.53,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,   1.38,  -7.42>, < -4.22,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -4.22,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -5.07,   1.38, -10.70>, < -4.22,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -4.22,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  0.84,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, <  0.84,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  3.38,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  3.38,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  2.53,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40, -10.70>, <  2.53,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  2.53,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40,  -7.42>, <  2.53,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -8.38,  -9.14>, <  2.53,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  2.53,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40,  -7.42>, <  4.22,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  4.22,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40,  -7.42>, <  3.38,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  3.38,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40, -10.70>, <  4.22,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  4.22,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -7.40, -10.70>, <  3.38,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  3.38,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, < -0.84,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -0.84,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, <  0.84,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48, -10.70>, <  0.84,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, <  0.84,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48,  -7.42>, <  0.84,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, <  1.69,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  1.69,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.45,  -9.14>, <  0.84,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  0.84,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48,  -7.42>, <  2.53,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  2.53,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48,  -7.42>, <  1.69,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  1.69,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48, -10.70>, <  2.53,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  2.53,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -4.48, -10.70>, <  1.69,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  1.69,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -2.53,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -2.53,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -0.84,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55,  -7.42>, < -0.84,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -0.84,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55, -10.70>, < -0.84,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, < -0.84,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, < -0.84,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -2.53,  -9.14>, <  0.00,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  0.00,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55,  -7.42>, <  0.00,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  0.00,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55,  -7.42>, <  0.84,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  0.84,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55, -10.70>, <  0.00,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  0.00,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.55, -10.70>, <  0.84,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  0.84,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -2.53,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   1.38,  -7.42>, < -2.53,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -2.53,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   1.38, -10.70>, < -2.53,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -3.38,   0.40,  -9.14>, < -1.69,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, < -1.69,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   1.38,  -7.42>, < -0.84,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, < -0.84,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,   1.38, -10.70>, < -0.84,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, < -0.84,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  5.91,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40, -10.70>, <  5.91,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  6.76,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -8.38,  -9.14>, <  6.76,  -8.38,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  5.91,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40,  -7.42>, <  5.91,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  5.91,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  5.91,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -8.38,  -9.14>, <  4.22,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  4.22,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40,  -7.42>, <  7.60,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -8.38,  -9.14>, <  7.60,  -7.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40,  -7.42>, <  6.76,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  6.76,  -6.43,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40, -10.70>, <  7.60,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -8.38,  -9.14>, <  7.60,  -7.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -7.40, -10.70>, <  6.76,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  6.76,  -6.43,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  4.22,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48, -10.70>, <  4.22,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  5.07,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  5.07,  -5.45,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  4.22,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48,  -7.42>, <  4.22,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  2.53,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  2.53,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -5.45,  -9.14>, <  4.22,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  4.22,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48,  -7.42>, <  5.91,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  5.91,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48,  -7.42>, <  5.07,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.07,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48, -10.70>, <  5.91,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  5.91,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -4.48, -10.70>, <  5.07,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.07,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  0.84,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  0.84,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  3.38,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  3.38,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  2.53,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55,  -7.42>, <  2.53,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  2.53,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55, -10.70>, <  2.53,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,  -2.53,  -9.14>, <  2.53,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  2.53,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55,  -7.42>, <  4.22,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  4.22,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55,  -7.42>, <  3.38,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  3.38,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55, -10.70>, <  4.22,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  4.22,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.55, -10.70>, <  3.38,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  3.38,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  1.69,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  1.69,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  0.84,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   1.38,  -7.42>, <  0.84,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.40,  -9.14>, <  0.84,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   1.38, -10.70>, <  0.84,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   1.38,  -7.42>, <  2.53,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  2.53,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.69,   1.38, -10.70>, <  2.53,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  2.53,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -8.38,  -9.14>, <  7.60,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  7.60,  -6.92,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  7.60,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.48, -10.70>, <  7.60,  -4.97,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  7.60,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.48,  -7.42>, <  7.60,  -4.97,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  5.91,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.91,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -5.45,  -9.14>, <  7.60,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  7.60,  -3.99,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.48,  -7.42>, <  8.45,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  8.45,  -3.50,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -4.48, -10.70>, <  8.45,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  8.45,  -3.50,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  6.76,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  6.76,  -2.53,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.91,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  5.91,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.91,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55,  -7.42>, <  5.91,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  5.91,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55, -10.70>, <  5.91,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,  -2.53,  -9.14>, <  4.22,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  4.22,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55,  -7.42>, <  7.60,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  7.60,  -2.04,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55,  -7.42>, <  6.76,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  6.76,  -0.58,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55, -10.70>, <  7.60,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  7.60,  -2.04,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,  -1.55, -10.70>, <  6.76,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  6.76,  -0.58,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  5.07,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  5.07,   0.40,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  4.22,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   1.38, -10.70>, <  4.22,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.40,  -9.14>, <  4.22,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   1.38,  -7.42>, <  4.22,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   1.38,  -7.42>, <  5.91,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  5.91,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.07,   1.38, -10.70>, <  5.91,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  5.91,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,  -2.53,  -9.14>, <  7.60,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  7.60,  -1.06,  -9.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  7.60,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,   1.38,  -7.42>, <  7.60,   0.89,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  6.76,   0.40,  -9.14>, <  7.60,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.45,   1.38, -10.70>, <  7.60,   0.89,  -9.92>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
