#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.75*x up 29.73*y
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

cylinder {<-12.82, -14.16, -34.07>, < 15.12, -14.03, -34.07>, Rcell pigment {Black}}
cylinder {<-15.12,  14.03, -34.07>, < 12.82,  14.16, -34.07>, Rcell pigment {Black}}
cylinder {<-15.12,  14.03,   0.00>, < 12.82,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.82, -14.16,   0.00>, < 15.12, -14.03,   0.00>, Rcell pigment {Black}}
cylinder {<-12.82, -14.16, -34.07>, <-15.12,  14.03, -34.07>, Rcell pigment {Black}}
cylinder {< 15.12, -14.03, -34.07>, < 12.82,  14.16, -34.07>, Rcell pigment {Black}}
cylinder {< 15.12, -14.03,   0.00>, < 12.82,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-12.82, -14.16,   0.00>, <-15.12,  14.03,   0.00>, Rcell pigment {Black}}
cylinder {<-12.82, -14.16, -34.07>, <-12.82, -14.16,   0.00>, Rcell pigment {Black}}
cylinder {< 15.12, -14.03, -34.07>, < 15.12, -14.03,   0.00>, Rcell pigment {Black}}
cylinder {< 12.82,  14.16, -34.07>, < 12.82,  14.16,   0.00>, Rcell pigment {Black}}
cylinder {<-15.12,  14.03, -34.07>, <-15.12,  14.03,   0.00>, Rcell pigment {Black}}
atom(<-11.98, -11.23, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(<-12.23,  -7.11, -35.96>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(<-12.44,  -5.59, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<-12.03,  -8.62, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<-12.00,  -9.92, -34.88>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #4
atom(< -7.32, -11.21, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -9.47, -11.43, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-12.00,  -9.92, -31.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(< -9.90,  -7.10, -36.25>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -9.90,  -7.10, -33.26>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(<-12.46,  -4.29, -34.88>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #10
atom(< -9.67,  -9.91, -32.19>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -7.57,  -7.08, -35.96>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -9.88,  -8.40, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< -7.78,  -5.57, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< -7.37,  -8.60, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< -9.93,  -5.79, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-12.46,  -4.29, -31.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(<-10.13,  -4.28, -32.19>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(< -7.34,  -9.90, -34.88>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< -4.81, -11.41, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -7.34,  -9.90, -31.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< -5.25,  -7.07, -36.25>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #22
atom(< -5.25,  -7.07, -33.26>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #23
atom(< -7.80,  -4.27, -34.88>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #24
atom(< -5.02,  -9.89, -32.19>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -2.92,  -7.06, -35.96>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< -5.22,  -8.38, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< -3.12,  -5.55, -33.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< -5.27,  -5.77, -34.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #29
atom(< -7.80,  -4.27, -31.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -5.48,  -4.26, -32.19>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -3.15,  -4.24, -34.88>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #32
atom(< -3.15,  -4.24, -31.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #33
cylinder {<-11.98, -11.23, -33.21>, <-11.99, -10.58, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00,  -9.92, -31.89>, <-11.99, -10.58, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.98, -11.23, -33.21>, <-11.99, -10.58, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00,  -9.92, -34.88>, <-11.99, -10.58, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.44,  -5.59, -33.21>, <-12.45,  -4.94, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.46,  -4.29, -31.89>, <-12.45,  -4.94, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-12.44,  -5.59, -33.21>, <-12.45,  -4.94, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.46,  -4.29, -34.88>, <-12.45,  -4.94, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.03,  -8.62, -33.21>, <-12.01,  -9.27, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00,  -9.92, -31.89>, <-12.01,  -9.27, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-12.03,  -8.62, -33.21>, <-12.01,  -9.27, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00,  -9.92, -34.88>, <-12.01,  -9.27, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.32, -11.21, -33.21>, < -7.33, -10.56, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34,  -9.90, -34.88>, < -7.33, -10.56, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.32, -11.21, -33.21>, < -7.33, -10.56, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34,  -9.90, -31.89>, < -7.33, -10.56, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.90,  -7.10, -36.25>, < -9.89,  -7.75, -35.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.88,  -8.40, -34.94>, < -9.89,  -7.75, -35.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90,  -7.10, -36.25>, < -9.92,  -6.44, -35.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.93,  -5.79, -34.94>, < -9.92,  -6.44, -35.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90,  -7.10, -33.26>, < -9.89,  -7.75, -34.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.88,  -8.40, -34.94>, < -9.89,  -7.75, -34.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90,  -7.10, -33.26>, < -9.92,  -6.44, -34.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.93,  -5.79, -34.94>, < -9.92,  -6.44, -34.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.78,  -5.57, -33.21>, < -7.79,  -4.92, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -4.27, -34.88>, < -7.79,  -4.92, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.78,  -5.57, -33.21>, < -7.79,  -4.92, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,  -4.27, -31.89>, < -7.79,  -4.92, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.37,  -8.60, -33.21>, < -7.36,  -9.25, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34,  -9.90, -34.88>, < -7.36,  -9.25, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.37,  -8.60, -33.21>, < -7.36,  -9.25, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34,  -9.90, -31.89>, < -7.36,  -9.25, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.25,  -7.07, -36.25>, < -5.23,  -7.73, -35.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,  -8.38, -34.94>, < -5.23,  -7.73, -35.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25,  -7.07, -36.25>, < -5.26,  -6.42, -35.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.27,  -5.77, -34.94>, < -5.26,  -6.42, -35.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25,  -7.07, -33.26>, < -5.23,  -7.73, -34.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,  -8.38, -34.94>, < -5.23,  -7.73, -34.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25,  -7.07, -33.26>, < -5.26,  -6.42, -34.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.27,  -5.77, -34.94>, < -5.26,  -6.42, -34.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,  -5.55, -33.21>, < -3.14,  -4.90, -34.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -4.24, -34.88>, < -3.14,  -4.90, -34.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,  -5.55, -33.21>, < -3.14,  -4.90, -32.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -4.24, -31.89>, < -3.14,  -4.90, -32.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
