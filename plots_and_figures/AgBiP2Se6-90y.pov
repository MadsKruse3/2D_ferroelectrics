#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -26.25*x up 26.25*y
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

cylinder {< 12.50, -12.50, -25.00>, < 12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50, -25.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,   0.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, <-12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,   0.00>, <-12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50,   0.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50, -25.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
atom(<  1.79,  -4.87, -16.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(<  0.21,  -4.86, -12.50>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(<  1.79,  -1.21, -17.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -1.79,  -1.02, -14.94>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -1.79,  -4.67, -14.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -1.09,  -2.92, -15.87>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(<  1.20,  -2.92, -15.87>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(<  0.21,   0.98, -15.87>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #7
atom(<  1.79,  -4.87,  -9.96>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  1.79,  -1.21, -10.40>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.79,  -2.66, -13.76>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.79,   0.97, -13.33>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -1.79,  -1.02,  -8.19>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.79,  -4.67,  -7.94>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -1.79,  -3.06, -11.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(< -1.09,  -2.92,  -9.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(<  1.20,  -2.92,  -9.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(< -0.47,  -0.97, -12.49>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #17
atom(<  0.21,   0.98,  -9.12>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #18
atom(<  1.79,   4.63, -13.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  1.79,   3.18, -17.13>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -1.79,   4.82, -11.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -1.79,   1.18, -11.32>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -1.79,   2.78, -14.60>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< -1.09,   2.93, -12.49>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #24
atom(<  1.20,   2.93, -12.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #25
atom(< -0.47,   4.87, -15.87>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #26
atom(<  1.79,   3.18, -10.38>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -1.79,   2.78,  -7.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -0.47,   4.87,  -9.12>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #29
cylinder {<  1.79,  -4.87, -16.70>, <  1.50,  -3.90, -16.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92, -15.87>, <  1.50,  -3.90, -16.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,  -4.86, -12.50>, < -0.79,  -3.96, -11.86>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.06, -11.23>, < -0.79,  -3.96, -11.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,  -4.86, -12.50>, < -0.79,  -4.77, -13.59>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.67, -14.69>, < -0.79,  -4.77, -13.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,  -4.86, -12.50>, <  1.00,  -4.87, -11.23>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.87,  -9.96>, <  1.00,  -4.87, -11.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,  -4.86, -12.50>, <  1.00,  -3.76, -13.13>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -2.66, -13.76>, <  1.00,  -3.76, -13.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.21, -17.15>, <  1.50,  -2.07, -16.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92, -15.87>, <  1.50,  -2.07, -16.51>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.21, -17.15>, <  1.00,  -0.12, -16.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98, -15.87>, <  1.00,  -0.12, -16.51>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -1.02, -14.94>, < -1.44,  -1.97, -15.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92, -15.87>, < -1.44,  -1.97, -15.40>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -1.02, -14.94>, < -1.13,  -0.99, -13.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,  -0.97, -12.49>, < -1.13,  -0.99, -13.72>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -1.02, -14.94>, < -0.79,  -0.02, -15.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98, -15.87>, < -0.79,  -0.02, -15.40>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.67, -14.69>, < -1.44,  -3.79, -15.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92, -15.87>, < -1.44,  -3.79, -15.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92, -15.87>, <  0.05,  -2.92, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92, -15.87>, <  0.05,  -2.92, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92, -15.87>, <  1.50,  -2.79, -14.81>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -2.66, -13.76>, <  1.50,  -2.79, -14.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98, -15.87>, <  1.00,   0.97, -14.60>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   0.97, -13.33>, <  1.00,   0.97, -14.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98, -15.87>, <  1.00,   2.08, -16.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   3.18, -17.13>, <  1.00,   2.08, -16.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98, -15.87>, < -0.79,   1.88, -15.23>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.78, -14.60>, < -0.79,   1.88, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.87,  -9.96>, <  1.50,  -3.90,  -9.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92,  -9.12>, <  1.50,  -3.90,  -9.54>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.21, -10.40>, <  1.50,  -2.07,  -9.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92,  -9.12>, <  1.50,  -2.07,  -9.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.21, -10.40>, <  1.00,  -0.12,  -9.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98,  -9.12>, <  1.00,  -0.12,  -9.76>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   0.97, -13.33>, <  1.50,   1.95, -12.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,   2.93, -12.50>, <  1.50,   1.95, -12.91>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -1.02,  -8.19>, < -1.44,  -1.97,  -8.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92,  -9.12>, < -1.44,  -1.97,  -8.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -1.02,  -8.19>, < -0.79,  -0.02,  -8.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98,  -9.12>, < -0.79,  -0.02,  -8.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.67,  -7.94>, < -1.44,  -3.79,  -8.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92,  -9.12>, < -1.44,  -3.79,  -8.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.06, -11.23>, < -1.44,  -2.99, -10.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92,  -9.12>, < -1.44,  -2.99, -10.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.06, -11.23>, < -1.13,  -2.02, -11.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,  -0.97, -12.49>, < -1.13,  -2.02, -11.86>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.92,  -9.12>, <  0.05,  -2.92,  -9.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -2.92,  -9.12>, <  0.05,  -2.92,  -9.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,  -0.97, -12.49>, < -1.13,   0.10, -11.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.18, -11.32>, < -1.13,   0.10, -11.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98,  -9.12>, < -0.79,   1.88,  -8.49>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.78,  -7.85>, < -0.79,   1.88,  -8.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98,  -9.12>, < -0.79,   1.08, -10.22>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.18, -11.32>, < -0.79,   1.08, -10.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.21,   0.98,  -9.12>, <  1.00,   2.08,  -9.75>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   3.18, -10.38>, <  1.00,   2.08,  -9.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.63, -13.77>, <  1.50,   3.78, -13.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,   2.93, -12.50>, <  1.50,   3.78, -13.13>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   4.82, -11.57>, < -1.44,   3.87, -12.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   2.93, -12.49>, < -1.44,   3.87, -12.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   4.82, -11.57>, < -1.13,   4.85, -10.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,   4.87,  -9.12>, < -1.13,   4.85, -10.34>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.18, -11.32>, < -1.44,   2.05, -11.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   2.93, -12.49>, < -1.44,   2.05, -11.91>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.78, -14.60>, < -1.44,   2.85, -13.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   2.93, -12.49>, < -1.44,   2.85, -13.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.78, -14.60>, < -1.13,   3.83, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,   4.87, -15.87>, < -1.13,   3.83, -15.23>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   2.93, -12.49>, <  0.05,   2.93, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,   2.93, -12.50>, <  0.05,   2.93, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,   2.93, -12.50>, <  1.50,   3.05, -11.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   3.18, -10.38>, <  1.50,   3.05, -11.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.78,  -7.85>, < -1.13,   3.83,  -8.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.47,   4.87,  -9.12>, < -1.13,   3.83,  -8.49>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
