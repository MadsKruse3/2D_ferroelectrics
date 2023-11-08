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
atom(< -4.98,  -2.87, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -4.90,  -2.88, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.70,  -4.53, -12.49>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(<  1.49,  -2.87, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.58,  -2.88, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -4.94,   0.97, -12.49>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -5.85,  -0.89, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.70,  -1.31, -12.51>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -2.83,  -3.14, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  0.24,  -4.60, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -0.57,  -3.15, -14.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.04,  -0.89, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.65,  -4.61, -14.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.75,   2.62, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(< -1.66,   2.62, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.94,   4.18, -12.51>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -6.07,   2.36, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -3.00,   0.90, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -3.81,   2.35, -14.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  4.78,  -4.53, -12.49>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  1.54,   0.97, -12.49>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.63,  -0.89, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  4.78,  -1.32, -12.51>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(<  3.65,  -3.14, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  5.91,  -3.15, -14.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  2.44,  -0.89, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  2.83,  -4.61, -14.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.73,   2.62, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  4.82,   2.62, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -2.61,   4.61, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  1.54,   4.18, -12.51>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  0.41,   2.36, -10.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  3.48,   0.89, -10.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.67,   2.35, -14.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -0.80,   4.60, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.41,   0.89, -14.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  3.87,   4.61, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  5.68,   4.60, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  6.07,   0.89, -14.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -4.98,  -2.87, -11.39>, < -4.94,  -2.87, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -2.88, -13.61>, < -4.94,  -2.87, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,  -2.87, -11.39>, < -3.91,  -3.00, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,  -3.14, -10.72>, < -3.91,  -3.00, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,  -2.87, -11.39>, < -5.42,  -1.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,  -0.89, -10.85>, < -5.42,  -1.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -2.88, -13.61>, < -4.27,  -3.74, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.65,  -4.61, -14.20>, < -4.27,  -3.74, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -2.88, -13.61>, < -4.47,  -1.88, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -0.89, -14.15>, < -4.47,  -1.88, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.53, -12.49>, < -1.14,  -3.84, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -3.15, -14.28>, < -1.14,  -3.84, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.53, -12.49>, < -2.27,  -3.83, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,  -3.14, -10.72>, < -2.27,  -3.83, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.53, -12.49>, < -2.67,  -4.57, -13.35>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.65,  -4.61, -14.20>, < -2.67,  -4.57, -13.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.53, -12.49>, < -1.70,  -2.92, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.31, -12.51>, < -1.70,  -2.92, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -4.53, -12.49>, < -0.73,  -4.56, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -4.60, -10.78>, < -0.73,  -4.56, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.87, -11.39>, <  0.87,  -3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -4.60, -10.78>, <  0.87,  -3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.87, -11.39>, <  2.57,  -3.01, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,  -3.14, -10.72>, <  2.57,  -3.01, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.87, -11.39>, <  1.54,  -2.88, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -2.88, -13.61>, <  1.54,  -2.88, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -2.87, -11.39>, <  1.06,  -1.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -0.89, -10.85>, <  1.06,  -1.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -2.88, -13.61>, <  0.51,  -3.01, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -3.15, -14.28>, <  0.51,  -3.01, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -2.88, -13.61>, <  2.21,  -3.74, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.83,  -4.61, -14.20>, <  2.21,  -3.74, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -2.88, -13.61>, <  2.01,  -1.89, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -0.89, -14.15>, <  2.01,  -1.89, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -5.40,   0.04, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,  -0.89, -10.85>, < -5.40,   0.04, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -4.49,   0.04, -13.32>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -0.89, -14.15>, < -4.49,   0.04, -13.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -3.97,   0.93, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.00,   0.90, -10.78>, < -3.97,   0.93, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -4.38,   1.66, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,   2.35, -14.28>, < -4.38,   1.66, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -5.51,   1.67, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.07,   2.36, -10.72>, < -5.51,   1.67, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.97, -12.49>, < -4.94,   2.58, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   4.18, -12.51>, < -4.94,   2.58, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.31, -12.51>, < -1.13,  -2.23, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -3.15, -14.28>, < -1.13,  -2.23, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.31, -12.51>, < -2.26,  -2.23, -11.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,  -3.14, -10.72>, < -2.26,  -2.23, -11.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.31, -12.51>, < -2.87,  -1.10, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -0.89, -14.15>, < -2.87,  -1.10, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.31, -12.51>, < -0.53,  -1.10, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -0.89, -10.85>, < -0.53,  -1.10, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   2.62, -11.39>, < -2.37,   1.76, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.00,   0.90, -10.78>, < -2.37,   1.76, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   2.62, -11.39>, < -2.18,   3.62, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.61,   4.61, -10.85>, < -2.18,   3.62, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   2.62, -11.39>, < -1.70,   2.62, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,   2.62, -13.61>, < -1.70,   2.62, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   2.62, -11.39>, < -0.67,   2.49, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   2.36, -10.72>, < -0.67,   2.49, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,   2.62, -13.61>, < -1.03,   1.75, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   0.89, -14.20>, < -1.03,   1.75, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,   2.62, -13.61>, < -2.74,   2.48, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,   2.35, -14.28>, < -2.74,   2.48, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,   2.62, -13.61>, < -1.23,   3.61, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.80,   4.60, -14.15>, < -1.23,   3.61, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   4.18, -12.51>, < -3.77,   4.40, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.61,   4.61, -10.85>, < -3.77,   4.40, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   4.18, -12.51>, < -4.37,   3.27, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,   2.35, -14.28>, < -4.37,   3.27, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   4.18, -12.51>, < -5.50,   3.27, -11.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.07,   2.36, -10.72>, < -5.50,   3.27, -11.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -4.53, -12.49>, <  3.81,  -4.57, -13.35>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.83,  -4.61, -14.20>, <  3.81,  -4.57, -13.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -4.53, -12.49>, <  4.78,  -2.92, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -1.32, -12.51>, <  4.78,  -2.92, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -4.53, -12.49>, <  5.34,  -3.84, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -3.15, -14.28>, <  5.34,  -3.84, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -4.53, -12.49>, <  4.21,  -3.83, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,  -3.14, -10.72>, <  4.21,  -3.83, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  0.56,   0.93, -13.35>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   0.89, -14.20>, <  0.56,   0.93, -13.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  1.99,   0.04, -13.32>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -0.89, -14.15>, <  1.99,   0.04, -13.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  1.08,   0.04, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -0.89, -10.85>, <  1.08,   0.04, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  2.51,   0.93, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.48,   0.89, -10.78>, <  2.51,   0.93, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  2.10,   1.66, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,   2.35, -14.28>, <  2.10,   1.66, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  1.54,   2.57, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   4.18, -12.51>, <  1.54,   2.57, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.97, -12.49>, <  0.97,   1.66, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   2.36, -10.72>, <  0.97,   1.66, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -1.32, -12.51>, <  3.61,  -1.10, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -0.89, -14.15>, <  3.61,  -1.10, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -1.32, -12.51>, <  5.35,  -2.23, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -3.15, -14.28>, <  5.35,  -2.23, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -1.32, -12.51>, <  4.22,  -2.23, -11.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,  -3.14, -10.72>, <  4.22,  -2.23, -11.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.62, -11.39>, <  4.30,   3.61, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,   4.61, -10.85>, <  4.30,   3.61, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.62, -11.39>, <  4.11,   1.76, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.48,   0.89, -10.78>, <  4.11,   1.76, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.62, -11.39>, <  4.77,   2.62, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,   2.62, -13.61>, <  4.77,   2.62, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,   2.62, -13.61>, <  5.44,   1.75, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.07,   0.89, -14.20>, <  5.44,   1.75, -13.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,   2.62, -13.61>, <  3.74,   2.48, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,   2.35, -14.28>, <  3.74,   2.48, -13.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,   2.62, -13.61>, <  5.25,   3.61, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.68,   4.60, -14.15>, <  5.25,   3.61, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   4.18, -12.51>, <  0.37,   4.39, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.80,   4.60, -14.15>, <  0.37,   4.39, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   4.18, -12.51>, <  2.70,   4.39, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,   4.61, -10.85>, <  2.70,   4.39, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   4.18, -12.51>, <  2.10,   3.26, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,   2.35, -14.28>, <  2.10,   3.26, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   4.18, -12.51>, <  0.97,   3.27, -11.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   2.36, -10.72>, <  0.97,   3.27, -11.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
