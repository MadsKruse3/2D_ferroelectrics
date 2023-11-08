#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.15*x up 34.81*y
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

cylinder {< 16.74, -16.58, -38.28>, < 16.74, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {< 16.74,  16.58, -57.42>, < 16.74,  16.58, -19.14>, Rcell pigment {Black}}
cylinder {<-16.74,  16.58, -57.42>, <-16.74,  16.58, -19.14>, Rcell pigment {Black}}
cylinder {<-16.74, -16.58, -38.28>, <-16.74, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {< 16.74, -16.58, -38.28>, < 16.74,  16.58, -57.42>, Rcell pigment {Black}}
cylinder {< 16.74, -16.58,   0.00>, < 16.74,  16.58, -19.14>, Rcell pigment {Black}}
cylinder {<-16.74, -16.58,   0.00>, <-16.74,  16.58, -19.14>, Rcell pigment {Black}}
cylinder {<-16.74, -16.58, -38.28>, <-16.74,  16.58, -57.42>, Rcell pigment {Black}}
cylinder {< 16.74, -16.58, -38.28>, <-16.74, -16.58, -38.28>, Rcell pigment {Black}}
cylinder {< 16.74, -16.58,   0.00>, <-16.74, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {< 16.74,  16.58, -19.14>, <-16.74,  16.58, -19.14>, Rcell pigment {Black}}
cylinder {< 16.74,  16.58, -57.42>, <-16.74,  16.58, -57.42>, Rcell pigment {Black}}
atom(< -1.11,  -9.58, -36.35>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(<  1.11,  -9.58, -36.26>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.73, -11.32, -37.58>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -0.00, -11.26, -33.12>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #3
atom(< -1.11,  -9.58, -29.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(<  1.11,  -9.58, -29.88>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -0.00,  -5.74, -36.31>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #6
atom(< -1.65,  -7.60, -37.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(<  0.00,  -8.02, -33.12>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -1.79,  -9.86, -34.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.73, -11.32, -31.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.79,  -9.86, -32.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.65,  -7.60, -35.40>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  1.73, -11.32, -35.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -1.11,  -4.06, -33.16>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(<  1.11,  -4.06, -33.07>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(<  0.00,  -2.50, -36.31>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -1.79,  -4.33, -37.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -1.73,  -5.79, -34.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  1.79,  -4.33, -35.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -0.00, -11.26, -26.74>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #20
atom(< -0.00,  -5.74, -29.93>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #21
atom(< -1.65,  -7.60, -30.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  0.00,  -8.02, -26.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(< -1.79,  -9.86, -27.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -1.73, -11.32, -24.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.79,  -9.86, -25.65>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  1.65,  -7.60, -29.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  1.73, -11.32, -28.65>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -1.11,  -4.06, -26.78>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  1.11,  -4.06, -26.69>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -1.65,  -2.07, -34.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(<  0.00,  -2.50, -29.93>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -1.79,  -4.33, -31.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -1.73,  -5.79, -28.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.79,  -4.33, -28.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.65,  -2.07, -32.21>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.73,  -5.79, -31.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -1.65,  -7.60, -24.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(< -1.65,  -2.07, -27.64>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(< -1.79,  -4.33, -24.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  1.65,  -2.07, -25.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  1.73,  -5.79, -25.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -1.11,  -9.58, -36.35>, < -1.42, -10.45, -36.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73, -11.32, -37.58>, < -1.42, -10.45, -36.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -36.35>, < -0.00,  -9.58, -36.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -36.26>, < -0.00,  -9.58, -36.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -36.35>, < -1.45,  -9.72, -35.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -34.20>, < -1.45,  -9.72, -35.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -36.35>, < -1.38,  -8.59, -36.78>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -37.21>, < -1.38,  -8.59, -36.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -36.26>, <  1.42, -10.45, -35.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73, -11.32, -35.03>, <  1.42, -10.45, -35.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -36.26>, <  1.38,  -8.59, -35.83>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -35.40>, <  1.38,  -8.59, -35.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -33.12>, < -0.86, -11.29, -32.16>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73, -11.32, -31.20>, < -0.86, -11.29, -32.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -33.12>, <  0.86, -11.29, -34.07>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73, -11.32, -35.03>, <  0.86, -11.29, -34.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -33.12>, <  0.00,  -9.64, -33.12>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -33.12>, <  0.00,  -9.64, -33.12>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -33.12>, < -0.89, -10.56, -33.66>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -34.20>, < -0.89, -10.56, -33.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -33.12>, <  0.89, -10.56, -32.57>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -9.86, -32.03>, <  0.89, -10.56, -32.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -29.97>, < -1.42, -10.45, -30.58>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73, -11.32, -31.20>, < -1.42, -10.45, -30.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -29.97>, < -1.38,  -8.59, -30.40>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -30.83>, < -1.38,  -8.59, -30.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -29.97>, < -0.00,  -9.58, -29.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -29.88>, < -0.00,  -9.58, -29.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.58, -29.97>, < -1.45,  -9.72, -28.90>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -27.82>, < -1.45,  -9.72, -28.90>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -29.88>, <  1.45,  -9.72, -30.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -9.86, -32.03>, <  1.45,  -9.72, -30.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -29.88>, <  1.38,  -8.59, -29.45>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -29.02>, <  1.38,  -8.59, -29.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.58, -29.88>, <  1.42, -10.45, -29.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73, -11.32, -28.65>, <  1.42, -10.45, -29.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, <  0.83,  -6.67, -35.85>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -35.40>, <  0.83,  -6.67, -35.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, < -0.83,  -6.67, -36.76>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -37.21>, < -0.83,  -6.67, -36.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, < -0.86,  -5.76, -35.35>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -5.79, -34.39>, < -0.86,  -5.76, -35.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, <  0.89,  -5.03, -35.76>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -35.22>, <  0.89,  -5.03, -35.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, < -0.89,  -5.03, -36.85>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -37.39>, < -0.89,  -5.03, -36.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -36.31>, <  0.00,  -4.12, -36.31>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -36.31>, <  0.00,  -4.12, -36.31>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -33.12>, < -0.89,  -8.94, -33.66>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -34.20>, < -0.89,  -8.94, -33.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -33.12>, <  0.89,  -8.94, -32.57>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -9.86, -32.03>, <  0.89,  -8.94, -32.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -33.12>, <  0.83,  -7.81, -34.26>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -35.40>, <  0.83,  -7.81, -34.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -33.12>, < -0.83,  -7.81, -31.97>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -30.83>, < -0.83,  -7.81, -31.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -33.16>, < -1.42,  -4.92, -33.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -5.79, -34.39>, < -1.42,  -4.92, -33.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -33.16>, < -0.00,  -4.06, -33.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -33.07>, < -0.00,  -4.06, -33.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -33.16>, < -1.38,  -3.06, -33.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -2.07, -34.02>, < -1.38,  -3.06, -33.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -33.16>, < -1.45,  -4.19, -32.09>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -31.01>, < -1.45,  -4.19, -32.09>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -33.07>, <  1.42,  -4.92, -32.46>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.79, -31.84>, <  1.42,  -4.92, -32.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -33.07>, <  1.45,  -4.20, -34.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -35.22>, <  1.45,  -4.20, -34.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -33.07>, <  1.38,  -3.06, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -2.07, -32.21>, <  1.38,  -3.06, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -36.31>, <  0.89,  -3.42, -35.76>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -35.22>, <  0.89,  -3.42, -35.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -36.31>, < -0.89,  -3.41, -36.85>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -37.39>, < -0.89,  -3.41, -36.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -36.31>, < -0.83,  -2.28, -35.16>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -2.07, -34.02>, < -0.83,  -2.28, -35.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -26.74>, <  0.00,  -9.64, -26.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -26.74>, <  0.00,  -9.64, -26.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -26.74>, <  0.89, -10.56, -26.19>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -9.86, -25.65>, <  0.89, -10.56, -26.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -26.74>, <  0.86, -11.29, -27.69>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73, -11.32, -28.65>, <  0.86, -11.29, -27.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -26.74>, < -0.89, -10.56, -27.28>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -27.82>, < -0.89, -10.56, -27.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.26, -26.74>, < -0.86, -11.29, -25.78>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73, -11.32, -24.82>, < -0.86, -11.29, -25.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, <  0.86,  -5.76, -30.88>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.79, -31.84>, <  0.86,  -5.76, -30.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, < -0.83,  -6.67, -30.38>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -30.83>, < -0.83,  -6.67, -30.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, <  0.83,  -6.67, -29.47>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -29.02>, <  0.83,  -6.67, -29.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, < -0.86,  -5.76, -28.97>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -5.79, -28.01>, < -0.86,  -5.76, -28.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, <  0.89,  -5.03, -29.38>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -28.84>, <  0.89,  -5.03, -29.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, < -0.89,  -5.03, -30.47>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -31.01>, < -0.89,  -5.03, -30.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -5.74, -29.93>, <  0.00,  -4.12, -29.93>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -29.93>, <  0.00,  -4.12, -29.93>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -26.74>, <  0.89,  -8.94, -26.19>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -9.86, -25.65>, <  0.89,  -8.94, -26.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -26.74>, <  0.83,  -7.81, -27.88>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -7.60, -29.02>, <  0.83,  -7.81, -27.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -26.74>, < -0.89,  -8.94, -27.28>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -9.86, -27.82>, < -0.89,  -8.94, -27.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.02, -26.74>, < -0.83,  -7.81, -25.59>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -7.60, -24.45>, < -0.83,  -7.81, -25.59>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -26.78>, < -1.42,  -4.92, -27.39>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -5.79, -28.01>, < -1.42,  -4.92, -27.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -26.78>, < -0.00,  -4.06, -26.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -26.69>, < -0.00,  -4.06, -26.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -26.78>, < -1.38,  -3.06, -27.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -2.07, -27.64>, < -1.38,  -3.06, -27.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -4.06, -26.78>, < -1.45,  -4.19, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -24.63>, < -1.45,  -4.19, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -26.69>, <  1.42,  -4.92, -26.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.79, -25.46>, <  1.42,  -4.92, -26.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -26.69>, <  1.45,  -4.20, -27.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -28.84>, <  1.45,  -4.20, -27.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -4.06, -26.69>, <  1.38,  -3.06, -26.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -2.07, -25.83>, <  1.38,  -3.06, -26.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -29.93>, <  0.83,  -2.28, -31.07>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -2.07, -32.21>, <  0.83,  -2.28, -31.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -29.93>, <  0.89,  -3.42, -29.38>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -4.33, -28.84>, <  0.89,  -3.42, -29.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -29.93>, < -0.89,  -3.41, -30.47>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -4.33, -31.01>, < -0.89,  -3.41, -30.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -2.50, -29.93>, < -0.83,  -2.28, -28.78>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -2.07, -27.64>, < -0.83,  -2.28, -28.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
