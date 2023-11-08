#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.27*x up 38.02*y
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

cylinder {<-13.02, -15.76,  -0.00>, < 14.89, -15.76,  -0.19>, Rcell pigment {Black}}
cylinder {<-14.89, -15.76, -28.13>, < 13.02, -15.76, -28.32>, Rcell pigment {Black}}
cylinder {<-14.89,  18.10, -28.13>, < 13.02,  18.10, -28.32>, Rcell pigment {Black}}
cylinder {<-13.02,  18.10,   0.00>, < 14.89,  18.10,  -0.19>, Rcell pigment {Black}}
cylinder {<-13.02, -15.76,  -0.00>, <-14.89, -15.76, -28.13>, Rcell pigment {Black}}
cylinder {< 14.89, -15.76,  -0.19>, < 13.02, -15.76, -28.32>, Rcell pigment {Black}}
cylinder {< 14.89,  18.10,  -0.19>, < 13.02,  18.10, -28.32>, Rcell pigment {Black}}
cylinder {<-13.02,  18.10,   0.00>, <-14.89,  18.10, -28.13>, Rcell pigment {Black}}
cylinder {<-13.02, -15.76,  -0.00>, <-13.02,  18.10,   0.00>, Rcell pigment {Black}}
cylinder {< 14.89, -15.76,  -0.19>, < 14.89,  18.10,  -0.19>, Rcell pigment {Black}}
cylinder {< 13.02, -15.76, -28.32>, < 13.02,  18.10, -28.32>, Rcell pigment {Black}}
cylinder {<-14.89, -15.76, -28.13>, <-14.89,  18.10, -28.13>, Rcell pigment {Black}}
atom(< -8.55, -15.76,  -2.84>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(<-10.64, -17.55,  -2.14>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(<-10.82, -17.51,  -5.93>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #2
atom(<-11.31, -14.01,  -5.35>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #3
atom(< -8.93, -15.76,  -8.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(<-11.06, -15.76,  -5.64>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -8.98, -17.55,  -6.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-11.11, -13.97,  -3.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(< -8.50, -13.97,  -4.97>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #8
atom(<-11.02, -17.55,  -7.76>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(<-11.68, -14.01, -10.97>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #10
atom(<-11.49, -13.97,  -9.15>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -8.88, -13.97, -10.59>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -8.80, -17.51,  -2.55>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #13
atom(< -3.90, -15.76,  -2.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< -5.99, -17.55,  -2.17>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< -8.31, -14.01,  -3.14>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #16
atom(< -6.17, -17.51,  -5.97>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< -9.17, -17.51,  -8.18>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #18
atom(< -6.66, -14.01,  -5.38>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(< -4.28, -15.76,  -8.50>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -6.41, -15.76,  -5.67>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< -4.32, -17.55,  -6.38>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -6.46, -13.97,  -3.55>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -3.85, -13.97,  -5.00>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -6.37, -17.55,  -7.79>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -8.68, -14.01,  -8.76>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(< -6.84, -13.97,  -9.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< -4.23, -13.97, -10.62>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< -4.14, -17.51,  -2.58>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< -3.66, -14.01,  -3.17>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -4.52, -17.51,  -8.21>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #31
atom(< -4.03, -14.01,  -8.79>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #32
cylinder {< -8.55, -15.76,  -2.84>, < -8.43, -14.89,  -2.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -14.01,  -3.14>, < -8.43, -14.89,  -2.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.55, -15.76,  -2.84>, < -8.67, -16.63,  -2.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.80, -17.51,  -2.55>, < -8.67, -16.63,  -2.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.64, -17.55,  -2.14>, < -9.72, -17.53,  -2.34>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.80, -17.51,  -2.55>, < -9.72, -17.53,  -2.34>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.82, -17.51,  -5.93>, <-10.94, -16.63,  -5.79>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.06, -15.76,  -5.64>, <-10.94, -16.63,  -5.79>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.82, -17.51,  -5.93>, <-10.92, -17.53,  -6.85>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.02, -17.55,  -7.76>, <-10.92, -17.53,  -6.85>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.82, -17.51,  -5.93>, < -9.90, -17.53,  -6.14>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.98, -17.55,  -6.35>, < -9.90, -17.53,  -6.14>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.31, -14.01,  -5.35>, <-11.21, -13.99,  -4.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.11, -13.97,  -3.52>, <-11.21, -13.99,  -4.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.31, -14.01,  -5.35>, <-11.19, -14.89,  -5.49>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.06, -15.76,  -5.64>, <-11.19, -14.89,  -5.49>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.93, -15.76,  -8.47>, < -9.05, -16.63,  -8.32>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17, -17.51,  -8.18>, < -9.05, -16.63,  -8.32>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93, -15.76,  -8.47>, < -8.80, -14.89,  -8.62>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.68, -14.01,  -8.76>, < -8.80, -14.89,  -8.62>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.98, -17.55,  -6.35>, < -9.07, -17.53,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17, -17.51,  -8.18>, < -9.07, -17.53,  -7.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.50, -13.97,  -4.97>, < -8.41, -13.99,  -4.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -14.01,  -3.14>, < -8.41, -13.99,  -4.05>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.50, -13.97,  -4.97>, < -7.58, -13.99,  -5.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66, -14.01,  -5.38>, < -7.58, -13.99,  -5.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.02, -17.55,  -7.76>, <-10.09, -17.53,  -7.97>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17, -17.51,  -8.18>, <-10.09, -17.53,  -7.97>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.68, -14.01, -10.97>, <-11.59, -13.99, -10.06>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.49, -13.97,  -9.15>, <-11.59, -13.99, -10.06>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.88, -13.97, -10.59>, < -8.78, -13.99,  -9.68>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.68, -14.01,  -8.76>, < -8.78, -13.99,  -9.68>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.90, -15.76,  -2.88>, < -4.02, -16.63,  -2.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.14, -17.51,  -2.58>, < -4.02, -16.63,  -2.73>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.90, -15.76,  -2.88>, < -3.78, -14.89,  -3.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.66, -14.01,  -3.17>, < -3.78, -14.89,  -3.02>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.99, -17.55,  -2.17>, < -5.07, -17.53,  -2.38>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.14, -17.51,  -2.58>, < -5.07, -17.53,  -2.38>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -14.01,  -3.14>, < -7.39, -13.99,  -3.35>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.46, -13.97,  -3.55>, < -7.39, -13.99,  -3.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17, -17.51,  -5.97>, < -6.29, -16.63,  -5.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.41, -15.76,  -5.67>, < -6.29, -16.63,  -5.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17, -17.51,  -5.97>, < -6.27, -17.53,  -6.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.37, -17.55,  -7.79>, < -6.27, -17.53,  -6.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17, -17.51,  -5.97>, < -5.25, -17.53,  -6.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.32, -17.55,  -6.38>, < -5.25, -17.53,  -6.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66, -14.01,  -5.38>, < -6.56, -13.99,  -4.47>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.46, -13.97,  -3.55>, < -6.56, -13.99,  -4.47>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66, -14.01,  -5.38>, < -6.54, -14.89,  -5.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.41, -15.76,  -5.67>, < -6.54, -14.89,  -5.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.28, -15.76,  -8.50>, < -4.40, -16.63,  -8.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52, -17.51,  -8.21>, < -4.40, -16.63,  -8.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28, -15.76,  -8.50>, < -4.15, -14.89,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.03, -14.01,  -8.79>, < -4.15, -14.89,  -8.65>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.32, -17.55,  -6.38>, < -4.42, -17.53,  -7.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52, -17.51,  -8.21>, < -4.42, -17.53,  -7.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.85, -13.97,  -5.00>, < -3.75, -13.99,  -4.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.66, -14.01,  -3.17>, < -3.75, -13.99,  -4.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.37, -17.55,  -7.79>, < -5.44, -17.53,  -8.00>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52, -17.51,  -8.21>, < -5.44, -17.53,  -8.00>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.68, -14.01,  -8.76>, < -7.76, -13.99,  -8.97>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.84, -13.97,  -9.18>, < -7.76, -13.99,  -8.97>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.23, -13.97, -10.62>, < -4.13, -13.99,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.03, -14.01,  -8.79>, < -4.13, -13.99,  -9.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
