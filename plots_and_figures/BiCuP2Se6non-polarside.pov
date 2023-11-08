#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -59.28*x up 38.28*y
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

cylinder {<-11.62, -15.29,  -0.00>, < 28.23, -15.29,  -0.00>, Rcell pigment {Black}}
cylinder {<-28.23, -15.29, -28.77>, < 11.62, -15.29, -28.77>, Rcell pigment {Black}}
cylinder {<-28.23,  18.23, -28.77>, < 11.62,  18.23, -28.77>, Rcell pigment {Black}}
cylinder {<-11.62,  18.23,  -0.00>, < 28.23,  18.23,   0.00>, Rcell pigment {Black}}
cylinder {<-11.62, -15.29,  -0.00>, <-28.23, -15.29, -28.77>, Rcell pigment {Black}}
cylinder {< 28.23, -15.29,  -0.00>, < 11.62, -15.29, -28.77>, Rcell pigment {Black}}
cylinder {< 28.23,  18.23,   0.00>, < 11.62,  18.23, -28.77>, Rcell pigment {Black}}
cylinder {<-11.62,  18.23,  -0.00>, <-28.23,  18.23, -28.77>, Rcell pigment {Black}}
cylinder {<-11.62, -15.29,  -0.00>, <-11.62,  18.23,  -0.00>, Rcell pigment {Black}}
cylinder {< 28.23, -15.29,  -0.00>, < 28.23,  18.23,   0.00>, Rcell pigment {Black}}
cylinder {< 11.62, -15.29, -28.77>, < 11.62,  18.23, -28.77>, Rcell pigment {Black}}
cylinder {<-28.23, -15.29, -28.77>, <-28.23,  18.23, -28.77>, Rcell pigment {Black}}
atom(<-10.87, -13.95,  -2.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -8.30, -15.29,  -5.75>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(<-10.58, -13.44,  -6.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.23, -13.95,  -2.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -6.03, -17.13,  -4.97>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -9.05, -16.62,  -3.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -6.90, -16.45,  -2.98>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -6.39, -14.12,  -2.78>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(< -1.66, -15.29,  -5.75>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< -7.55, -13.95,  -8.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -3.93, -13.44,  -6.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -7.24, -12.94,  -4.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -9.35, -17.13, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -9.37, -17.63,  -7.12>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<-10.22, -16.45,  -8.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -9.71, -14.12,  -8.53>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -4.98, -15.29,  -5.75>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #16
atom(<-10.56, -12.94, -10.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -2.41, -16.62,  -3.16>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -2.71, -17.13, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -2.72, -17.63,  -7.12>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -5.73, -16.62,  -8.92>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -3.58, -16.45,  -8.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< -3.07, -14.12,  -8.53>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(< -3.92, -12.94, -10.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< -8.30, -15.29,  -5.75>, < -8.83, -16.46,  -6.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -17.63,  -7.12>, < -8.83, -16.46,  -6.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30, -15.29,  -5.75>, < -7.93, -14.62,  -7.05>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.55, -13.95,  -8.34>, < -7.93, -14.62,  -7.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.58, -13.44,  -6.54>, <-10.14, -13.78,  -7.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71, -14.12,  -8.53>, <-10.14, -13.78,  -7.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.23, -13.95,  -2.59>, < -5.31, -14.04,  -2.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -14.12,  -2.78>, < -5.31, -14.04,  -2.68>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.03, -17.13,  -4.97>, < -6.46, -16.79,  -3.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -16.45,  -2.98>, < -6.46, -16.79,  -3.97>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.03, -17.13,  -4.97>, < -5.51, -16.21,  -5.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98, -15.29,  -5.75>, < -5.51, -16.21,  -5.36>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -9.05, -16.62,  -3.17>, < -7.98, -16.53,  -3.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -16.45,  -2.98>, < -7.98, -16.53,  -3.07>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.05, -16.62,  -3.17>, < -8.68, -15.95,  -4.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30, -15.29,  -5.75>, < -8.68, -15.95,  -4.46>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -16.45,  -2.98>, < -6.64, -15.29,  -2.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -14.12,  -2.78>, < -6.64, -15.29,  -2.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -14.12,  -2.78>, < -6.81, -13.53,  -3.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.24, -12.94,  -4.39>, < -6.81, -13.53,  -3.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66, -15.29,  -5.75>, < -2.04, -15.95,  -4.46>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.41, -16.62,  -3.16>, < -2.04, -15.95,  -4.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66, -15.29,  -5.75>, < -2.19, -16.46,  -6.44>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.72, -17.63,  -7.12>, < -2.19, -16.46,  -6.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55, -13.95,  -8.34>, < -8.63, -14.04,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71, -14.12,  -8.53>, < -8.63, -14.04,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.93, -13.44,  -6.54>, < -4.46, -14.36,  -6.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98, -15.29,  -5.75>, < -4.46, -14.36,  -6.15>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -3.93, -13.44,  -6.54>, < -3.50, -13.78,  -7.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07, -14.12,  -8.53>, < -3.50, -13.78,  -7.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.24, -12.94,  -4.39>, < -7.77, -14.11,  -5.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30, -15.29,  -5.75>, < -7.77, -14.11,  -5.07>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35, -17.13, -10.72>, < -9.78, -16.79,  -9.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22, -16.45,  -8.73>, < -9.78, -16.79,  -9.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.37, -17.63,  -7.12>, < -9.79, -17.04,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22, -16.45,  -8.73>, < -9.79, -17.04,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22, -16.45,  -8.73>, < -9.96, -15.29,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71, -14.12,  -8.53>, < -9.96, -15.29,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71, -14.12,  -8.53>, <-10.13, -13.53,  -9.34>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.56, -12.94, -10.14>, <-10.13, -13.53,  -9.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.71, -17.13, -10.72>, < -3.14, -16.79,  -9.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -16.45,  -8.73>, < -3.14, -16.79,  -9.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.72, -17.63,  -7.12>, < -3.15, -17.04,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -16.45,  -8.73>, < -3.15, -17.04,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -16.45,  -8.73>, < -3.32, -15.29,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07, -14.12,  -8.53>, < -3.32, -15.29,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58, -16.45,  -8.73>, < -4.65, -16.53,  -8.83>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -16.62,  -8.92>, < -4.65, -16.53,  -8.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07, -14.12,  -8.53>, < -3.49, -13.53,  -9.34>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.92, -12.94, -10.14>, < -3.49, -13.53,  -9.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
