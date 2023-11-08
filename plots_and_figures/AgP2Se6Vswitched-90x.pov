#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -60.29*x up 35.15*y
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

cylinder {< -9.57, -16.74,  -0.00>, < 28.71, -16.74,  -0.00>, Rcell pigment {Black}}
cylinder {<-28.71, -16.74, -33.15>, <  9.57, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {<-28.71,  16.74, -33.15>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57,  16.74,   0.00>, < 28.71,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.74,  -0.00>, <-28.71, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {< 28.71, -16.74,  -0.00>, <  9.57, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {< 28.71,  16.74,   0.00>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57,  16.74,   0.00>, <-28.71,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57, -16.74,  -0.00>, < -9.57,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {< 28.71, -16.74,  -0.00>, < 28.71,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {<  9.57, -16.74, -33.15>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {<-28.71, -16.74, -33.15>, <-28.71,  16.74, -33.15>, Rcell pigment {Black}}
atom(< -7.64,   1.11,  -6.99>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -7.55,  -1.11,  -6.99>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -8.87,   1.73,  -5.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.41,   0.00,  -5.31>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #3
atom(< -1.26,   1.11,  -6.99>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -1.17,  -1.11,  -6.99>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -7.60,   0.00, -10.84>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #6
atom(< -8.50,   1.65,  -8.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -4.41,  -0.00,  -8.55>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -5.49,   1.79,  -6.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.49,   1.73,  -5.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -3.32,  -1.79,  -6.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -6.69,  -1.65,  -8.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.32,  -1.73,  -5.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -4.45,   1.11, -12.52>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.36,  -1.11, -12.52>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -7.60,  -0.00, -14.08>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -8.68,   1.79, -12.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.68,   1.73, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -6.51,  -1.79, -12.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  1.97,   0.00,  -5.31>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #20
atom(< -1.22,   0.00, -10.84>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #21
atom(< -2.12,   1.65,  -8.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  1.97,  -0.00,  -8.55>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(<  0.89,   1.79,  -6.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.89,   1.73,  -5.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  3.06,  -1.79,  -6.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -0.31,  -1.65,  -8.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  0.06,  -1.73,  -5.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  1.93,   1.11, -12.52>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  2.02,  -1.11, -12.52>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -5.31,   1.65, -14.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.22,  -0.00, -14.08>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -2.30,   1.79, -12.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  0.70,   1.73, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.13,  -1.79, -12.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -3.50,  -1.65, -14.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -3.13,  -1.73, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  4.26,   1.65,  -8.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(<  1.07,   1.65, -14.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(<  4.08,   1.79, -12.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  2.88,  -1.65, -14.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  3.25,  -1.73, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -7.64,   1.11,  -6.99>, < -8.25,   1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.87,   1.73,  -5.26>, < -8.25,   1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,   1.11,  -6.99>, < -7.60,   0.00,  -6.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -1.11,  -6.99>, < -7.60,   0.00,  -6.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,   1.11,  -6.99>, < -6.57,   1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.79,  -6.72>, < -6.57,   1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,   1.11,  -6.99>, < -8.07,   1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,   1.65,  -8.98>, < -8.07,   1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -1.11,  -6.99>, < -6.94,  -1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.32,  -1.73,  -5.26>, < -6.94,  -1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -1.11,  -6.99>, < -7.12,  -1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -1.65,  -8.98>, < -7.12,  -1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,   0.00,  -5.31>, < -3.45,   0.86,  -5.29>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.49,   1.73,  -5.26>, < -3.45,   0.86,  -5.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,   0.00,  -5.31>, < -5.36,  -0.86,  -5.29>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.32,  -1.73,  -5.26>, < -5.36,  -0.86,  -5.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,   0.00,  -5.31>, < -4.41,  -0.00,  -6.93>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -0.00,  -8.55>, < -4.41,  -0.00,  -6.93>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,   0.00,  -5.31>, < -4.95,   0.89,  -6.02>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.79,  -6.72>, < -4.95,   0.89,  -6.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,   0.00,  -5.31>, < -3.86,  -0.89,  -6.02>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.79,  -6.72>, < -3.86,  -0.89,  -6.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,   1.11,  -6.99>, < -1.87,   1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.49,   1.73,  -5.26>, < -1.87,   1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,   1.11,  -6.99>, < -1.69,   1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,   1.65,  -8.98>, < -1.69,   1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,   1.11,  -6.99>, < -1.22,   0.00,  -6.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -1.11,  -6.99>, < -1.22,   0.00,  -6.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,   1.11,  -6.99>, < -0.19,   1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.79,  -6.72>, < -0.19,   1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -1.11,  -6.99>, < -2.25,  -1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.79,  -6.72>, < -2.25,  -1.45,  -6.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -1.11,  -6.99>, < -0.74,  -1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -1.65,  -8.98>, < -0.74,  -1.38,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -1.11,  -6.99>, < -0.56,  -1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.06,  -1.73,  -5.26>, < -0.56,  -1.42,  -6.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -7.14,  -0.83,  -9.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -1.65,  -8.98>, < -7.14,  -0.83,  -9.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -8.05,   0.83,  -9.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,   1.65,  -8.98>, < -8.05,   0.83,  -9.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -6.64,   0.86, -10.81>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,   1.73, -10.78>, < -6.64,   0.86, -10.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -7.05,  -0.89, -11.54>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -1.79, -12.24>, < -7.05,  -0.89, -11.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -8.14,   0.89, -11.54>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,   1.79, -12.24>, < -8.14,   0.89, -11.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,   0.00, -10.84>, < -7.60,  -0.00, -12.46>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -0.00, -14.08>, < -7.60,  -0.00, -12.46>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -0.00,  -8.55>, < -4.95,   0.89,  -7.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   1.79,  -6.72>, < -4.95,   0.89,  -7.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -0.00,  -8.55>, < -3.86,  -0.89,  -7.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.79,  -6.72>, < -3.86,  -0.89,  -7.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -0.00,  -8.55>, < -5.55,  -0.83,  -8.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -1.65,  -8.98>, < -5.55,  -0.83,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -0.00,  -8.55>, < -3.26,   0.83,  -8.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,   1.65,  -8.98>, < -3.26,   0.83,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,   1.11, -12.52>, < -5.06,   1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,   1.73, -10.78>, < -5.06,   1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,   1.11, -12.52>, < -4.41,   0.00, -12.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -1.11, -12.52>, < -4.41,   0.00, -12.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,   1.11, -12.52>, < -4.88,   1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.31,   1.65, -14.50>, < -4.88,   1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,   1.11, -12.52>, < -3.38,   1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,   1.79, -12.24>, < -3.38,   1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -1.11, -12.52>, < -3.75,  -1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.13,  -1.73, -10.78>, < -3.75,  -1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -1.11, -12.52>, < -5.44,  -1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -1.79, -12.24>, < -5.44,  -1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -1.11, -12.52>, < -3.93,  -1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.50,  -1.65, -14.50>, < -3.93,  -1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -0.00, -14.08>, < -7.05,  -0.89, -13.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -1.79, -12.24>, < -7.05,  -0.89, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -0.00, -14.08>, < -8.14,   0.89, -13.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,   1.79, -12.24>, < -8.14,   0.89, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -0.00, -14.08>, < -6.45,   0.83, -14.29>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.31,   1.65, -14.50>, < -6.45,   0.83, -14.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,   0.00,  -5.31>, <  1.97,  -0.00,  -6.93>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -0.00,  -8.55>, <  1.97,  -0.00,  -6.93>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,   0.00,  -5.31>, <  2.52,  -0.89,  -6.02>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.06,  -1.79,  -6.72>, <  2.52,  -0.89,  -6.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,   0.00,  -5.31>, <  1.02,  -0.86,  -5.29>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.06,  -1.73,  -5.26>, <  1.02,  -0.86,  -5.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,   0.00,  -5.31>, <  1.43,   0.89,  -6.02>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.79,  -6.72>, <  1.43,   0.89,  -6.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,   0.00,  -5.31>, <  2.93,   0.86,  -5.29>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.89,   1.73,  -5.26>, <  2.93,   0.86,  -5.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -2.17,  -0.86, -10.81>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.13,  -1.73, -10.78>, < -2.17,  -0.86, -10.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -1.67,   0.83,  -9.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,   1.65,  -8.98>, < -1.67,   0.83,  -9.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -0.76,  -0.83,  -9.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -1.65,  -8.98>, < -0.76,  -0.83,  -9.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -0.26,   0.86, -10.81>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.70,   1.73, -10.78>, < -0.26,   0.86, -10.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -0.67,  -0.89, -11.54>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -1.79, -12.24>, < -0.67,  -0.89, -11.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -1.76,   0.89, -11.54>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,   1.79, -12.24>, < -1.76,   0.89, -11.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   0.00, -10.84>, < -1.22,  -0.00, -12.46>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -0.00, -14.08>, < -1.22,  -0.00, -12.46>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -0.00,  -8.55>, <  2.52,  -0.89,  -7.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.06,  -1.79,  -6.72>, <  2.52,  -0.89,  -7.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -0.00,  -8.55>, <  0.83,  -0.83,  -8.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -1.65,  -8.98>, <  0.83,  -0.83,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -0.00,  -8.55>, <  1.43,   0.89,  -7.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.79,  -6.72>, <  1.43,   0.89,  -7.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -0.00,  -8.55>, <  3.12,   0.83,  -8.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  4.26,   1.65,  -8.98>, <  3.12,   0.83,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,   1.11, -12.52>, <  1.32,   1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.70,   1.73, -10.78>, <  1.32,   1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,   1.11, -12.52>, <  1.97,   0.00, -12.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -1.11, -12.52>, <  1.97,   0.00, -12.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,   1.11, -12.52>, <  1.50,   1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,   1.65, -14.50>, <  1.50,   1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,   1.11, -12.52>, <  3.00,   1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.08,   1.79, -12.24>, <  3.00,   1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -1.11, -12.52>, <  2.63,  -1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.25,  -1.73, -10.78>, <  2.63,  -1.42, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -1.11, -12.52>, <  0.94,  -1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -1.79, -12.24>, <  0.94,  -1.45, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -1.11, -12.52>, <  2.45,  -1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.88,  -1.65, -14.50>, <  2.45,  -1.38, -13.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -0.00, -14.08>, < -2.36,  -0.83, -14.29>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.50,  -1.65, -14.50>, < -2.36,  -0.83, -14.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -0.00, -14.08>, < -0.67,  -0.89, -13.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -1.79, -12.24>, < -0.67,  -0.89, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -0.00, -14.08>, < -1.76,   0.89, -13.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,   1.79, -12.24>, < -1.76,   0.89, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -0.00, -14.08>, < -0.07,   0.83, -14.29>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,   1.65, -14.50>, < -0.07,   0.83, -14.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
