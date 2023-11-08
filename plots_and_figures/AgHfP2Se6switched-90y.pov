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
atom(< -1.11,  -3.04, -17.42>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(<  1.11,  -3.04, -17.34>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -0.00,  -4.72, -14.19>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(< -1.11,  -3.04, -11.04>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.11,  -3.04, -10.96>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -0.00,   0.81, -17.38>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -1.65,  -1.05, -18.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(<  0.00,  -0.75, -13.76>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -1.79,  -3.32, -15.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -1.73,  -4.77, -12.27>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.79,  -3.32, -13.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.65,  -1.05, -16.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.73,  -4.77, -16.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.11,   2.49, -14.23>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  1.11,   2.49, -14.15>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(<  0.00,   4.77, -16.95>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -1.79,   2.21, -18.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.73,   0.75, -15.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  1.79,   2.21, -16.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -0.00,  -4.72,  -7.81>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(< -0.00,   0.81, -11.00>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(< -1.65,  -1.05, -11.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  0.00,  -0.75,  -7.38>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -1.79,  -3.32,  -8.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  1.79,  -3.32,  -6.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  1.65,  -1.05, -10.09>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.73,  -4.77,  -9.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -1.11,   2.49,  -7.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  1.11,   2.49,  -7.77>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -1.65,   4.47, -15.09>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  0.00,   4.77, -10.57>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(< -1.79,   2.21, -12.09>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.73,   0.75,  -9.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  1.79,   2.21,  -9.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  1.65,   4.47, -13.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.73,   0.75, -12.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -1.65,   4.47,  -8.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.65,   4.47,  -6.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  1.73,   0.75,  -6.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -1.11,  -3.04, -17.42>, < -0.00,  -3.04, -17.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -17.34>, < -0.00,  -3.04, -17.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -17.42>, < -1.45,  -3.18, -16.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.32, -15.28>, < -1.45,  -3.18, -16.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -17.42>, < -1.38,  -2.05, -17.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -1.05, -18.28>, < -1.38,  -2.05, -17.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -17.34>, <  1.42,  -3.91, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.77, -16.10>, <  1.42,  -3.91, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -17.34>, <  1.38,  -2.05, -16.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -1.05, -16.47>, <  1.38,  -2.05, -16.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72, -14.19>, <  0.89,  -4.02, -13.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -3.32, -13.10>, <  0.89,  -4.02, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72, -14.19>, < -0.89,  -4.02, -14.73>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.32, -15.28>, < -0.89,  -4.02, -14.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72, -14.19>, <  0.86,  -4.75, -15.15>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.77, -16.10>, <  0.86,  -4.75, -15.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72, -14.19>, < -0.86,  -4.75, -13.23>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -4.77, -12.27>, < -0.86,  -4.75, -13.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -11.04>, < -1.42,  -3.91, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -4.77, -12.27>, < -1.42,  -3.91, -11.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -11.04>, < -1.45,  -3.18,  -9.97>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.32,  -8.90>, < -1.45,  -3.18,  -9.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -11.04>, < -0.00,  -3.04, -11.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -10.96>, < -0.00,  -3.04, -11.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.04, -11.04>, < -1.38,  -2.05, -11.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -1.05, -11.90>, < -1.38,  -2.05, -11.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -10.96>, <  1.45,  -3.18, -12.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -3.32, -13.10>, <  1.45,  -3.18, -12.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -10.96>, <  1.42,  -3.91, -10.34>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.77,  -9.72>, <  1.42,  -3.91, -10.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.04, -10.96>, <  1.38,  -2.05, -10.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -1.05, -10.09>, <  1.38,  -2.05, -10.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -17.38>, < -0.83,  -0.12, -17.83>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -1.05, -18.28>, < -0.83,  -0.12, -17.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -17.38>, <  0.83,  -0.12, -16.92>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -1.05, -16.47>, <  0.83,  -0.12, -16.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -17.38>, < -0.86,   0.78, -16.42>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75, -15.46>, < -0.86,   0.78, -16.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -17.38>, <  0.89,   1.51, -16.83>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   2.21, -16.29>, <  0.89,   1.51, -16.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -17.38>, < -0.89,   1.51, -17.92>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.21, -18.47>, < -0.89,   1.51, -17.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75, -13.76>, <  0.86,   0.00, -13.34>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   0.75, -12.91>, <  0.86,   0.00, -13.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75, -13.76>, < -0.86,   0.00, -14.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75, -15.46>, < -0.86,   0.00, -14.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75, -13.76>, < -0.83,  -0.90, -12.83>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -1.05, -11.90>, < -0.83,  -0.90, -12.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75, -13.76>, <  0.00,   0.03, -12.38>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, <  0.00,   0.03, -12.38>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49, -14.23>, < -1.42,   1.62, -14.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75, -15.46>, < -1.42,   1.62, -14.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49, -14.23>, < -1.38,   3.48, -14.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.47, -15.09>, < -1.38,   3.48, -14.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49, -14.23>, < -0.00,   2.49, -14.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49, -14.15>, < -0.00,   2.49, -14.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49, -14.23>, < -1.45,   2.35, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.21, -12.09>, < -1.45,   2.35, -13.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49, -14.15>, <  1.42,   1.62, -13.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   0.75, -12.91>, <  1.42,   1.62, -13.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49, -14.15>, <  1.45,   2.35, -15.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   2.21, -16.29>, <  1.45,   2.35, -15.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49, -14.15>, <  1.38,   3.48, -13.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   4.47, -13.28>, <  1.38,   3.48, -13.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   4.77, -16.95>, < -0.83,   4.62, -16.02>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.47, -15.09>, < -0.83,   4.62, -16.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72,  -7.81>, <  0.86,  -4.75,  -8.77>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.77,  -9.72>, <  0.86,  -4.75,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72,  -7.81>, < -0.89,  -4.02,  -8.35>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -3.32,  -8.90>, < -0.89,  -4.02,  -8.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -4.72,  -7.81>, <  0.89,  -4.02,  -7.26>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -3.32,  -6.72>, <  0.89,  -4.02,  -7.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, <  0.86,   0.78, -11.96>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   0.75, -12.91>, <  0.86,   0.78, -11.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, <  0.83,  -0.12, -10.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -1.05, -10.09>, <  0.83,  -0.12, -10.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, < -0.83,  -0.12, -11.45>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -1.05, -11.90>, < -0.83,  -0.12, -11.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, < -0.86,   0.78, -10.04>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75,  -9.08>, < -0.86,   0.78, -10.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, <  0.89,   1.51, -10.45>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   2.21,  -9.91>, <  0.89,   1.51, -10.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.81, -11.00>, < -0.89,   1.51, -11.54>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   2.21, -12.09>, < -0.89,   1.51, -11.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75,  -7.38>, <  0.86,   0.00,  -6.96>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   0.75,  -6.53>, <  0.86,   0.00,  -6.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -0.75,  -7.38>, < -0.86,   0.00,  -8.23>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75,  -9.08>, < -0.86,   0.00,  -8.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49,  -7.85>, < -1.38,   3.48,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.47,  -8.71>, < -1.38,   3.48,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49,  -7.85>, < -1.42,   1.62,  -8.46>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   0.75,  -9.08>, < -1.42,   1.62,  -8.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.49,  -7.85>, < -0.00,   2.49,  -7.81>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49,  -7.77>, < -0.00,   2.49,  -7.81>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49,  -7.77>, <  1.42,   1.62,  -7.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   0.75,  -6.53>, <  1.42,   1.62,  -7.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49,  -7.77>, <  1.45,   2.35,  -8.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   2.21,  -9.91>, <  1.45,   2.35,  -8.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.49,  -7.77>, <  1.38,   3.48,  -7.33>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   4.47,  -6.90>, <  1.38,   3.48,  -7.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   4.77, -10.57>, < -0.83,   4.62,  -9.64>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.47,  -8.71>, < -0.83,   4.62,  -9.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
