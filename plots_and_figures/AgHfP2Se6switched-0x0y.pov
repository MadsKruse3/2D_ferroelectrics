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
atom(< -4.92,  -3.04, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -4.84,  -3.04, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.69,  -4.72, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(<  1.46,  -3.04, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.54,  -3.04, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -4.88,   0.81, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -5.78,  -1.05, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.26,  -0.75, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -2.78,  -3.32, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  0.23,  -4.77, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -0.60,  -3.32, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -3.97,  -1.05, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.60,  -4.77, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.73,   2.49, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(< -1.65,   2.49, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.45,   4.77, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -5.97,   2.21, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -2.96,   0.75, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -3.79,   2.21, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  4.69,  -4.72, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  1.50,   0.81, -12.50>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.60,  -1.05, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  5.12,  -0.75, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(<  3.60,  -3.32, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  5.78,  -3.32, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  2.41,  -1.05, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  2.78,  -4.77, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  4.65,   2.49, -11.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  4.73,   2.49, -13.61>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -2.59,   4.47, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  1.93,   4.77, -12.50>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(<  0.41,   2.21, -10.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  3.42,   0.75, -10.77>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  2.59,   2.21, -14.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -0.78,   4.47, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.41,   0.75, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  3.79,   4.47, -10.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  5.60,   4.47, -14.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  5.97,   0.75, -14.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -4.92,  -3.04, -11.39>, < -4.88,  -3.04, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -3.04, -13.61>, < -4.88,  -3.04, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.92,  -3.04, -11.39>, < -3.85,  -3.18, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.78,  -3.32, -10.71>, < -3.85,  -3.18, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.92,  -3.04, -11.39>, < -5.35,  -2.05, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.78,  -1.05, -10.85>, < -5.35,  -2.05, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -3.04, -13.61>, < -4.22,  -3.91, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -4.77, -14.23>, < -4.22,  -3.91, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -3.04, -13.61>, < -4.40,  -2.05, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.97,  -1.05, -14.15>, < -4.40,  -2.05, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.72, -12.50>, < -1.14,  -4.02, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.60,  -3.32, -14.29>, < -1.14,  -4.02, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.72, -12.50>, < -2.23,  -4.02, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.78,  -3.32, -10.71>, < -2.23,  -4.02, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.72, -12.50>, < -2.65,  -4.75, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -4.77, -14.23>, < -2.65,  -4.75, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.69,  -4.72, -12.50>, < -0.73,  -4.75, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -4.77, -10.77>, < -0.73,  -4.75, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.46,  -3.04, -11.39>, <  0.85,  -3.91, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -4.77, -10.77>, <  0.85,  -3.91, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.46,  -3.04, -11.39>, <  2.53,  -3.18, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.60,  -3.32, -10.71>, <  2.53,  -3.18, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.46,  -3.04, -11.39>, <  1.50,  -3.04, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -3.04, -13.61>, <  1.50,  -3.04, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.46,  -3.04, -11.39>, <  1.03,  -2.05, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -1.05, -10.85>, <  1.03,  -2.05, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -3.04, -13.61>, <  0.47,  -3.18, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.60,  -3.32, -14.29>, <  0.47,  -3.18, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -3.04, -13.61>, <  2.16,  -3.91, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.78,  -4.77, -14.23>, <  2.16,  -3.91, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.54,  -3.04, -13.61>, <  1.98,  -2.05, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.41,  -1.05, -14.15>, <  1.98,  -2.05, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.88,   0.81, -12.50>, < -5.33,  -0.12, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.78,  -1.05, -10.85>, < -5.33,  -0.12, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.88,   0.81, -12.50>, < -4.42,  -0.12, -13.33>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.97,  -1.05, -14.15>, < -4.42,  -0.12, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.88,   0.81, -12.50>, < -3.92,   0.78, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,   0.75, -10.77>, < -3.92,   0.78, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.88,   0.81, -12.50>, < -4.33,   1.51, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.79,   2.21, -14.29>, < -4.33,   1.51, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.88,   0.81, -12.50>, < -5.42,   1.51, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.97,   2.21, -10.71>, < -5.42,   1.51, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -0.75, -12.50>, < -0.84,   0.00, -13.36>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   0.75, -14.23>, < -0.84,   0.00, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -0.75, -12.50>, < -2.11,   0.00, -11.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,   0.75, -10.77>, < -2.11,   0.00, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -0.75, -12.50>, < -0.33,  -0.90, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -1.05, -10.85>, < -0.33,  -0.90, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -0.75, -12.50>, <  0.12,   0.03, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  0.12,   0.03, -12.50>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   2.49, -11.39>, < -2.34,   1.62, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,   0.75, -10.77>, < -2.34,   1.62, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   2.49, -11.39>, < -2.16,   3.48, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.59,   4.47, -10.85>, < -2.16,   3.48, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   2.49, -11.39>, < -1.69,   2.49, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.49, -13.61>, < -1.69,   2.49, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   2.49, -11.39>, < -0.66,   2.35, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   2.21, -10.71>, < -0.66,   2.35, -11.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.49, -13.61>, < -1.03,   1.62, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   0.75, -14.23>, < -1.03,   1.62, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.49, -13.61>, < -2.72,   2.35, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.79,   2.21, -14.29>, < -2.72,   2.35, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.49, -13.61>, < -1.21,   3.48, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.78,   4.47, -14.15>, < -1.21,   3.48, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,   4.77, -12.50>, < -3.52,   4.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.59,   4.47, -10.85>, < -3.52,   4.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.69,  -4.72, -12.50>, <  3.73,  -4.75, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.78,  -4.77, -14.23>, <  3.73,  -4.75, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.69,  -4.72, -12.50>, <  4.15,  -4.02, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.60,  -3.32, -10.71>, <  4.15,  -4.02, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.69,  -4.72, -12.50>, <  5.24,  -4.02, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.78,  -3.32, -14.29>, <  5.24,  -4.02, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  0.54,   0.78, -13.36>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   0.75, -14.23>, <  0.54,   0.78, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  1.96,  -0.12, -13.33>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.41,  -1.05, -14.15>, <  1.96,  -0.12, -13.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  1.05,  -0.12, -11.67>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.60,  -1.05, -10.85>, <  1.05,  -0.12, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  2.46,   0.78, -11.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.42,   0.75, -10.77>, <  2.46,   0.78, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  2.05,   1.51, -13.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.59,   2.21, -14.29>, <  2.05,   1.51, -13.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.50,   0.81, -12.50>, <  0.96,   1.51, -11.61>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.41,   2.21, -10.71>, <  0.96,   1.51, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.12,  -0.75, -12.50>, <  5.54,   0.00, -13.36>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   0.75, -14.23>, <  5.54,   0.00, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.12,  -0.75, -12.50>, <  4.27,   0.00, -11.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.42,   0.75, -10.77>, <  4.27,   0.00, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   2.49, -11.39>, <  4.22,   3.48, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.79,   4.47, -10.85>, <  4.22,   3.48, -11.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   2.49, -11.39>, <  4.04,   1.62, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.42,   0.75, -10.77>, <  4.04,   1.62, -11.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.65,   2.49, -11.39>, <  4.69,   2.49, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.49, -13.61>, <  4.69,   2.49, -12.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.49, -13.61>, <  5.35,   1.62, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   0.75, -14.23>, <  5.35,   1.62, -13.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.49, -13.61>, <  3.66,   2.35, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.59,   2.21, -14.29>, <  3.66,   2.35, -13.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.73,   2.49, -13.61>, <  5.17,   3.48, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.60,   4.47, -14.15>, <  5.17,   3.48, -13.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,   4.77, -12.50>, <  2.86,   4.62, -11.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.79,   4.47, -10.85>, <  2.86,   4.62, -11.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
