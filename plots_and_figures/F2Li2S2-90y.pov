#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -19.55*x up 36.52*y
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

cylinder {<  9.31, -17.39, -30.97>, <  9.31, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  9.31,  17.39, -30.97>, <  9.31,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.31,  17.39, -30.97>, < -9.31,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.31, -17.39, -30.97>, < -9.31, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  9.31, -17.39, -30.97>, <  9.31,  17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  9.31, -17.39,   0.00>, <  9.31,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.31, -17.39,   0.00>, < -9.31,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.31, -17.39, -30.97>, < -9.31,  17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  9.31, -17.39, -30.97>, < -9.31, -17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  9.31, -17.39,   0.00>, < -9.31, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  9.31,  17.39,  -0.00>, < -9.31,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {<  9.31,  17.39, -30.97>, < -9.31,  17.39, -30.97>, Rcell pigment {Black}}
atom(< -0.52, -10.74, -30.51>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<  0.37,  -8.55, -28.49>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #1
atom(< -0.06,  -6.97, -26.66>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(< -0.45,  -9.08, -29.96>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(< -0.42, -11.20, -27.83>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<  1.14, -10.27, -27.97>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #5
atom(< -0.52,  -4.95, -30.51>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #6
atom(<  0.37,  -2.75, -28.49>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #7
atom(< -0.06,  -1.17, -26.66>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(< -0.45,  -3.28, -29.96>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(< -0.42,  -5.40, -27.83>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<  1.14,  -4.47, -27.97>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -0.52, -10.74, -25.35>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(<  0.37,  -8.55, -23.33>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -0.06,  -6.97, -21.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -0.45,  -9.08, -24.80>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #15
atom(< -0.42, -11.20, -22.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(<  1.14, -10.27, -22.80>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(< -0.52,  -4.95, -25.35>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #18
atom(<  0.37,  -2.75, -23.33>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #19
atom(< -0.06,  -1.17, -21.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -0.45,  -3.28, -24.80>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #21
atom(< -0.42,  -5.40, -22.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(<  1.14,  -4.47, -22.80>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #23
cylinder {< -0.52, -10.74, -30.51>, < -0.07,  -9.65, -29.50>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -28.49>, < -0.07,  -9.65, -29.50>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -30.51>, < -0.48,  -9.91, -30.24>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -9.08, -29.96>, < -0.48,  -9.91, -30.24>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -30.51>, < -0.47, -10.97, -29.17>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -27.83>, < -0.47, -10.97, -29.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -28.49>, < -0.04,  -8.81, -29.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -9.08, -29.96>, < -0.04,  -8.81, -29.23>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -28.49>, < -0.03,  -9.87, -28.16>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -27.83>, < -0.03,  -9.87, -28.16>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -28.49>, <  0.75,  -9.41, -28.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.14, -10.27, -27.97>, <  0.75,  -9.41, -28.23>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -28.49>, <  0.15,  -7.76, -27.57>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -6.97, -26.66>, <  0.15,  -7.76, -27.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -6.97, -26.66>, < -0.24,  -6.18, -27.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -27.83>, < -0.24,  -6.18, -27.24>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -6.97, -26.66>, < -0.29,  -5.96, -26.00>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -25.35>, < -0.29,  -5.96, -26.00>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -27.83>, <  0.36, -10.73, -27.90>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.14, -10.27, -27.97>, <  0.36, -10.73, -27.90>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -27.83>, < -0.47, -10.97, -26.59>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -25.35>, < -0.47, -10.97, -26.59>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -30.51>, < -0.47,  -5.18, -29.17>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -27.83>, < -0.47,  -5.18, -29.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -30.51>, < -0.07,  -3.85, -29.50>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -28.49>, < -0.07,  -3.85, -29.50>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -30.51>, < -0.48,  -4.11, -30.24>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -3.28, -29.96>, < -0.48,  -4.11, -30.24>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -28.49>, < -0.03,  -4.08, -28.16>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -27.83>, < -0.03,  -4.08, -28.16>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -28.49>, < -0.04,  -3.02, -29.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -3.28, -29.96>, < -0.04,  -3.02, -29.23>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -28.49>, <  0.15,  -1.96, -27.57>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -1.17, -26.66>, <  0.15,  -1.96, -27.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -28.49>, <  0.75,  -3.61, -28.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.14,  -4.47, -27.97>, <  0.75,  -3.61, -28.23>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -27.83>, < -0.47,  -5.18, -26.59>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -25.35>, < -0.47,  -5.18, -26.59>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -27.83>, <  0.36,  -4.94, -27.90>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.14,  -4.47, -27.97>, <  0.36,  -4.94, -27.90>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -25.35>, < -0.47, -10.97, -24.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -22.67>, < -0.47, -10.97, -24.01>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -25.35>, < -0.48,  -9.91, -25.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -9.08, -24.80>, < -0.48,  -9.91, -25.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.52, -10.74, -25.35>, < -0.07,  -9.65, -24.34>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -23.33>, < -0.07,  -9.65, -24.34>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -23.33>, <  0.75,  -9.41, -23.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.14, -10.27, -22.80>, <  0.75,  -9.41, -23.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -23.33>, < -0.03,  -9.87, -23.00>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -22.67>, < -0.03,  -9.87, -23.00>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -23.33>, < -0.04,  -8.81, -24.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -9.08, -24.80>, < -0.04,  -8.81, -24.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -8.55, -23.33>, <  0.15,  -7.76, -22.41>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -6.97, -21.50>, <  0.15,  -7.76, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -6.97, -21.50>, < -0.24,  -6.18, -22.08>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -22.67>, < -0.24,  -6.18, -22.08>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -11.20, -22.67>, <  0.36, -10.73, -22.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.14, -10.27, -22.80>, <  0.36, -10.73, -22.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -25.35>, < -0.47,  -5.18, -24.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -22.67>, < -0.47,  -5.18, -24.01>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -25.35>, < -0.07,  -3.85, -24.34>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -23.33>, < -0.07,  -3.85, -24.34>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.52,  -4.95, -25.35>, < -0.48,  -4.11, -25.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -3.28, -24.80>, < -0.48,  -4.11, -25.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -23.33>, < -0.03,  -4.08, -23.00>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -22.67>, < -0.03,  -4.08, -23.00>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -23.33>, <  0.15,  -1.96, -22.41>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.06,  -1.17, -21.50>, <  0.15,  -1.96, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -23.33>, < -0.04,  -3.02, -24.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.45,  -3.28, -24.80>, < -0.04,  -3.02, -24.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -2.75, -23.33>, <  0.75,  -3.61, -23.07>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.14,  -4.47, -22.80>, <  0.75,  -3.61, -23.07>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -5.40, -22.67>, <  0.36,  -4.94, -22.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  1.14,  -4.47, -22.80>, <  0.36,  -4.94, -22.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
