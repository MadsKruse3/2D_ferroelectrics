#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -28.32*x up 19.17*y
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

cylinder {<-13.41,  -9.13, -17.11>, < 13.49,  -9.13, -17.11>, Rcell pigment {Black}}
cylinder {<-13.41,   9.13, -17.11>, < 13.49,   9.13, -17.11>, Rcell pigment {Black}}
cylinder {<-13.41,   9.13,   0.00>, < 13.49,   9.13,   0.00>, Rcell pigment {Black}}
cylinder {<-13.41,  -9.13,   0.00>, < 13.49,  -9.13,   0.00>, Rcell pigment {Black}}
cylinder {<-13.41,  -9.13, -17.11>, <-13.41,   9.13, -17.11>, Rcell pigment {Black}}
cylinder {< 13.49,  -9.13, -17.11>, < 13.49,   9.13, -17.11>, Rcell pigment {Black}}
cylinder {< 13.49,  -9.13,   0.00>, < 13.49,   9.13,   0.00>, Rcell pigment {Black}}
cylinder {<-13.41,  -9.13,   0.00>, <-13.41,   9.13,   0.00>, Rcell pigment {Black}}
cylinder {<-13.41,  -9.13, -17.11>, <-13.41,  -9.13,   0.00>, Rcell pigment {Black}}
cylinder {< 13.49,  -9.13, -17.11>, < 13.49,  -9.13,   0.00>, Rcell pigment {Black}}
cylinder {< 13.49,   9.13, -17.11>, < 13.49,   9.13,   0.00>, Rcell pigment {Black}}
cylinder {<-13.41,   9.13, -17.11>, <-13.41,   9.13,   0.00>, Rcell pigment {Black}}
atom(<-12.29,  -6.39, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-12.29,  -6.39, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-12.29,  -2.74, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-12.29,  -2.74, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-12.29,   0.91, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.29,   0.91, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(< -7.80,  -6.39, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(< -7.80,  -6.39, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<-10.04,  -4.57, -18.29>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -7.80,  -2.74, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<-10.04,  -4.57, -15.97>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #10
atom(< -7.80,  -2.74, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #11
atom(<-10.04,  -0.91, -18.29>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(< -7.80,   0.91, -15.93>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-10.04,  -0.91, -15.97>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #14
atom(< -7.80,   0.91, -18.25>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(< -5.56,  -4.57, -18.29>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -5.56,  -4.57, -15.97>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #17
atom(< -5.56,  -0.91, -18.29>, 1.05, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -5.56,  -0.91, -15.97>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
cylinder {<-12.29,  -6.39, -15.93>, <-12.29,  -6.39, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.29,  -6.39, -18.25>, <-12.29,  -6.39, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.29,  -2.74, -15.93>, <-12.29,  -2.74, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.29,  -2.74, -18.25>, <-12.29,  -2.74, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-12.29,   0.91, -15.93>, <-12.29,   0.91, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.29,   0.91, -18.25>, <-12.29,   0.91, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -6.39, -15.93>, < -7.80,  -6.39, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -6.39, -18.25>, < -7.80,  -6.39, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.04,  -4.57, -18.29>, <-10.04,  -4.57, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.04,  -4.57, -15.97>, <-10.04,  -4.57, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -2.74, -15.93>, < -7.80,  -2.74, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -2.74, -18.25>, < -7.80,  -2.74, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-10.04,  -0.91, -18.29>, <-10.04,  -0.91, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.04,  -0.91, -15.97>, <-10.04,  -0.91, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   0.91, -15.93>, < -7.80,   0.91, -17.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   0.91, -18.25>, < -7.80,   0.91, -17.09>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.56,  -4.57, -18.29>, < -5.56,  -4.57, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.56,  -4.57, -15.97>, < -5.56,  -4.57, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.56,  -0.91, -18.29>, < -5.56,  -0.91, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.56,  -0.91, -15.97>, < -5.56,  -0.91, -17.13>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
