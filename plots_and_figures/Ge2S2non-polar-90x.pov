#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -28.24*x up 19.79*y
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

cylinder {<-13.45,  -7.68,  -0.00>, < 13.45,  -7.68,  -0.00>, Rcell pigment {Black}}
cylinder {<-13.45,  -7.68, -21.91>, < 13.45,  -7.68, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   9.42, -21.91>, < 13.45,   9.42, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   9.42,   0.00>, < 13.45,   9.42,  -0.00>, Rcell pigment {Black}}
cylinder {<-13.45,  -7.68,  -0.00>, <-13.45,  -7.68, -21.91>, Rcell pigment {Black}}
cylinder {< 13.45,  -7.68,  -0.00>, < 13.45,  -7.68, -21.91>, Rcell pigment {Black}}
cylinder {< 13.45,   9.42,  -0.00>, < 13.45,   9.42, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,   9.42,   0.00>, <-13.45,   9.42, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,  -7.68,  -0.00>, <-13.45,   9.42,   0.00>, Rcell pigment {Black}}
cylinder {< 13.45,  -7.68,  -0.00>, < 13.45,   9.42,  -0.00>, Rcell pigment {Black}}
cylinder {< 13.45,  -7.68, -21.91>, < 13.45,   9.42, -21.91>, Rcell pigment {Black}}
cylinder {<-13.45,  -7.68, -21.91>, <-13.45,   9.42, -21.91>, Rcell pigment {Black}}
atom(<-12.32,  -6.50,  -2.74>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-12.32,  -8.82,  -2.74>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-12.32,  -6.50,  -6.39>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-12.32,  -8.82,  -6.39>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-12.32,  -6.50, -10.04>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.32,  -8.82, -10.04>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(<-12.32,  -6.50, -13.70>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-12.32,  -8.82, -13.70>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<-10.08,  -8.87,  -0.91>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -7.84,  -6.50,  -2.74>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<-10.08,  -6.54,  -0.91>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #10
atom(< -7.84,  -8.82,  -2.74>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #11
atom(<-10.08,  -8.87,  -4.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -7.84,  -6.50,  -6.39>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-10.08,  -6.54,  -4.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #14
atom(< -7.84,  -8.82,  -6.39>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(<-10.08,  -8.87,  -8.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -7.84,  -6.50, -10.04>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(<-10.08,  -6.54,  -8.22>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #18
atom(< -7.84,  -8.82, -10.04>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
atom(<-10.08,  -8.87, -11.87>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -7.84,  -6.50, -13.70>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-10.08,  -6.54, -11.87>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #22
atom(< -7.84,  -8.82, -13.70>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(< -5.60,  -8.87,  -0.91>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -3.36,  -6.50,  -2.74>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -5.60,  -6.54,  -0.91>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(< -3.36,  -8.82,  -2.74>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(< -5.60,  -8.87,  -4.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -3.36,  -6.50,  -6.39>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -5.60,  -6.54,  -4.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(< -3.36,  -8.82,  -6.39>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(< -5.60,  -8.87,  -8.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(< -3.36,  -6.50, -10.04>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(< -5.60,  -6.54,  -8.22>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(< -3.36,  -8.82, -10.04>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(< -5.60,  -8.87, -11.87>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -3.36,  -6.50, -13.70>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(< -5.60,  -6.54, -11.87>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #38
atom(< -3.36,  -8.82, -13.70>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(< -1.12,  -8.87,  -0.91>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(< -1.12,  -6.54,  -0.91>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #41
atom(< -1.12,  -8.87,  -4.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #42
atom(< -1.12,  -6.54,  -4.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #43
atom(< -1.12,  -8.87,  -8.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #44
atom(< -1.12,  -6.54,  -8.22>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #45
atom(< -1.12,  -8.87, -11.87>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #46
atom(< -1.12,  -6.54, -11.87>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #47
cylinder {<-12.32,  -6.50,  -2.74>, <-11.20,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -4.57>, <-11.20,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50,  -2.74>, <-12.32,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -2.74>, <-12.32,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50,  -2.74>, <-11.20,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -0.91>, <-11.20,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -2.74>, <-11.20,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -4.57>, <-11.20,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -2.74>, <-11.20,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -0.91>, <-11.20,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50,  -6.39>, <-12.32,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -6.39>, <-12.32,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50,  -6.39>, <-11.20,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -4.57>, <-11.20,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50,  -6.39>, <-11.20,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -8.22>, <-11.20,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -6.39>, <-11.20,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -4.57>, <-11.20,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82,  -6.39>, <-11.20,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -8.22>, <-11.20,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50, -10.04>, <-11.20,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -8.22>, <-11.20,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50, -10.04>, <-12.32,  -7.66, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82, -10.04>, <-12.32,  -7.66, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50, -10.04>, <-11.20,  -6.52, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54, -11.87>, <-11.20,  -6.52, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82, -10.04>, <-11.20,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -8.22>, <-11.20,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82, -10.04>, <-11.20,  -8.85, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87, -11.87>, <-11.20,  -8.85, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50, -13.70>, <-12.32,  -7.66, -13.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82, -13.70>, <-12.32,  -7.66, -13.70>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -6.50, -13.70>, <-11.20,  -6.52, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54, -11.87>, <-11.20,  -6.52, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.82, -13.70>, <-11.20,  -8.85, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87, -11.87>, <-11.20,  -8.85, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -0.91>, <-10.08,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -0.91>, <-10.08,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -0.91>, < -8.96,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -2.74>, < -8.96,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -2.74>, < -8.96,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -4.57>, < -8.96,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -2.74>, < -8.96,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -0.91>, < -8.96,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -2.74>, < -7.84,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -2.74>, < -7.84,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -2.74>, < -6.72,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -0.91>, < -6.72,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -2.74>, < -6.72,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -4.57>, < -6.72,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -2.74>, < -8.96,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -4.57>, < -8.96,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -2.74>, < -6.72,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -0.91>, < -6.72,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -2.74>, < -6.72,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -4.57>, < -6.72,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -4.57>, <-10.08,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -4.57>, <-10.08,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -4.57>, < -8.96,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -6.39>, < -8.96,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -6.39>, < -8.96,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -4.57>, < -8.96,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -6.39>, < -7.84,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -6.39>, < -7.84,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -6.39>, < -6.72,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -4.57>, < -6.72,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -6.39>, < -8.96,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -8.22>, < -8.96,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50,  -6.39>, < -6.72,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -8.22>, < -6.72,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -6.39>, < -6.72,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -4.57>, < -6.72,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -6.39>, < -8.96,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -8.22>, < -8.96,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82,  -6.39>, < -6.72,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -8.22>, < -6.72,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -8.22>, <-10.08,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -8.22>, <-10.08,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87,  -8.22>, < -8.96,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -10.04>, < -8.96,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -10.04>, < -8.96,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54,  -8.22>, < -8.96,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -10.04>, < -8.96,  -6.52, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54, -11.87>, < -8.96,  -6.52, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -10.04>, < -7.84,  -7.66, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -10.04>, < -7.84,  -7.66, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -10.04>, < -6.72,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -8.22>, < -6.72,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -10.04>, < -6.72,  -6.52, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54, -11.87>, < -6.72,  -6.52, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -10.04>, < -8.96,  -8.85, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87, -11.87>, < -8.96,  -8.85, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -10.04>, < -6.72,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -8.22>, < -6.72,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -10.04>, < -6.72,  -8.85, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87, -11.87>, < -6.72,  -8.85, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87, -11.87>, <-10.08,  -7.71, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54, -11.87>, <-10.08,  -7.71, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -8.87, -11.87>, < -8.96,  -8.85, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -13.70>, < -8.96,  -8.85, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -13.70>, < -8.96,  -6.52, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.54, -11.87>, < -8.96,  -6.52, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -13.70>, < -7.84,  -7.66, -13.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -13.70>, < -7.84,  -7.66, -13.70>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -6.50, -13.70>, < -6.72,  -6.52, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54, -11.87>, < -6.72,  -6.52, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.82, -13.70>, < -6.72,  -8.85, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87, -11.87>, < -6.72,  -8.85, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -0.91>, < -5.60,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -0.91>, < -5.60,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -0.91>, < -4.48,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -2.74>, < -4.48,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -2.74>, < -4.48,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -0.91>, < -4.48,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -2.74>, < -3.36,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -2.74>, < -3.36,  -7.66,  -2.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -2.74>, < -4.48,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -4.57>, < -4.48,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -2.74>, < -2.24,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -0.91>, < -2.24,  -6.52,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -2.74>, < -2.24,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -4.57>, < -2.24,  -6.52,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -2.74>, < -4.48,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -4.57>, < -4.48,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -2.74>, < -2.24,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -0.91>, < -2.24,  -8.85,  -1.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -2.74>, < -2.24,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -4.57>, < -2.24,  -8.85,  -3.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -4.57>, < -4.48,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -6.39>, < -4.48,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -4.57>, < -5.60,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -4.57>, < -5.60,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -6.39>, < -3.36,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -6.39>, < -3.36,  -7.66,  -6.39>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -6.39>, < -4.48,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -4.57>, < -4.48,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -6.39>, < -2.24,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -4.57>, < -2.24,  -6.52,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -6.39>, < -4.48,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -8.22>, < -4.48,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50,  -6.39>, < -2.24,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -8.22>, < -2.24,  -6.52,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -6.39>, < -2.24,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -4.57>, < -2.24,  -8.85,  -5.48>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -6.39>, < -4.48,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -8.22>, < -4.48,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82,  -6.39>, < -2.24,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -8.22>, < -2.24,  -8.85,  -7.30>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -8.22>, < -5.60,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -8.22>, < -5.60,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87,  -8.22>, < -4.48,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -10.04>, < -4.48,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -10.04>, < -4.48,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54,  -8.22>, < -4.48,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -10.04>, < -4.48,  -6.52, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54, -11.87>, < -4.48,  -6.52, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -10.04>, < -3.36,  -7.66, -10.04>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -10.04>, < -3.36,  -7.66, -10.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -10.04>, < -2.24,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -8.22>, < -2.24,  -6.52,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -10.04>, < -2.24,  -6.52, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54, -11.87>, < -2.24,  -6.52, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -10.04>, < -4.48,  -8.85, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87, -11.87>, < -4.48,  -8.85, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -10.04>, < -2.24,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -8.22>, < -2.24,  -8.85,  -9.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -10.04>, < -2.24,  -8.85, -10.96>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87, -11.87>, < -2.24,  -8.85, -10.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87, -11.87>, < -5.60,  -7.71, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54, -11.87>, < -5.60,  -7.71, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -8.87, -11.87>, < -4.48,  -8.85, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -13.70>, < -4.48,  -8.85, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -13.70>, < -4.48,  -6.52, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.54, -11.87>, < -4.48,  -6.52, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -13.70>, < -3.36,  -7.66, -13.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -13.70>, < -3.36,  -7.66, -13.70>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -6.50, -13.70>, < -2.24,  -6.52, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54, -11.87>, < -2.24,  -6.52, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.82, -13.70>, < -2.24,  -8.85, -12.78>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87, -11.87>, < -2.24,  -8.85, -12.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -0.91>, < -1.12,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -0.91>, < -1.12,  -7.71,  -0.91>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -4.57>, < -1.12,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -4.57>, < -1.12,  -7.71,  -4.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87,  -8.22>, < -1.12,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54,  -8.22>, < -1.12,  -7.71,  -8.22>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -8.87, -11.87>, < -1.12,  -7.71, -11.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.54, -11.87>, < -1.12,  -7.71, -11.87>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
