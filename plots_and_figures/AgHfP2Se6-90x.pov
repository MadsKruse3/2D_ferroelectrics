#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -60.29*x up 35.15*y
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

cylinder {< -9.57, -16.74,  -0.00>, < 28.71, -16.74,  -0.00>, Rcell pigment {Black}}
cylinder {<-28.71, -16.74, -33.15>, <  9.57, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {<-28.71,  16.74, -33.15>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57,  16.74,   0.00>, < 28.71,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.74,  -0.00>, <-28.71, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {< 28.71, -16.74,  -0.00>, <  9.57, -16.74, -33.15>, Rcell pigment {Black}}
cylinder {< 28.71,  16.74,   0.00>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57,  16.74,   0.00>, <-28.71,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {< -9.57, -16.74,  -0.00>, < -9.57,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {< 28.71, -16.74,  -0.00>, < 28.71,  16.74,   0.00>, Rcell pigment {Black}}
cylinder {<  9.57, -16.74, -33.15>, <  9.57,  16.74, -33.15>, Rcell pigment {Black}}
cylinder {<-28.71, -16.74, -33.15>, <-28.71,  16.74, -33.15>, Rcell pigment {Black}}
atom(< -7.58,   1.11,  -7.29>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -7.62,  -1.11,  -7.22>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -8.89,   1.79,  -5.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.27,  -0.00,  -5.33>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #3
atom(< -1.20,   1.11,  -7.29>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -1.24,  -1.11,  -7.22>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -7.46,  -0.00, -10.86>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #6
atom(< -8.47,   1.73,  -9.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -4.66,   0.00,  -9.24>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -5.43,   1.65,  -7.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.51,   1.79,  -5.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -3.36,  -1.73,  -7.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -6.79,  -1.79,  -9.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.34,  -1.65,  -5.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -4.39,   1.11, -12.82>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.43,  -1.11, -12.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -7.85,   0.00, -14.76>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -8.62,   1.65, -12.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.70,   1.79, -11.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -6.55,  -1.73, -12.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  2.11,  -0.00,  -5.33>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(< -1.08,  -0.00, -10.86>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #21
atom(< -2.09,   1.73,  -9.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  1.72,   0.00,  -9.24>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(<  0.95,   1.65,  -7.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.87,   1.79,  -5.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  3.02,  -1.73,  -7.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -0.41,  -1.79,  -9.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  0.04,  -1.65,  -5.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  1.99,   1.11, -12.82>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  1.95,  -1.11, -12.74>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -5.28,   1.73, -14.75>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.47,   0.00, -14.76>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -2.24,   1.65, -12.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  0.68,   1.79, -11.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.17,  -1.73, -12.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -3.60,  -1.79, -14.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -3.15,  -1.65, -11.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  4.29,   1.73,  -9.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(<  1.10,   1.73, -14.75>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(<  4.14,   1.65, -12.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  2.78,  -1.79, -14.74>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  3.23,  -1.65, -11.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -7.58,   1.11,  -7.29>, < -7.60,  -0.00,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -1.11,  -7.22>, < -7.60,  -0.00,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,   1.11,  -7.29>, < -8.24,   1.45,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.89,   1.79,  -5.57>, < -8.24,   1.45,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,   1.11,  -7.29>, < -6.51,   1.38,  -7.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,   1.65,  -7.05>, < -6.51,   1.38,  -7.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,   1.11,  -7.29>, < -8.03,   1.42,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,   1.73,  -9.22>, < -8.03,   1.42,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -1.11,  -7.22>, < -6.98,  -1.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.34,  -1.65,  -5.48>, < -6.98,  -1.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -1.11,  -7.22>, < -7.21,  -1.45,  -8.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -1.79,  -9.21>, < -7.21,  -1.45,  -8.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27,  -0.00,  -5.33>, < -5.30,  -0.83,  -5.40>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.34,  -1.65,  -5.48>, < -5.30,  -0.83,  -5.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27,  -0.00,  -5.33>, < -3.39,   0.89,  -5.45>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.51,   1.79,  -5.57>, < -3.39,   0.89,  -5.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27,  -0.00,  -5.33>, < -3.82,  -0.86,  -6.18>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -1.73,  -7.02>, < -3.82,  -0.86,  -6.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27,  -0.00,  -5.33>, < -4.85,   0.83,  -6.19>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,   1.65,  -7.05>, < -4.85,   0.83,  -6.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.11,  -7.29>, < -1.86,   1.45,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.51,   1.79,  -5.57>, < -1.86,   1.45,  -6.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.11,  -7.29>, < -1.65,   1.42,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.09,   1.73,  -9.22>, < -1.65,   1.42,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.11,  -7.29>, < -0.13,   1.38,  -7.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,   1.65,  -7.05>, < -0.13,   1.38,  -7.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.11,  -7.29>, < -1.22,  -0.00,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -1.11,  -7.22>, < -1.22,  -0.00,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -1.11,  -7.22>, < -2.30,  -1.42,  -7.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -1.73,  -7.02>, < -2.30,  -1.42,  -7.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -1.11,  -7.22>, < -0.83,  -1.45,  -8.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -1.79,  -9.21>, < -0.83,  -1.45,  -8.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -1.11,  -7.22>, < -0.60,  -1.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.04,  -1.65,  -5.48>, < -0.60,  -1.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -7.13,  -0.89, -10.04>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -1.79,  -9.21>, < -7.13,  -0.89, -10.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -7.97,   0.86, -10.04>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,   1.73,  -9.22>, < -7.97,   0.86, -10.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -6.06,   0.00, -10.05>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   0.00,  -9.24>, < -6.06,   0.00, -10.05>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -6.58,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,   1.79, -11.10>, < -6.58,   0.89, -10.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -7.01,  -0.86, -11.70>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.55,  -1.73, -12.55>, < -7.01,  -0.86, -11.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -0.00, -10.86>, < -8.04,   0.83, -11.72>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,   1.65, -12.57>, < -8.04,   0.83, -11.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   0.00,  -9.24>, < -5.04,   0.83,  -8.14>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,   1.65,  -7.05>, < -5.04,   0.83,  -8.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   0.00,  -9.24>, < -5.73,  -0.89,  -9.23>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -1.79,  -9.21>, < -5.73,  -0.89,  -9.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   0.00,  -9.24>, < -3.90,  -0.83, -10.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -1.65, -11.00>, < -3.90,  -0.83, -10.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   0.00,  -9.24>, < -5.18,   0.89, -10.17>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,   1.79, -11.10>, < -5.18,   0.89, -10.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,   1.11, -12.82>, < -5.05,   1.45, -11.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,   1.79, -11.10>, < -5.05,   1.45, -11.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,   1.11, -12.82>, < -4.41,  -0.00, -12.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -1.11, -12.74>, < -4.41,  -0.00, -12.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,   1.11, -12.82>, < -4.84,   1.42, -13.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.28,   1.73, -14.75>, < -4.84,   1.42, -13.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,   1.11, -12.82>, < -3.32,   1.38, -12.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,   1.65, -12.57>, < -3.32,   1.38, -12.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -1.11, -12.74>, < -3.79,  -1.38, -11.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -1.65, -11.00>, < -3.79,  -1.38, -11.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -1.11, -12.74>, < -5.49,  -1.42, -12.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.55,  -1.73, -12.55>, < -5.49,  -1.42, -12.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -1.11, -12.74>, < -4.02,  -1.45, -13.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -1.79, -14.74>, < -4.02,  -1.45, -13.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.85,   0.00, -14.76>, < -8.23,   0.83, -13.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,   1.65, -12.57>, < -8.23,   0.83, -13.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -0.00,  -5.33>, <  1.53,   0.83,  -6.19>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,   1.65,  -7.05>, <  1.53,   0.83,  -6.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -0.00,  -5.33>, <  2.99,   0.89,  -5.45>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,   1.79,  -5.57>, <  2.99,   0.89,  -5.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -0.00,  -5.33>, <  1.08,  -0.83,  -5.40>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.04,  -1.65,  -5.48>, <  1.08,  -0.83,  -5.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -0.00,  -5.33>, <  2.56,  -0.86,  -6.18>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.02,  -1.73,  -7.02>, <  2.56,  -0.86,  -6.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -2.11,  -0.83, -10.93>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -1.65, -11.00>, < -2.11,  -0.83, -10.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -1.59,   0.86, -10.04>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.09,   1.73,  -9.22>, < -1.59,   0.86, -10.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -0.75,  -0.89, -10.04>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -1.79,  -9.21>, < -0.75,  -0.89, -10.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, <  0.32,   0.00, -10.05>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   0.00,  -9.24>, <  0.32,   0.00, -10.05>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -0.20,   0.89, -10.98>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,   1.79, -11.10>, < -0.20,   0.89, -10.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -0.63,  -0.86, -11.70>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.17,  -1.73, -12.55>, < -0.63,  -0.86, -11.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -0.00, -10.86>, < -1.66,   0.83, -11.72>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,   1.65, -12.57>, < -1.66,   0.83, -11.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   0.00,  -9.24>, <  1.34,   0.83,  -8.14>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,   1.65,  -7.05>, <  1.34,   0.83,  -8.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   0.00,  -9.24>, <  0.65,  -0.89,  -9.23>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -1.79,  -9.21>, <  0.65,  -0.89,  -9.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   0.00,  -9.24>, <  2.48,  -0.83, -10.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.23,  -1.65, -11.00>, <  2.48,  -0.83, -10.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   0.00,  -9.24>, <  1.20,   0.89, -10.17>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,   1.79, -11.10>, <  1.20,   0.89, -10.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,   1.11, -12.82>, <  1.33,   1.45, -11.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,   1.79, -11.10>, <  1.33,   1.45, -11.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,   1.11, -12.82>, <  1.54,   1.42, -13.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.10,   1.73, -14.75>, <  1.54,   1.42, -13.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,   1.11, -12.82>, <  3.06,   1.38, -12.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.14,   1.65, -12.57>, <  3.06,   1.38, -12.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,   1.11, -12.82>, <  1.97,  -0.00, -12.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -1.11, -12.74>, <  1.97,  -0.00, -12.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -1.11, -12.74>, <  2.59,  -1.38, -11.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.23,  -1.65, -11.00>, <  2.59,  -1.38, -11.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -1.11, -12.74>, <  0.89,  -1.42, -12.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.17,  -1.73, -12.55>, <  0.89,  -1.42, -12.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -1.11, -12.74>, <  2.36,  -1.45, -13.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.78,  -1.79, -14.74>, <  2.36,  -1.45, -13.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,   0.00, -14.76>, < -2.54,  -0.89, -14.75>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -1.79, -14.74>, < -2.54,  -0.89, -14.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,   0.00, -14.76>, < -1.85,   0.83, -13.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,   1.65, -12.57>, < -1.85,   0.83, -13.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
