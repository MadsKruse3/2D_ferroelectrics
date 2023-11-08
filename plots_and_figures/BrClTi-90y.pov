#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -19.14*x up 19.28*y
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

cylinder {<  9.12,  -8.38, -20.28>, <  9.12,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {<  9.12,   9.18, -30.41>, <  9.12,   9.18, -10.14>, Rcell pigment {Black}}
cylinder {< -9.12,   9.18, -30.41>, < -9.12,   9.18, -10.14>, Rcell pigment {Black}}
cylinder {< -9.12,  -8.38, -20.28>, < -9.12,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {<  9.12,  -8.38, -20.28>, <  9.12,   9.18, -30.41>, Rcell pigment {Black}}
cylinder {<  9.12,  -8.38,   0.00>, <  9.12,   9.18, -10.14>, Rcell pigment {Black}}
cylinder {< -9.12,  -8.38,   0.00>, < -9.12,   9.18, -10.14>, Rcell pigment {Black}}
cylinder {< -9.12,  -8.38, -20.28>, < -9.12,   9.18, -30.41>, Rcell pigment {Black}}
cylinder {<  9.12,  -8.38, -20.28>, < -9.12,  -8.38, -20.28>, Rcell pigment {Black}}
cylinder {<  9.12,  -8.38,   0.00>, < -9.12,  -8.38,   0.00>, Rcell pigment {Black}}
cylinder {<  9.12,   9.18, -10.14>, < -9.12,   9.18, -10.14>, Rcell pigment {Black}}
cylinder {<  9.12,   9.18, -30.41>, < -9.12,   9.18, -30.41>, Rcell pigment {Black}}
atom(<  0.03,  -8.38, -20.28>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #0
atom(< -1.70,  -7.40, -18.59>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #1
atom(<  1.58,  -7.40, -18.59>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(< -1.70,  -4.48, -20.28>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #3
atom(<  1.58,  -4.48, -20.28>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(<  0.03,  -8.38, -16.90>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #5
atom(< -1.70,  -7.40, -15.21>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #6
atom(<  1.58,  -7.40, -15.21>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(<  0.03,  -5.45, -18.59>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #8
atom(< -1.70,  -4.48, -16.90>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #9
atom(<  1.58,  -4.48, -16.90>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(<  0.03,  -2.53, -20.28>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #11
atom(< -1.70,  -1.55, -18.59>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #12
atom(<  1.58,  -1.55, -18.59>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(< -1.70,   1.38, -20.28>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #14
atom(<  1.58,   1.38, -20.28>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(<  0.03,  -8.38, -13.52>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #16
atom(< -1.70,  -7.40, -11.83>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #17
atom(<  1.58,  -7.40, -11.83>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<  0.03,  -5.45, -15.21>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #19
atom(< -1.70,  -4.48, -13.52>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #20
atom(<  1.58,  -4.48, -13.52>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #21
atom(<  0.03,  -2.53, -16.90>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #22
atom(< -1.70,  -1.55, -15.21>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #23
atom(<  1.58,  -1.55, -15.21>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(<  0.03,   0.40, -18.59>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #25
atom(< -1.70,   1.38, -16.90>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #26
atom(<  1.58,   1.38, -16.90>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #27
atom(<  0.03,  -8.38, -10.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #28
atom(< -1.70,  -7.40,  -8.45>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #29
atom(<  1.58,  -7.40,  -8.45>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #30
atom(<  0.03,  -5.45, -11.83>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #31
atom(< -1.70,  -4.48, -10.14>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #32
atom(<  1.58,  -4.48, -10.14>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #33
atom(<  0.03,  -2.53, -13.52>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #34
atom(< -1.70,  -1.55, -11.83>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #35
atom(<  1.58,  -1.55, -11.83>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #36
atom(<  0.03,   0.40, -15.21>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #37
atom(< -1.70,   1.38, -13.52>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #38
atom(<  1.58,   1.38, -13.52>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #39
atom(<  0.03,  -8.38,  -6.76>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #40
atom(<  0.03,  -5.45,  -8.45>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #41
atom(< -1.70,  -4.48,  -6.76>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #42
atom(<  1.58,  -4.48,  -6.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #43
atom(<  0.03,  -2.53, -10.14>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #44
atom(< -1.70,  -1.55,  -8.45>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #45
atom(<  1.58,  -1.55,  -8.45>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #46
atom(<  0.03,   0.40, -11.83>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #47
atom(< -1.70,   1.38, -10.14>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #48
atom(<  1.58,   1.38, -10.14>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #49
atom(<  0.03,  -2.53,  -6.76>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #50
atom(<  0.03,   0.40,  -8.45>, 0.80, rgb <0.75, 0.76, 0.78>, 0.0, ase3) // #51
atom(< -1.70,   1.38,  -6.76>, 0.60, rgb <0.65, 0.16, 0.16>, 0.0, ase3) // #52
atom(<  1.58,   1.38,  -6.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #53
cylinder {<  0.03,  -8.38, -20.28>, < -0.83,  -7.89, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -18.59>, < -0.83,  -7.89, -19.43>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -20.28>, <  0.80,  -7.89, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -18.59>, <  0.80,  -7.89, -19.43>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -20.28>, <  0.03,  -6.92, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.03,  -6.92, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -20.28>, <  0.03,  -8.38, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.03,  -8.38, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -18.59>, < -0.83,  -6.43, -18.59>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, < -0.83,  -6.43, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -18.59>, < -0.83,  -7.89, -17.74>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, < -0.83,  -7.89, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -18.59>, <  0.80,  -6.43, -18.59>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.80,  -6.43, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -18.59>, <  0.80,  -7.89, -17.74>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.80,  -7.89, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -20.28>, < -0.83,  -4.97, -19.43>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, < -0.83,  -4.97, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -20.28>, < -0.83,  -3.50, -20.28>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, < -0.83,  -3.50, -20.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -20.28>, <  0.80,  -4.97, -19.43>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.80,  -4.97, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -20.28>, <  0.80,  -3.50, -20.28>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, <  0.80,  -3.50, -20.28>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, < -0.83,  -7.89, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -15.21>, < -0.83,  -7.89, -16.05>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.03,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.03,  -6.92, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.03,  -6.92, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.80,  -7.89, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -15.21>, <  0.80,  -7.89, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -16.90>, <  0.03,  -8.38, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.03,  -8.38, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -15.21>, < -0.83,  -6.43, -15.21>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, < -0.83,  -6.43, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -15.21>, < -0.83,  -7.89, -14.36>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, < -0.83,  -7.89, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -15.21>, <  0.80,  -6.43, -15.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.80,  -6.43, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -15.21>, <  0.80,  -7.89, -14.36>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.80,  -7.89, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.03,  -5.45, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -5.45, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.03,  -3.99, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, <  0.03,  -3.99, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, < -0.83,  -4.97, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -16.90>, < -0.83,  -4.97, -17.74>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.80,  -4.97, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -16.90>, <  0.80,  -4.97, -17.74>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -18.59>, <  0.03,  -3.99, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -3.99, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -16.90>, < -0.83,  -4.97, -16.05>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, < -0.83,  -4.97, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -16.90>, < -0.83,  -3.50, -16.90>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, < -0.83,  -3.50, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -16.90>, <  0.80,  -4.97, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.80,  -4.97, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -16.90>, <  0.80,  -3.50, -16.90>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.80,  -3.50, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, <  0.03,  -1.06, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.03,  -1.06, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, <  0.80,  -2.04, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -18.59>, <  0.80,  -2.04, -19.43>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, < -0.83,  -2.04, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -18.59>, < -0.83,  -2.04, -19.43>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -20.28>, <  0.03,  -2.53, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -2.53, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -18.59>, < -0.83,  -0.58, -18.59>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, < -0.83,  -0.58, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -18.59>, < -0.83,  -2.04, -17.74>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, < -0.83,  -2.04, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -18.59>, <  0.80,  -0.58, -18.59>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.80,  -0.58, -18.59>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -18.59>, <  0.80,  -2.04, -17.74>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.80,  -2.04, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -20.28>, < -0.83,   0.89, -19.43>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, < -0.83,   0.89, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -20.28>, <  0.80,   0.89, -19.43>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.80,   0.89, -19.43>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.03,  -6.92, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -6.92, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.03,  -8.38, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.03,  -8.38, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.80,  -7.89, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -11.83>, <  0.80,  -7.89, -12.67>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, < -0.83,  -7.89, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -11.83>, < -0.83,  -7.89, -12.67>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -13.52>, <  0.03,  -6.92, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -6.92, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -11.83>, < -0.83,  -7.89, -10.98>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, < -0.83,  -7.89, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40, -11.83>, < -0.83,  -6.43, -11.83>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, < -0.83,  -6.43, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -11.83>, <  0.80,  -7.89, -10.98>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.80,  -7.89, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40, -11.83>, <  0.80,  -6.43, -11.83>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.80,  -6.43, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -3.99, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -3.99, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.80,  -4.97, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -13.52>, <  0.80,  -4.97, -14.36>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, < -0.83,  -4.97, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -13.52>, < -0.83,  -4.97, -14.36>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -5.45, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -5.45, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -15.21>, <  0.03,  -3.99, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -3.99, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -13.52>, < -0.83,  -4.97, -12.67>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, < -0.83,  -4.97, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -13.52>, < -0.83,  -3.50, -13.52>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, < -0.83,  -3.50, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -13.52>, <  0.80,  -4.97, -12.67>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.80,  -4.97, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -13.52>, <  0.80,  -3.50, -13.52>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.80,  -3.50, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -1.06, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.03,  -1.06, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, < -0.83,  -2.04, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -15.21>, < -0.83,  -2.04, -16.05>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.80,  -2.04, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -15.21>, <  0.80,  -2.04, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -1.06, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.03,  -1.06, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -16.90>, <  0.03,  -2.53, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -2.53, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -15.21>, < -0.83,  -0.58, -15.21>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, < -0.83,  -0.58, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -15.21>, < -0.83,  -2.04, -14.36>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, < -0.83,  -2.04, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -15.21>, <  0.80,  -0.58, -15.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.80,  -0.58, -15.21>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -15.21>, <  0.80,  -2.04, -14.36>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.80,  -2.04, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, < -0.83,   0.89, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -16.90>, < -0.83,   0.89, -17.74>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.80,   0.89, -17.74>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -16.90>, <  0.80,   0.89, -17.74>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -18.59>, <  0.03,   0.40, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.03,   0.40, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -16.90>, < -0.83,   0.89, -16.05>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, < -0.83,   0.89, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -16.90>, <  0.80,   0.89, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.80,   0.89, -16.05>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.80,  -7.89,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40,  -8.45>, <  0.80,  -7.89,  -9.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.03,  -8.38,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38,  -6.76>, <  0.03,  -8.38,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, < -0.83,  -7.89,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40,  -8.45>, < -0.83,  -7.89,  -9.29>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.03,  -6.92,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.03,  -6.92,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38, -10.14>, <  0.03,  -6.92, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -6.92, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40,  -8.45>, < -0.83,  -7.89,  -7.60>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38,  -6.76>, < -0.83,  -7.89,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.40,  -8.45>, < -0.83,  -6.43,  -8.45>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, < -0.83,  -6.43,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40,  -8.45>, <  0.80,  -7.89,  -7.60>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38,  -6.76>, <  0.80,  -7.89,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -7.40,  -8.45>, <  0.80,  -6.43,  -8.45>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.80,  -6.43,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.80,  -4.97, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -10.14>, <  0.80,  -4.97, -10.98>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -5.45, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.03,  -5.45, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, < -0.83,  -4.97, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -10.14>, < -0.83,  -4.97, -10.98>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -3.99, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -3.99, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45, -11.83>, <  0.03,  -3.99, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -3.99, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -10.14>, < -0.83,  -4.97,  -9.29>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, < -0.83,  -4.97,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48, -10.14>, < -0.83,  -3.50, -10.14>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, < -0.83,  -3.50, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -10.14>, <  0.80,  -4.97,  -9.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.80,  -4.97,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48, -10.14>, <  0.80,  -3.50, -10.14>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.80,  -3.50, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -1.06, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.03,  -1.06, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -2.53, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -2.53, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, < -0.83,  -2.04, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -11.83>, < -0.83,  -2.04, -12.67>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.80,  -2.04, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -11.83>, <  0.80,  -2.04, -12.67>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -13.52>, <  0.03,  -1.06, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.03,  -1.06, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -11.83>, < -0.83,  -2.04, -10.98>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, < -0.83,  -2.04, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55, -11.83>, < -0.83,  -0.58, -11.83>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, < -0.83,  -0.58, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -11.83>, <  0.80,  -2.04, -10.98>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.80,  -2.04, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55, -11.83>, <  0.80,  -0.58, -11.83>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.80,  -0.58, -11.83>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.03,   0.40, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.03,   0.40, -13.52>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, < -0.83,   0.89, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -13.52>, < -0.83,   0.89, -14.36>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -15.21>, <  0.80,   0.89, -14.36>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -13.52>, <  0.80,   0.89, -14.36>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -13.52>, < -0.83,   0.89, -12.67>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, < -0.83,   0.89, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -13.52>, <  0.80,   0.89, -12.67>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.80,   0.89, -12.67>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -8.38,  -6.76>, <  0.03,  -6.92,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.03,  -6.92,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.80,  -4.97,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48,  -6.76>, <  0.80,  -4.97,  -7.60>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, < -0.83,  -4.97,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48,  -6.76>, < -0.83,  -4.97,  -7.60>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.03,  -3.99,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -3.99,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -5.45,  -8.45>, <  0.03,  -3.99,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, <  0.03,  -3.99,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.48,  -6.76>, < -0.83,  -3.50,  -6.76>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, < -0.83,  -3.50,  -6.76>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -4.48,  -6.76>, <  0.80,  -3.50,  -6.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, <  0.80,  -3.50,  -6.76>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -2.53,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, <  0.03,  -2.53,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -1.06,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.03,  -1.06,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, < -0.83,  -2.04,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55,  -8.45>, < -0.83,  -2.04,  -9.29>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.80,  -2.04,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55,  -8.45>, <  0.80,  -2.04,  -9.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53, -10.14>, <  0.03,  -1.06, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.03,  -1.06, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55,  -8.45>, < -0.83,  -2.04,  -7.60>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, < -0.83,  -2.04,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.55,  -8.45>, < -0.83,  -0.58,  -8.45>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, < -0.83,  -0.58,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55,  -8.45>, <  0.80,  -2.04,  -7.60>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, <  0.80,  -2.04,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.55,  -8.45>, <  0.80,  -0.58,  -8.45>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.80,  -0.58,  -8.45>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.03,   0.40, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.03,   0.40, -10.14>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, <  0.80,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -10.14>, <  0.80,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40, -11.83>, < -0.83,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -10.14>, < -0.83,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38, -10.14>, < -0.83,   0.89,  -9.29>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, < -0.83,   0.89,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38, -10.14>, <  0.80,   0.89,  -9.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.80,   0.89,  -9.29>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,  -2.53,  -6.76>, <  0.03,  -1.06,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.03,  -1.06,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, < -0.83,   0.89,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.38,  -6.76>, < -0.83,   0.89,  -7.60>, Rbond texture{pigment {color rgb <0.65, 0.16, 0.16> transmit 0.0} finish{ase3}}}
cylinder {<  0.03,   0.40,  -8.45>, <  0.80,   0.89,  -7.60>, Rbond texture{pigment {color rgb <0.75, 0.76, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,   1.38,  -6.76>, <  0.80,   0.89,  -7.60>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
