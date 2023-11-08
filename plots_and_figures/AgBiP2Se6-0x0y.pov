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

cylinder {<-12.50, -12.50, -25.00>, < 12.50, -12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,   0.00>, < 12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50,  12.50, -25.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50,   0.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50,   0.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50, -12.50, -25.00>, <-12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50, -12.50, -25.00>, < 12.50, -12.50,   0.00>, Rcell pigment {Black}}
cylinder {< 12.50,  12.50, -25.00>, < 12.50,  12.50,   0.00>, Rcell pigment {Black}}
cylinder {<-12.50,  12.50, -25.00>, <-12.50,  12.50,   0.00>, Rcell pigment {Black}}
atom(< -4.20,  -4.87, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(<  0.00,  -4.86, -12.71>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(< -4.65,  -1.21, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -2.44,  -1.02, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -2.19,  -4.67, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -3.37,  -2.92, -11.41>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -3.37,  -2.92, -13.70>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -3.37,   0.98, -12.71>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #7
atom(<  2.54,  -4.87, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  2.10,  -1.21, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.26,  -2.66, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -0.83,   0.97, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  4.31,  -1.02, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  4.56,  -4.67, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<  1.27,  -3.06, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<  3.38,  -2.92, -11.41>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(<  3.38,  -2.92, -13.70>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(<  0.01,  -0.97, -12.03>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #17
atom(<  3.38,   0.98, -12.71>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #18
atom(< -1.27,   4.63, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -4.63,   3.18, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(<  0.93,   4.82, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  1.18,   1.18, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -2.10,   2.78, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  0.01,   2.93, -11.41>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #24
atom(<  0.00,   2.93, -13.70>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #25
atom(< -3.37,   4.87, -12.03>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #26
atom(<  2.12,   3.18, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  4.65,   2.78, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  3.38,   4.87, -12.03>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #29
cylinder {< -4.20,  -4.87, -14.29>, < -3.79,  -3.90, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -13.70>, < -3.79,  -3.90, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.86, -12.71>, <  0.64,  -3.96, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,  -3.06, -10.71>, <  0.64,  -3.96, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.86, -12.71>, < -1.09,  -4.77, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.19,  -4.67, -10.71>, < -1.09,  -4.77, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.86, -12.71>, <  1.27,  -4.87, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.54,  -4.87, -14.29>, <  1.27,  -4.87, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.86, -12.71>, < -0.63,  -3.76, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -2.66, -14.29>, < -0.63,  -3.76, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.21, -14.29>, < -4.01,  -2.07, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -13.70>, < -4.01,  -2.07, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.21, -14.29>, < -4.01,  -0.12, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.98, -12.71>, < -4.01,  -0.12, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,  -1.02, -10.71>, < -2.90,  -1.97, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -11.41>, < -2.90,  -1.97, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,  -1.02, -10.71>, < -1.22,  -0.99, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -0.97, -12.03>, < -1.22,  -0.99, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,  -1.02, -10.71>, < -2.90,  -0.02, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.98, -12.71>, < -2.90,  -0.02, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.19,  -4.67, -10.71>, < -2.78,  -3.79, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -11.41>, < -2.78,  -3.79, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -11.41>, < -3.37,  -2.92, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -13.70>, < -3.37,  -2.92, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -2.92, -13.70>, < -2.31,  -2.79, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -2.66, -14.29>, < -2.31,  -2.79, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.98, -12.71>, < -2.10,   0.97, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.83,   0.97, -14.29>, < -2.10,   0.97, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.98, -12.71>, < -4.00,   2.08, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.63,   3.18, -14.29>, < -4.00,   2.08, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   0.98, -12.71>, < -2.73,   1.88, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   2.78, -10.71>, < -2.73,   1.88, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.54,  -4.87, -14.29>, <  2.96,  -3.90, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -13.70>, <  2.96,  -3.90, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -1.21, -14.29>, <  2.74,  -2.07, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -13.70>, <  2.74,  -2.07, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -1.21, -14.29>, <  2.74,  -0.12, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.98, -12.71>, <  2.74,  -0.12, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.83,   0.97, -14.29>, < -0.41,   1.95, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   2.93, -13.70>, < -0.41,   1.95, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.31,  -1.02, -10.71>, <  3.84,  -1.97, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -11.41>, <  3.84,  -1.97, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.31,  -1.02, -10.71>, <  3.84,  -0.02, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.98, -12.71>, <  3.84,  -0.02, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  4.56,  -4.67, -10.71>, <  3.97,  -3.79, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -11.41>, <  3.97,  -3.79, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,  -3.06, -10.71>, <  2.33,  -2.99, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -11.41>, <  2.33,  -2.99, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.27,  -3.06, -10.71>, <  0.64,  -2.02, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -0.97, -12.03>, <  0.64,  -2.02, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -11.41>, <  3.38,  -2.92, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,  -2.92, -13.70>, <  3.38,  -2.92, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -0.97, -12.03>, <  0.59,   0.10, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.18, -10.71>, <  0.59,   0.10, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.98, -12.71>, <  4.01,   1.88, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   2.78, -10.71>, <  4.01,   1.88, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.98, -12.71>, <  2.28,   1.08, -11.71>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.18, -10.71>, <  2.28,   1.08, -11.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   0.98, -12.71>, <  2.75,   2.08, -13.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.12,   3.18, -14.29>, <  2.75,   2.08, -13.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,   4.63, -14.29>, < -0.63,   3.78, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   2.93, -13.70>, < -0.63,   3.78, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.93,   4.82, -10.71>, <  0.47,   3.87, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   2.93, -11.41>, <  0.47,   3.87, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.93,   4.82, -10.71>, <  2.16,   4.85, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   4.87, -12.03>, <  2.16,   4.85, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.18,   1.18, -10.71>, <  0.59,   2.05, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   2.93, -11.41>, <  0.59,   2.05, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   2.78, -10.71>, < -1.05,   2.85, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   2.93, -11.41>, < -1.05,   2.85, -11.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   2.78, -10.71>, < -2.73,   3.83, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   4.87, -12.03>, < -2.73,   3.83, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   2.93, -11.41>, <  0.00,   2.93, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   2.93, -13.70>, <  0.00,   2.93, -12.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   2.93, -13.70>, <  1.06,   3.05, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.12,   3.18, -14.29>, <  1.06,   3.05, -14.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   2.78, -10.71>, <  4.01,   3.83, -11.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.38,   4.87, -12.03>, <  4.01,   3.83, -11.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
