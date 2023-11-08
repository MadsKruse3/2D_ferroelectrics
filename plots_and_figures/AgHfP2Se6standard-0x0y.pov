#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -26.25*x up 26.25*y
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

cylinder {<-12.50, -12.50, -25.00>, < 12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,   0.00>, < 12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,   0.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50, -25.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
atom(< -4.89,  -2.76, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -4.93,  -2.83, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.58,  -4.72, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(<  1.49,  -2.76, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.45,  -2.83, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -4.77,   0.81, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -5.77,  -0.82, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.96,  -0.81, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -2.74,  -3.00, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  0.18,  -4.47, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -0.67,  -3.03, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.10,  -0.83, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.64,  -4.57, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.70,   2.77, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(< -1.74,   2.70, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -5.15,   4.72, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -5.93,   2.52, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -3.01,   1.05, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -3.86,   2.50, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  4.80,  -4.72, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  1.61,   0.81, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.61,  -0.82, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  4.42,  -0.81, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(<  3.64,  -3.00, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  5.71,  -3.03, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  2.28,  -0.83, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  2.74,  -4.57, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.68,   2.77, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  4.64,   2.70, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -2.58,   4.70, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  1.23,   4.72, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  0.45,   2.52, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  3.37,   1.05, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.52,   2.50, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -0.91,   4.69, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.45,   0.95, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  3.80,   4.70, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  5.47,   4.69, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  5.93,   0.95, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -4.89,  -2.76, -11.39>, < -3.81,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,  -3.00, -10.85>, < -3.81,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.89,  -2.76, -11.39>, < -4.91,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -2.83, -13.61>, < -4.91,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.89,  -2.76, -11.39>, < -5.33,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,  -0.82, -10.77>, < -5.33,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -2.83, -13.61>, < -4.29,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.64,  -4.57, -14.15>, < -4.29,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -2.83, -13.61>, < -4.51,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -0.83, -14.29>, < -4.51,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -4.72, -12.50>, < -2.16,  -3.86, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,  -3.00, -10.85>, < -2.16,  -3.86, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -4.72, -12.50>, < -1.12,  -3.87, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.67,  -3.03, -14.23>, < -1.12,  -3.87, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -4.72, -12.50>, < -2.61,  -4.64, -13.33>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.64,  -4.57, -14.15>, < -2.61,  -4.64, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -4.72, -12.50>, < -0.70,  -4.59, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,  -4.47, -10.71>, < -0.70,  -4.59, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.76, -11.39>, <  0.84,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,  -4.47, -10.71>, <  0.84,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.76, -11.39>, <  1.05,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -0.82, -10.77>, <  1.05,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.76, -11.39>, <  2.57,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,  -3.00, -10.85>, <  2.57,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.76, -11.39>, <  1.47,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -2.83, -13.61>, <  1.47,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -2.83, -13.61>, <  0.39,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.67,  -3.03, -14.23>, <  0.39,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -2.83, -13.61>, <  2.09,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.74,  -4.57, -14.15>, <  2.09,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -2.83, -13.61>, <  1.87,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -0.83, -14.29>, <  1.87,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -3.37,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -0.81, -12.50>, < -3.37,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -5.27,  -0.01, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,  -0.82, -10.77>, < -5.27,  -0.01, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -4.43,  -0.01, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -0.83, -14.29>, < -4.43,  -0.01, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -4.31,   1.65, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.86,   2.50, -14.23>, < -4.31,   1.65, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -3.89,   0.93, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.05, -10.71>, < -3.89,   0.93, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,   0.81, -12.50>, < -5.35,   1.67, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.93,   2.52, -10.85>, < -5.35,   1.67, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -0.81, -12.50>, < -2.35,  -1.91, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,  -3.00, -10.85>, < -2.35,  -1.91, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -0.81, -12.50>, < -3.03,  -0.82, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -0.83, -14.29>, < -3.03,  -0.82, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -0.81, -12.50>, < -1.21,   0.07, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,   0.95, -14.15>, < -1.21,   0.07, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -0.81, -12.50>, < -2.49,   0.12, -11.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.05, -10.71>, < -2.49,   0.12, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.77, -11.39>, < -2.35,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.05, -10.71>, < -2.35,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.77, -11.39>, < -1.72,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,   2.70, -13.61>, < -1.72,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.77, -11.39>, < -2.14,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,   4.70, -10.77>, < -2.14,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.77, -11.39>, < -0.62,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   2.52, -10.85>, < -0.62,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,   2.70, -13.61>, < -1.10,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,   0.95, -14.15>, < -1.10,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,   2.70, -13.61>, < -2.80,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.86,   2.50, -14.23>, < -2.80,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,   2.70, -13.61>, < -1.32,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.91,   4.69, -14.29>, < -1.32,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.15,   4.72, -12.50>, < -5.54,   3.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.93,   2.52, -10.85>, < -5.54,   3.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -4.72, -12.50>, <  3.77,  -4.64, -13.33>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.74,  -4.57, -14.15>, <  3.77,  -4.64, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -4.72, -12.50>, <  4.22,  -3.86, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,  -3.00, -10.85>, <  4.22,  -3.86, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -4.72, -12.50>, <  5.26,  -3.87, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.71,  -3.03, -14.23>, <  5.26,  -3.87, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  0.58,   0.88, -13.33>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,   0.95, -14.15>, <  0.58,   0.88, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  1.11,  -0.01, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -0.82, -10.77>, <  1.11,  -0.01, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  1.95,  -0.01, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -0.83, -14.29>, <  1.95,  -0.01, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  3.01,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,  -0.81, -12.50>, <  3.01,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  1.03,   1.67, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   2.52, -10.85>, <  1.03,   1.67, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  2.49,   0.93, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.05, -10.71>, <  2.49,   0.93, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,   0.81, -12.50>, <  2.07,   1.65, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.52,   2.50, -14.23>, <  2.07,   1.65, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,  -0.81, -12.50>, <  4.03,  -1.91, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,  -3.00, -10.85>, <  4.03,  -1.91, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,  -0.81, -12.50>, <  3.35,  -0.82, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -0.83, -14.29>, <  3.35,  -0.82, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,  -0.81, -12.50>, <  3.89,   0.12, -11.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.05, -10.71>, <  3.89,   0.12, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,  -0.81, -12.50>, <  5.17,   0.07, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,   0.95, -14.15>, <  5.17,   0.07, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   2.77, -11.39>, <  4.03,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.05, -10.71>, <  4.03,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   2.77, -11.39>, <  4.66,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,   2.70, -13.61>, <  4.66,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   2.77, -11.39>, <  4.24,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.80,   4.70, -10.77>, <  4.24,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,   2.70, -13.61>, <  3.58,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.52,   2.50, -14.23>, <  3.58,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,   2.70, -13.61>, <  5.06,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.47,   4.69, -14.29>, <  5.06,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,   2.70, -13.61>, <  5.28,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,   0.95, -14.15>, <  5.28,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   4.72, -12.50>, <  0.16,   4.70, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.91,   4.69, -14.29>, <  0.16,   4.70, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   4.72, -12.50>, <  0.84,   3.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   2.52, -10.85>, <  0.84,   3.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
