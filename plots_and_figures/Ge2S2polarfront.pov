#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -28.24*x up 23.01*y
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

cylinder {<-13.45, -10.96, -17.11>, < 13.45, -10.96, -17.11>, Rcell pigment {Black}}
cylinder {<-13.45,  10.96, -17.11>, < 13.45,  10.96, -17.11>, Rcell pigment {Black}}
cylinder {<-13.45,  10.96,   0.00>, < 13.45,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<-13.45, -10.96,   0.00>, < 13.45, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<-13.45, -10.96, -17.11>, <-13.45,  10.96, -17.11>, Rcell pigment {Black}}
cylinder {< 13.45, -10.96, -17.11>, < 13.45,  10.96, -17.11>, Rcell pigment {Black}}
cylinder {< 13.45, -10.96,   0.00>, < 13.45,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<-13.45, -10.96,   0.00>, <-13.45,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<-13.45, -10.96, -17.11>, <-13.45, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {< 13.45, -10.96, -17.11>, < 13.45, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {< 13.45,  10.96, -17.11>, < 13.45,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<-13.45,  10.96, -17.11>, <-13.45,  10.96,   0.00>, Rcell pigment {Black}}
atom(<-11.07,  -9.13,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-10.47,  -9.13,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-11.07,  -5.48,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-12.71,  -7.30,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-10.47,  -5.48,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #4
atom(<-11.07,  -1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<-12.71,  -3.65,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #6
atom(<-10.47,  -1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<-11.07,   1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-12.71,  -0.00,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #9
atom(<-10.47,   1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #10
atom(< -6.59,  -9.13,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(< -5.99,  -9.13,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #12
atom(< -8.83,  -7.30,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(< -6.59,  -5.48,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -8.23,  -7.30,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(< -5.99,  -5.48,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #16
atom(< -8.83,  -3.65,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(< -6.59,  -1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -8.23,  -3.65,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
atom(< -5.99,  -1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #20
atom(< -8.83,  -0.00,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(< -6.59,   1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -8.23,  -0.00,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(< -5.99,   1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #24
atom(< -2.10,  -9.13,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -1.51,  -9.13,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(< -4.35,  -7.30,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #27
atom(< -2.10,  -5.48,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -3.75,  -7.30,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #29
atom(< -1.51,  -5.48,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(< -4.35,  -3.65,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #31
atom(< -2.10,  -1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(< -3.75,  -3.65,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #33
atom(< -1.51,  -1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(< -4.35,  -0.00,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #35
atom(< -2.10,   1.83,  -7.49>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -3.75,  -0.00,  -7.27>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #37
atom(< -1.51,   1.83,  -9.84>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #38
atom(<  0.14,  -7.30,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #39
atom(<  0.14,  -3.65,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(<  0.14,  -0.00,  -9.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #41
cylinder {<-11.07,  -9.13,  -7.49>, <-10.77,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -9.13,  -9.84>, <-10.77,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -9.13,  -7.49>, <-11.89,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -7.30,  -7.27>, <-11.89,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -9.13,  -9.84>, < -9.65,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -7.30,  -9.62>, < -9.65,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -5.48,  -7.49>, <-11.89,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -7.30,  -7.27>, <-11.89,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -5.48,  -7.49>, <-10.77,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -5.48,  -9.84>, <-10.77,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -5.48,  -7.49>, <-11.89,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -3.65,  -7.27>, <-11.89,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -5.48,  -9.84>, < -9.65,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -7.30,  -9.62>, < -9.65,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -5.48,  -9.84>, < -9.65,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -3.65,  -9.62>, < -9.65,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -1.83,  -7.49>, <-11.89,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -3.65,  -7.27>, <-11.89,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -1.83,  -7.49>, <-11.89,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -0.00,  -7.27>, <-11.89,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,  -1.83,  -7.49>, <-10.77,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.83,  -9.84>, <-10.77,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.83,  -9.84>, < -9.65,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -3.65,  -9.62>, < -9.65,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.83,  -9.84>, < -9.65,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -0.00,  -9.62>, < -9.65,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,   1.83,  -7.49>, <-11.89,   0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.71,  -0.00,  -7.27>, <-11.89,   0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,   1.83,  -7.49>, <-10.77,   1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,   1.83,  -9.84>, <-10.77,   1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,   1.83,  -9.84>, < -9.65,   0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -0.00,  -9.62>, < -9.65,   0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -9.13,  -7.49>, < -7.41,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -7.30,  -7.27>, < -7.41,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -9.13,  -7.49>, < -6.29,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -9.13,  -9.84>, < -6.29,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -9.13,  -9.84>, < -5.17,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -7.30,  -9.62>, < -5.17,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -7.30,  -9.62>, < -8.53,  -7.30,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -7.30,  -7.27>, < -8.53,  -7.30,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -5.48,  -7.49>, < -7.41,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -7.30,  -7.27>, < -7.41,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -5.48,  -7.49>, < -7.41,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -3.65,  -7.27>, < -7.41,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -5.48,  -7.49>, < -6.29,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -5.48,  -9.84>, < -6.29,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -5.48,  -9.84>, < -5.17,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -7.30,  -9.62>, < -5.17,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -5.48,  -9.84>, < -5.17,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -3.65,  -9.62>, < -5.17,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -3.65,  -9.62>, < -8.53,  -3.65,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -3.65,  -7.27>, < -8.53,  -3.65,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -1.83,  -7.49>, < -7.41,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -3.65,  -7.27>, < -7.41,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -1.83,  -7.49>, < -7.41,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -0.00,  -7.27>, < -7.41,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,  -1.83,  -7.49>, < -6.29,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.83,  -9.84>, < -6.29,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.83,  -9.84>, < -5.17,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -3.65,  -9.62>, < -5.17,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.83,  -9.84>, < -5.17,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -0.00,  -9.62>, < -5.17,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -0.00,  -9.62>, < -8.53,  -0.00,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -0.00,  -7.27>, < -8.53,  -0.00,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.83,  -7.49>, < -7.41,   0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,  -0.00,  -7.27>, < -7.41,   0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.83,  -7.49>, < -6.29,   1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,   1.83,  -9.84>, < -6.29,   1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,   1.83,  -9.84>, < -5.17,   0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -0.00,  -9.62>, < -5.17,   0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -9.13,  -7.49>, < -1.81,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -9.13,  -9.84>, < -1.81,  -9.13,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -9.13,  -7.49>, < -2.93,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -7.30,  -7.27>, < -2.93,  -8.22,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -9.13,  -9.84>, < -0.69,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -7.30,  -9.62>, < -0.69,  -8.22,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -7.30,  -9.62>, < -4.05,  -7.30,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -7.30,  -7.27>, < -4.05,  -7.30,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -5.48,  -7.49>, < -2.93,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -7.30,  -7.27>, < -2.93,  -6.39,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -5.48,  -7.49>, < -1.81,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -5.48,  -9.84>, < -1.81,  -5.48,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -5.48,  -7.49>, < -2.93,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -3.65,  -7.27>, < -2.93,  -4.57,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -5.48,  -9.84>, < -0.69,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -7.30,  -9.62>, < -0.69,  -6.39,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -5.48,  -9.84>, < -0.69,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -3.65,  -9.62>, < -0.69,  -4.57,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -3.65,  -9.62>, < -4.05,  -3.65,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -3.65,  -7.27>, < -4.05,  -3.65,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -1.83,  -7.49>, < -2.93,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -3.65,  -7.27>, < -2.93,  -2.74,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -1.83,  -7.49>, < -1.81,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.83,  -9.84>, < -1.81,  -1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -1.83,  -7.49>, < -2.93,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -0.00,  -7.27>, < -2.93,  -0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.83,  -9.84>, < -0.69,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -3.65,  -9.62>, < -0.69,  -2.74,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.83,  -9.84>, < -0.69,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -0.00,  -9.62>, < -0.69,  -0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -0.00,  -9.62>, < -4.05,  -0.00,  -8.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -0.00,  -7.27>, < -4.05,  -0.00,  -8.45>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.83,  -7.49>, < -2.93,   0.91,  -7.38>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,  -0.00,  -7.27>, < -2.93,   0.91,  -7.38>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.83,  -7.49>, < -1.81,   1.83,  -8.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,   1.83,  -9.84>, < -1.81,   1.83,  -8.66>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,   1.83,  -9.84>, < -0.69,   0.91,  -9.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -0.00,  -9.62>, < -0.69,   0.91,  -9.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
// no constraints
