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
atom(< -4.98,   1.11,  -9.63>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -4.90,  -1.11,  -9.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.70,   0.01,  -7.97>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(<  1.49,   1.11,  -9.63>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.58,  -1.11,  -9.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -4.94,   0.01, -13.47>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -5.85,   1.65, -11.61>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.70,  -0.01, -11.19>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -2.83,   1.78,  -9.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  0.24,   1.72,  -7.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -0.57,  -1.78,  -9.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.04,  -1.65, -11.61>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.65,  -1.70,  -7.89>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.75,   1.11, -15.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(< -1.66,  -1.11, -15.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.94,  -0.01, -16.68>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -6.07,   1.78, -14.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -3.00,   1.72, -13.40>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -3.81,  -1.78, -14.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  4.78,   0.01,  -7.97>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  1.54,   0.01, -13.47>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.63,   1.65, -11.61>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  4.78,  -0.01, -11.18>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(<  3.65,   1.78,  -9.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  5.91,  -1.78,  -9.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  2.44,  -1.65, -11.61>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  2.83,  -1.70,  -7.89>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.73,   1.11, -15.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  4.82,  -1.11, -15.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -2.61,   1.65, -17.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  1.54,  -0.01, -16.68>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  0.41,   1.78, -14.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  3.48,   1.72, -13.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.67,  -1.78, -14.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -0.80,  -1.65, -17.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.41,  -1.70, -13.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  3.87,   1.65, -17.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  5.68,  -1.65, -17.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  6.07,  -1.70, -13.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -4.98,   1.11,  -9.63>, < -4.94,   0.00,  -9.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -1.11,  -9.62>, < -4.94,   0.00,  -9.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,   1.11,  -9.63>, < -3.91,   1.45,  -9.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,   1.78,  -9.36>, < -3.91,   1.45,  -9.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,   1.11,  -9.63>, < -5.42,   1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,   1.65, -11.61>, < -5.42,   1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -1.11,  -9.62>, < -4.27,  -1.40,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.65,  -1.70,  -7.89>, < -4.27,  -1.40,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.90,  -1.11,  -9.62>, < -4.47,  -1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.65, -11.61>, < -4.47,  -1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.01,  -7.97>, < -1.14,  -0.89,  -8.66>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -1.78,  -9.35>, < -1.14,  -0.89,  -8.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.01,  -7.97>, < -2.27,   0.89,  -8.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,   1.78,  -9.36>, < -2.27,   0.89,  -8.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.01,  -7.97>, < -2.67,  -0.85,  -7.93>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.65,  -1.70,  -7.89>, < -2.67,  -0.85,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.01,  -7.97>, < -1.70,  -0.00,  -9.58>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -0.01, -11.19>, < -1.70,  -0.00,  -9.58>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.01,  -7.97>, < -0.73,   0.86,  -7.94>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,   1.72,  -7.90>, < -0.73,   0.86,  -7.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.63>, <  0.87,   1.42,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,   1.72,  -7.90>, <  0.87,   1.42,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.63>, <  2.57,   1.45,  -9.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,   1.78,  -9.36>, <  2.57,   1.45,  -9.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.63>, <  1.54,   0.00,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.11,  -9.62>, <  1.54,   0.00,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,   1.11,  -9.63>, <  1.06,   1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65, -11.61>, <  1.06,   1.38, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.11,  -9.62>, <  0.51,  -1.44,  -9.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -1.78,  -9.35>, <  0.51,  -1.44,  -9.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.11,  -9.62>, <  2.21,  -1.40,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.83,  -1.70,  -7.89>, <  2.21,  -1.40,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.58,  -1.11,  -9.62>, <  2.01,  -1.38, -10.61>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -1.65, -11.61>, <  2.01,  -1.38, -10.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -5.40,   0.83, -12.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,   1.65, -11.61>, < -5.40,   0.83, -12.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -4.49,  -0.82, -12.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.65, -11.61>, < -4.49,  -0.82, -12.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -3.97,   0.86, -13.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.00,   1.72, -13.40>, < -3.97,   0.86, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -4.38,  -0.89, -14.16>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,  -1.78, -14.85>, < -4.38,  -0.89, -14.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -5.51,   0.89, -14.17>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.07,   1.78, -14.86>, < -5.51,   0.89, -14.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,   0.01, -13.47>, < -4.94,  -0.00, -15.08>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,  -0.01, -16.68>, < -4.94,  -0.00, -15.08>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -0.01, -11.19>, < -1.13,  -0.89, -10.27>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -1.78,  -9.35>, < -1.13,  -0.89, -10.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -0.01, -11.19>, < -2.26,   0.88, -10.27>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,   1.78,  -9.36>, < -2.26,   0.88, -10.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -0.01, -11.19>, < -2.87,  -0.83, -11.40>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.65, -11.61>, < -2.87,  -0.83, -11.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -0.01, -11.19>, < -0.53,   0.82, -11.40>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65, -11.61>, < -0.53,   0.82, -11.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   1.11, -15.12>, < -2.37,   1.42, -14.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.00,   1.72, -13.40>, < -2.37,   1.42, -14.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   1.11, -15.12>, < -2.18,   1.38, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.61,   1.65, -17.11>, < -2.18,   1.38, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   1.11, -15.12>, < -1.70,   0.00, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -1.11, -15.12>, < -1.70,   0.00, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,   1.11, -15.12>, < -0.67,   1.45, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   1.78, -14.86>, < -0.67,   1.45, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -1.11, -15.12>, < -1.03,  -1.40, -14.25>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -1.70, -13.39>, < -1.03,  -1.40, -14.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -1.11, -15.12>, < -2.74,  -1.44, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,  -1.78, -14.85>, < -2.74,  -1.44, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -1.11, -15.12>, < -1.23,  -1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.80,  -1.65, -17.10>, < -1.23,  -1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,  -0.01, -16.68>, < -3.77,   0.82, -16.90>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.61,   1.65, -17.11>, < -3.77,   0.82, -16.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,  -0.01, -16.68>, < -4.37,  -0.89, -15.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.81,  -1.78, -14.85>, < -4.37,  -0.89, -15.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.94,  -0.01, -16.68>, < -5.50,   0.88, -15.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.07,   1.78, -14.86>, < -5.50,   0.88, -15.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,   0.01,  -7.97>, <  3.81,  -0.85,  -7.93>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.83,  -1.70,  -7.89>, <  3.81,  -0.85,  -7.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,   0.01,  -7.97>, <  4.78,  -0.00,  -9.58>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -0.01, -11.18>, <  4.78,  -0.00,  -9.58>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,   0.01,  -7.97>, <  5.34,  -0.89,  -8.66>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -1.78,  -9.35>, <  5.34,  -0.89,  -8.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,   0.01,  -7.97>, <  4.21,   0.89,  -8.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,   1.78,  -9.36>, <  4.21,   0.89,  -8.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  0.56,  -0.85, -13.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -1.70, -13.39>, <  0.56,  -0.85, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  1.99,  -0.82, -12.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -1.65, -11.61>, <  1.99,  -0.82, -12.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  1.08,   0.83, -12.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65, -11.61>, <  1.08,   0.83, -12.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  2.51,   0.86, -13.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.48,   1.72, -13.39>, <  2.51,   0.86, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  2.10,  -0.89, -14.16>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,  -1.78, -14.85>, <  2.10,  -0.89, -14.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  1.54,  -0.00, -15.07>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -0.01, -16.68>, <  1.54,  -0.00, -15.07>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,   0.01, -13.47>, <  0.97,   0.89, -14.16>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   1.78, -14.86>, <  0.97,   0.89, -14.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -0.01, -11.18>, <  3.61,  -0.83, -11.40>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -1.65, -11.61>, <  3.61,  -0.83, -11.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -0.01, -11.18>, <  5.35,  -0.89, -10.27>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -1.78,  -9.35>, <  5.35,  -0.89, -10.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.78,  -0.01, -11.18>, <  4.22,   0.88, -10.27>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.65,   1.78,  -9.36>, <  4.22,   0.88, -10.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   1.11, -15.12>, <  4.30,   1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,   1.65, -17.11>, <  4.30,   1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   1.11, -15.12>, <  4.11,   1.42, -14.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.48,   1.72, -13.39>, <  4.11,   1.42, -14.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   1.11, -15.12>, <  4.77,   0.00, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11, -15.12>, <  4.77,   0.00, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11, -15.12>, <  5.44,  -1.40, -14.25>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.07,  -1.70, -13.39>, <  5.44,  -1.40, -14.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11, -15.12>, <  3.74,  -1.44, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,  -1.78, -14.85>, <  3.74,  -1.44, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11, -15.12>, <  5.25,  -1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.68,  -1.65, -17.10>, <  5.25,  -1.38, -16.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -0.01, -16.68>, <  0.37,  -0.83, -16.89>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.80,  -1.65, -17.10>, <  0.37,  -0.83, -16.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -0.01, -16.68>, <  2.70,   0.82, -16.89>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,   1.65, -17.11>, <  2.70,   0.82, -16.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -0.01, -16.68>, <  2.10,  -0.89, -15.76>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.67,  -1.78, -14.85>, <  2.10,  -0.89, -15.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -0.01, -16.68>, <  0.97,   0.88, -15.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   1.78, -14.86>, <  0.97,   0.88, -15.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
