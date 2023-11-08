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
atom(< -4.89,   1.11,  -9.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -4.93,  -1.11,  -9.67>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.58,  -0.00,  -7.78>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(<  1.49,   1.11,  -9.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.45,  -1.11,  -9.67>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -4.77,  -0.00, -13.31>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -5.77,   1.73, -11.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.96,   0.00, -11.69>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -2.74,   1.65,  -9.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  0.18,   1.79,  -8.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -0.67,  -1.73,  -9.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.10,  -1.79, -11.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.64,  -1.65,  -7.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.70,   1.11, -15.27>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(< -1.74,  -1.11, -15.20>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -5.15,   0.00, -17.22>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -5.93,   1.65, -15.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -3.01,   1.79, -13.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -3.86,  -1.73, -15.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  4.80,  -0.00,  -7.78>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  1.61,  -0.00, -13.31>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.61,   1.73, -11.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  4.42,   0.00, -11.69>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(<  3.64,   1.65,  -9.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  5.71,  -1.73,  -9.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  2.28,  -1.79, -11.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  2.74,  -1.65,  -7.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.68,   1.11, -15.27>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  4.64,  -1.11, -15.20>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -2.58,   1.73, -17.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  1.23,   0.00, -17.22>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  0.45,   1.65, -15.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  3.37,   1.79, -13.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.52,  -1.73, -15.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -0.91,  -1.79, -17.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.45,  -1.65, -13.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  3.80,   1.73, -17.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  5.47,  -1.79, -17.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  5.93,  -1.65, -13.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -4.89,   1.11,  -9.74>, < -3.81,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,   1.65,  -9.50>, < -3.81,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.89,   1.11,  -9.74>, < -4.91,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -1.11,  -9.67>, < -4.91,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.89,   1.11,  -9.74>, < -5.33,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,   1.73, -11.68>, < -5.33,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -1.11,  -9.67>, < -4.29,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.64,  -1.65,  -7.93>, < -4.29,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.93,  -1.11,  -9.67>, < -4.51,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -1.79, -11.67>, < -4.51,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -0.00,  -7.78>, < -2.16,   0.83,  -8.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,   1.65,  -9.50>, < -2.16,   0.83,  -8.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -0.00,  -7.78>, < -1.12,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.67,  -1.73,  -9.47>, < -1.12,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -0.00,  -7.78>, < -2.61,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.64,  -1.65,  -7.93>, < -2.61,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -0.00,  -7.78>, < -0.70,   0.89,  -7.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,   1.79,  -8.03>, < -0.70,   0.89,  -7.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.74>, <  0.84,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,   1.79,  -8.03>, <  0.84,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.74>, <  1.05,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,   1.73, -11.68>, <  1.05,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.74>, <  2.57,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,   1.65,  -9.50>, <  2.57,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.74>, <  1.47,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -1.11,  -9.67>, <  1.47,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -1.11,  -9.67>, <  0.39,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.67,  -1.73,  -9.47>, <  0.39,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -1.11,  -9.67>, <  2.09,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.74,  -1.65,  -7.93>, <  2.09,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.45,  -1.11,  -9.67>, <  1.87,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -1.79, -11.67>, <  1.87,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -3.37,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,   0.00, -11.69>, < -3.37,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -5.27,   0.86, -12.49>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,   1.73, -11.68>, < -5.27,   0.86, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -4.43,  -0.89, -12.49>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -1.79, -11.67>, < -4.43,  -0.89, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -4.31,  -0.86, -14.15>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.86,  -1.73, -15.00>, < -4.31,  -0.86, -14.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -3.89,   0.89, -13.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.79, -13.55>, < -3.89,   0.89, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.77,  -0.00, -13.31>, < -5.35,   0.83, -14.17>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.93,   1.65, -15.02>, < -5.35,   0.83, -14.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,   0.00, -11.69>, < -2.35,   0.83, -10.59>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.74,   1.65,  -9.50>, < -2.35,   0.83, -10.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,   0.00, -11.69>, < -3.03,  -0.89, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,  -1.79, -11.67>, < -3.03,  -0.89, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,   0.00, -11.69>, < -1.21,  -0.83, -12.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -1.65, -13.45>, < -1.21,  -0.83, -12.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,   0.00, -11.69>, < -2.49,   0.89, -12.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.79, -13.55>, < -2.49,   0.89, -12.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.11, -15.27>, < -2.35,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.01,   1.79, -13.55>, < -2.35,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.11, -15.27>, < -1.72,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,  -1.11, -15.20>, < -1.72,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.11, -15.27>, < -2.14,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,   1.73, -17.20>, < -2.14,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   1.11, -15.27>, < -0.62,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   1.65, -15.02>, < -0.62,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,  -1.11, -15.20>, < -1.10,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -1.65, -13.45>, < -1.10,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,  -1.11, -15.20>, < -2.80,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.86,  -1.73, -15.00>, < -2.80,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.74,  -1.11, -15.20>, < -1.32,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.91,  -1.79, -17.19>, < -1.32,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.15,   0.00, -17.22>, < -5.54,   0.83, -16.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.93,   1.65, -15.02>, < -5.54,   0.83, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -0.00,  -7.78>, <  3.77,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.74,  -1.65,  -7.93>, <  3.77,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -0.00,  -7.78>, <  4.22,   0.83,  -8.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,   1.65,  -9.50>, <  4.22,   0.83,  -8.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.80,  -0.00,  -7.78>, <  5.26,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.71,  -1.73,  -9.47>, <  5.26,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  0.58,  -0.83, -13.38>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -1.65, -13.45>, <  0.58,  -0.83, -13.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  1.11,   0.86, -12.49>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,   1.73, -11.68>, <  1.11,   0.86, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  1.95,  -0.89, -12.49>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -1.79, -11.67>, <  1.95,  -0.89, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  3.01,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,   0.00, -11.69>, <  3.01,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  1.03,   0.83, -14.17>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   1.65, -15.02>, <  1.03,   0.83, -14.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  2.49,   0.89, -13.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.79, -13.55>, <  2.49,   0.89, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.61,  -0.00, -13.31>, <  2.07,  -0.86, -14.15>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.52,  -1.73, -15.00>, <  2.07,  -0.86, -14.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,   0.00, -11.69>, <  4.03,   0.83, -10.59>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.64,   1.65,  -9.50>, <  4.03,   0.83, -10.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,   0.00, -11.69>, <  3.35,  -0.89, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.28,  -1.79, -11.67>, <  3.35,  -0.89, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,   0.00, -11.69>, <  3.89,   0.89, -12.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.79, -13.55>, <  3.89,   0.89, -12.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.42,   0.00, -11.69>, <  5.17,  -0.83, -12.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -1.65, -13.45>, <  5.17,  -0.83, -12.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   1.11, -15.27>, <  4.03,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.37,   1.79, -13.55>, <  4.03,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   1.11, -15.27>, <  4.66,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,  -1.11, -15.20>, <  4.66,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.68,   1.11, -15.27>, <  4.24,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.80,   1.73, -17.20>, <  4.24,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,  -1.11, -15.20>, <  3.58,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.52,  -1.73, -15.00>, <  3.58,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,  -1.11, -15.20>, <  5.06,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.47,  -1.79, -17.19>, <  5.06,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.64,  -1.11, -15.20>, <  5.28,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -1.65, -13.45>, <  5.28,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   0.00, -17.22>, <  0.16,  -0.89, -17.20>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.91,  -1.79, -17.19>, <  0.16,  -0.89, -17.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   0.00, -17.22>, <  0.84,   0.83, -16.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.45,   1.65, -15.02>, <  0.84,   0.83, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
