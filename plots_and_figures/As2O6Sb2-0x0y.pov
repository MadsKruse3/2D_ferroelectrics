#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.24*x up 35.65*y
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

cylinder {<-12.59, -16.98, -34.07>, < 15.35, -16.85, -34.07>, Rcell pigment {Black}}
cylinder {<-15.35,  16.85, -34.07>, < 12.59,  16.98, -34.07>, Rcell pigment {Black}}
cylinder {<-15.35,  16.85,   0.00>, < 12.59,  16.98,   0.00>, Rcell pigment {Black}}
cylinder {<-12.59, -16.98,   0.00>, < 15.35, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-12.59, -16.98, -34.07>, <-15.35,  16.85, -34.07>, Rcell pigment {Black}}
cylinder {< 15.35, -16.85, -34.07>, < 12.59,  16.98, -34.07>, Rcell pigment {Black}}
cylinder {< 15.35, -16.85,   0.00>, < 12.59,  16.98,   0.00>, Rcell pigment {Black}}
cylinder {<-12.59, -16.98,   0.00>, <-15.35,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-12.59, -16.98, -34.07>, <-12.59, -16.98,   0.00>, Rcell pigment {Black}}
cylinder {< 15.35, -16.85, -34.07>, < 15.35, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 12.59,  16.98, -34.07>, < 12.59,  16.98,   0.00>, Rcell pigment {Black}}
cylinder {<-15.35,  16.85, -34.07>, <-15.35,  16.85,   0.00>, Rcell pigment {Black}}
atom(<-10.48, -14.11, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(<-10.34, -14.62, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #1
atom(<-10.83, -16.45, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(< -8.73, -13.62, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<-10.58, -15.12, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -8.48, -12.29, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -8.43, -15.26, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-10.99, -12.45, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(<-10.94,  -8.47, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(<-10.80,  -8.98, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(<-11.29, -10.81, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(< -9.19,  -7.98, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-11.04,  -9.48, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -8.94,  -6.65, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< -8.89,  -9.62, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(<-11.45,  -6.82, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(<-11.75,  -5.18, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -5.82, -14.09, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< -5.68, -14.60, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #18
atom(< -8.24, -11.79, -18.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< -6.17, -16.43, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -4.07, -13.60, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< -5.92, -15.09, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -3.82, -12.27, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -3.77, -15.24, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -6.33, -12.43, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -8.38, -11.28, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(< -6.28,  -8.45, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(< -6.14,  -8.96, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #28
atom(< -8.70,  -6.15, -18.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #29
atom(< -6.63, -10.79, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #30
atom(< -4.53,  -7.96, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -6.38,  -9.46, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(< -4.28,  -6.63, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -4.23,  -9.60, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(< -6.79,  -6.79, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(< -8.84,  -5.64, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #36
atom(< -7.09,  -5.15, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #37
atom(< -1.16, -14.07, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(< -1.03, -14.57, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #39
atom(< -3.58, -11.77, -18.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #40
atom(< -1.52, -16.41, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(<  0.58, -13.58, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #42
atom(< -1.27, -15.07, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #43
atom(<  0.83, -12.24, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #44
atom(<  0.88, -15.22, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(< -1.67, -12.41, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(< -3.72, -11.26, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #47
atom(< -1.62,  -8.43, -19.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #48
atom(< -1.49,  -8.94, -15.68>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #49
atom(< -4.04,  -6.13, -18.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #50
atom(< -1.98, -10.77, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #51
atom(<  0.12,  -7.94, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #52
atom(< -1.73,  -9.44, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #53
atom(<  0.37,  -6.61, -16.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(<  0.42,  -9.58, -15.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(< -2.13,  -6.77, -18.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -4.18,  -5.62, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #57
atom(< -2.44,  -5.13, -15.03>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(<  0.94, -11.24, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #59
atom(<  0.61,  -6.11, -18.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #60
atom(<  0.48,  -5.60, -14.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
cylinder {<-10.48, -14.11, -19.12>, <-10.53, -14.61, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.58, -15.12, -17.60>, <-10.53, -14.61, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.48, -14.11, -19.12>, < -9.60, -13.87, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.73, -13.62, -19.05>, < -9.60, -13.87, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.48, -14.11, -19.12>, <-10.73, -13.28, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.99, -12.45, -18.53>, <-10.73, -13.28, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34, -14.62, -15.68>, <-10.58, -15.53, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.83, -16.45, -15.03>, <-10.58, -15.53, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34, -14.62, -15.68>, <-10.46, -14.87, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.58, -15.12, -17.60>, <-10.46, -14.87, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34, -14.62, -15.68>, < -9.38, -14.94, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.43, -15.26, -15.54>, < -9.38, -14.94, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.73, -13.62, -19.05>, < -8.49, -12.70, -18.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24, -11.79, -18.39>, < -8.49, -12.70, -18.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.48, -12.29, -16.47>, < -8.36, -12.04, -17.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24, -11.79, -18.39>, < -8.36, -12.04, -17.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.48, -12.29, -16.47>, < -8.43, -11.78, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.38, -11.28, -14.96>, < -8.43, -11.78, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -8.47, -19.12>, <-10.99,  -8.97, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.04,  -9.48, -17.60>, <-10.99,  -8.97, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -8.47, -19.12>, <-10.06,  -8.23, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.19,  -7.98, -19.05>, <-10.06,  -8.23, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -8.47, -19.12>, <-11.19,  -7.64, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.45,  -6.82, -18.53>, <-11.19,  -7.64, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,  -8.98, -15.68>, <-11.04,  -9.90, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.29, -10.81, -15.03>, <-11.04,  -9.90, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,  -8.98, -15.68>, < -9.84,  -9.30, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.89,  -9.62, -15.54>, < -9.84,  -9.30, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,  -8.98, -15.68>, <-10.92,  -9.23, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.04,  -9.48, -17.60>, <-10.92,  -9.23, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.19,  -7.98, -19.05>, < -8.95,  -7.07, -18.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -6.15, -18.39>, < -8.95,  -7.07, -18.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.94,  -6.65, -16.47>, < -8.82,  -6.40, -17.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -6.15, -18.39>, < -8.82,  -6.40, -17.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.94,  -6.65, -16.47>, < -8.89,  -6.14, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,  -5.64, -14.96>, < -8.89,  -6.14, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.89,  -9.62, -15.54>, < -8.63, -10.45, -15.25>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.38, -11.28, -14.96>, < -8.63, -10.45, -15.25>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.82, -14.09, -19.12>, < -5.87, -14.59, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.92, -15.09, -17.60>, < -5.87, -14.59, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.82, -14.09, -19.12>, < -6.08, -13.26, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.33, -12.43, -18.53>, < -6.08, -13.26, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.82, -14.09, -19.12>, < -4.95, -13.84, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.07, -13.60, -19.05>, < -4.95, -13.84, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68, -14.60, -15.68>, < -5.93, -15.51, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.17, -16.43, -15.03>, < -5.93, -15.51, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68, -14.60, -15.68>, < -5.80, -14.85, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.92, -15.09, -17.60>, < -5.80, -14.85, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68, -14.60, -15.68>, < -4.73, -14.92, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.77, -15.24, -15.54>, < -4.73, -14.92, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24, -11.79, -18.39>, < -7.29, -12.11, -18.46>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.33, -12.43, -18.53>, < -7.29, -12.11, -18.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.07, -13.60, -19.05>, < -3.83, -12.68, -18.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -11.77, -18.39>, < -3.83, -12.68, -18.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.82, -12.27, -16.47>, < -3.77, -11.76, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.72, -11.26, -14.96>, < -3.77, -11.76, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.82, -12.27, -16.47>, < -3.70, -12.02, -17.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -11.77, -18.39>, < -3.70, -12.02, -17.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.38, -11.28, -14.96>, < -7.50, -11.04, -14.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.63, -10.79, -15.03>, < -7.50, -11.04, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -8.45, -19.12>, < -6.33,  -8.95, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.38,  -9.46, -17.60>, < -6.33,  -8.95, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -8.45, -19.12>, < -6.54,  -7.62, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -6.79, -18.53>, < -6.54,  -7.62, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -8.45, -19.12>, < -5.41,  -8.21, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.53,  -7.96, -19.05>, < -5.41,  -8.21, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,  -8.96, -15.68>, < -6.39,  -9.88, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.63, -10.79, -15.03>, < -6.39,  -9.88, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,  -8.96, -15.68>, < -6.26,  -9.21, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.38,  -9.46, -17.60>, < -6.26,  -9.21, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,  -8.96, -15.68>, < -5.19,  -9.28, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.23,  -9.60, -15.54>, < -5.19,  -9.28, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -6.15, -18.39>, < -7.75,  -6.47, -18.46>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -6.79, -18.53>, < -7.75,  -6.47, -18.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.53,  -7.96, -19.05>, < -4.29,  -7.05, -18.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -6.13, -18.39>, < -4.29,  -7.05, -18.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -6.63, -16.47>, < -4.16,  -6.38, -17.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -6.13, -18.39>, < -4.16,  -6.38, -17.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -6.63, -16.47>, < -4.23,  -6.12, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.18,  -5.62, -14.96>, < -4.23,  -6.12, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.23,  -9.60, -15.54>, < -3.98, -10.43, -15.25>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.72, -11.26, -14.96>, < -3.98, -10.43, -15.25>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,  -5.64, -14.96>, < -7.96,  -5.40, -14.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.09,  -5.15, -15.03>, < -7.96,  -5.40, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -14.07, -19.12>, < -0.29, -13.82, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.58, -13.58, -19.05>, < -0.29, -13.82, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -14.07, -19.12>, < -1.21, -14.57, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.27, -15.07, -17.60>, < -1.21, -14.57, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -14.07, -19.12>, < -1.42, -13.24, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -12.41, -18.53>, < -1.42, -13.24, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03, -14.57, -15.68>, < -0.07, -14.90, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.88, -15.22, -15.54>, < -0.07, -14.90, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03, -14.57, -15.68>, < -1.15, -14.82, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27, -15.07, -17.60>, < -1.15, -14.82, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03, -14.57, -15.68>, < -1.27, -15.49, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.52, -16.41, -15.03>, < -1.27, -15.49, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -11.77, -18.39>, < -2.63, -12.09, -18.46>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -12.41, -18.53>, < -2.63, -12.09, -18.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.83, -12.24, -16.47>, <  0.88, -11.74, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94, -11.24, -14.96>, <  0.88, -11.74, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.72, -11.26, -14.96>, < -2.85, -11.01, -14.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -10.77, -15.03>, < -2.85, -11.01, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -8.43, -19.12>, < -1.67,  -8.93, -18.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -9.44, -17.60>, < -1.67,  -8.93, -18.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -8.43, -19.12>, < -0.75,  -8.19, -19.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.12,  -7.94, -19.05>, < -0.75,  -8.19, -19.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -8.43, -19.12>, < -1.88,  -7.60, -18.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -6.77, -18.53>, < -1.88,  -7.60, -18.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -8.94, -15.68>, < -1.73,  -9.85, -15.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -10.77, -15.03>, < -1.73,  -9.85, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -8.94, -15.68>, < -0.53,  -9.26, -15.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.42,  -9.58, -15.54>, < -0.53,  -9.26, -15.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -8.94, -15.68>, < -1.61,  -9.19, -16.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -9.44, -17.60>, < -1.61,  -9.19, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -6.13, -18.39>, < -3.09,  -6.45, -18.46>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -6.77, -18.53>, < -3.09,  -6.45, -18.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.12,  -7.94, -19.05>, <  0.37,  -7.02, -18.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -6.11, -18.39>, <  0.37,  -7.02, -18.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -6.61, -16.47>, <  0.49,  -6.36, -17.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -6.11, -18.39>, <  0.49,  -6.36, -17.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -6.61, -16.47>, <  0.42,  -6.10, -15.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.48,  -5.60, -14.96>, <  0.42,  -6.10, -15.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.42,  -9.58, -15.54>, <  0.68, -10.41, -15.25>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94, -11.24, -14.96>, <  0.68, -10.41, -15.25>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.18,  -5.62, -14.96>, < -3.31,  -5.38, -14.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,  -5.13, -15.03>, < -3.31,  -5.38, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
