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
atom(< -1.11,  -2.87, -17.48>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(<  1.11,  -2.88, -17.40>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -0.01,  -4.53, -14.20>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #2
atom(< -1.11,  -2.87, -11.01>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #3
atom(<  1.11,  -2.88, -10.92>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -0.01,   0.97, -17.44>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #5
atom(< -1.65,  -0.89, -18.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(<  0.01,  -1.31, -14.20>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -1.78,  -3.14, -15.33>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -1.72,  -4.60, -12.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.78,  -3.15, -13.07>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.65,  -0.89, -16.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.70,  -4.61, -16.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.11,   2.62, -14.25>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  1.11,   2.62, -14.16>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(<  0.01,   4.18, -17.44>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #15
atom(< -1.78,   2.36, -18.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.72,   0.90, -15.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  1.78,   2.35, -16.31>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -0.01,  -4.53,  -7.72>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #19
atom(< -0.01,   0.97, -10.96>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(< -1.65,  -0.89, -11.87>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  0.01,  -1.32,  -7.72>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -1.78,  -3.14,  -8.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(<  1.78,  -3.15,  -6.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  1.65,  -0.89, -10.06>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.70,  -4.61,  -9.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -1.11,   2.62,  -7.77>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #27
atom(<  1.11,   2.62,  -7.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #28
atom(< -1.65,   4.61, -15.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  0.01,   4.18, -10.96>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #30
atom(< -1.78,   2.36, -12.09>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.72,   0.89,  -9.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(<  1.78,   2.35,  -9.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  1.65,   4.60, -13.30>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.70,   0.89, -12.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -1.65,   4.61,  -8.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.65,   4.60,  -6.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  1.70,   0.89,  -6.43>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
cylinder {< -1.11,  -2.87, -17.48>, < -0.00,  -2.87, -17.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -17.40>, < -0.00,  -2.87, -17.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -17.48>, < -1.45,  -3.00, -16.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14, -15.33>, < -1.45,  -3.00, -16.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -17.48>, < -1.38,  -1.88, -17.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -0.89, -18.35>, < -1.38,  -1.88, -17.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -17.40>, <  1.40,  -3.74, -16.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,  -4.61, -16.15>, <  1.40,  -3.74, -16.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -17.40>, <  1.38,  -1.88, -16.97>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -16.54>, <  1.38,  -1.88, -16.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53, -14.20>, <  0.89,  -3.84, -13.64>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.15, -13.07>, <  0.89,  -3.84, -13.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53, -14.20>, < -0.89,  -3.83, -14.77>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14, -15.33>, < -0.89,  -3.83, -14.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53, -14.20>, <  0.85,  -4.57, -15.17>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,  -4.61, -16.15>, <  0.85,  -4.57, -15.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53, -14.20>, <  0.00,  -2.92, -14.20>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.31, -14.20>, <  0.00,  -2.92, -14.20>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53, -14.20>, < -0.86,  -4.56, -13.23>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,  -4.60, -12.26>, < -0.86,  -4.56, -13.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -11.01>, < -1.42,  -3.74, -11.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,  -4.60, -12.26>, < -1.42,  -3.74, -11.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -11.01>, < -1.45,  -3.01,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14,  -8.85>, < -1.45,  -3.01,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -11.01>, < -0.00,  -2.88, -10.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -10.92>, < -0.00,  -2.88, -10.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -2.87, -11.01>, < -1.38,  -1.88, -11.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -0.89, -11.87>, < -1.38,  -1.88, -11.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -10.92>, <  1.44,  -3.01, -11.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.15, -13.07>, <  1.44,  -3.01, -11.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -10.92>, <  1.40,  -3.74, -10.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,  -4.61,  -9.67>, <  1.40,  -3.74, -10.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -2.88, -10.92>, <  1.38,  -1.89, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -10.06>, <  1.38,  -1.89, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, < -0.83,   0.04, -17.90>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -0.89, -18.35>, < -0.83,   0.04, -17.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, <  0.82,   0.04, -16.99>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -16.54>, <  0.82,   0.04, -16.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, < -0.86,   0.93, -16.47>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,   0.90, -15.50>, < -0.86,   0.93, -16.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, <  0.89,   1.66, -16.88>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35, -16.31>, <  0.89,   1.66, -16.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, < -0.89,   1.67, -18.01>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,   2.36, -18.57>, < -0.89,   1.67, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -17.44>, <  0.00,   2.58, -17.44>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -17.44>, <  0.00,   2.58, -17.44>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.31, -14.20>, <  0.89,  -2.23, -13.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.15, -13.07>, <  0.89,  -2.23, -13.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.31, -14.20>, < -0.88,  -2.23, -14.76>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14, -15.33>, < -0.88,  -2.23, -14.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.31, -14.20>, <  0.83,  -1.10, -15.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -16.54>, <  0.83,  -1.10, -15.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.31, -14.20>, < -0.82,  -1.10, -13.03>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -0.89, -11.87>, < -0.82,  -1.10, -13.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62, -14.25>, < -1.42,   1.76, -14.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,   0.90, -15.50>, < -1.42,   1.76, -14.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62, -14.25>, < -1.38,   3.62, -14.68>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.61, -15.11>, < -1.38,   3.62, -14.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62, -14.25>, < -0.00,   2.62, -14.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62, -14.16>, < -0.00,   2.62, -14.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62, -14.25>, < -1.45,   2.49, -13.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,   2.36, -12.09>, < -1.45,   2.49, -13.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62, -14.16>, <  1.40,   1.75, -13.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   0.89, -12.91>, <  1.40,   1.75, -13.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62, -14.16>, <  1.44,   2.48, -15.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35, -16.31>, <  1.44,   2.48, -15.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62, -14.16>, <  1.38,   3.61, -13.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   4.60, -13.30>, <  1.38,   3.61, -13.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -17.44>, < -0.82,   4.40, -16.27>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.61, -15.11>, < -0.82,   4.40, -16.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -17.44>, <  0.89,   3.27, -16.87>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35, -16.31>, <  0.89,   3.27, -16.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -17.44>, < -0.88,   3.27, -18.00>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,   2.36, -18.57>, < -0.88,   3.27, -18.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53,  -7.72>, <  0.85,  -4.57,  -8.69>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,  -4.61,  -9.67>, <  0.85,  -4.57,  -8.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53,  -7.72>, <  0.00,  -2.92,  -7.72>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.32,  -7.72>, <  0.00,  -2.92,  -7.72>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53,  -7.72>, <  0.89,  -3.84,  -7.16>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.15,  -6.59>, <  0.89,  -3.84,  -7.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,  -4.53,  -7.72>, < -0.89,  -3.83,  -8.29>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14,  -8.85>, < -0.89,  -3.83,  -8.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, <  0.85,   0.93, -11.94>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   0.89, -12.91>, <  0.85,   0.93, -11.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, <  0.82,   0.04, -10.51>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -10.06>, <  0.82,   0.04, -10.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, < -0.83,   0.04, -11.42>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -0.89, -11.87>, < -0.83,   0.04, -11.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, < -0.86,   0.93,  -9.99>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,   0.89,  -9.02>, < -0.86,   0.93,  -9.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, <  0.89,   1.66, -10.40>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35,  -9.83>, <  0.89,   1.66, -10.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, <  0.00,   2.57, -10.96>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -10.96>, <  0.00,   2.57, -10.96>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.01,   0.97, -10.96>, < -0.89,   1.66, -11.53>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,   2.36, -12.09>, < -0.89,   1.66, -11.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.32,  -7.72>, <  0.83,  -1.10,  -8.89>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.89, -10.06>, <  0.83,  -1.10,  -8.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.32,  -7.72>, <  0.89,  -2.23,  -7.15>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.15,  -6.59>, <  0.89,  -2.23,  -7.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,  -1.32,  -7.72>, < -0.88,  -2.23,  -8.28>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,  -3.14,  -8.85>, < -0.88,  -2.23,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62,  -7.77>, < -1.38,   3.61,  -8.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.61,  -8.63>, < -1.38,   3.61,  -8.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62,  -7.77>, < -1.42,   1.76,  -8.39>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.72,   0.89,  -9.02>, < -1.42,   1.76,  -8.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,   2.62,  -7.77>, < -0.00,   2.62,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62,  -7.68>, < -0.00,   2.62,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62,  -7.68>, <  1.40,   1.75,  -7.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   0.89,  -6.43>, <  1.40,   1.75,  -7.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62,  -7.68>, <  1.44,   2.48,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35,  -9.83>, <  1.44,   2.48,  -8.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,   2.62,  -7.68>, <  1.38,   3.61,  -7.25>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   4.60,  -6.82>, <  1.38,   3.61,  -7.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -10.96>, <  0.83,   4.39, -12.13>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,   4.60, -13.30>, <  0.83,   4.39, -12.13>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -10.96>, < -0.82,   4.39,  -9.80>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,   4.61,  -8.63>, < -0.82,   4.39,  -9.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -10.96>, <  0.89,   3.26, -10.40>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,   2.35,  -9.83>, <  0.89,   3.26, -10.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.01,   4.18, -10.96>, < -0.88,   3.27, -11.53>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.78,   2.36, -12.09>, < -0.88,   3.27, -11.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
