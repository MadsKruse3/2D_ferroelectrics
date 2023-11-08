#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -27.55*x up 21.34*y
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

cylinder {<-12.83, -10.16, -17.11>, < 13.12, -10.16, -17.11>, Rcell pigment {Black}}
cylinder {<-12.83,  10.16, -17.11>, < 13.12,  10.16, -17.11>, Rcell pigment {Black}}
cylinder {<-12.83,  10.16,   0.00>, < 13.12,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -10.16,   0.00>, < 13.12, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -10.16, -17.11>, <-12.83,  10.16, -17.11>, Rcell pigment {Black}}
cylinder {< 13.12, -10.16, -17.11>, < 13.12,  10.16, -17.11>, Rcell pigment {Black}}
cylinder {< 13.12, -10.16,   0.00>, < 13.12,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -10.16,   0.00>, <-12.83,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -10.16, -17.11>, <-12.83, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {< 13.12, -10.16, -17.11>, < 13.12, -10.16,   0.00>, Rcell pigment {Black}}
cylinder {< 13.12,  10.16, -17.11>, < 13.12,  10.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83,  10.16, -17.11>, <-12.83,  10.16,   0.00>, Rcell pigment {Black}}
atom(<-10.43,  -8.13,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-10.07,  -8.13,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #1
atom(<-12.59,  -6.10,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-10.43,  -4.06,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #3
atom(<-12.23,  -6.10,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #4
atom(<-10.07,  -4.06,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #5
atom(<-12.59,  -2.03,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-10.43,  -0.00,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-12.23,  -2.03,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #8
atom(<-10.07,  -0.00,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #9
atom(< -6.11,  -8.13,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(< -5.74,  -8.13,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #11
atom(< -8.27,  -6.10,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -6.11,  -4.06,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(< -7.91,  -6.10,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #14
atom(< -5.74,  -4.06,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #15
atom(< -8.27,  -2.03,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -6.11,  -0.00,  -7.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(< -7.91,  -2.03,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #18
atom(< -5.74,  -0.00,  -9.99>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #19
atom(< -3.94,  -6.10,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -3.58,  -6.10,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #21
atom(< -3.94,  -2.03,  -9.69>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -3.58,  -2.03,  -7.12>, 0.69, rgb <0.40, 0.50, 0.50>, 0.0, ase3) // #23
cylinder {<-10.43,  -8.13,  -7.42>, <-10.25,  -8.13,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -8.13,  -9.99>, <-10.25,  -8.13,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -8.13,  -7.42>, <-11.33,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -6.10,  -7.12>, <-11.33,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -8.13,  -9.99>, < -9.17,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -6.10,  -9.69>, < -9.17,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.59,  -6.10,  -9.69>, <-12.41,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -6.10,  -7.12>, <-12.41,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -4.06,  -7.42>, <-11.33,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -6.10,  -7.12>, <-11.33,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -4.06,  -7.42>, <-10.25,  -4.06,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -4.06,  -9.99>, <-10.25,  -4.06,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -4.06,  -7.42>, <-11.33,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -2.03,  -7.12>, <-11.33,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -4.06,  -9.99>, < -9.17,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -6.10,  -9.69>, < -9.17,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -4.06,  -9.99>, < -9.17,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -2.03,  -9.69>, < -9.17,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.59,  -2.03,  -9.69>, <-12.41,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -2.03,  -7.12>, <-12.41,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -0.00,  -7.42>, <-11.33,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.23,  -2.03,  -7.12>, <-11.33,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.43,  -0.00,  -7.42>, <-10.25,  -0.00,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -0.00,  -9.99>, <-10.25,  -0.00,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {<-10.07,  -0.00,  -9.99>, < -9.17,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -2.03,  -9.69>, < -9.17,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -8.13,  -7.42>, < -7.01,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -6.10,  -7.12>, < -7.01,  -7.11,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -8.13,  -7.42>, < -5.93,  -8.13,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -8.13,  -9.99>, < -5.93,  -8.13,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -8.13,  -9.99>, < -4.84,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -6.10,  -9.69>, < -4.84,  -7.11,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -6.10,  -9.69>, < -8.09,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -6.10,  -7.12>, < -8.09,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -4.06,  -7.42>, < -7.01,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -6.10,  -7.12>, < -7.01,  -5.08,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -4.06,  -7.42>, < -7.01,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -2.03,  -7.12>, < -7.01,  -3.05,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -4.06,  -7.42>, < -5.93,  -4.06,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -4.06,  -9.99>, < -5.93,  -4.06,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -4.06,  -9.99>, < -4.84,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -6.10,  -9.69>, < -4.84,  -5.08,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -4.06,  -9.99>, < -4.84,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -2.03,  -9.69>, < -4.84,  -3.05,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.27,  -2.03,  -9.69>, < -8.09,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -2.03,  -7.12>, < -8.09,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -0.00,  -7.42>, < -7.01,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.91,  -2.03,  -7.12>, < -7.01,  -1.02,  -7.27>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -0.00,  -7.42>, < -5.93,  -0.00,  -8.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -0.00,  -9.99>, < -5.93,  -0.00,  -8.70>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -5.74,  -0.00,  -9.99>, < -4.84,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -2.03,  -9.69>, < -4.84,  -1.02,  -9.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -6.10,  -9.69>, < -3.76,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -6.10,  -7.12>, < -3.76,  -6.10,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
cylinder {< -3.94,  -2.03,  -9.69>, < -3.76,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -2.03,  -7.12>, < -3.76,  -2.03,  -8.41>, Rbond texture{pigment {color rgb <0.40, 0.50, 0.50> transmit 0.0} finish{ase3}}}
// no constraints
