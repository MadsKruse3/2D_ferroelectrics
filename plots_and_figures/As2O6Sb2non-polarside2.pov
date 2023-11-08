#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -38.69*x up 29.73*y
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

cylinder {< 15.65, -14.16, -27.94>, < 15.65, -14.03,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.65,  14.03, -30.24>, < 15.65,  14.16,  -2.30>, Rcell pigment {Black}}
cylinder {<-18.42,  14.03, -30.24>, <-18.42,  14.16,  -2.30>, Rcell pigment {Black}}
cylinder {<-18.42, -14.16, -27.94>, <-18.42, -14.03,   0.00>, Rcell pigment {Black}}
cylinder {< 15.65, -14.16, -27.94>, < 15.65,  14.03, -30.24>, Rcell pigment {Black}}
cylinder {< 15.65, -14.03,  -0.00>, < 15.65,  14.16,  -2.30>, Rcell pigment {Black}}
cylinder {<-18.42, -14.03,   0.00>, <-18.42,  14.16,  -2.30>, Rcell pigment {Black}}
cylinder {<-18.42, -14.16, -27.94>, <-18.42,  14.03, -30.24>, Rcell pigment {Black}}
cylinder {< 15.65, -14.16, -27.94>, <-18.42, -14.16, -27.94>, Rcell pigment {Black}}
cylinder {< 15.65, -14.03,  -0.00>, <-18.42, -14.03,   0.00>, Rcell pigment {Black}}
cylinder {< 15.65,  14.16,  -2.30>, <-18.42,  14.16,  -2.30>, Rcell pigment {Black}}
cylinder {< 15.65,  14.03, -30.24>, <-18.42,  14.03, -30.24>, Rcell pigment {Black}}
atom(< 14.78, -11.23, -27.10>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(< 17.53,  -7.11, -27.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(< 14.78,  -5.59, -27.56>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(< 14.78,  -8.62, -27.15>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(< 16.46,  -9.92, -27.12>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #4
atom(< 14.78, -11.21, -22.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< 16.52, -11.43, -24.59>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(< 13.47,  -9.92, -27.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(< 17.83,  -7.10, -25.02>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< 14.84,  -7.10, -25.02>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(< 16.46,  -4.29, -27.58>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #10
atom(< 13.76,  -9.91, -24.79>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< 17.53,  -7.08, -22.70>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< 16.52,  -8.40, -25.00>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< 14.78,  -5.57, -22.90>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< 14.78,  -8.60, -22.49>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< 16.52,  -5.79, -25.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< 13.47,  -4.29, -27.58>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< 13.76,  -4.28, -25.25>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(< 16.46,  -9.90, -22.47>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< 16.52, -11.41, -19.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< 13.47,  -9.90, -22.47>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< 17.83,  -7.07, -20.37>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #22
atom(< 14.84,  -7.07, -20.37>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #23
atom(< 16.46,  -4.27, -22.93>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #24
atom(< 13.76,  -9.89, -20.14>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< 17.53,  -7.06, -18.04>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< 16.52,  -8.38, -20.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< 14.78,  -5.55, -18.24>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< 16.52,  -5.77, -20.39>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #29
atom(< 13.47,  -4.27, -22.93>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< 13.76,  -4.26, -20.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< 16.46,  -4.24, -18.27>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #32
atom(< 13.47,  -4.24, -18.27>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #33
cylinder {< 14.78, -11.23, -27.10>, < 14.13, -10.58, -27.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -9.92, -27.12>, < 14.13, -10.58, -27.11>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.78, -11.23, -27.10>, < 15.62, -10.58, -27.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -9.92, -27.12>, < 15.62, -10.58, -27.11>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.59, -27.56>, < 14.13,  -4.94, -27.57>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -4.29, -27.58>, < 14.13,  -4.94, -27.57>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.59, -27.56>, < 15.62,  -4.94, -27.57>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -4.29, -27.58>, < 15.62,  -4.94, -27.57>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -8.62, -27.15>, < 14.13,  -9.27, -27.13>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -9.92, -27.12>, < 14.13,  -9.27, -27.13>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -8.62, -27.15>, < 15.62,  -9.27, -27.13>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -9.92, -27.12>, < 15.62,  -9.27, -27.13>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78, -11.21, -22.44>, < 15.62, -10.56, -22.45>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -9.90, -22.47>, < 15.62, -10.56, -22.45>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78, -11.21, -22.44>, < 14.13, -10.56, -22.45>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -9.90, -22.47>, < 14.13, -10.56, -22.45>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.83,  -7.10, -25.02>, < 17.17,  -7.75, -25.01>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -8.40, -25.00>, < 17.17,  -7.75, -25.01>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.83,  -7.10, -25.02>, < 17.17,  -6.44, -25.04>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -5.79, -25.05>, < 17.17,  -6.44, -25.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.84,  -7.10, -25.02>, < 15.68,  -7.75, -25.01>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -8.40, -25.00>, < 15.68,  -7.75, -25.01>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.84,  -7.10, -25.02>, < 15.68,  -6.44, -25.04>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -5.79, -25.05>, < 15.68,  -6.44, -25.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.57, -22.90>, < 15.62,  -4.92, -22.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -4.27, -22.93>, < 15.62,  -4.92, -22.91>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.57, -22.90>, < 14.13,  -4.92, -22.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -4.27, -22.93>, < 14.13,  -4.92, -22.91>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -8.60, -22.49>, < 15.62,  -9.25, -22.48>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -9.90, -22.47>, < 15.62,  -9.25, -22.48>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -8.60, -22.49>, < 14.13,  -9.25, -22.48>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -9.90, -22.47>, < 14.13,  -9.25, -22.48>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.83,  -7.07, -20.37>, < 17.17,  -7.73, -20.35>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -8.38, -20.34>, < 17.17,  -7.73, -20.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.83,  -7.07, -20.37>, < 17.17,  -6.42, -20.38>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -5.77, -20.39>, < 17.17,  -6.42, -20.38>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.84,  -7.07, -20.37>, < 15.68,  -7.73, -20.35>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -8.38, -20.34>, < 15.68,  -7.73, -20.35>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.84,  -7.07, -20.37>, < 15.68,  -6.42, -20.38>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.52,  -5.77, -20.39>, < 15.68,  -6.42, -20.38>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.55, -18.24>, < 15.62,  -4.90, -18.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 16.46,  -4.24, -18.27>, < 15.62,  -4.90, -18.26>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 14.78,  -5.55, -18.24>, < 14.13,  -4.90, -18.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.47,  -4.24, -18.27>, < 14.13,  -4.90, -18.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
