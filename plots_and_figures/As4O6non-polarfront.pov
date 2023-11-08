#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.27*x up 29.73*y
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

cylinder {<-13.02, -14.16, -33.86>, < 14.89, -13.97, -33.86>, Rcell pigment {Black}}
cylinder {<-14.89,  13.97, -33.86>, < 13.02,  14.16, -33.86>, Rcell pigment {Black}}
cylinder {<-14.89,  13.97,   0.00>, < 13.02,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-13.02, -14.16,   0.00>, < 14.89, -13.97,   0.00>, Rcell pigment {Black}}
cylinder {<-13.02, -14.16, -33.86>, <-14.89,  13.97, -33.86>, Rcell pigment {Black}}
cylinder {< 14.89, -13.97, -33.86>, < 13.02,  14.16, -33.86>, Rcell pigment {Black}}
cylinder {< 14.89, -13.97,   0.00>, < 13.02,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-13.02, -14.16,   0.00>, <-14.89,  13.97,   0.00>, Rcell pigment {Black}}
cylinder {<-13.02, -14.16, -33.86>, <-13.02, -14.16,   0.00>, Rcell pigment {Black}}
cylinder {< 14.89, -13.97, -33.86>, < 14.89, -13.97,   0.00>, Rcell pigment {Black}}
cylinder {< 13.02,  14.16, -33.86>, < 13.02,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-14.89,  13.97, -33.86>, <-14.89,  13.97,   0.00>, Rcell pigment {Black}}
atom(< -8.55, -11.31, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(<-10.64, -12.02, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(<-10.82,  -8.22, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #2
atom(<-11.31,  -8.81, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #3
atom(< -8.93,  -5.69, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(<-11.06,  -8.52, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -8.98,  -7.81, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-11.11, -10.64, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(< -8.50,  -9.19, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #8
atom(<-11.02,  -6.40, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(<-11.68,  -3.19, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #10
atom(<-11.49,  -5.01, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -8.88,  -3.57, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -8.80, -11.61, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #13
atom(< -3.90, -11.28, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< -5.99, -11.99, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< -8.31, -11.02, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #16
atom(< -6.17,  -8.19, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< -9.17,  -5.98, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #18
atom(< -6.66,  -8.78, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(< -4.28,  -5.66, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -6.41,  -8.49, -33.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< -4.32,  -7.78, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -6.46, -10.61, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -3.85,  -9.16, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -6.37,  -6.37, -35.65>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -8.68,  -5.40, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(< -6.84,  -4.98, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< -4.23,  -3.54, -32.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< -4.14, -11.58, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< -3.66, -10.99, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -4.52,  -5.95, -35.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #31
atom(< -4.03,  -5.36, -32.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #32
cylinder {< -8.55, -11.31, -33.86>, < -8.43, -11.17, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -11.02, -32.12>, < -8.43, -11.17, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.55, -11.31, -33.86>, < -8.67, -11.46, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.80, -11.61, -35.61>, < -8.67, -11.46, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.64, -12.02, -35.65>, < -9.72, -11.81, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.80, -11.61, -35.61>, < -9.72, -11.81, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.82,  -8.22, -35.61>, <-10.94,  -8.37, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.06,  -8.52, -33.86>, <-10.94,  -8.37, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.82,  -8.22, -35.61>, <-10.92,  -7.31, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.02,  -6.40, -35.65>, <-10.92,  -7.31, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.82,  -8.22, -35.61>, < -9.90,  -8.02, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.98,  -7.81, -35.65>, < -9.90,  -8.02, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.31,  -8.81, -32.12>, <-11.21,  -9.72, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.11, -10.64, -32.08>, <-11.21,  -9.72, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.31,  -8.81, -32.12>, <-11.19,  -8.66, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.06,  -8.52, -33.86>, <-11.19,  -8.66, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.93,  -5.69, -33.86>, < -9.05,  -5.84, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17,  -5.98, -35.61>, < -9.05,  -5.84, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93,  -5.69, -33.86>, < -8.80,  -5.54, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,  -5.40, -32.12>, < -8.80,  -5.54, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.98,  -7.81, -35.65>, < -9.07,  -6.90, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17,  -5.98, -35.61>, < -9.07,  -6.90, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -9.19, -32.08>, < -8.41, -10.11, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -11.02, -32.12>, < -8.41, -10.11, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -9.19, -32.08>, < -7.58,  -8.99, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66,  -8.78, -32.12>, < -7.58,  -8.99, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.02,  -6.40, -35.65>, <-10.09,  -6.19, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.17,  -5.98, -35.61>, <-10.09,  -6.19, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.68,  -3.19, -32.12>, <-11.59,  -4.10, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.49,  -5.01, -32.08>, <-11.59,  -4.10, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.88,  -3.57, -32.08>, < -8.78,  -4.48, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,  -5.40, -32.12>, < -8.78,  -4.48, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.90, -11.28, -33.86>, < -4.02, -11.43, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.14, -11.58, -35.61>, < -4.02, -11.43, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.90, -11.28, -33.86>, < -3.78, -11.14, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.66, -10.99, -32.12>, < -3.78, -11.14, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.99, -11.99, -35.65>, < -5.07, -11.78, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.14, -11.58, -35.61>, < -5.07, -11.78, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.31, -11.02, -32.12>, < -7.39, -10.81, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.46, -10.61, -32.08>, < -7.39, -10.81, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17,  -8.19, -35.61>, < -6.29,  -8.34, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.41,  -8.49, -33.86>, < -6.29,  -8.34, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17,  -8.19, -35.61>, < -6.27,  -7.28, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.37,  -6.37, -35.65>, < -6.27,  -7.28, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.17,  -8.19, -35.61>, < -5.25,  -7.99, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.32,  -7.78, -35.65>, < -5.25,  -7.99, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66,  -8.78, -32.12>, < -6.56,  -9.69, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.46, -10.61, -32.08>, < -6.56,  -9.69, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.66,  -8.78, -32.12>, < -6.54,  -8.63, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.41,  -8.49, -33.86>, < -6.54,  -8.63, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -5.66, -33.86>, < -4.40,  -5.80, -34.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52,  -5.95, -35.61>, < -4.40,  -5.80, -34.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -5.66, -33.86>, < -4.15,  -5.51, -32.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.03,  -5.36, -32.12>, < -4.15,  -5.51, -32.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.32,  -7.78, -35.65>, < -4.42,  -6.86, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52,  -5.95, -35.61>, < -4.42,  -6.86, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.85,  -9.16, -32.08>, < -3.75, -10.08, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.66, -10.99, -32.12>, < -3.75, -10.08, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.37,  -6.37, -35.65>, < -5.44,  -6.16, -35.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.52,  -5.95, -35.61>, < -5.44,  -6.16, -35.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,  -5.40, -32.12>, < -7.76,  -5.19, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.84,  -4.98, -32.08>, < -7.76,  -5.19, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.23,  -3.54, -32.08>, < -4.13,  -4.45, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.03,  -5.36, -32.12>, < -4.13,  -4.45, -32.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
