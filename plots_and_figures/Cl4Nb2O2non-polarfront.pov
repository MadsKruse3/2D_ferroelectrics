#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.98*x up 35.38*y
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

cylinder {< -6.52, -16.85, -34.05>, < 17.13, -16.85, -34.05>, Rcell pigment {Black}}
cylinder {< -6.51,  16.85, -34.05>, < 17.13,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< -6.51,  16.85,   0.00>, < 17.13,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.52, -16.85,   0.00>, < 17.13, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.52, -16.85, -34.05>, < -6.51,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< 17.13, -16.85, -34.05>, < 17.13,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< 17.13, -16.85,   0.00>, < 17.13,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.52, -16.85,   0.00>, < -6.51,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.52, -16.85, -34.05>, < -6.52, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.13, -16.85, -34.05>, < 17.13, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.13,  16.85, -34.05>, < 17.13,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.51,  16.85, -34.05>, < -6.51,  16.85,   0.00>, Rcell pigment {Black}}
atom(< -9.88, -14.88, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #0
atom(<-11.36, -15.06, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #1
atom(< -9.88, -14.88, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(<-15.15, -14.70, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #3
atom(<-13.25, -14.88, -35.71>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(<-16.62, -14.88, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(<-13.25, -14.88, -32.38>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(<-16.62, -14.88, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(< -9.88, -10.94, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(<-11.36, -11.12, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(< -9.88, -10.94, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(<-15.15, -10.76, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #11
atom(<-13.25, -10.94, -35.71>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #12
atom(<-16.62, -10.94, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(<-13.25, -10.94, -32.38>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(<-16.62, -10.94, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(<-15.13, -12.92, -34.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-11.38, -12.90, -34.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< -9.88,  -6.99, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<-11.36,  -7.18, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(< -9.88,  -6.99, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(<-15.15,  -6.81, -34.05>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #21
atom(<-13.25,  -6.99, -35.71>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #22
atom(<-16.62,  -6.99, -36.00>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(<-13.25,  -6.99, -32.38>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(<-16.62,  -6.99, -32.09>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #25
atom(<-15.13,  -8.98, -34.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(<-11.38,  -8.95, -34.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
cylinder {< -9.88, -14.88, -36.00>, <-10.62, -14.97, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.06, -34.05>, <-10.62, -14.97, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.06, -34.05>, <-10.62, -14.97, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -14.88, -32.09>, <-10.62, -14.97, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.06, -34.05>, <-12.31, -14.97, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.88, -35.71>, <-12.31, -14.97, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.06, -34.05>, <-12.31, -14.97, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.88, -32.38>, <-12.31, -14.97, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.06, -34.05>, <-11.37, -13.98, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -12.90, -34.05>, <-11.37, -13.98, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -14.70, -34.05>, <-14.20, -14.79, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.88, -35.71>, <-14.20, -14.79, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -14.70, -34.05>, <-15.89, -14.79, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -14.88, -36.00>, <-15.89, -14.79, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -14.70, -34.05>, <-14.20, -14.79, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.88, -32.38>, <-14.20, -14.79, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -14.70, -34.05>, <-15.89, -14.79, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -14.88, -32.09>, <-15.89, -14.79, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -14.70, -34.05>, <-15.14, -13.81, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -12.92, -34.05>, <-15.14, -13.81, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -10.94, -36.00>, <-10.62, -11.03, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-10.62, -11.03, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-12.31, -11.03, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -10.94, -32.38>, <-12.31, -11.03, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-11.37, -12.01, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -12.90, -34.05>, <-11.37, -12.01, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-10.62, -11.03, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -10.94, -32.09>, <-10.62, -11.03, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-12.31, -11.03, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -10.94, -35.71>, <-12.31, -11.03, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -11.12, -34.05>, <-11.37, -10.04, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38,  -8.95, -34.05>, <-11.37, -10.04, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-14.20, -10.85, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -10.94, -32.38>, <-14.20, -10.85, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-15.14, -11.84, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -12.92, -34.05>, <-15.14, -11.84, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-15.89, -10.85, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -10.94, -32.09>, <-15.89, -10.85, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-14.20, -10.85, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -10.94, -35.71>, <-14.20, -10.85, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-15.89, -10.85, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -10.94, -36.00>, <-15.89, -10.85, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -10.76, -34.05>, <-15.14,  -9.87, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -8.98, -34.05>, <-15.14,  -9.87, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.88,  -6.99, -36.00>, <-10.62,  -7.09, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36,  -7.18, -34.05>, <-10.62,  -7.09, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36,  -7.18, -34.05>, <-11.37,  -8.07, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38,  -8.95, -34.05>, <-11.37,  -8.07, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.36,  -7.18, -34.05>, <-10.62,  -7.09, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88,  -6.99, -32.09>, <-10.62,  -7.09, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36,  -7.18, -34.05>, <-12.31,  -7.09, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25,  -6.99, -35.71>, <-12.31,  -7.09, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36,  -7.18, -34.05>, <-12.31,  -7.09, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25,  -6.99, -32.38>, <-12.31,  -7.09, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15,  -6.81, -34.05>, <-15.14,  -7.90, -34.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -8.98, -34.05>, <-15.14,  -7.90, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15,  -6.81, -34.05>, <-14.20,  -6.90, -34.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25,  -6.99, -35.71>, <-14.20,  -6.90, -34.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15,  -6.81, -34.05>, <-15.89,  -6.90, -35.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62,  -6.99, -36.00>, <-15.89,  -6.90, -35.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15,  -6.81, -34.05>, <-14.20,  -6.90, -33.21>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25,  -6.99, -32.38>, <-14.20,  -6.90, -33.21>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15,  -6.81, -34.05>, <-15.89,  -6.90, -33.07>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62,  -6.99, -32.09>, <-15.89,  -6.90, -33.07>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
