#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -19.00*x up 34.04*y
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

cylinder {<  9.05, -16.21, -37.49>, <  9.05, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {<  9.05,  16.21, -37.49>, <  9.05,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {< -9.05,  16.21, -37.49>, < -9.05,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {< -9.05, -16.21, -37.49>, < -9.05, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {<  9.05, -16.21, -37.49>, <  9.05,  16.21, -37.49>, Rcell pigment {Black}}
cylinder {<  9.05, -16.21,   0.00>, <  9.05,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {< -9.05, -16.21,   0.00>, < -9.05,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {< -9.05, -16.21, -37.49>, < -9.05,  16.21, -37.49>, Rcell pigment {Black}}
cylinder {<  9.05, -16.21, -37.49>, < -9.05, -16.21, -37.49>, Rcell pigment {Black}}
cylinder {<  9.05, -16.21,   0.00>, < -9.05, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {<  9.05,  16.21,   0.00>, < -9.05,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {<  9.05,  16.21, -37.49>, < -9.05,  16.21, -37.49>, Rcell pigment {Black}}
atom(< -0.00, -13.51, -35.92>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #0
atom(< -0.00, -13.51, -32.80>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #1
atom(< -1.49, -11.64, -35.92>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<  1.49, -11.64, -35.92>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #3
atom(<  1.55, -14.46, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(< -1.49, -11.64, -32.80>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(< -1.55, -14.46, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<  1.49, -11.64, -32.80>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(< -0.00, -10.79, -34.36>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #8
atom(< -0.00,  -8.11, -35.92>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #9
atom(< -0.00,  -8.11, -32.80>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #10
atom(< -1.49,  -6.24, -35.92>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<  1.49,  -6.24, -35.92>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<  1.55,  -9.06, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(< -1.49,  -6.24, -32.80>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -1.55,  -9.06, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(<  1.49,  -6.24, -32.80>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -0.00,  -5.39, -34.36>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #17
atom(< -0.00,  -2.70, -35.92>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #18
atom(< -0.00,  -2.70, -32.80>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #19
atom(<  1.55,  -3.65, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -1.55,  -3.65, -34.36>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(< -0.00, -13.51, -29.67>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #22
atom(< -0.00, -13.51, -26.55>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #23
atom(<  1.55, -14.46, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -1.49, -11.64, -29.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -1.55, -14.46, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(<  1.49, -11.64, -29.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #27
atom(<  1.55, -14.46, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -1.49, -11.64, -26.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -1.55, -14.46, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
atom(<  1.49, -11.64, -26.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #31
atom(< -0.00, -10.79, -31.24>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #32
atom(< -0.00, -10.79, -28.11>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #33
atom(< -0.00,  -8.11, -29.67>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #34
atom(< -0.00,  -8.11, -26.55>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #35
atom(<  1.55,  -9.06, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -1.49,  -6.24, -29.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(< -1.55,  -9.06, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #38
atom(<  1.49,  -6.24, -29.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #39
atom(<  1.55,  -9.06, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(< -1.49,  -6.24, -26.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #41
atom(< -1.55,  -9.06, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #42
atom(<  1.49,  -6.24, -26.55>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #43
atom(< -0.00,  -5.39, -31.24>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #44
atom(< -0.00,  -5.39, -28.11>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #45
atom(< -0.00,  -2.70, -29.67>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #46
atom(< -0.00,  -2.70, -26.55>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #47
atom(<  1.55,  -3.65, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #48
atom(< -1.55,  -3.65, -31.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #49
atom(<  1.55,  -3.65, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #50
atom(< -1.55,  -3.65, -28.11>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #51
atom(<  1.55, -14.46, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #52
atom(< -1.55, -14.46, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #53
atom(< -0.00, -10.79, -24.99>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #54
atom(<  1.55,  -9.06, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #55
atom(< -1.55,  -9.06, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #56
atom(< -0.00,  -5.39, -24.99>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #57
atom(<  1.55,  -3.65, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #58
atom(< -1.55,  -3.65, -24.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #59
cylinder {< -0.00, -13.51, -35.92>, < -0.75, -12.58, -35.92>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -35.92>, < -0.75, -12.58, -35.92>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -35.92>, <  0.75, -12.58, -35.92>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -35.92>, <  0.75, -12.58, -35.92>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -35.92>, < -0.77, -13.99, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -34.36>, < -0.77, -13.99, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -35.92>, <  0.77, -13.99, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -34.36>, <  0.77, -13.99, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -35.92>, < -0.00, -13.51, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.00, -13.51, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -35.92>, < -0.00, -12.15, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.00, -12.15, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.77, -13.99, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -34.36>, < -0.77, -13.99, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, <  0.77, -13.99, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -34.36>, <  0.77, -13.99, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, <  0.77, -13.99, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -31.24>, <  0.77, -13.99, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.00, -12.15, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.00, -12.15, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.75, -12.58, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -32.80>, < -0.75, -12.58, -32.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.77, -13.99, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -31.24>, < -0.77, -13.99, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, <  0.75, -12.58, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -32.80>, <  0.75, -12.58, -32.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.00, -12.15, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.00, -12.15, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -32.80>, < -0.00, -13.51, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.00, -13.51, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -35.92>, < -0.75, -11.22, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.75, -11.22, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -35.92>, <  0.75, -11.22, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, <  0.75, -11.22, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -32.80>, < -0.75, -11.22, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.75, -11.22, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -32.80>, < -0.75, -11.22, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.75, -11.22, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -32.80>, <  0.75, -11.22, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, <  0.75, -11.22, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -32.80>, <  0.75, -11.22, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, <  0.75, -11.22, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.77,  -9.93, -34.36>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -34.36>, < -0.77,  -9.93, -34.36>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, <  0.77,  -9.93, -34.36>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -34.36>, <  0.77,  -9.93, -34.36>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.00,  -9.45, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -9.45, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -34.36>, < -0.00,  -9.45, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, < -0.00,  -9.45, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, < -0.77,  -8.58, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -34.36>, < -0.77,  -8.58, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, <  0.77,  -8.58, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -34.36>, <  0.77,  -8.58, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, < -0.75,  -7.17, -35.92>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -35.92>, < -0.75,  -7.17, -35.92>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, < -0.00,  -8.11, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -8.11, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, <  0.75,  -7.17, -35.92>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -35.92>, <  0.75,  -7.17, -35.92>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -35.92>, < -0.00,  -6.75, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.00,  -6.75, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.77,  -8.58, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -34.36>, < -0.77,  -8.58, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, <  0.77,  -8.58, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -34.36>, <  0.77,  -8.58, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.77,  -8.58, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -31.24>, < -0.77,  -8.58, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -9.45, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.00,  -9.45, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, <  0.77,  -8.58, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -31.24>, <  0.77,  -8.58, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.75,  -7.17, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -32.80>, < -0.75,  -7.17, -32.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, <  0.75,  -7.17, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -32.80>, <  0.75,  -7.17, -32.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -6.75, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.00,  -6.75, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -6.75, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.00,  -6.75, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -32.80>, < -0.00,  -8.11, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -8.11, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -35.92>, < -0.75,  -5.82, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.75,  -5.82, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -35.92>, <  0.75,  -5.82, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, <  0.75,  -5.82, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -32.80>, < -0.75,  -5.82, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.75,  -5.82, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -32.80>, < -0.75,  -5.82, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.75,  -5.82, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -32.80>, <  0.75,  -5.82, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, <  0.75,  -5.82, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -32.80>, <  0.75,  -5.82, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, <  0.75,  -5.82, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.77,  -4.52, -34.36>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -34.36>, < -0.77,  -4.52, -34.36>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, <  0.77,  -4.52, -34.36>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -34.36>, <  0.77,  -4.52, -34.36>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.00,  -4.05, -33.58>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.00,  -4.05, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -34.36>, < -0.00,  -4.05, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -35.92>, < -0.00,  -4.05, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -35.92>, < -0.77,  -3.18, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -34.36>, < -0.77,  -3.18, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -35.92>, <  0.77,  -3.18, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -34.36>, <  0.77,  -3.18, -35.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -35.92>, < -0.00,  -2.70, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.00,  -2.70, -34.36>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.77,  -3.18, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -34.36>, < -0.77,  -3.18, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, <  0.77,  -3.18, -33.58>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -34.36>, <  0.77,  -3.18, -33.58>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.77,  -3.18, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -31.24>, < -0.77,  -3.18, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, <  0.77,  -3.18, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -31.24>, <  0.77,  -3.18, -32.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.00,  -4.05, -32.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.00,  -4.05, -32.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -32.80>, < -0.00,  -2.70, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.00,  -2.70, -31.24>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, <  0.77, -13.99, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -31.24>, <  0.77, -13.99, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.77, -13.99, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -31.24>, < -0.77, -13.99, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.00, -12.15, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.00, -12.15, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.75, -12.58, -29.67>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -29.67>, < -0.75, -12.58, -29.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, <  0.75, -12.58, -29.67>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -29.67>, <  0.75, -12.58, -29.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.00, -12.15, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.00, -12.15, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.00, -13.51, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.00, -13.51, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, <  0.77, -13.99, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -28.11>, <  0.77, -13.99, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -29.67>, < -0.77, -13.99, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -28.11>, < -0.77, -13.99, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.75, -12.58, -26.55>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -26.55>, < -0.75, -12.58, -26.55>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, <  0.75, -12.58, -26.55>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -26.55>, <  0.75, -12.58, -26.55>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.00, -12.15, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.00, -12.15, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, <  0.77, -13.99, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -28.11>, <  0.77, -13.99, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.77, -13.99, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -28.11>, < -0.77, -13.99, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, <  0.77, -13.99, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55, -14.46, -24.99>, <  0.77, -13.99, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.00, -12.15, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, < -0.00, -12.15, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -13.51, -26.55>, < -0.77, -13.99, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.46, -24.99>, < -0.77, -13.99, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -29.67>, < -0.75, -11.22, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.75, -11.22, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -29.67>, < -0.75, -11.22, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.75, -11.22, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -29.67>, <  0.75, -11.22, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, <  0.75, -11.22, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -29.67>, <  0.75, -11.22, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, <  0.75, -11.22, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -26.55>, < -0.75, -11.22, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.75, -11.22, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -11.64, -26.55>, < -0.75, -11.22, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, < -0.75, -11.22, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -26.55>, <  0.75, -11.22, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, <  0.75, -11.22, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -11.64, -26.55>, <  0.75, -11.22, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, <  0.75, -11.22, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.77,  -9.93, -31.24>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -31.24>, < -0.77,  -9.93, -31.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, <  0.77,  -9.93, -31.24>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -31.24>, <  0.77,  -9.93, -31.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -31.24>, < -0.00,  -9.45, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -9.45, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, <  0.77,  -9.93, -28.11>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -28.11>, <  0.77,  -9.93, -28.11>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.77,  -9.93, -28.11>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -28.11>, < -0.77,  -9.93, -28.11>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.00,  -9.45, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -9.45, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -28.11>, < -0.00,  -9.45, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.00,  -9.45, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.77,  -8.58, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -31.24>, < -0.77,  -8.58, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, <  0.77,  -8.58, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -28.11>, <  0.77,  -8.58, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.77,  -8.58, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -28.11>, < -0.77,  -8.58, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, <  0.77,  -8.58, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -31.24>, <  0.77,  -8.58, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -6.75, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.00,  -6.75, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -6.75, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.00,  -6.75, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, <  0.75,  -7.17, -29.67>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -29.67>, <  0.75,  -7.17, -29.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.75,  -7.17, -29.67>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -29.67>, < -0.75,  -7.17, -29.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -29.67>, < -0.00,  -8.11, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.00,  -8.11, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, <  0.77,  -8.58, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -28.11>, <  0.77,  -8.58, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.00,  -9.45, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, < -0.00,  -9.45, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.77,  -8.58, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -28.11>, < -0.77,  -8.58, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.77,  -8.58, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -24.99>, < -0.77,  -8.58, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.00,  -6.75, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.00,  -6.75, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, <  0.75,  -7.17, -26.55>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -26.55>, <  0.75,  -7.17, -26.55>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.75,  -7.17, -26.55>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -26.55>, < -0.75,  -7.17, -26.55>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, <  0.77,  -8.58, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -24.99>, <  0.77,  -8.58, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.11, -26.55>, < -0.00,  -6.75, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, < -0.00,  -6.75, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -29.67>, < -0.75,  -5.82, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.75,  -5.82, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -29.67>, < -0.75,  -5.82, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.75,  -5.82, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -29.67>, <  0.75,  -5.82, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, <  0.75,  -5.82, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -29.67>, <  0.75,  -5.82, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, <  0.75,  -5.82, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -26.55>, < -0.75,  -5.82, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.75,  -5.82, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -6.24, -26.55>, < -0.75,  -5.82, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, < -0.75,  -5.82, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -26.55>, <  0.75,  -5.82, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, <  0.75,  -5.82, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.24, -26.55>, <  0.75,  -5.82, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, <  0.75,  -5.82, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.77,  -4.52, -31.24>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -31.24>, < -0.77,  -4.52, -31.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, <  0.77,  -4.52, -31.24>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -31.24>, <  0.77,  -4.52, -31.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -31.24>, < -0.00,  -4.05, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.00,  -4.05, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.00,  -4.05, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.00,  -4.05, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.00,  -4.05, -27.33>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, < -0.00,  -4.05, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, <  0.77,  -4.52, -28.11>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -28.11>, <  0.77,  -4.52, -28.11>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -28.11>, < -0.77,  -4.52, -28.11>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -28.11>, < -0.77,  -4.52, -28.11>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.77,  -3.18, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -31.24>, < -0.77,  -3.18, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, <  0.77,  -3.18, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -31.24>, <  0.77,  -3.18, -30.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.00,  -2.70, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, < -0.00,  -2.70, -28.11>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, <  0.77,  -3.18, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -28.11>, <  0.77,  -3.18, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -29.67>, < -0.77,  -3.18, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -28.11>, < -0.77,  -3.18, -28.89>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, <  0.77,  -3.18, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -28.11>, <  0.77,  -3.18, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, < -0.77,  -3.18, -27.33>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -28.11>, < -0.77,  -3.18, -27.33>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, < -0.00,  -4.05, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, < -0.00,  -4.05, -25.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, <  0.77,  -3.18, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -24.99>, <  0.77,  -3.18, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -2.70, -26.55>, < -0.77,  -3.18, -25.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -24.99>, < -0.77,  -3.18, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, < -0.77,  -9.93, -24.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -9.06, -24.99>, < -0.77,  -9.93, -24.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.79, -24.99>, <  0.77,  -9.93, -24.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -9.06, -24.99>, <  0.77,  -9.93, -24.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, <  0.77,  -4.52, -24.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  1.55,  -3.65, -24.99>, <  0.77,  -4.52, -24.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.39, -24.99>, < -0.77,  -4.52, -24.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -3.65, -24.99>, < -0.77,  -4.52, -24.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
// no constraints
