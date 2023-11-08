#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -27.25*x up 25.60*y
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

cylinder {<-12.97, -12.19, -17.11>, < 12.97, -12.19, -17.11>, Rcell pigment {Black}}
cylinder {<-12.97,  12.19, -17.11>, < 12.97,  12.19, -17.11>, Rcell pigment {Black}}
cylinder {<-12.97,  12.19,   0.00>, < 12.97,  12.19,   0.00>, Rcell pigment {Black}}
cylinder {<-12.97, -12.19,   0.00>, < 12.97, -12.19,   0.00>, Rcell pigment {Black}}
cylinder {<-12.97, -12.19, -17.11>, <-12.97,  12.19, -17.11>, Rcell pigment {Black}}
cylinder {< 12.97, -12.19, -17.11>, < 12.97,  12.19, -17.11>, Rcell pigment {Black}}
cylinder {< 12.97, -12.19,   0.00>, < 12.97,  12.19,   0.00>, Rcell pigment {Black}}
cylinder {<-12.97, -12.19,   0.00>, <-12.97,  12.19,   0.00>, Rcell pigment {Black}}
cylinder {<-12.97, -12.19, -17.11>, <-12.97, -12.19,   0.00>, Rcell pigment {Black}}
cylinder {< 12.97, -12.19, -17.11>, < 12.97, -12.19,   0.00>, Rcell pigment {Black}}
cylinder {< 12.97,  12.19, -17.11>, < 12.97,  12.19,   0.00>, Rcell pigment {Black}}
cylinder {<-12.97,  12.19, -17.11>, <-12.97,  12.19,   0.00>, Rcell pigment {Black}}
atom(<-10.58, -10.16,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-10.21, -10.16,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #1
atom(<-10.58,  -6.10,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-10.21,  -6.10,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #3
atom(<-10.58,  -2.03,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-10.21,  -2.03,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #5
atom(< -6.25, -10.16,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(< -5.89, -10.16,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #7
atom(< -8.41,  -8.13,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -6.25,  -6.10,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(< -8.05,  -8.13,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #10
atom(< -5.89,  -6.10,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #11
atom(< -8.41,  -4.06,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -6.25,  -2.03,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(< -8.05,  -4.06,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #14
atom(< -5.89,  -2.03,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #15
atom(< -8.41,  -0.00,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -8.05,  -0.00,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #17
atom(< -1.93, -10.16,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -1.56, -10.16,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #19
atom(< -4.09,  -8.13,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -1.93,  -6.10,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(< -3.73,  -8.13,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #22
atom(< -1.56,  -6.10,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #23
atom(< -4.09,  -4.06,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -1.93,  -2.03,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -3.73,  -4.06,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #26
atom(< -1.56,  -2.03,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #27
atom(< -4.09,  -0.00,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -3.73,  -0.00,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #29
atom(<  0.24,  -8.13,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
atom(<  0.60,  -8.13,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #31
atom(<  0.24,  -4.06,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(<  0.60,  -4.06,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #33
atom(<  0.24,  -0.00,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #34
atom(<  0.60,  -0.00,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #35
cylinder {<-10.58, -10.16,  -7.42>, <-10.39, -10.16,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.21, -10.16,  -9.99>, <-10.39, -10.16,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.21, -10.16,  -9.99>, < -9.31,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -8.13,  -9.69>, < -9.31,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.58,  -6.10,  -7.42>, <-10.39,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -6.10,  -9.99>, <-10.39,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -6.10,  -9.99>, < -9.31,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -8.13,  -9.69>, < -9.31,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -6.10,  -9.99>, < -9.31,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -4.06,  -9.69>, < -9.31,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.58,  -2.03,  -7.42>, <-10.39,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -2.03,  -9.99>, <-10.39,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -2.03,  -9.99>, < -9.31,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -4.06,  -9.69>, < -9.31,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.21,  -2.03,  -9.99>, < -9.31,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -0.00,  -9.69>, < -9.31,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.25, -10.16,  -7.42>, < -7.15,  -9.14,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -8.13,  -7.12>, < -7.15,  -9.14,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25, -10.16,  -7.42>, < -6.07, -10.16,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.89, -10.16,  -9.99>, < -6.07, -10.16,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.89, -10.16,  -9.99>, < -4.99,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -8.13,  -9.69>, < -4.99,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -8.13,  -9.69>, < -8.23,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -8.13,  -7.12>, < -8.23,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -6.10,  -7.42>, < -7.15,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -8.13,  -7.12>, < -7.15,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -6.10,  -7.42>, < -6.07,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -6.10,  -9.99>, < -6.07,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -6.10,  -7.42>, < -7.15,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -4.06,  -7.12>, < -7.15,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -6.10,  -9.99>, < -4.99,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -8.13,  -9.69>, < -4.99,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -6.10,  -9.99>, < -4.99,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -4.06,  -9.69>, < -4.99,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -4.06,  -9.69>, < -8.23,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -4.06,  -7.12>, < -8.23,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -2.03,  -7.42>, < -7.15,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -0.00,  -7.12>, < -7.15,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -2.03,  -7.42>, < -7.15,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -4.06,  -7.12>, < -7.15,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.25,  -2.03,  -7.42>, < -6.07,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -2.03,  -9.99>, < -6.07,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -2.03,  -9.99>, < -4.99,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -4.06,  -9.69>, < -4.99,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.89,  -2.03,  -9.99>, < -4.99,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -0.00,  -9.69>, < -4.99,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.41,  -0.00,  -9.69>, < -8.23,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.05,  -0.00,  -7.12>, < -8.23,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93, -10.16,  -7.42>, < -2.83,  -9.14,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -8.13,  -7.12>, < -2.83,  -9.14,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93, -10.16,  -7.42>, < -1.75, -10.16,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.16,  -9.99>, < -1.75, -10.16,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.16,  -9.99>, < -0.66,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -8.13,  -9.69>, < -0.66,  -9.14,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -8.13,  -9.69>, < -3.91,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -8.13,  -7.12>, < -3.91,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -6.10,  -7.42>, < -2.83,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -8.13,  -7.12>, < -2.83,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -6.10,  -7.42>, < -1.75,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -6.10,  -9.99>, < -1.75,  -6.10,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -6.10,  -7.42>, < -2.83,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -4.06,  -7.12>, < -2.83,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -6.10,  -9.99>, < -0.66,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -8.13,  -9.69>, < -0.66,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -6.10,  -9.99>, < -0.66,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -4.06,  -9.69>, < -0.66,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -4.06,  -9.69>, < -3.91,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -4.06,  -7.12>, < -3.91,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -2.03,  -7.42>, < -2.83,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -4.06,  -7.12>, < -2.83,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -2.03,  -7.42>, < -1.75,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.03,  -9.99>, < -1.75,  -2.03,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.93,  -2.03,  -7.42>, < -2.83,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -0.00,  -7.12>, < -2.83,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.03,  -9.99>, < -0.66,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -4.06,  -9.69>, < -0.66,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.03,  -9.99>, < -0.66,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -0.00,  -9.69>, < -0.66,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -0.00,  -9.69>, < -3.91,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.73,  -0.00,  -7.12>, < -3.91,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -8.13,  -9.69>, <  0.42,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -8.13,  -7.12>, <  0.42,  -8.13,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -4.06,  -9.69>, <  0.42,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -4.06,  -7.12>, <  0.42,  -4.06,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<  0.24,  -0.00,  -9.69>, <  0.42,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -0.00,  -7.12>, <  0.42,  -0.00,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
// no constraints
