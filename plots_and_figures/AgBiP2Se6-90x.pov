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

cylinder {<-12.50, -12.50,  -0.00>, < 12.50, -12.50,  -0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, < 12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,  -0.00>, <-12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,  -0.00>, < 12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50,   0.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50,   0.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,  -0.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,  -0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
atom(< -4.20,  -1.79,  -7.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(<  0.00,  -0.21,  -7.64>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(< -4.65,  -1.79, -11.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -2.44,   1.79, -11.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -2.19,   1.79,  -7.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -3.37,   1.09,  -9.58>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -3.37,  -1.20,  -9.58>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -3.37,  -0.21, -13.48>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #7
atom(<  2.54,  -1.79,  -7.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  2.10,  -1.79, -11.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.26,  -1.79,  -9.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -0.83,  -1.79, -13.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  4.31,   1.79, -11.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  4.56,   1.79,  -7.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<  1.27,   1.79,  -9.44>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<  3.38,   1.09,  -9.58>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(<  3.38,  -1.20,  -9.58>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(<  0.01,   0.47, -11.53>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #17
atom(<  3.38,  -0.21, -13.48>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #18
atom(< -1.27,  -1.79, -17.13>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -4.63,  -1.79, -15.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(<  0.93,   1.79, -17.32>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  1.18,   1.79, -13.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -2.10,   1.79, -15.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  0.01,   1.09, -15.43>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #24
atom(<  0.00,  -1.20, -15.43>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #25
atom(< -3.37,   0.47, -17.37>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #26
atom(<  2.12,  -1.79, -15.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  4.65,   1.79, -15.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  3.38,   0.47, -17.37>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #29
cylinder {< -4.20,  -1.79,  -7.63>, < -3.79,  -1.50,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.20,  -9.58>, < -3.79,  -1.50,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.21,  -7.64>, <  0.64,   0.79,  -8.54>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,   1.79,  -9.44>, <  0.64,   0.79,  -8.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.21,  -7.64>, < -1.09,   0.79,  -7.73>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.19,   1.79,  -7.83>, < -1.09,   0.79,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.21,  -7.64>, <  1.27,  -1.00,  -7.63>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.54,  -1.79,  -7.63>, <  1.27,  -1.00,  -7.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.21,  -7.64>, < -0.63,  -1.00,  -8.74>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -1.79,  -9.84>, < -0.63,  -1.00,  -8.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.79, -11.29>, < -4.01,  -1.50, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.20,  -9.58>, < -4.01,  -1.50, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.79, -11.29>, < -4.01,  -1.00, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.21, -13.48>, < -4.01,  -1.00, -12.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,   1.79, -11.48>, < -2.90,   1.44, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.09,  -9.58>, < -2.90,   1.44, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,   1.79, -11.48>, < -1.22,   1.13, -11.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   0.47, -11.53>, < -1.22,   1.13, -11.51>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,   1.79, -11.48>, < -2.90,   0.79, -12.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.21, -13.48>, < -2.90,   0.79, -12.48>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.19,   1.79,  -7.83>, < -2.78,   1.44,  -8.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.09,  -9.58>, < -2.78,   1.44,  -8.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   1.09,  -9.58>, < -3.37,  -0.05,  -9.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.20,  -9.58>, < -3.37,  -0.05,  -9.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.20,  -9.58>, < -2.31,  -1.50,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -1.79,  -9.84>, < -2.31,  -1.50,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.21, -13.48>, < -2.10,  -1.00, -13.47>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.83,  -1.79, -13.47>, < -2.10,  -1.00, -13.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.21, -13.48>, < -4.00,  -1.00, -14.58>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.63,  -1.79, -15.68>, < -4.00,  -1.00, -14.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -0.21, -13.48>, < -2.73,   0.79, -14.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.79, -15.28>, < -2.73,   0.79, -14.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.54,  -1.79,  -7.63>, <  2.96,  -1.50,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.20,  -9.58>, <  2.96,  -1.50,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -1.79, -11.29>, <  2.74,  -1.50, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.20,  -9.58>, <  2.74,  -1.50, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -1.79, -11.29>, <  2.74,  -1.00, -12.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -0.21, -13.48>, <  2.74,  -1.00, -12.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.83,  -1.79, -13.47>, < -0.41,  -1.50, -14.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.20, -15.43>, < -0.41,  -1.50, -14.45>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.31,   1.79, -11.48>, <  3.84,   1.44, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   1.09,  -9.58>, <  3.84,   1.44, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.31,   1.79, -11.48>, <  3.84,   0.79, -12.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -0.21, -13.48>, <  3.84,   0.79, -12.48>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  4.56,   1.79,  -7.83>, <  3.97,   1.44,  -8.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   1.09,  -9.58>, <  3.97,   1.44,  -8.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,   1.79,  -9.44>, <  2.33,   1.44,  -9.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   1.09,  -9.58>, <  2.33,   1.44,  -9.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,   1.79,  -9.44>, <  0.64,   1.13, -10.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   0.47, -11.53>, <  0.64,   1.13, -10.48>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   1.09,  -9.58>, <  3.38,  -0.05,  -9.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -1.20,  -9.58>, <  3.38,  -0.05,  -9.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   0.47, -11.53>, <  0.59,   1.13, -12.60>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.79, -13.68>, <  0.59,   1.13, -12.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -0.21, -13.48>, <  4.01,   0.79, -14.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   1.79, -15.28>, <  4.01,   0.79, -14.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -0.21, -13.48>, <  2.28,   0.79, -13.58>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.79, -13.68>, <  2.28,   0.79, -13.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -0.21, -13.48>, <  2.75,  -1.00, -14.58>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.12,  -1.79, -15.68>, <  2.75,  -1.00, -14.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -1.79, -17.13>, < -0.63,  -1.50, -16.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.20, -15.43>, < -0.63,  -1.50, -16.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.93,   1.79, -17.32>, <  0.47,   1.44, -16.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   1.09, -15.43>, <  0.47,   1.44, -16.37>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.93,   1.79, -17.32>, <  2.16,   1.13, -17.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.47, -17.37>, <  2.16,   1.13, -17.35>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.79, -13.68>, <  0.59,   1.44, -14.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   1.09, -15.43>, <  0.59,   1.44, -14.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.79, -15.28>, < -1.05,   1.44, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   1.09, -15.43>, < -1.05,   1.44, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.79, -15.28>, < -2.73,   1.13, -16.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.47, -17.37>, < -2.73,   1.13, -16.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   1.09, -15.43>, <  0.00,  -0.05, -15.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.20, -15.43>, <  0.00,  -0.05, -15.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.20, -15.43>, <  1.06,  -1.50, -15.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.12,  -1.79, -15.68>, <  1.06,  -1.50, -15.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   1.79, -15.28>, <  4.01,   1.13, -16.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.47, -17.37>, <  4.01,   1.13, -16.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
