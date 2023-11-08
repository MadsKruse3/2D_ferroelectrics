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
atom(< -1.11,  -2.76, -17.39>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(<  1.11,  -2.83, -17.43>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(<  0.00,  -4.72, -14.08>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(< -1.11,  -2.76, -11.01>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.11,  -2.83, -11.05>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(<  0.00,   0.81, -17.27>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -1.73,  -0.82, -18.27>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -0.00,  -0.81, -14.46>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -1.65,  -3.00, -15.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -1.79,  -4.47, -12.32>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.73,  -3.03, -13.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.79,  -0.83, -16.60>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.65,  -4.57, -16.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.11,   2.77, -14.20>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  1.11,   2.70, -14.24>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -0.00,   4.72, -17.65>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -1.65,   2.52, -18.43>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.79,   1.05, -15.51>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  1.73,   2.50, -16.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  0.00,  -4.72,  -7.70>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(<  0.00,   0.81, -10.89>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(< -1.73,  -0.82, -11.89>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -0.00,  -0.81,  -8.08>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -1.65,  -3.00,  -8.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  1.73,  -3.03,  -6.79>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  1.79,  -0.83, -10.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.65,  -4.57,  -9.76>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -1.11,   2.77,  -7.82>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  1.11,   2.70,  -7.86>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -1.73,   4.70, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(< -0.00,   4.72, -11.27>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(< -1.65,   2.52, -12.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.79,   1.05,  -9.13>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  1.73,   2.50,  -9.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  1.79,   4.69, -13.41>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.65,   0.95, -12.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -1.73,   4.70,  -8.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.79,   4.69,  -7.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  1.65,   0.95,  -6.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -1.11,  -2.76, -17.39>, < -1.38,  -2.88, -16.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -15.24>, < -1.38,  -2.88, -16.31>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -17.39>, <  0.00,  -2.79, -17.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -17.43>, <  0.00,  -2.79, -17.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -17.39>, < -1.42,  -1.79, -17.83>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -18.27>, < -1.42,  -1.79, -17.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -17.43>, <  1.38,  -3.70, -16.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57, -16.14>, <  1.38,  -3.70, -16.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -17.43>, <  1.45,  -1.83, -17.01>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -16.60>, <  1.45,  -1.83, -17.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -14.08>, < -0.83,  -3.86, -14.66>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -15.24>, < -0.83,  -3.86, -14.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -14.08>, <  0.86,  -3.87, -13.62>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03, -13.17>, <  0.86,  -3.87, -13.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -14.08>, <  0.83,  -4.64, -15.11>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57, -16.14>, <  0.83,  -4.64, -15.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -14.08>, < -0.89,  -4.59, -13.20>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47, -12.32>, < -0.89,  -4.59, -13.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -11.01>, < -1.45,  -3.62, -11.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47, -12.32>, < -1.45,  -3.62, -11.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -11.01>, < -1.42,  -1.79, -11.45>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -11.89>, < -1.42,  -1.79, -11.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -11.01>, < -1.38,  -2.88,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00,  -8.86>, < -1.38,  -2.88,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -11.01>, <  0.00,  -2.79, -11.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -11.05>, <  0.00,  -2.79, -11.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -11.05>, <  1.42,  -2.93, -12.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03, -13.17>, <  1.42,  -2.93, -12.11>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -11.05>, <  1.38,  -3.70, -10.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57,  -9.76>, <  1.38,  -3.70, -10.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -11.05>, <  1.45,  -1.83, -10.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -10.22>, <  1.45,  -1.83, -10.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, < -0.00,   0.00, -15.87>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -14.46>, < -0.00,   0.00, -15.87>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, < -0.86,  -0.01, -17.77>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -18.27>, < -0.86,  -0.01, -17.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, <  0.89,  -0.01, -16.93>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -16.60>, <  0.89,  -0.01, -16.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, <  0.86,   1.65, -16.81>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50, -16.36>, <  0.86,   1.65, -16.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, < -0.89,   0.93, -16.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -15.51>, < -0.89,   0.93, -16.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -17.27>, < -0.83,   1.67, -17.85>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -18.43>, < -0.83,   1.67, -17.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -14.46>, < -0.83,  -1.91, -14.85>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -15.24>, < -0.83,  -1.91, -14.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -14.46>, <  0.89,  -0.82, -15.53>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -16.60>, <  0.89,  -0.82, -15.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -14.46>, <  0.83,   0.07, -13.71>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -12.95>, <  0.83,   0.07, -13.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -14.46>, < -0.89,   0.12, -14.99>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -15.51>, < -0.89,   0.12, -14.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -14.20>, < -1.45,   1.91, -14.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -15.51>, < -1.45,   1.91, -14.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -14.20>, <  0.00,   2.73, -14.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -14.24>, <  0.00,   2.73, -14.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -14.20>, < -1.42,   3.74, -14.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   4.70, -15.08>, < -1.42,   3.74, -14.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -14.20>, < -1.38,   2.65, -13.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -12.05>, < -1.38,   2.65, -13.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -14.24>, <  1.38,   1.83, -13.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -12.95>, <  1.38,   1.83, -13.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -14.24>, <  1.42,   2.60, -15.30>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50, -16.36>, <  1.42,   2.60, -15.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -14.24>, <  1.45,   3.69, -13.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -13.41>, <  1.45,   3.69, -13.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72, -17.65>, < -0.83,   3.62, -18.04>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -18.43>, < -0.83,   3.62, -18.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72,  -7.70>, <  0.83,  -4.64,  -8.73>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57,  -9.76>, <  0.83,  -4.64,  -8.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72,  -7.70>, < -0.83,  -3.86,  -8.28>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00,  -8.86>, < -0.83,  -3.86,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72,  -7.70>, <  0.86,  -3.87,  -7.24>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03,  -6.79>, <  0.86,  -3.87,  -7.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, <  0.83,   0.88, -11.92>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -12.95>, <  0.83,   0.88, -11.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, < -0.86,  -0.01, -11.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -11.89>, < -0.86,  -0.01, -11.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, <  0.89,  -0.01, -10.55>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -10.22>, <  0.89,  -0.01, -10.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, < -0.00,   0.00,  -9.49>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81,  -8.08>, < -0.00,   0.00,  -9.49>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, < -0.83,   1.67, -11.47>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -12.05>, < -0.83,   1.67, -11.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, < -0.89,   0.93, -10.01>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05,  -9.13>, < -0.89,   0.93, -10.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -10.89>, <  0.86,   1.65, -10.43>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50,  -9.98>, <  0.86,   1.65, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81,  -8.08>, < -0.83,  -1.91,  -8.47>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00,  -8.86>, < -0.83,  -1.91,  -8.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81,  -8.08>, <  0.89,  -0.82,  -9.15>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -10.22>, <  0.89,  -0.82,  -9.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81,  -8.08>, < -0.89,   0.12,  -8.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05,  -9.13>, < -0.89,   0.12,  -8.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81,  -8.08>, <  0.83,   0.07,  -7.33>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95,  -6.57>, <  0.83,   0.07,  -7.33>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77,  -7.82>, < -1.45,   1.91,  -8.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05,  -9.13>, < -1.45,   1.91,  -8.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77,  -7.82>, <  0.00,   2.73,  -7.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70,  -7.86>, <  0.00,   2.73,  -7.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77,  -7.82>, < -1.42,   3.74,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   4.70,  -8.70>, < -1.42,   3.74,  -8.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70,  -7.86>, <  1.42,   2.60,  -8.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50,  -9.98>, <  1.42,   2.60,  -8.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70,  -7.86>, <  1.45,   3.69,  -7.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69,  -7.03>, <  1.45,   3.69,  -7.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70,  -7.86>, <  1.38,   1.83,  -7.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95,  -6.57>, <  1.38,   1.83,  -7.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72, -11.27>, <  0.89,   4.70, -12.34>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -13.41>, <  0.89,   4.70, -12.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72, -11.27>, < -0.83,   3.62, -11.66>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -12.05>, < -0.83,   3.62, -11.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
