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
atom(<-12.32,  -8.22, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-12.32,  -8.22, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-12.32,  -4.57, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-12.32,  -4.57, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-12.32,  -0.91, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.32,  -0.91, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(<-12.32,   2.74, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-12.32,   2.74, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<-10.08, -10.04, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -7.84,  -8.22, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<-10.08, -10.04, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #10
atom(< -7.84,  -8.22, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #11
atom(<-10.08,  -6.39, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -7.84,  -4.57, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-10.08,  -6.39, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #14
atom(< -7.84,  -4.57, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(<-10.08,  -2.74, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -7.84,  -0.91, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(<-10.08,  -2.74, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #18
atom(< -7.84,  -0.91, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
atom(<-10.08,   0.91, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -7.84,   2.74, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-10.08,   0.91, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #22
atom(< -7.84,   2.74, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(< -5.60, -10.04, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -3.36,  -8.22, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -5.60, -10.04, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(< -3.36,  -8.22, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(< -5.60,  -6.39, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(< -3.36,  -4.57, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -5.60,  -6.39, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(< -3.36,  -4.57, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(< -5.60,  -2.74, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(< -3.36,  -0.91, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(< -5.60,  -2.74, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(< -3.36,  -0.91, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(< -5.60,   0.91, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -3.36,   2.74, -15.93>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(< -5.60,   0.91, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #38
atom(< -3.36,   2.74, -18.25>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(< -1.12, -10.04, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(< -1.12, -10.04, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #41
atom(< -1.12,  -6.39, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #42
atom(< -1.12,  -6.39, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #43
atom(< -1.12,  -2.74, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #44
atom(< -1.12,  -2.74, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #45
atom(< -1.12,   0.91, -18.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #46
atom(< -1.12,   0.91, -15.97>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #47
cylinder {<-12.32,  -8.22, -15.93>, <-11.20,  -7.30, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -15.97>, <-11.20,  -7.30, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.22, -15.93>, <-12.32,  -8.22, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.22, -18.25>, <-12.32,  -8.22, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.22, -15.93>, <-11.20,  -9.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -15.97>, <-11.20,  -9.13, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.22, -18.25>, <-11.20,  -7.30, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -18.29>, <-11.20,  -7.30, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -8.22, -18.25>, <-11.20,  -9.13, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -18.29>, <-11.20,  -9.13, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -15.93>, <-12.32,  -4.57, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -18.25>, <-12.32,  -4.57, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -15.93>, <-11.20,  -5.48, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -15.97>, <-11.20,  -5.48, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -15.93>, <-11.20,  -3.65, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -15.97>, <-11.20,  -3.65, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -18.25>, <-11.20,  -5.48, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -18.29>, <-11.20,  -5.48, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -4.57, -18.25>, <-11.20,  -3.65, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -18.29>, <-11.20,  -3.65, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -15.93>, <-11.20,  -1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -15.97>, <-11.20,  -1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -15.93>, <-12.32,  -0.91, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -18.25>, <-12.32,  -0.91, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -15.93>, <-11.20,  -0.00, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -15.97>, <-11.20,  -0.00, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -18.25>, <-11.20,  -1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -18.29>, <-11.20,  -1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,  -0.91, -18.25>, <-11.20,   0.00, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -18.29>, <-11.20,   0.00, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,   2.74, -15.93>, <-12.32,   2.74, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,   2.74, -18.25>, <-12.32,   2.74, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,   2.74, -15.93>, <-11.20,   1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -15.97>, <-11.20,   1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.32,   2.74, -18.25>, <-11.20,   1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -18.29>, <-11.20,   1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -18.29>, <-10.08, -10.04, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -15.97>, <-10.08, -10.04, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -18.29>, < -8.96,  -9.13, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -18.25>, < -8.96,  -9.13, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -15.93>, < -8.96,  -7.30, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -15.97>, < -8.96,  -7.30, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -15.93>, < -8.96,  -9.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08, -10.04, -15.97>, < -8.96,  -9.13, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -15.93>, < -7.84,  -8.22, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -18.25>, < -7.84,  -8.22, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -15.93>, < -6.72,  -9.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -15.97>, < -6.72,  -9.13, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -15.93>, < -6.72,  -7.30, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -15.97>, < -6.72,  -7.30, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -18.25>, < -8.96,  -7.30, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -18.29>, < -8.96,  -7.30, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -18.25>, < -6.72,  -9.13, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -18.29>, < -6.72,  -9.13, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -8.22, -18.25>, < -6.72,  -7.30, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -18.29>, < -6.72,  -7.30, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -18.29>, <-10.08,  -6.39, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -15.97>, <-10.08,  -6.39, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -18.29>, < -8.96,  -5.48, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -18.25>, < -8.96,  -5.48, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -15.93>, < -8.96,  -5.48, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -6.39, -15.97>, < -8.96,  -5.48, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -15.93>, < -7.84,  -4.57, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -18.25>, < -7.84,  -4.57, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -15.93>, < -6.72,  -5.48, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -15.97>, < -6.72,  -5.48, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -15.93>, < -8.96,  -3.65, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -15.97>, < -8.96,  -3.65, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -15.93>, < -6.72,  -3.65, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -15.97>, < -6.72,  -3.65, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -18.25>, < -6.72,  -5.48, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -18.29>, < -6.72,  -5.48, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -18.25>, < -8.96,  -3.65, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -18.29>, < -8.96,  -3.65, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -4.57, -18.25>, < -6.72,  -3.65, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -18.29>, < -6.72,  -3.65, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -18.29>, <-10.08,  -2.74, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -15.97>, <-10.08,  -2.74, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -18.29>, < -8.96,  -1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -18.25>, < -8.96,  -1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -15.93>, < -8.96,  -1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,  -2.74, -15.97>, < -8.96,  -1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -15.93>, < -8.96,  -0.00, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -15.97>, < -8.96,  -0.00, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -15.93>, < -7.84,  -0.91, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -18.25>, < -7.84,  -0.91, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -15.93>, < -6.72,  -1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -15.97>, < -6.72,  -1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -15.93>, < -6.72,  -0.00, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -15.97>, < -6.72,  -0.00, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -18.25>, < -8.96,   0.00, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -18.29>, < -8.96,   0.00, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -18.25>, < -6.72,  -1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -18.29>, < -6.72,  -1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,  -0.91, -18.25>, < -6.72,   0.00, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -18.29>, < -6.72,   0.00, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -18.29>, <-10.08,   0.91, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -15.97>, <-10.08,   0.91, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -18.29>, < -8.96,   1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -18.25>, < -8.96,   1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -15.93>, < -8.96,   1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.08,   0.91, -15.97>, < -8.96,   1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -15.93>, < -7.84,   2.74, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -18.25>, < -7.84,   2.74, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -15.93>, < -6.72,   1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -15.97>, < -6.72,   1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.84,   2.74, -18.25>, < -6.72,   1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -18.29>, < -6.72,   1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -18.29>, < -5.60, -10.04, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -15.97>, < -5.60, -10.04, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -18.29>, < -4.48,  -9.13, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -18.25>, < -4.48,  -9.13, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -15.93>, < -4.48,  -9.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60, -10.04, -15.97>, < -4.48,  -9.13, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -15.93>, < -3.36,  -8.22, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -18.25>, < -3.36,  -8.22, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -15.93>, < -4.48,  -7.30, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -15.97>, < -4.48,  -7.30, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -15.93>, < -2.24,  -9.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12, -10.04, -15.97>, < -2.24,  -9.13, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -15.93>, < -2.24,  -7.30, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -15.97>, < -2.24,  -7.30, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -18.25>, < -4.48,  -7.30, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -18.29>, < -4.48,  -7.30, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -18.25>, < -2.24,  -9.13, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12, -10.04, -18.29>, < -2.24,  -9.13, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -8.22, -18.25>, < -2.24,  -7.30, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -18.29>, < -2.24,  -7.30, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -18.29>, < -4.48,  -5.48, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -18.25>, < -4.48,  -5.48, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -18.29>, < -5.60,  -6.39, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -15.97>, < -5.60,  -6.39, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -15.93>, < -3.36,  -4.57, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -18.25>, < -3.36,  -4.57, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -15.93>, < -4.48,  -5.48, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -6.39, -15.97>, < -4.48,  -5.48, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -15.93>, < -2.24,  -5.48, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -15.97>, < -2.24,  -5.48, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -15.93>, < -4.48,  -3.65, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -15.97>, < -4.48,  -3.65, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -15.93>, < -2.24,  -3.65, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -15.97>, < -2.24,  -3.65, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -18.25>, < -2.24,  -5.48, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -18.29>, < -2.24,  -5.48, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -18.25>, < -4.48,  -3.65, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -18.29>, < -4.48,  -3.65, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -4.57, -18.25>, < -2.24,  -3.65, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -18.29>, < -2.24,  -3.65, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -18.29>, < -5.60,  -2.74, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -15.97>, < -5.60,  -2.74, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -18.29>, < -4.48,  -1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -18.25>, < -4.48,  -1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -15.93>, < -4.48,  -1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,  -2.74, -15.97>, < -4.48,  -1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -15.93>, < -4.48,  -0.00, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -15.97>, < -4.48,  -0.00, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -15.93>, < -3.36,  -0.91, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -18.25>, < -3.36,  -0.91, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -15.93>, < -2.24,  -1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -15.97>, < -2.24,  -1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -15.93>, < -2.24,  -0.00, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -15.97>, < -2.24,  -0.00, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -18.25>, < -4.48,   0.00, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -18.29>, < -4.48,   0.00, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -18.25>, < -2.24,  -1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -18.29>, < -2.24,  -1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -0.91, -18.25>, < -2.24,   0.00, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -18.29>, < -2.24,   0.00, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -18.29>, < -5.60,   0.91, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -15.97>, < -5.60,   0.91, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -18.29>, < -4.48,   1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -18.25>, < -4.48,   1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -15.93>, < -4.48,   1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.60,   0.91, -15.97>, < -4.48,   1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -15.93>, < -3.36,   2.74, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -18.25>, < -3.36,   2.74, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -15.93>, < -2.24,   1.83, -15.95>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -15.97>, < -2.24,   1.83, -15.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,   2.74, -18.25>, < -2.24,   1.83, -18.27>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -18.29>, < -2.24,   1.83, -18.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12, -10.04, -18.29>, < -1.12, -10.04, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12, -10.04, -15.97>, < -1.12, -10.04, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -18.29>, < -1.12,  -6.39, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -6.39, -15.97>, < -1.12,  -6.39, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -18.29>, < -1.12,  -2.74, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,  -2.74, -15.97>, < -1.12,  -2.74, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -18.29>, < -1.12,   0.91, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -1.12,   0.91, -15.97>, < -1.12,   0.91, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
