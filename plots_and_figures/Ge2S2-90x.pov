#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -28.24*x up 17.97*y
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

cylinder {<-13.45,  -8.55,  -0.00>, < 13.45,  -8.55,  -0.00>, Rcell pigment {Black}}
cylinder {<-13.45,  -8.55, -21.91>, < 13.45,  -8.55, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   8.55, -21.91>, < 13.45,   8.55, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   8.55,   0.00>, < 13.45,   8.55,  -0.00>, Rcell pigment {Black}}
cylinder {<-13.45,  -8.55,  -0.00>, <-13.45,  -8.55, -21.91>, Rcell pigment {Black}}
cylinder {< 13.45,  -8.55,  -0.00>, < 13.45,  -8.55, -21.91>, Rcell pigment {Black}}
cylinder {< 13.45,   8.55,  -0.00>, < 13.45,   8.55, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   8.55,   0.00>, <-13.45,   8.55, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,  -8.55,  -0.00>, <-13.45,   8.55,   0.00>, Rcell pigment {Black}}
cylinder {< 13.45,  -8.55,  -0.00>, < 13.45,   8.55,  -0.00>, Rcell pigment {Black}}
cylinder {< 13.45,  -8.55, -21.91>, < 13.45,   8.55, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,  -8.55, -21.91>, <-13.45,   8.55, -21.91>, Rcell pigment {Black}}
atom(<-11.07,   1.07,  -1.83>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-10.47,  -1.28,  -1.83>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-11.07,   1.07,  -5.48>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-10.47,  -1.28,  -5.48>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-11.07,   1.07,  -9.13>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-10.47,  -1.28,  -9.13>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(<-11.07,   1.07, -12.78>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-10.47,  -1.28, -12.78>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(< -6.59,   1.07,  -1.83>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -5.99,  -1.28,  -1.83>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #9
atom(< -8.83,  -1.07,  -3.65>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(< -6.59,   1.07,  -5.48>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(< -8.23,   1.28,  -3.65>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #12
atom(< -5.99,  -1.28,  -5.48>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #13
atom(< -8.83,  -1.07,  -7.30>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -6.59,   1.07,  -9.13>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(< -8.23,   1.28,  -7.30>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #16
atom(< -5.99,  -1.28,  -9.13>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #17
atom(< -8.83,  -1.07, -10.96>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -6.59,   1.07, -12.78>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #19
atom(< -8.23,   1.28, -10.96>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #20
atom(< -5.99,  -1.28, -12.78>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #21
atom(< -2.10,   1.07,  -1.83>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -1.51,  -1.28,  -1.83>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(< -4.35,  -1.07,  -3.65>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -2.10,   1.07,  -5.48>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -3.75,   1.28,  -3.65>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(< -1.51,  -1.28,  -5.48>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(< -4.35,  -1.07,  -7.30>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -2.10,   1.07,  -9.13>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -3.75,   1.28,  -7.30>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(< -1.51,  -1.28,  -9.13>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(< -4.35,  -1.07, -10.96>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(< -2.10,   1.07, -12.78>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(< -3.75,   1.28, -10.96>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(< -1.51,  -1.28, -12.78>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(<  0.14,  -1.07,  -3.65>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(<  0.73,   1.28,  -3.65>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #37
atom(<  0.14,  -1.07,  -7.30>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #38
atom(<  0.73,   1.28,  -7.30>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(<  0.14,  -1.07, -10.96>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(<  0.73,   1.28, -10.96>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #41
cylinder {<-11.07,   1.07,  -1.83>, <-10.77,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -1.83>, <-10.77,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -1.83>, < -9.65,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -3.65>, < -9.65,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,   1.07,  -5.48>, <-10.77,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -5.48>, <-10.77,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -5.48>, < -9.65,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -7.30>, < -9.65,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -5.48>, < -9.65,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -3.65>, < -9.65,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,   1.07,  -9.13>, <-10.77,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -9.13>, <-10.77,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -9.13>, < -9.65,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -7.30>, < -9.65,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28,  -9.13>, < -9.65,  -1.17, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07, -10.96>, < -9.65,  -1.17, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.07,   1.07, -12.78>, <-10.77,  -0.11, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28, -12.78>, <-10.77,  -0.11, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.47,  -1.28, -12.78>, < -9.65,  -1.17, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07, -10.96>, < -9.65,  -1.17, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -1.83>, < -7.41,   1.17,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -3.65>, < -7.41,   1.17,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -1.83>, < -6.29,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -1.83>, < -6.29,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -1.83>, < -5.17,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -3.65>, < -5.17,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -3.65>, < -8.53,   0.11,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -3.65>, < -8.53,   0.11,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -5.48>, < -7.41,   1.17,  -4.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -3.65>, < -7.41,   1.17,  -4.56>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -5.48>, < -7.41,   1.17,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -7.30>, < -7.41,   1.17,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -5.48>, < -6.29,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -5.48>, < -6.29,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -5.48>, < -5.17,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -3.65>, < -5.17,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -5.48>, < -5.17,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -7.30>, < -5.17,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07,  -7.30>, < -8.53,   0.11,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -7.30>, < -8.53,   0.11,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -9.13>, < -7.41,   1.17,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28,  -7.30>, < -7.41,   1.17,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -9.13>, < -7.41,   1.17, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28, -10.96>, < -7.41,   1.17, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07,  -9.13>, < -6.29,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -9.13>, < -6.29,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -9.13>, < -5.17,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -7.30>, < -5.17,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28,  -9.13>, < -5.17,  -1.17, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07, -10.96>, < -5.17,  -1.17, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.83,  -1.07, -10.96>, < -8.53,   0.11, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28, -10.96>, < -8.53,   0.11, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07, -12.78>, < -7.41,   1.17, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.23,   1.28, -10.96>, < -7.41,   1.17, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -6.59,   1.07, -12.78>, < -6.29,  -0.11, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28, -12.78>, < -6.29,  -0.11, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.99,  -1.28, -12.78>, < -5.17,  -1.17, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07, -10.96>, < -5.17,  -1.17, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -1.83>, < -1.81,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -1.83>, < -1.81,  -0.11,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -1.83>, < -2.93,   1.17,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -3.65>, < -2.93,   1.17,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -1.83>, < -0.69,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -3.65>, < -0.69,  -1.17,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -3.65>, < -4.05,   0.11,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -3.65>, < -4.05,   0.11,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -5.48>, < -2.93,   1.17,  -4.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -3.65>, < -2.93,   1.17,  -4.56>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -5.48>, < -1.81,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -5.48>, < -1.81,  -0.11,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -5.48>, < -2.93,   1.17,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -7.30>, < -2.93,   1.17,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -5.48>, < -0.69,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -3.65>, < -0.69,  -1.17,  -4.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -5.48>, < -0.69,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -7.30>, < -0.69,  -1.17,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07,  -7.30>, < -4.05,   0.11,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -7.30>, < -4.05,   0.11,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -9.13>, < -2.93,   1.17,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28,  -7.30>, < -2.93,   1.17,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -9.13>, < -1.81,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -9.13>, < -1.81,  -0.11,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07,  -9.13>, < -2.93,   1.17, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28, -10.96>, < -2.93,   1.17, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -9.13>, < -0.69,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -7.30>, < -0.69,  -1.17,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28,  -9.13>, < -0.69,  -1.17, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07, -10.96>, < -0.69,  -1.17, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -1.07, -10.96>, < -4.05,   0.11, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28, -10.96>, < -4.05,   0.11, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07, -12.78>, < -2.93,   1.17, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.75,   1.28, -10.96>, < -2.93,   1.17, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   1.07, -12.78>, < -1.81,  -0.11, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28, -12.78>, < -1.81,  -0.11, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.51,  -1.28, -12.78>, < -0.69,  -1.17, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07, -10.96>, < -0.69,  -1.17, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -3.65>, <  0.43,   0.11,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.73,   1.28,  -3.65>, <  0.43,   0.11,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07,  -7.30>, <  0.43,   0.11,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.73,   1.28,  -7.30>, <  0.43,   0.11,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  0.14,  -1.07, -10.96>, <  0.43,   0.11, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.73,   1.28, -10.96>, <  0.43,   0.11, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
