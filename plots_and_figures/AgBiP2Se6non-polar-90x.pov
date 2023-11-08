#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -63.76*x up 35.24*y
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

cylinder {<-10.12, -16.78,  -0.01>, < 30.36, -16.78,  -0.01>, Rcell pigment {Black}}
cylinder {<-30.36, -16.78, -35.07>, < 10.12, -16.78, -35.07>, Rcell pigment {Black}}
cylinder {<-30.36,  16.78, -35.07>, < 10.12,  16.78, -35.07>, Rcell pigment {Black}}
cylinder {<-10.12,  16.78,  -0.01>, < 30.36,  16.78,  -0.01>, Rcell pigment {Black}}
cylinder {<-10.12, -16.78,  -0.01>, <-30.36, -16.78, -35.07>, Rcell pigment {Black}}
cylinder {< 30.36, -16.78,  -0.01>, < 10.12, -16.78, -35.07>, Rcell pigment {Black}}
cylinder {< 30.36,  16.78,  -0.01>, < 10.12,  16.78, -35.07>, Rcell pigment {Black}}
cylinder {<-10.12,  16.78,  -0.01>, <-30.36,  16.78, -35.07>, Rcell pigment {Black}}
cylinder {<-10.12, -16.78,  -0.01>, <-10.12,  16.78,  -0.01>, Rcell pigment {Black}}
cylinder {< 30.36, -16.78,  -0.01>, < 30.36,  16.78,  -0.01>, Rcell pigment {Black}}
cylinder {< 10.12, -16.78, -35.07>, < 10.12,  16.78, -35.07>, Rcell pigment {Black}}
cylinder {<-30.36, -16.78, -35.07>, <-30.36,  16.78, -35.07>, Rcell pigment {Black}}
atom(< -3.37,   0.12,  -0.01>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #0
atom(< -7.67,  -1.89,  -3.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -5.47,   1.70,  -3.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -5.91,   1.70,   0.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -8.86,   1.70,  -2.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -6.75,   1.10,  -1.96>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -6.75,  -1.19,  -1.96>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(<-10.12,  -0.57,  -3.91>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -6.75,   0.12,  -5.85>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< -8.84,   1.70,  -9.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -9.29,   1.70,  -5.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<-10.12,   1.10,  -7.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #11
atom(<-10.12,  -1.19,  -7.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(<-10.12,   0.12, -11.70>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #13
atom(< -0.93,  -1.89,  -3.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(< -4.64,  -1.89,  -1.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(< -4.55,  -1.89,  -6.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(<  1.28,   1.70,  -3.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  0.83,   1.70,  -0.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -2.11,   1.70,  -2.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -0.00,   1.10,  -1.96>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(< -0.00,  -1.19,  -1.96>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #21
atom(< -3.37,  -0.57,  -3.91>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -0.00,   0.12,  -5.85>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #23
atom(< -4.30,  -1.89,  -9.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -8.01,  -1.89,  -7.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(< -7.93,  -1.89, -11.89>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -2.10,   1.70,  -9.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -2.54,   1.70,  -5.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -5.49,   1.70,  -8.06>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(< -3.37,   1.10,  -7.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -3.37,  -1.19,  -7.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(< -6.75,  -0.57,  -9.75>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -3.37,   0.12, -11.70>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #33
atom(< -7.67,  -1.89, -15.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -5.47,   1.70, -15.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -5.91,   1.70, -11.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -8.86,   1.70, -13.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -6.75,   1.10, -13.64>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(< -6.75,  -1.19, -13.64>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<-10.12,  -0.57, -15.59>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #40
atom(< -6.75,   0.12, -17.54>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(< -8.84,   1.70, -21.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -9.29,   1.70, -17.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(<-10.12,   1.10, -19.49>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #44
atom(<-10.12,  -1.19, -19.49>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #45
atom(<  2.11,  -1.89,  -1.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #46
atom(<  2.19,  -1.89,  -6.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #47
atom(< -1.27,  -1.89,  -7.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #48
atom(< -1.18,  -1.89, -11.89>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #49
atom(<  1.26,   1.70,  -8.06>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #50
atom(<  0.00,  -0.57,  -9.75>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #51
atom(< -0.93,  -1.89, -15.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #52
atom(< -4.64,  -1.89, -13.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #53
atom(< -4.55,  -1.89, -17.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #54
atom(<  1.28,   1.70, -15.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #55
atom(<  0.83,   1.70, -11.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #56
atom(< -2.11,   1.70, -13.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #57
atom(< -0.00,   1.10, -13.64>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #58
atom(<  0.00,  -1.19, -13.64>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #59
atom(< -3.37,  -0.57, -15.59>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #60
atom(< -0.00,   0.12, -17.54>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #61
atom(< -4.30,  -1.89, -21.38>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #62
atom(< -8.01,  -1.89, -19.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #63
atom(< -2.10,   1.70, -21.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #64
atom(< -2.54,   1.70, -17.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #65
atom(< -5.49,   1.70, -19.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #66
atom(< -3.37,   1.10, -19.49>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #67
atom(< -3.37,  -1.19, -19.49>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #68
atom(< -6.75,  -0.57, -21.44>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #69
atom(<  2.11,  -1.89, -13.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #70
atom(<  2.20,  -1.89, -17.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #71
atom(< -1.27,  -1.89, -19.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #72
atom(<  1.26,   1.70, -19.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #73
atom(<  0.00,  -0.57, -21.44>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #74
cylinder {< -3.37,   0.12,  -0.01>, < -4.64,   0.91,  -0.01>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,   1.70,   0.00>, < -4.64,   0.91,  -0.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12,  -0.01>, < -4.01,  -0.89,  -0.91>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89,  -1.81>, < -4.01,  -0.89,  -0.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12,  -0.01>, < -2.74,   0.91,  -1.11>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,   1.70,  -2.21>, < -2.74,   0.91,  -1.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89,  -3.85>, < -8.90,  -1.23,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -0.57,  -3.91>, < -8.90,  -1.23,  -3.88>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89,  -3.85>, < -7.21,  -1.54,  -2.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19,  -1.96>, < -7.21,  -1.54,  -2.91>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89,  -3.85>, < -7.21,  -0.89,  -4.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -7.21,  -0.89,  -4.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,   1.70,  -3.66>, < -6.11,   1.40,  -2.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10,  -1.96>, < -6.11,   1.40,  -2.81>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,   1.70,  -3.66>, < -6.11,   0.91,  -4.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -6.11,   0.91,  -4.76>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,   1.70,   0.00>, < -6.33,   1.40,  -0.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10,  -1.96>, < -6.33,   1.40,  -0.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.86,   1.70,  -2.21>, < -7.80,   1.40,  -2.09>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10,  -1.96>, < -7.80,   1.40,  -2.09>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10,  -1.96>, < -6.75,  -0.04,  -1.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19,  -1.96>, < -6.75,  -0.04,  -1.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19,  -1.96>, < -5.69,  -1.54,  -1.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89,  -1.81>, < -5.69,  -1.54,  -1.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -8.02,   0.91,  -5.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   1.70,  -5.84>, < -8.02,   0.91,  -5.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -5.65,  -0.89,  -5.95>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89,  -6.05>, < -5.65,  -0.89,  -5.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -7.38,  -0.89,  -6.75>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89,  -7.66>, < -7.38,  -0.89,  -6.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12,  -5.85>, < -6.12,   0.91,  -6.96>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.70,  -8.06>, < -6.12,   0.91,  -6.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   1.70,  -9.50>, < -9.48,   1.40,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10,  -7.80>, < -9.48,   1.40,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   1.70,  -9.50>, < -9.48,   0.91, -10.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   0.12, -11.70>, < -9.48,   0.91, -10.60>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   1.70,  -5.84>, < -9.70,   1.40,  -6.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10,  -7.80>, < -9.70,   1.40,  -6.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10,  -7.80>, <-10.12,  -0.04,  -7.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -1.19,  -7.80>, <-10.12,  -0.04,  -7.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -1.19,  -7.80>, < -9.07,  -1.54,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89,  -7.66>, < -9.07,  -1.54,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   0.12, -11.70>, < -9.02,  -0.89, -11.79>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -1.89, -11.89>, < -9.02,  -0.89, -11.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   0.12, -11.70>, < -9.49,   0.91, -12.80>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.86,   1.70, -13.90>, < -9.49,   0.91, -12.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89,  -3.85>, < -0.46,  -0.89,  -4.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, < -0.46,  -0.89,  -4.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89,  -3.85>, < -0.46,  -1.54,  -2.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.19,  -1.96>, < -0.46,  -1.54,  -2.91>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89,  -3.85>, < -2.15,  -1.23,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57,  -3.91>, < -2.15,  -1.23,  -3.88>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89,  -1.81>, < -4.01,  -1.23,  -2.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57,  -3.91>, < -4.01,  -1.23,  -2.86>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89,  -6.05>, < -3.96,  -1.23,  -4.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57,  -3.91>, < -3.96,  -1.23,  -4.98>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89,  -6.05>, < -3.96,  -1.54,  -6.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19,  -7.80>, < -3.96,  -1.54,  -6.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.70,  -3.66>, <  0.64,   0.91,  -4.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, <  0.64,   0.91,  -4.76>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.70,  -3.66>, <  0.64,   1.40,  -2.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10,  -1.96>, <  0.64,   1.40,  -2.81>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.83,   1.70,  -0.00>, <  0.42,   1.40,  -0.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10,  -1.96>, <  0.42,   1.40,  -0.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,   1.70,  -2.21>, < -1.06,   1.40,  -2.09>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10,  -1.96>, < -1.06,   1.40,  -2.09>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10,  -1.96>, < -0.00,  -0.04,  -1.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.19,  -1.96>, < -0.00,  -0.04,  -1.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.19,  -1.96>, <  1.05,  -1.54,  -1.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -1.89,  -1.81>, <  1.05,  -1.54,  -1.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, < -1.27,   0.91,  -5.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.70,  -5.84>, < -1.27,   0.91,  -5.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, <  1.10,  -0.89,  -5.95>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.19,  -1.89,  -6.05>, <  1.10,  -0.89,  -5.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, < -0.63,  -0.89,  -6.75>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89,  -7.66>, < -0.63,  -0.89,  -6.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12,  -5.85>, <  0.63,   0.91,  -6.96>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.26,   1.70,  -8.06>, <  0.63,   0.91,  -6.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -1.89,  -9.70>, < -5.52,  -1.23,  -9.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -0.57,  -9.75>, < -5.52,  -1.23,  -9.72>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -1.89,  -9.70>, < -3.84,  -1.54,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19,  -7.80>, < -3.84,  -1.54,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -1.89,  -9.70>, < -3.84,  -0.89, -10.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -3.84,  -0.89, -10.70>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89,  -7.66>, < -7.38,  -1.23,  -8.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -0.57,  -9.75>, < -7.38,  -1.23,  -8.70>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -1.89, -11.89>, < -7.34,  -1.23, -10.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -0.57,  -9.75>, < -7.34,  -1.23, -10.82>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -1.89, -11.89>, < -7.34,  -1.54, -12.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19, -13.64>, < -7.34,  -1.54, -12.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.70,  -9.50>, < -2.74,   1.40,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10,  -7.80>, < -2.74,   1.40,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.70,  -9.50>, < -2.74,   0.91, -10.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -2.74,   0.91, -10.60>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.70,  -5.84>, < -2.96,   1.40,  -6.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10,  -7.80>, < -2.96,   1.40,  -6.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.70,  -8.06>, < -4.43,   1.40,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10,  -7.80>, < -4.43,   1.40,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10,  -7.80>, < -3.37,  -0.04,  -7.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19,  -7.80>, < -3.37,  -0.04,  -7.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19,  -7.80>, < -2.32,  -1.54,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89,  -7.66>, < -2.32,  -1.54,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -4.64,   0.91, -11.69>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,   1.70, -11.69>, < -4.64,   0.91, -11.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -4.01,  -0.89, -12.60>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89, -13.50>, < -4.01,  -0.89, -12.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -2.28,  -0.89, -11.79>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -1.89, -11.89>, < -2.28,  -0.89, -11.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.12, -11.70>, < -2.74,   0.91, -12.80>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,   1.70, -13.90>, < -2.74,   0.91, -12.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89, -15.54>, < -8.90,  -1.23, -15.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -0.57, -15.59>, < -8.90,  -1.23, -15.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89, -15.54>, < -7.21,  -1.54, -14.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19, -13.64>, < -7.21,  -1.54, -14.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.89, -15.54>, < -7.21,  -0.89, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -7.21,  -0.89, -16.54>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,   1.70, -15.35>, < -6.11,   1.40, -14.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10, -13.64>, < -6.11,   1.40, -14.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,   1.70, -15.35>, < -6.11,   0.91, -16.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -6.11,   0.91, -16.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,   1.70, -11.69>, < -6.33,   1.40, -12.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10, -13.64>, < -6.33,   1.40, -12.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.86,   1.70, -13.90>, < -7.80,   1.40, -13.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10, -13.64>, < -7.80,   1.40, -13.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   1.10, -13.64>, < -6.75,  -0.04, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19, -13.64>, < -6.75,  -0.04, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -1.19, -13.64>, < -5.69,  -1.54, -13.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89, -13.50>, < -5.69,  -1.54, -13.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -8.02,   0.91, -17.53>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   1.70, -17.53>, < -8.02,   0.91, -17.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -7.38,  -0.89, -18.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89, -19.34>, < -7.38,  -0.89, -18.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -6.12,   0.91, -18.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.70, -19.74>, < -6.12,   0.91, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.12, -17.54>, < -5.65,  -0.89, -17.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89, -17.74>, < -5.65,  -0.89, -17.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   1.70, -21.19>, < -9.48,   1.40, -20.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10, -19.49>, < -9.48,   1.40, -20.34>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   1.70, -17.53>, < -9.70,   1.40, -18.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10, -19.49>, < -9.70,   1.40, -18.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   1.10, -19.49>, <-10.12,  -0.04, -19.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -1.19, -19.49>, <-10.12,  -0.04, -19.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -1.19, -19.49>, < -9.07,  -1.54, -19.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89, -19.34>, < -9.07,  -1.54, -19.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89,  -7.66>, < -0.63,  -1.23,  -8.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.57,  -9.75>, < -0.63,  -1.23,  -8.70>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -1.89, -11.89>, < -0.59,  -1.23, -10.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.57,  -9.75>, < -0.59,  -1.23, -10.82>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -1.89, -11.89>, < -0.59,  -1.54, -12.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.19, -13.64>, < -0.59,  -1.54, -12.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89, -15.54>, < -0.46,  -1.54, -14.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.19, -13.64>, < -0.46,  -1.54, -14.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89, -15.54>, < -2.15,  -1.23, -15.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57, -15.59>, < -2.15,  -1.23, -15.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.89, -15.54>, < -0.46,  -0.89, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, < -0.46,  -0.89, -16.54>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -1.89, -13.50>, < -4.01,  -1.23, -14.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57, -15.59>, < -4.01,  -1.23, -14.55>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89, -17.74>, < -3.96,  -1.23, -16.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.57, -15.59>, < -3.96,  -1.23, -16.66>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,  -1.89, -17.74>, < -3.96,  -1.54, -18.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19, -19.49>, < -3.96,  -1.54, -18.61>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.70, -15.35>, <  0.64,   1.40, -14.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10, -13.64>, <  0.64,   1.40, -14.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,   1.70, -15.35>, <  0.64,   0.91, -16.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, <  0.64,   0.91, -16.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.83,   1.70, -11.69>, <  0.42,   1.40, -12.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10, -13.64>, <  0.42,   1.40, -12.67>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,   1.70, -13.90>, < -1.06,   1.40, -13.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10, -13.64>, < -1.06,   1.40, -13.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.10, -13.64>, < -0.00,  -0.04, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.19, -13.64>, < -0.00,  -0.04, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.19, -13.64>, <  1.05,  -1.54, -13.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -1.89, -13.50>, <  1.05,  -1.54, -13.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, < -1.27,   0.91, -17.53>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.70, -17.53>, < -1.27,   0.91, -17.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, <  1.10,  -0.89, -17.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.20,  -1.89, -17.74>, <  1.10,  -0.89, -17.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, < -0.63,  -0.89, -18.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89, -19.34>, < -0.63,  -0.89, -18.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.12, -17.54>, <  0.63,   0.91, -18.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.26,   1.70, -19.74>, <  0.63,   0.91, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -1.89, -21.38>, < -5.52,  -1.23, -21.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -0.57, -21.44>, < -5.52,  -1.23, -21.41>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -1.89, -21.38>, < -3.84,  -1.54, -20.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19, -19.49>, < -3.84,  -1.54, -20.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -1.89, -19.34>, < -7.38,  -1.23, -20.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -0.57, -21.44>, < -7.38,  -1.23, -20.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.70, -21.19>, < -2.74,   1.40, -20.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10, -19.49>, < -2.74,   1.40, -20.34>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.70, -17.53>, < -2.96,   1.40, -18.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10, -19.49>, < -2.96,   1.40, -18.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.70, -19.74>, < -4.43,   1.40, -19.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10, -19.49>, < -4.43,   1.40, -19.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.10, -19.49>, < -3.37,  -0.04, -19.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19, -19.49>, < -3.37,  -0.04, -19.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.19, -19.49>, < -2.32,  -1.54, -19.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89, -19.34>, < -2.32,  -1.54, -19.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.89, -19.34>, < -0.63,  -1.23, -20.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.57, -21.44>, < -0.63,  -1.23, -20.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
