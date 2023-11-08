#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.75*x up 38.69*y
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

cylinder {<-12.82, -15.65,  -0.00>, < 15.12, -15.65,  -0.13>, Rcell pigment {Black}}
cylinder {<-15.12, -15.65, -28.19>, < 12.82, -15.65, -28.32>, Rcell pigment {Black}}
cylinder {<-15.12,  18.42, -28.19>, < 12.82,  18.42, -28.32>, Rcell pigment {Black}}
cylinder {<-12.82,  18.42,   0.00>, < 15.12,  18.42,  -0.13>, Rcell pigment {Black}}
cylinder {<-12.82, -15.65,  -0.00>, <-15.12, -15.65, -28.19>, Rcell pigment {Black}}
cylinder {< 15.12, -15.65,  -0.13>, < 12.82, -15.65, -28.32>, Rcell pigment {Black}}
cylinder {< 15.12,  18.42,  -0.13>, < 12.82,  18.42, -28.32>, Rcell pigment {Black}}
cylinder {<-12.82,  18.42,   0.00>, <-15.12,  18.42, -28.19>, Rcell pigment {Black}}
cylinder {<-12.82, -15.65,  -0.00>, <-12.82,  18.42,   0.00>, Rcell pigment {Black}}
cylinder {< 15.12, -15.65,  -0.13>, < 15.12,  18.42,  -0.13>, Rcell pigment {Black}}
cylinder {< 12.82, -15.65, -28.32>, < 12.82,  18.42, -28.32>, Rcell pigment {Black}}
cylinder {<-15.12, -15.65, -28.19>, <-15.12,  18.42, -28.19>, Rcell pigment {Black}}
atom(<-11.98, -14.78,  -2.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(<-12.23, -17.53,  -7.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(<-12.44, -14.78,  -8.57>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<-12.03, -14.78,  -5.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<-12.00, -16.46,  -4.23>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #4
atom(< -7.32, -14.78,  -2.95>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -9.47, -16.52,  -2.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-12.00, -13.47,  -4.23>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(< -9.90, -17.83,  -7.06>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -9.90, -14.84,  -7.06>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(<-12.46, -16.46,  -9.87>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #10
atom(< -9.67, -13.76,  -4.24>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -7.57, -17.53,  -7.07>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -9.88, -16.52,  -5.76>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< -7.78, -14.78,  -8.59>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< -7.37, -14.78,  -5.56>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< -9.93, -16.52,  -8.37>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-12.46, -13.47,  -9.87>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(<-10.13, -13.76,  -9.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(< -7.34, -16.46,  -4.26>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< -4.81, -16.52,  -2.75>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -7.34, -13.47,  -4.26>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< -5.25, -17.83,  -7.08>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #22
atom(< -5.25, -14.84,  -7.08>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #23
atom(< -7.80, -16.46,  -9.89>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #24
atom(< -5.02, -13.76,  -4.27>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -2.92, -17.53,  -7.10>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< -5.22, -16.52,  -5.78>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< -3.12, -14.78,  -8.61>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< -5.27, -16.52,  -8.39>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #29
atom(< -7.80, -13.47,  -9.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -5.48, -13.76,  -9.90>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -3.15, -16.46,  -9.91>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #32
atom(< -3.15, -13.47,  -9.91>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #33
cylinder {<-11.98, -14.78,  -2.93>, <-11.99, -14.13,  -3.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00, -13.47,  -4.23>, <-11.99, -14.13,  -3.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.98, -14.78,  -2.93>, <-11.99, -15.62,  -3.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00, -16.46,  -4.23>, <-11.99, -15.62,  -3.58>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.44, -14.78,  -8.57>, <-12.45, -14.13,  -9.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.46, -13.47,  -9.87>, <-12.45, -14.13,  -9.22>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-12.44, -14.78,  -8.57>, <-12.45, -15.62,  -9.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.46, -16.46,  -9.87>, <-12.45, -15.62,  -9.22>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.03, -14.78,  -5.54>, <-12.01, -14.13,  -4.89>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00, -13.47,  -4.23>, <-12.01, -14.13,  -4.89>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-12.03, -14.78,  -5.54>, <-12.01, -15.62,  -4.89>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.00, -16.46,  -4.23>, <-12.01, -15.62,  -4.89>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.32, -14.78,  -2.95>, < -7.33, -15.62,  -3.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34, -16.46,  -4.26>, < -7.33, -15.62,  -3.60>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.32, -14.78,  -2.95>, < -7.33, -14.13,  -3.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34, -13.47,  -4.26>, < -7.33, -14.13,  -3.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.90, -17.83,  -7.06>, < -9.89, -17.17,  -6.41>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -16.52,  -5.76>, < -9.89, -17.17,  -6.41>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90, -17.83,  -7.06>, < -9.92, -17.17,  -7.72>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.93, -16.52,  -8.37>, < -9.92, -17.17,  -7.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90, -14.84,  -7.06>, < -9.89, -15.68,  -6.41>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -16.52,  -5.76>, < -9.89, -15.68,  -6.41>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.90, -14.84,  -7.06>, < -9.92, -15.68,  -7.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.93, -16.52,  -8.37>, < -9.92, -15.68,  -7.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.78, -14.78,  -8.59>, < -7.79, -15.62,  -9.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.80, -16.46,  -9.89>, < -7.79, -15.62,  -9.24>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.78, -14.78,  -8.59>, < -7.79, -14.13,  -9.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.80, -13.47,  -9.89>, < -7.79, -14.13,  -9.24>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.37, -14.78,  -5.56>, < -7.36, -15.62,  -4.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34, -16.46,  -4.26>, < -7.36, -15.62,  -4.91>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.37, -14.78,  -5.56>, < -7.36, -14.13,  -4.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -7.34, -13.47,  -4.26>, < -7.36, -14.13,  -4.91>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.25, -17.83,  -7.08>, < -5.23, -17.17,  -6.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.22, -16.52,  -5.78>, < -5.23, -17.17,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25, -17.83,  -7.08>, < -5.26, -17.17,  -7.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.27, -16.52,  -8.39>, < -5.26, -17.17,  -7.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25, -14.84,  -7.08>, < -5.23, -15.68,  -6.43>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.22, -16.52,  -5.78>, < -5.23, -15.68,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.25, -14.84,  -7.08>, < -5.26, -15.68,  -7.74>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.27, -16.52,  -8.39>, < -5.26, -15.68,  -7.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.12, -14.78,  -8.61>, < -3.14, -15.62,  -9.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.15, -16.46,  -9.91>, < -3.14, -15.62,  -9.26>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12, -14.78,  -8.61>, < -3.14, -14.13,  -9.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.15, -13.47,  -9.91>, < -3.14, -14.13,  -9.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
