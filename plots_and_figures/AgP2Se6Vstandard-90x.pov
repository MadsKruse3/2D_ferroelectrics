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
atom(< -4.59,  -0.00,  -7.78>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #0
atom(< -1.52,   1.11,  -9.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.56,  -1.11,  -9.67>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< -4.98,   0.00, -11.69>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #3
atom(< -2.83,   1.79,  -8.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -3.68,  -1.73,  -9.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -4.71,   1.11, -15.27>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -4.75,  -1.11, -15.20>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(<  1.79,  -0.00,  -7.78>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #8
atom(<  4.86,   1.11,  -9.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(<  4.82,  -1.11,  -9.67>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(< -1.40,  -0.00, -13.31>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #11
atom(< -2.41,   1.73, -11.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  1.40,   0.00, -11.69>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #13
atom(<  0.63,   1.65,  -9.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<  3.55,   1.79,  -8.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(<  2.70,  -1.73,  -9.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -0.73,  -1.79, -11.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -0.28,  -1.65,  -7.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  1.67,   1.11, -15.27>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(<  1.63,  -1.11, -15.20>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(< -1.79,   0.00, -17.22>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #21
atom(< -2.56,   1.65, -15.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  0.36,   1.79, -13.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< -0.49,  -1.73, -15.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -3.92,  -1.79, -17.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(< -3.47,  -1.65, -13.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.98,  -0.00, -13.31>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #27
atom(<  3.97,   1.73, -11.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  0.78,   1.73, -17.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  4.59,   0.00, -17.22>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  3.82,   1.65, -15.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  2.46,  -1.79, -17.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.91,  -1.65, -13.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
cylinder {< -4.59,  -0.00,  -7.78>, < -3.71,   0.89,  -7.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,   1.79,  -8.03>, < -3.71,   0.89,  -7.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.59,  -0.00,  -7.78>, < -4.14,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.68,  -1.73,  -9.47>, < -4.14,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,   1.11,  -9.74>, < -1.54,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -1.11,  -9.67>, < -1.54,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,   1.11,  -9.74>, < -2.18,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,   1.79,  -8.03>, < -2.18,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,   1.11,  -9.74>, < -1.96,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.41,   1.73, -11.68>, < -1.96,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,   1.11,  -9.74>, < -0.45,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65,  -9.50>, < -0.45,   1.38,  -9.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -1.11,  -9.67>, < -0.92,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.28,  -1.65,  -7.93>, < -0.92,  -1.38,  -8.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -1.11,  -9.67>, < -2.62,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.68,  -1.73,  -9.47>, < -2.62,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -1.11,  -9.67>, < -1.15,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -1.79, -11.67>, < -1.15,  -1.45, -10.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,   0.00, -11.69>, < -4.22,  -0.83, -12.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,  -1.65, -13.45>, < -4.22,  -0.83, -12.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.71,   1.11, -15.27>, < -3.64,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.65, -15.02>, < -3.64,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.71,   1.11, -15.27>, < -4.73,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,  -1.11, -15.20>, < -4.73,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,  -1.11, -15.20>, < -4.34,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.92,  -1.79, -17.19>, < -4.34,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,  -1.11, -15.20>, < -4.11,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,  -1.65, -13.45>, < -4.11,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.00,  -7.78>, <  0.76,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.28,  -1.65,  -7.93>, <  0.76,  -0.83,  -7.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.00,  -7.78>, <  1.21,   0.83,  -8.64>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65,  -9.50>, <  1.21,   0.83,  -8.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.00,  -7.78>, <  2.67,   0.89,  -7.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.55,   1.79,  -8.03>, <  2.67,   0.89,  -7.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.00,  -7.78>, <  2.24,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  2.70,  -1.73,  -9.47>, <  2.24,  -0.86,  -8.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,   1.11,  -9.74>, <  4.20,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.55,   1.79,  -8.03>, <  4.20,   1.45,  -8.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,   1.11,  -9.74>, <  4.42,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.97,   1.73, -11.68>, <  4.42,   1.42, -10.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,   1.11,  -9.74>, <  4.84,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11,  -9.67>, <  4.84,  -0.00,  -9.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -1.11,  -9.67>, <  3.76,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.70,  -1.73,  -9.47>, <  3.76,  -1.42,  -9.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -1.91,   0.86, -12.49>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.41,   1.73, -11.68>, < -1.91,   0.86, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -1.07,  -0.89, -12.49>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -1.79, -11.67>, < -1.07,  -0.89, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -1.98,   0.83, -14.17>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.65, -15.02>, < -1.98,   0.83, -14.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -2.43,  -0.83, -13.38>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,  -1.65, -13.45>, < -2.43,  -0.83, -13.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -0.95,  -0.86, -14.15>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -1.73, -15.00>, < -0.95,  -0.86, -14.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,   0.00, -11.69>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,  -0.00, -13.31>, < -0.52,   0.89, -13.43>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.79, -13.55>, < -0.52,   0.89, -13.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,   0.00, -11.69>, <  0.34,  -0.89, -11.68>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -1.79, -11.67>, <  0.34,  -0.89, -11.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,   0.00, -11.69>, <  1.02,   0.83, -10.59>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,   1.65,  -9.50>, <  1.02,   0.83, -10.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,   0.00, -11.69>, <  2.16,  -0.83, -12.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,  -1.65, -13.45>, <  2.16,  -0.83, -12.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,   0.00, -11.69>, <  0.88,   0.89, -12.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.79, -13.55>, <  0.88,   0.89, -12.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   1.11, -15.27>, <  1.65,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,  -1.11, -15.20>, <  1.65,  -0.00, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   1.11, -15.27>, <  2.74,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.65, -15.02>, <  2.74,   1.38, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   1.11, -15.27>, <  1.01,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.79, -13.55>, <  1.01,   1.45, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   1.11, -15.27>, <  1.23,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.78,   1.73, -17.20>, <  1.23,   1.42, -16.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,  -1.11, -15.20>, <  0.57,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -1.73, -15.00>, <  0.57,  -1.42, -15.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,  -1.11, -15.20>, <  2.27,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,  -1.65, -13.45>, <  2.27,  -1.38, -14.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,  -1.11, -15.20>, <  2.04,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.46,  -1.79, -17.19>, <  2.04,  -1.45, -16.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   0.00, -17.22>, < -2.17,   0.83, -16.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.65, -15.02>, < -2.17,   0.83, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   0.00, -17.22>, < -2.85,  -0.89, -17.20>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.92,  -1.79, -17.19>, < -2.85,  -0.89, -17.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,  -0.00, -13.31>, <  4.47,   0.86, -12.49>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.97,   1.73, -11.68>, <  4.47,   0.86, -12.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,  -0.00, -13.31>, <  3.95,  -0.83, -13.38>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,  -1.65, -13.45>, <  3.95,  -0.83, -13.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,  -0.00, -13.31>, <  4.40,   0.83, -14.17>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.65, -15.02>, <  4.40,   0.83, -14.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.59,   0.00, -17.22>, <  3.53,  -0.89, -17.20>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.46,  -1.79, -17.19>, <  3.53,  -0.89, -17.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.59,   0.00, -17.22>, <  4.21,   0.83, -16.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.65, -15.02>, <  4.21,   0.83, -16.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
