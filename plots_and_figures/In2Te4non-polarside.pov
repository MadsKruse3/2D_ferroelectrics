#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -37.92*x up 35.91*y
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

cylinder {< -7.47, -17.10,  -0.00>, < 18.06, -17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<-18.06, -17.10, -38.99>, <  7.47, -17.10, -39.02>, Rcell pigment {Black}}
cylinder {<-18.06,  17.10, -38.99>, <  7.47,  17.10, -39.02>, Rcell pigment {Black}}
cylinder {< -7.47,  17.10,   0.00>, < 18.06,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {< -7.47, -17.10,  -0.00>, <-18.06, -17.10, -38.99>, Rcell pigment {Black}}
cylinder {< 18.06, -17.10,  -0.03>, <  7.47, -17.10, -39.02>, Rcell pigment {Black}}
cylinder {< 18.06,  17.10,  -0.03>, <  7.47,  17.10, -39.02>, Rcell pigment {Black}}
cylinder {< -7.47,  17.10,   0.00>, <-18.06,  17.10, -38.99>, Rcell pigment {Black}}
cylinder {< -7.47, -17.10,  -0.00>, < -7.47,  17.10,   0.00>, Rcell pigment {Black}}
cylinder {< 18.06, -17.10,  -0.03>, < 18.06,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<  7.47, -17.10, -39.02>, <  7.47,  17.10, -39.02>, Rcell pigment {Black}}
cylinder {<-18.06, -17.10, -38.99>, <-18.06,  17.10, -38.99>, Rcell pigment {Black}}
atom(< -5.73,  -2.63,  -2.91>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -5.73,   1.25,  -5.93>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -3.61,  -0.91,  -2.33>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #2
atom(< -5.72,  -0.91, -10.13>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(< -3.60,  -0.61,  -5.24>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #4
atom(< -1.48,  -2.63,  -2.92>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -1.48,   1.25,  -5.94>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  0.65,  -0.91,  -2.34>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #7
atom(< -3.60,   3.27,  -8.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -3.60,  -2.63, -10.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #9
atom(< -5.73,   1.55,  -8.84>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -1.47,  -0.91, -10.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #11
atom(<  0.65,  -0.61,  -5.24>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(<  0.65,   3.27,  -8.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(<  0.66,  -2.63, -10.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -1.48,   1.55,  -8.85>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
cylinder {< -5.73,  -2.63,  -2.91>, < -4.67,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.61,  -0.91,  -2.33>, < -4.67,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,   1.25,  -5.93>, < -4.67,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -0.61,  -5.24>, < -4.67,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,   1.25,  -5.93>, < -5.73,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,   1.55,  -8.84>, < -5.73,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.61,  -0.91,  -2.33>, < -3.61,  -0.76,  -3.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -0.61,  -5.24>, < -3.61,  -0.76,  -3.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.61,  -0.91,  -2.33>, < -2.54,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,  -2.63,  -2.92>, < -2.54,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.72,  -0.91, -10.13>, < -4.66,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -2.63, -10.72>, < -4.66,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.72,  -0.91, -10.13>, < -5.73,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,   1.55,  -8.84>, < -5.73,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -0.61,  -5.24>, < -2.54,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.25,  -5.94>, < -2.54,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,  -2.63,  -2.92>, < -0.42,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.65,  -0.91,  -2.34>, < -0.42,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.25,  -5.94>, < -0.41,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.65,  -0.61,  -5.24>, < -0.41,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.25,  -5.94>, < -1.48,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.55,  -8.85>, < -1.48,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65,  -0.91,  -2.34>, <  0.65,  -0.76,  -3.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65,  -0.61,  -5.24>, <  0.65,  -0.76,  -3.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,   3.27,  -8.26>, < -4.67,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,   1.55,  -8.84>, < -4.67,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,   3.27,  -8.26>, < -2.54,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.55,  -8.85>, < -2.54,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -2.63, -10.72>, < -2.53,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -0.91, -10.14>, < -2.53,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -0.91, -10.14>, < -0.41,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.66,  -2.63, -10.72>, < -0.41,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -0.91, -10.14>, < -1.47,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.55,  -8.85>, < -1.47,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65,   3.27,  -8.27>, < -0.41,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,   1.55,  -8.85>, < -0.41,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
// no constraints
