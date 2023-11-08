#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -39.36*x up 34.04*y
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

cylinder {<-18.74, -16.21, -18.09>, < 18.74, -16.21, -18.09>, Rcell pigment {Black}}
cylinder {<-18.74,  16.21, -18.09>, < 18.74,  16.21, -18.09>, Rcell pigment {Black}}
cylinder {<-18.74,  16.21,   0.00>, < 18.74,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74, -16.21,   0.00>, < 18.74, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74, -16.21, -18.09>, <-18.74,  16.21, -18.09>, Rcell pigment {Black}}
cylinder {< 18.74, -16.21, -18.09>, < 18.74,  16.21, -18.09>, Rcell pigment {Black}}
cylinder {< 18.74, -16.21,   0.00>, < 18.74,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74, -16.21,   0.00>, <-18.74,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74, -16.21, -18.09>, <-18.74, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {< 18.74, -16.21, -18.09>, < 18.74, -16.21,   0.00>, Rcell pigment {Black}}
cylinder {< 18.74,  16.21, -18.09>, < 18.74,  16.21,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74,  16.21, -18.09>, <-18.74,  16.21,   0.00>, Rcell pigment {Black}}
atom(<-17.18, -13.51,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #0
atom(<-14.05, -13.51,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #1
atom(<-17.18, -11.64,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-17.18, -11.64, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #3
atom(<-15.62, -14.46, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-14.05, -11.64,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<-15.62, -14.46,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-14.05, -11.64, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-15.62, -10.79,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #8
atom(<-17.18,  -8.11,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #9
atom(<-14.05,  -8.11,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #10
atom(<-17.18,  -6.24,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<-17.18,  -6.24, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<-15.62,  -9.06, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-14.05,  -6.24,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(<-15.62,  -9.06,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(<-14.05,  -6.24, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(<-15.62,  -5.39,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #17
atom(<-17.18,  -2.70,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #18
atom(<-14.05,  -2.70,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #19
atom(<-15.62,  -3.65, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<-15.62,  -3.65,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-10.93, -13.51,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #22
atom(< -7.81, -13.51,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #23
atom(<-12.49, -14.46, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(<-10.93, -11.64,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(<-12.49, -14.46,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(<-10.93, -11.64, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #27
atom(< -9.37, -14.46, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -7.80, -11.64,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -9.37, -14.46,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
atom(< -7.81, -11.64, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #31
atom(<-12.49, -10.79,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #32
atom(< -9.37, -10.79,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #33
atom(<-10.93,  -8.11,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #34
atom(< -7.81,  -8.11,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #35
atom(<-12.49,  -9.06, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(<-10.93,  -6.24,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(<-12.49,  -9.06,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #38
atom(<-10.93,  -6.24, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #39
atom(< -9.37,  -9.06, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(< -7.80,  -6.24,  -7.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #41
atom(< -9.37,  -9.06,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #42
atom(< -7.81,  -6.24, -10.54>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #43
atom(<-12.49,  -5.39,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #44
atom(< -9.37,  -5.39,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #45
atom(<-10.93,  -2.70,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #46
atom(< -7.81,  -2.70,  -9.05>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #47
atom(<-12.49,  -3.65, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #48
atom(<-12.49,  -3.65,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #49
atom(< -9.37,  -3.65, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #50
atom(< -9.37,  -3.65,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #51
atom(< -6.24, -14.46, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #52
atom(< -6.24, -14.46,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #53
atom(< -6.24, -10.79,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #54
atom(< -6.24,  -9.06, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #55
atom(< -6.24,  -9.06,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #56
atom(< -6.24,  -5.39,  -9.05>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #57
atom(< -6.24,  -3.65, -10.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #58
atom(< -6.24,  -3.65,  -7.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #59
cylinder {<-17.18, -13.51,  -9.05>, <-17.18, -12.58,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -11.64,  -7.56>, <-17.18, -12.58,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -13.51,  -9.05>, <-17.18, -12.58,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -11.64, -10.54>, <-17.18, -12.58,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -13.51,  -9.05>, <-16.40, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -14.46,  -7.50>, <-16.40, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -13.51,  -9.05>, <-16.40, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -14.46, -10.59>, <-16.40, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -13.51,  -9.05>, <-15.62, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-15.62, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -13.51,  -9.05>, <-16.40, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-16.40, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-14.83, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -14.46,  -7.50>, <-14.83, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-14.83, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -14.46, -10.59>, <-14.83, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-13.27, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -14.46, -10.59>, <-13.27, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-14.83, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-14.83, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-14.05, -12.58,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64,  -7.56>, <-14.05, -12.58,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-13.27, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -14.46,  -7.50>, <-13.27, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-14.05, -12.58,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64, -10.54>, <-14.05, -12.58,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-13.27, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-13.27, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -13.51,  -9.05>, <-12.49, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-12.49, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -11.64,  -7.56>, <-16.40, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-16.40, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18, -11.64, -10.54>, <-16.40, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-16.40, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64,  -7.56>, <-14.83, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-14.83, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64,  -7.56>, <-13.27, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-13.27, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64, -10.54>, <-14.83, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-14.83, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -11.64, -10.54>, <-13.27, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-13.27, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-15.62,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06,  -7.50>, <-15.62,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-15.62,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06, -10.59>, <-15.62,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-14.83,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.83,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62, -10.79,  -9.05>, <-16.40,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-16.40,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-16.40,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06,  -7.50>, <-16.40,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-16.40,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06, -10.59>, <-16.40,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-17.18,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -6.24,  -7.56>, <-17.18,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-15.62,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-15.62,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-17.18,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -6.24, -10.54>, <-17.18,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -8.11,  -9.05>, <-16.40,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-16.40,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.83,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06,  -7.50>, <-14.83,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.83,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -9.06, -10.59>, <-14.83,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-13.27,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06,  -7.50>, <-13.27,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-13.27,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-13.27,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-13.27,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06, -10.59>, <-13.27,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.05,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24,  -7.56>, <-14.05,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.05,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24, -10.54>, <-14.05,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-14.83,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-14.83,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-13.27,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-13.27,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -8.11,  -9.05>, <-12.49,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-12.49,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -6.24,  -7.56>, <-16.40,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-16.40,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -6.24, -10.54>, <-16.40,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-16.40,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24,  -7.56>, <-14.83,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-14.83,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24,  -7.56>, <-13.27,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-13.27,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24, -10.54>, <-14.83,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-14.83,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -6.24, -10.54>, <-13.27,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-13.27,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-15.62,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65,  -7.50>, <-15.62,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-15.62,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65, -10.59>, <-15.62,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-14.83,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-14.83,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -5.39,  -9.05>, <-16.40,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -2.70,  -9.05>, <-16.40,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -2.70,  -9.05>, <-16.40,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65,  -7.50>, <-16.40,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -2.70,  -9.05>, <-16.40,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65, -10.59>, <-16.40,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -2.70,  -9.05>, <-15.62,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-15.62,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-14.83,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65,  -7.50>, <-14.83,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-14.83,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -3.65, -10.59>, <-14.83,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-13.27,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65,  -7.50>, <-13.27,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-13.27,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65, -10.59>, <-13.27,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-13.27,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-13.27,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -2.70,  -9.05>, <-12.49,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-12.49,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-11.71, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -14.46, -10.59>, <-11.71, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-11.71, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -14.46,  -7.50>, <-11.71, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-11.71, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-11.71, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-10.93, -12.58,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64,  -7.56>, <-10.93, -12.58,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-10.93, -12.58,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64, -10.54>, <-10.93, -12.58,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-10.15, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, <-10.15, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, < -9.37, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -9.37, -13.51,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-10.15, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -14.46, -10.59>, <-10.15, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -13.51,  -9.05>, <-10.15, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -14.46,  -7.50>, <-10.15, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -7.80, -12.58,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.80, -11.64,  -7.56>, < -7.80, -12.58,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -7.81, -12.58,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -11.64, -10.54>, < -7.81, -12.58,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -8.59, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -8.59, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -8.59, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -14.46, -10.59>, < -8.59, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -8.59, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -14.46,  -7.50>, < -8.59, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -7.02, -13.99,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -14.46, -10.59>, < -7.02, -13.99,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -7.02, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -7.02, -12.15,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -13.51,  -9.05>, < -7.02, -13.99,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -14.46,  -7.50>, < -7.02, -13.99,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64,  -7.56>, <-11.71, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-11.71, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64,  -7.56>, <-10.15, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, <-10.15, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64, -10.54>, <-11.71, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-11.71, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93, -11.64, -10.54>, <-10.15, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, <-10.15, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80, -11.64,  -7.56>, < -8.59, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -8.59, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80, -11.64,  -7.56>, < -7.02, -11.22,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -7.02, -11.22,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -11.64, -10.54>, < -8.59, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -8.59, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81, -11.64, -10.54>, < -7.02, -11.22,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -7.02, -11.22,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-12.49,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06,  -7.50>, <-12.49,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-12.49,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06, -10.59>, <-12.49,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49, -10.79,  -9.05>, <-11.71,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-11.71,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -9.37,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06, -10.59>, < -9.37,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -9.37,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06,  -7.50>, < -9.37,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, <-10.15,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.15,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -10.79,  -9.05>, < -8.59,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -8.59,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-11.71,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06,  -7.50>, <-11.71,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.15,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06, -10.59>, <-10.15,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.15,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06,  -7.50>, <-10.15,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-11.71,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -9.06, -10.59>, <-11.71,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-11.71,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-11.71,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.15,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, <-10.15,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.93,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24, -10.54>, <-10.93,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, <-10.93,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24,  -7.56>, <-10.93,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -8.11,  -9.05>, < -9.37,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -9.37,  -8.11,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -8.59,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06, -10.59>, < -8.59,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.02,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -7.02,  -9.45,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -8.59,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -9.06,  -7.50>, < -8.59,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.02,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -9.06,  -7.50>, < -7.02,  -8.58,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -8.59,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -8.59,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.81,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -6.24, -10.54>, < -7.81,  -7.17,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.80,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -6.24,  -7.56>, < -7.80,  -7.17,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.02,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -9.06, -10.59>, < -7.02,  -8.58,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -8.11,  -9.05>, < -7.02,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -7.02,  -6.75,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24,  -7.56>, <-11.71,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-11.71,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24,  -7.56>, <-10.15,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, <-10.15,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24, -10.54>, <-11.71,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-11.71,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -6.24, -10.54>, <-10.15,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, <-10.15,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -6.24,  -7.56>, < -8.59,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -8.59,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -6.24,  -7.56>, < -7.02,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -7.02,  -5.82,  -8.30>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -6.24, -10.54>, < -8.59,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -8.59,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -6.24, -10.54>, < -7.02,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -7.02,  -5.82,  -9.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-12.49,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65,  -7.50>, <-12.49,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-12.49,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65, -10.59>, <-12.49,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -5.39,  -9.05>, <-11.71,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-11.71,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, <-10.15,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-10.15,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -8.59,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -8.59,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -9.37,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65, -10.59>, < -9.37,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -5.39,  -9.05>, < -9.37,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65,  -7.50>, < -9.37,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-11.71,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65,  -7.50>, <-11.71,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-11.71,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -3.65, -10.59>, <-11.71,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, < -9.37,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -9.37,  -2.70,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-10.15,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65, -10.59>, <-10.15,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -2.70,  -9.05>, <-10.15,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65,  -7.50>, <-10.15,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -8.59,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65, -10.59>, < -8.59,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -8.59,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -3.65,  -7.50>, < -8.59,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -7.02,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -7.02,  -4.05,  -9.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -7.02,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -3.65, -10.59>, < -7.02,  -3.18,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -2.70,  -9.05>, < -7.02,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -3.65,  -7.50>, < -7.02,  -3.18,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -6.24,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -9.06,  -7.50>, < -6.24,  -9.93,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24, -10.79,  -9.05>, < -6.24,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -9.06, -10.59>, < -6.24,  -9.93,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -6.24,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -3.65, -10.59>, < -6.24,  -4.52,  -9.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -5.39,  -9.05>, < -6.24,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -3.65,  -7.50>, < -6.24,  -4.52,  -8.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
// no constraints
