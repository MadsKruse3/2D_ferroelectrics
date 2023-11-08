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
atom(< -4.59,  -4.72, -12.50>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #0
atom(< -1.52,  -2.76, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.56,  -2.83, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< -4.98,  -0.81, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #3
atom(< -2.83,  -4.47, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -3.68,  -3.03, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -4.71,   2.77, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -4.75,   2.70, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(<  1.79,  -4.72, -12.50>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #8
atom(<  4.86,  -2.76, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(<  4.82,  -2.83, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(< -1.40,   0.81, -12.50>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #11
atom(< -2.41,  -0.82, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  1.40,  -0.81, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #13
atom(<  0.63,  -3.00, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<  3.55,  -4.47, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(<  2.70,  -3.03, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -0.73,  -0.83, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -0.28,  -4.57, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  1.67,   2.77, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(<  1.63,   2.70, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(< -1.79,   4.72, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #21
atom(< -2.56,   2.52, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  0.36,   1.05, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< -0.49,   2.50, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -3.92,   4.69, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(< -3.47,   0.95, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.98,   0.81, -12.50>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #27
atom(<  3.97,  -0.82, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  0.78,   4.70, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  4.59,   4.72, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  3.82,   2.52, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  2.46,   4.69, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.91,   0.95, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
cylinder {< -4.59,  -4.72, -12.50>, < -3.71,  -4.59, -11.61>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,  -4.47, -10.71>, < -3.71,  -4.59, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.59,  -4.72, -12.50>, < -4.14,  -3.87, -13.36>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.68,  -3.03, -14.23>, < -4.14,  -3.87, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,  -2.76, -11.39>, < -1.54,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.83, -13.61>, < -1.54,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,  -2.76, -11.39>, < -2.18,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.83,  -4.47, -10.71>, < -2.18,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,  -2.76, -11.39>, < -1.96,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.41,  -0.82, -10.77>, < -1.96,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,  -2.76, -11.39>, < -0.45,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -3.00, -10.85>, < -0.45,  -2.88, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.83, -13.61>, < -0.92,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.28,  -4.57, -14.15>, < -0.92,  -3.70, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.83, -13.61>, < -2.62,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.68,  -3.03, -14.23>, < -2.62,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.83, -13.61>, < -1.15,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -0.83, -14.29>, < -1.15,  -1.83, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.98,  -0.81, -12.50>, < -4.22,   0.07, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,   0.95, -14.15>, < -4.22,   0.07, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.71,   2.77, -11.39>, < -3.64,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   2.52, -10.85>, < -3.64,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.71,   2.77, -11.39>, < -4.73,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,   2.70, -13.61>, < -4.73,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,   2.70, -13.61>, < -4.34,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.92,   4.69, -14.29>, < -4.34,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.75,   2.70, -13.61>, < -4.11,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,   0.95, -14.15>, < -4.11,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.72, -12.50>, <  0.76,  -4.64, -13.33>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.28,  -4.57, -14.15>, <  0.76,  -4.64, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.72, -12.50>, <  1.21,  -3.86, -11.67>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -3.00, -10.85>, <  1.21,  -3.86, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.72, -12.50>, <  2.67,  -4.59, -11.61>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.55,  -4.47, -10.71>, <  2.67,  -4.59, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.72, -12.50>, <  2.24,  -3.87, -13.36>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  2.70,  -3.03, -14.23>, <  2.24,  -3.87, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,  -2.76, -11.39>, <  4.20,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.55,  -4.47, -10.71>, <  4.20,  -3.62, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,  -2.76, -11.39>, <  4.42,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.97,  -0.82, -10.77>, <  4.42,  -1.79, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.86,  -2.76, -11.39>, <  4.84,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -2.83, -13.61>, <  4.84,  -2.79, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.82,  -2.83, -13.61>, <  3.76,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.70,  -3.03, -14.23>, <  3.76,  -2.93, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -1.91,  -0.01, -11.64>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.41,  -0.82, -10.77>, < -1.91,  -0.01, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -1.07,  -0.01, -13.39>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -0.83, -14.29>, < -1.07,  -0.01, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -1.98,   1.67, -11.67>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   2.52, -10.85>, < -1.98,   1.67, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -2.43,   0.88, -13.33>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.47,   0.95, -14.15>, < -2.43,   0.88, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -0.95,   1.65, -13.36>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,   2.50, -14.23>, < -0.95,   1.65, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,  -0.81, -12.50>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.40,   0.81, -12.50>, < -0.52,   0.93, -11.61>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.05, -10.71>, < -0.52,   0.93, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,  -0.81, -12.50>, <  0.34,  -0.82, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -0.83, -14.29>, <  0.34,  -0.82, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,  -0.81, -12.50>, <  1.02,  -1.91, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.63,  -3.00, -10.85>, <  1.02,  -1.91, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,  -0.81, -12.50>, <  2.16,   0.07, -13.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,   0.95, -14.15>, <  2.16,   0.07, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.40,  -0.81, -12.50>, <  0.88,   0.12, -11.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.05, -10.71>, <  0.88,   0.12, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   2.77, -11.39>, <  1.65,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,   2.70, -13.61>, <  1.65,   2.73, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   2.77, -11.39>, <  2.74,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   2.52, -10.85>, <  2.74,   2.65, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   2.77, -11.39>, <  1.01,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.36,   1.05, -10.71>, <  1.01,   1.91, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,   2.77, -11.39>, <  1.23,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.78,   4.70, -10.77>, <  1.23,   3.74, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,   2.70, -13.61>, <  0.57,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,   2.50, -14.23>, <  0.57,   2.60, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,   2.70, -13.61>, <  2.27,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,   0.95, -14.15>, <  2.27,   1.83, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.63,   2.70, -13.61>, <  2.04,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.46,   4.69, -14.29>, <  2.04,   3.69, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   4.72, -12.50>, < -2.17,   3.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   2.52, -10.85>, < -2.17,   3.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   4.72, -12.50>, < -2.85,   4.70, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.92,   4.69, -14.29>, < -2.85,   4.70, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,   0.81, -12.50>, <  4.47,  -0.01, -11.64>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.97,  -0.82, -10.77>, <  4.47,  -0.01, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,   0.81, -12.50>, <  3.95,   0.88, -13.33>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  2.91,   0.95, -14.15>, <  3.95,   0.88, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.98,   0.81, -12.50>, <  4.40,   1.67, -11.67>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   2.52, -10.85>, <  4.40,   1.67, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.59,   4.72, -12.50>, <  3.53,   4.70, -13.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  2.46,   4.69, -14.29>, <  3.53,   4.70, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.59,   4.72, -12.50>, <  4.21,   3.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   2.52, -10.85>, <  4.21,   3.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
