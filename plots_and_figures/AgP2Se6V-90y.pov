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
atom(<  0.00,  -4.72, -17.09>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #0
atom(< -1.11,  -2.76, -14.02>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(<  1.11,  -2.83, -14.06>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< -0.00,  -0.81, -17.48>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #3
atom(< -1.79,  -4.47, -15.33>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(<  1.73,  -3.03, -16.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -1.11,   2.77, -17.21>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(<  1.11,   2.70, -17.25>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(<  0.00,  -4.72, -10.71>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #8
atom(< -1.11,  -2.76,  -7.64>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(<  1.11,  -2.83,  -7.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(<  0.00,   0.81, -13.90>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #11
atom(< -1.73,  -0.82, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -0.00,  -0.81, -11.10>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #13
atom(< -1.65,  -3.00, -11.87>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(< -1.79,  -4.47,  -8.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(<  1.73,  -3.03,  -9.80>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(<  1.79,  -0.83, -13.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  1.65,  -4.57, -12.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -1.11,   2.77, -10.83>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(<  1.11,   2.70, -10.87>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(< -0.00,   4.72, -14.29>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #21
atom(< -1.65,   2.52, -15.06>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -1.79,   1.05, -12.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  1.73,   2.50, -12.99>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  1.79,   4.69, -16.42>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.65,   0.95, -15.97>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  0.00,   0.81,  -7.52>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #27
atom(< -1.73,  -0.82,  -8.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -1.73,   4.70, -11.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(< -0.00,   4.72,  -7.91>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(< -1.65,   2.52,  -8.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  1.79,   4.69, -10.04>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  1.65,   0.95,  -9.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
cylinder {<  0.00,  -4.72, -17.09>, < -0.89,  -4.59, -16.21>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47, -15.33>, < -0.89,  -4.59, -16.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -17.09>, <  0.86,  -3.87, -16.64>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03, -16.18>, <  0.86,  -3.87, -16.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -14.02>, <  0.00,  -2.79, -14.04>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -14.06>, <  0.00,  -2.79, -14.04>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -14.02>, < -1.45,  -3.62, -14.68>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47, -15.33>, < -1.45,  -3.62, -14.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -14.02>, < -1.42,  -1.79, -14.46>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -14.91>, < -1.42,  -1.79, -14.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76, -14.02>, < -1.38,  -2.88, -12.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -11.87>, < -1.38,  -2.88, -12.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -14.06>, <  1.38,  -3.70, -13.42>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57, -12.78>, <  1.38,  -3.70, -13.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -14.06>, <  1.42,  -2.93, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03, -16.18>, <  1.42,  -2.93, -15.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83, -14.06>, <  1.45,  -1.83, -13.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -13.23>, <  1.45,  -1.83, -13.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -17.48>, <  0.83,   0.07, -16.72>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -15.97>, <  0.83,   0.07, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -17.21>, < -1.38,   2.65, -16.14>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -15.06>, < -1.38,   2.65, -16.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -17.21>, <  0.00,   2.73, -17.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -17.25>, <  0.00,   2.73, -17.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -17.25>, <  1.45,   3.69, -16.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -16.42>, <  1.45,   3.69, -16.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -17.25>, <  1.38,   1.83, -16.61>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -15.97>, <  1.38,   1.83, -16.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -10.71>, <  0.83,  -4.64, -11.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -4.57, -12.78>, <  0.83,  -4.64, -11.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -10.71>, < -0.83,  -3.86, -11.29>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -11.87>, < -0.83,  -3.86, -11.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -10.71>, < -0.89,  -4.59,  -9.83>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47,  -8.95>, < -0.89,  -4.59,  -9.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -4.72, -10.71>, <  0.86,  -3.87, -10.26>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03,  -9.80>, <  0.86,  -3.87, -10.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76,  -7.64>, < -1.45,  -3.62,  -8.30>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.47,  -8.95>, < -1.45,  -3.62,  -8.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76,  -7.64>, < -1.42,  -1.79,  -8.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82,  -8.53>, < -1.42,  -1.79,  -8.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.76,  -7.64>, <  0.00,  -2.79,  -7.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83,  -7.68>, <  0.00,  -2.79,  -7.66>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.83,  -7.68>, <  1.42,  -2.93,  -8.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -3.03,  -9.80>, <  1.42,  -2.93,  -8.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, < -0.86,  -0.01, -14.41>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82, -14.91>, < -0.86,  -0.01, -14.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, <  0.89,  -0.01, -13.57>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -13.23>, <  0.89,  -0.01, -13.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, < -0.83,   1.67, -14.48>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -15.06>, < -0.83,   1.67, -14.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, <  0.83,   0.88, -14.93>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95, -15.97>, <  0.83,   0.88, -14.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, <  0.86,   1.65, -13.45>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50, -12.99>, <  0.86,   1.65, -13.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -11.10>, < -0.00,   0.00, -12.50>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81, -13.90>, < -0.89,   0.93, -13.02>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -12.14>, < -0.89,   0.93, -13.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -11.10>, <  0.89,  -0.82, -12.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -0.83, -13.23>, <  0.89,  -0.82, -12.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -11.10>, < -0.83,  -1.91, -11.48>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -3.00, -11.87>, < -0.83,  -1.91, -11.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -11.10>, <  0.83,   0.07, -10.34>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95,  -9.59>, <  0.83,   0.07, -10.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.81, -11.10>, < -0.89,   0.12, -11.62>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -12.14>, < -0.89,   0.12, -11.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -10.83>, <  0.00,   2.73, -10.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -10.87>, <  0.00,   2.73, -10.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -10.83>, < -1.38,   2.65,  -9.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52,  -8.68>, < -1.38,   2.65,  -9.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -10.83>, < -1.45,   1.91, -11.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,   1.05, -12.14>, < -1.45,   1.91, -11.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.77, -10.83>, < -1.42,   3.74, -11.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,   4.70, -11.72>, < -1.42,   3.74, -11.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -10.87>, <  1.42,   2.60, -11.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   2.50, -12.99>, <  1.42,   2.60, -11.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -10.87>, <  1.38,   1.83, -10.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95,  -9.59>, <  1.38,   1.83, -10.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.70, -10.87>, <  1.45,   3.69, -10.46>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -10.04>, <  1.45,   3.69, -10.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72, -14.29>, < -0.83,   3.62, -14.67>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52, -15.06>, < -0.83,   3.62, -14.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72, -14.29>, <  0.89,   4.70, -15.35>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -16.42>, <  0.89,   4.70, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81,  -7.52>, < -0.86,  -0.01,  -8.03>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.82,  -8.53>, < -0.86,  -0.01,  -8.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81,  -7.52>, <  0.83,   0.88,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   0.95,  -9.59>, <  0.83,   0.88,  -8.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.81,  -7.52>, < -0.83,   1.67,  -8.10>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52,  -8.68>, < -0.83,   1.67,  -8.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72,  -7.91>, <  0.89,   4.70,  -8.97>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,   4.69, -10.04>, <  0.89,   4.70,  -8.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   4.72,  -7.91>, < -0.83,   3.62,  -8.29>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   2.52,  -8.68>, < -0.83,   3.62,  -8.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
