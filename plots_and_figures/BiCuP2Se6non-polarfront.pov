#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -59.28*x up 30.21*y
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

cylinder {<-11.62, -14.38, -33.52>, < 28.23, -14.38, -33.52>, Rcell pigment {Black}}
cylinder {<-28.23,  14.38, -33.52>, < 11.62,  14.38, -33.52>, Rcell pigment {Black}}
cylinder {<-28.23,  14.38,   0.00>, < 11.62,  14.38,   0.00>, Rcell pigment {Black}}
cylinder {<-11.62, -14.38,   0.00>, < 28.23, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {<-11.62, -14.38, -33.52>, <-28.23,  14.38, -33.52>, Rcell pigment {Black}}
cylinder {< 28.23, -14.38, -33.52>, < 11.62,  14.38, -33.52>, Rcell pigment {Black}}
cylinder {< 28.23, -14.38,   0.00>, < 11.62,  14.38,   0.00>, Rcell pigment {Black}}
cylinder {<-11.62, -14.38,   0.00>, <-28.23,  14.38,   0.00>, Rcell pigment {Black}}
cylinder {<-11.62, -14.38, -33.52>, <-11.62, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {< 28.23, -14.38, -33.52>, < 28.23, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {< 11.62,  14.38, -33.52>, < 11.62,  14.38,   0.00>, Rcell pigment {Black}}
cylinder {<-28.23,  14.38, -33.52>, <-28.23,  14.38,   0.00>, Rcell pigment {Black}}
atom(<-10.87, -11.79, -32.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -8.30,  -8.63, -33.52>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(<-10.58,  -7.84, -31.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.23, -11.79, -32.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -6.03,  -9.42, -35.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -9.05, -11.22, -34.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -6.90, -11.40, -34.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -6.39, -11.61, -32.35>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(< -1.66,  -8.63, -33.52>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< -7.55,  -6.04, -32.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -3.93,  -7.84, -31.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -7.24, -10.00, -31.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -9.35,  -3.66, -35.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -9.37,  -7.26, -35.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<-10.22,  -5.65, -34.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -9.71,  -5.86, -32.35>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -4.98,  -8.63, -33.52>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #16
atom(<-10.56,  -4.24, -31.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -2.41, -11.22, -34.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -2.71,  -3.66, -35.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -2.72,  -7.26, -35.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -5.73,  -5.47, -34.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -3.58,  -5.65, -34.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< -3.07,  -5.86, -32.35>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(< -3.92,  -4.24, -31.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< -8.30,  -8.63, -33.52>, < -8.83,  -7.95, -34.69>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -7.26, -35.86>, < -8.83,  -7.95, -34.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30,  -8.63, -33.52>, < -7.93,  -7.33, -32.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -6.04, -32.18>, < -7.93,  -7.33, -32.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.58,  -7.84, -31.67>, <-10.14,  -6.85, -32.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71,  -5.86, -32.35>, <-10.14,  -6.85, -32.01>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.23, -11.79, -32.18>, < -5.31, -11.70, -32.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -11.61, -32.35>, < -5.31, -11.70, -32.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.03,  -9.42, -35.36>, < -6.46, -10.41, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -11.40, -34.68>, < -6.46, -10.41, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.03,  -9.42, -35.36>, < -5.51,  -9.02, -34.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,  -8.63, -33.52>, < -5.51,  -9.02, -34.44>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -9.05, -11.22, -34.85>, < -7.98, -11.31, -34.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -11.40, -34.68>, < -7.98, -11.31, -34.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.05, -11.22, -34.85>, < -8.68,  -9.92, -34.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30,  -8.63, -33.52>, < -8.68,  -9.92, -34.18>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.90, -11.40, -34.68>, < -6.64, -11.51, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -11.61, -32.35>, < -6.64, -11.51, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.39, -11.61, -32.35>, < -6.81, -10.80, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.24, -10.00, -31.17>, < -6.81, -10.80, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -8.63, -33.52>, < -2.04,  -9.92, -34.18>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.41, -11.22, -34.85>, < -2.04,  -9.92, -34.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.66,  -8.63, -33.52>, < -2.19,  -7.95, -34.69>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.72,  -7.26, -35.86>, < -2.19,  -7.95, -34.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -6.04, -32.18>, < -8.63,  -5.95, -32.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71,  -5.86, -32.35>, < -8.63,  -5.95, -32.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.93,  -7.84, -31.67>, < -4.46,  -8.24, -32.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,  -8.63, -33.52>, < -4.46,  -8.24, -32.59>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -3.93,  -7.84, -31.67>, < -3.50,  -6.85, -32.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07,  -5.86, -32.35>, < -3.50,  -6.85, -32.01>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.24, -10.00, -31.17>, < -7.77,  -9.31, -32.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.30,  -8.63, -33.52>, < -7.77,  -9.31, -32.34>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -3.66, -35.36>, < -9.78,  -4.66, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22,  -5.65, -34.68>, < -9.78,  -4.66, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -7.26, -35.86>, < -9.79,  -6.46, -35.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22,  -5.65, -34.68>, < -9.79,  -6.46, -35.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.22,  -5.65, -34.68>, < -9.96,  -5.75, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71,  -5.86, -32.35>, < -9.96,  -5.75, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.71,  -5.86, -32.35>, <-10.13,  -5.05, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.56,  -4.24, -31.17>, <-10.13,  -5.05, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.71,  -3.66, -35.36>, < -3.14,  -4.66, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -5.65, -34.68>, < -3.14,  -4.66, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.72,  -7.26, -35.86>, < -3.15,  -6.46, -35.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -5.65, -34.68>, < -3.15,  -6.46, -35.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -5.65, -34.68>, < -3.32,  -5.75, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07,  -5.86, -32.35>, < -3.32,  -5.75, -33.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -5.65, -34.68>, < -4.65,  -5.56, -34.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73,  -5.47, -34.85>, < -4.65,  -5.56, -34.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.07,  -5.86, -32.35>, < -3.49,  -5.05, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.92,  -4.24, -31.17>, < -3.49,  -5.05, -31.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
