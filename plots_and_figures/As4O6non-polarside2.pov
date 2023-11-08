#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -38.02*x up 29.73*y
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

cylinder {< 15.76, -14.16, -27.91>, < 15.76, -13.97,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.76,  13.97, -29.78>, < 15.76,  14.16,  -1.88>, Rcell pigment {Black}}
cylinder {<-18.10,  13.97, -29.78>, <-18.10,  14.16,  -1.88>, Rcell pigment {Black}}
cylinder {<-18.10, -14.16, -27.91>, <-18.10, -13.97,   0.00>, Rcell pigment {Black}}
cylinder {< 15.76, -14.16, -27.91>, < 15.76,  13.97, -29.78>, Rcell pigment {Black}}
cylinder {< 15.76, -13.97,  -0.00>, < 15.76,  14.16,  -1.88>, Rcell pigment {Black}}
cylinder {<-18.10, -13.97,   0.00>, <-18.10,  14.16,  -1.88>, Rcell pigment {Black}}
cylinder {<-18.10, -14.16, -27.91>, <-18.10,  13.97, -29.78>, Rcell pigment {Black}}
cylinder {< 15.76, -14.16, -27.91>, <-18.10, -14.16, -27.91>, Rcell pigment {Black}}
cylinder {< 15.76, -13.97,  -0.00>, <-18.10, -13.97,   0.00>, Rcell pigment {Black}}
cylinder {< 15.76,  14.16,  -1.88>, <-18.10,  14.16,  -1.88>, Rcell pigment {Black}}
cylinder {< 15.76,  13.97, -29.78>, <-18.10,  13.97, -29.78>, Rcell pigment {Black}}
atom(< 15.76, -11.31, -23.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #0
atom(< 17.55, -12.02, -25.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #1
atom(< 17.51,  -8.22, -25.71>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #2
atom(< 14.01,  -8.81, -26.20>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #3
atom(< 15.76,  -5.69, -23.82>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< 15.76,  -8.52, -25.96>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< 17.55,  -7.81, -23.87>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(< 13.97, -10.64, -26.00>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(< 13.97,  -9.19, -23.39>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #8
atom(< 17.55,  -6.40, -25.91>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(< 14.01,  -3.19, -26.57>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #10
atom(< 13.97,  -5.01, -26.38>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< 13.97,  -3.57, -23.77>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< 17.51, -11.61, -23.69>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #13
atom(< 15.76, -11.28, -18.79>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< 17.55, -11.99, -20.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< 14.01, -11.02, -23.20>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #16
atom(< 17.51,  -8.19, -21.06>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< 17.51,  -5.98, -24.06>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #18
atom(< 14.01,  -8.78, -21.55>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(< 15.76,  -5.66, -19.17>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< 15.76,  -8.49, -21.30>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< 17.55,  -7.78, -19.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< 13.97, -10.61, -21.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< 13.97,  -9.16, -18.74>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< 17.55,  -6.37, -21.26>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< 14.01,  -5.40, -23.57>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(< 13.97,  -4.98, -21.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
atom(< 13.97,  -3.54, -19.12>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #28
atom(< 17.51, -11.58, -19.04>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< 14.01, -10.99, -18.55>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< 17.51,  -5.95, -19.41>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #31
atom(< 14.01,  -5.36, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #32
cylinder {< 15.76, -11.31, -23.44>, < 14.89, -11.17, -23.32>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01, -11.02, -23.20>, < 14.89, -11.17, -23.32>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76, -11.31, -23.44>, < 16.63, -11.46, -23.56>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51, -11.61, -23.69>, < 16.63, -11.46, -23.56>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55, -12.02, -25.53>, < 17.53, -11.81, -24.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51, -11.61, -23.69>, < 17.53, -11.81, -24.61>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.22, -25.71>, < 16.63,  -8.37, -25.83>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -8.52, -25.96>, < 16.63,  -8.37, -25.83>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.22, -25.71>, < 17.53,  -7.31, -25.81>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -6.40, -25.91>, < 17.53,  -7.31, -25.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.22, -25.71>, < 17.53,  -8.02, -24.79>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -7.81, -23.87>, < 17.53,  -8.02, -24.79>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -8.81, -26.20>, < 13.99,  -9.72, -26.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97, -10.64, -26.00>, < 13.99,  -9.72, -26.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -8.81, -26.20>, < 14.89,  -8.66, -26.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -8.52, -25.96>, < 14.89,  -8.66, -26.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -5.69, -23.82>, < 16.63,  -5.84, -23.94>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.98, -24.06>, < 16.63,  -5.84, -23.94>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -5.69, -23.82>, < 14.89,  -5.54, -23.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -5.40, -23.57>, < 14.89,  -5.54, -23.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -7.81, -23.87>, < 17.53,  -6.90, -23.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.98, -24.06>, < 17.53,  -6.90, -23.96>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -9.19, -23.39>, < 13.99, -10.11, -23.30>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01, -11.02, -23.20>, < 13.99, -10.11, -23.30>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -9.19, -23.39>, < 13.99,  -8.99, -22.47>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -8.78, -21.55>, < 13.99,  -8.99, -22.47>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -6.40, -25.91>, < 17.53,  -6.19, -24.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.98, -24.06>, < 17.53,  -6.19, -24.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -3.19, -26.57>, < 13.99,  -4.10, -26.48>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -5.01, -26.38>, < 13.99,  -4.10, -26.48>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -3.57, -23.77>, < 13.99,  -4.48, -23.67>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -5.40, -23.57>, < 13.99,  -4.48, -23.67>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76, -11.28, -18.79>, < 16.63, -11.43, -18.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51, -11.58, -19.04>, < 16.63, -11.43, -18.91>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76, -11.28, -18.79>, < 14.89, -11.14, -18.67>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01, -10.99, -18.55>, < 14.89, -11.14, -18.67>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55, -11.99, -20.88>, < 17.53, -11.78, -19.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51, -11.58, -19.04>, < 17.53, -11.78, -19.96>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.01, -11.02, -23.20>, < 13.99, -10.81, -22.28>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97, -10.61, -21.35>, < 13.99, -10.81, -22.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.19, -21.06>, < 16.63,  -8.34, -21.18>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -8.49, -21.30>, < 16.63,  -8.34, -21.18>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.19, -21.06>, < 17.53,  -7.28, -21.16>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -6.37, -21.26>, < 17.53,  -7.28, -21.16>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -8.19, -21.06>, < 17.53,  -7.99, -20.14>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -7.78, -19.21>, < 17.53,  -7.99, -20.14>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -8.78, -21.55>, < 13.99,  -9.69, -21.45>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97, -10.61, -21.35>, < 13.99,  -9.69, -21.45>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -8.78, -21.55>, < 14.89,  -8.63, -21.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -8.49, -21.30>, < 14.89,  -8.63, -21.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -5.66, -19.17>, < 16.63,  -5.80, -19.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.95, -19.41>, < 16.63,  -5.80, -19.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 15.76,  -5.66, -19.17>, < 14.89,  -5.51, -19.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -5.36, -18.92>, < 14.89,  -5.51, -19.04>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -7.78, -19.21>, < 17.53,  -6.86, -19.31>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.95, -19.41>, < 17.53,  -6.86, -19.31>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -9.16, -18.74>, < 13.99, -10.08, -18.65>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01, -10.99, -18.55>, < 13.99, -10.08, -18.65>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 17.55,  -6.37, -21.26>, < 17.53,  -6.16, -20.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.51,  -5.95, -19.41>, < 17.53,  -6.16, -20.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -5.40, -23.57>, < 13.99,  -5.19, -22.65>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -4.98, -21.73>, < 13.99,  -5.19, -22.65>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 13.97,  -3.54, -19.12>, < 13.99,  -4.45, -19.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 14.01,  -5.36, -18.92>, < 13.99,  -4.45, -19.02>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
