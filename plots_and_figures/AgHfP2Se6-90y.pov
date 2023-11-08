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
atom(< -1.11,  -9.28, -36.29>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(<  1.11,  -9.36, -36.33>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -1.79, -11.00, -37.60>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(<  0.00, -11.24, -32.98>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #3
atom(< -1.11,  -9.28, -29.91>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(<  1.11,  -9.36, -29.95>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(<  0.00,  -5.72, -36.17>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #6
atom(< -1.73,  -7.35, -37.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -0.00,  -7.34, -33.37>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -1.65,  -9.53, -34.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.79, -11.00, -31.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.73,  -9.56, -32.07>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.79,  -7.36, -35.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(<  1.65, -11.10, -35.05>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -1.11,  -3.76, -33.10>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(<  1.11,  -3.83, -33.14>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -0.00,  -1.81, -36.56>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -1.65,  -4.00, -37.33>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -1.79,  -5.48, -34.41>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  1.73,  -4.03, -35.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  0.00, -11.24, -26.60>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(<  0.00,  -5.72, -29.79>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #21
atom(< -1.73,  -7.35, -30.80>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -0.00,  -7.34, -26.99>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(< -1.65,  -9.53, -27.76>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -1.79, -11.00, -24.84>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.73,  -9.56, -25.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  1.79,  -7.36, -29.12>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  1.65, -11.10, -28.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -1.11,  -3.76, -26.72>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  1.11,  -3.83, -26.76>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -1.73,  -1.83, -33.99>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -0.00,  -1.81, -30.18>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -1.65,  -4.00, -30.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -1.79,  -5.48, -28.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.73,  -4.03, -28.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.79,  -1.84, -32.31>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.65,  -5.57, -31.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -1.73,  -7.35, -24.42>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(< -1.73,  -1.83, -27.61>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(< -1.65,  -4.00, -24.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  1.79,  -1.84, -25.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  1.65,  -5.57, -25.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -1.11,  -9.28, -36.29>, <  0.00,  -9.32, -36.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -36.33>, <  0.00,  -9.32, -36.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -36.29>, < -1.45, -10.14, -36.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79, -11.00, -37.60>, < -1.45, -10.14, -36.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -36.29>, < -1.38,  -9.41, -35.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -34.14>, < -1.38,  -9.41, -35.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -36.29>, < -1.42,  -8.32, -36.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -7.35, -37.18>, < -1.42,  -8.32, -36.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -36.33>, <  1.38, -10.23, -35.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -11.10, -35.05>, <  1.38, -10.23, -35.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -36.33>, <  1.45,  -8.36, -35.92>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -35.50>, <  1.45,  -8.36, -35.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -32.98>, <  0.83, -11.17, -34.01>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -11.10, -35.05>, <  0.83, -11.17, -34.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -32.98>, < -0.89, -11.12, -32.10>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79, -11.00, -31.22>, < -0.89, -11.12, -32.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -32.98>, <  0.86, -10.40, -32.53>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -9.56, -32.07>, <  0.86, -10.40, -32.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -32.98>, < -0.83, -10.39, -33.56>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -34.14>, < -0.83, -10.39, -33.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -29.91>, < -1.45, -10.14, -30.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79, -11.00, -31.22>, < -1.45, -10.14, -30.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -29.91>, < -1.42,  -8.32, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -7.35, -30.80>, < -1.42,  -8.32, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -29.91>, < -1.38,  -9.41, -28.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -27.76>, < -1.38,  -9.41, -28.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -9.28, -29.91>, <  0.00,  -9.32, -29.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -29.95>, <  0.00,  -9.32, -29.93>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -29.95>, <  1.42,  -9.46, -31.01>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -9.56, -32.07>, <  1.42,  -9.46, -31.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -29.95>, <  1.45,  -8.36, -29.54>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -29.12>, <  1.45,  -8.36, -29.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -9.36, -29.95>, <  1.38, -10.23, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -11.10, -28.67>, <  1.38, -10.23, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, <  0.89,  -6.54, -35.84>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -35.50>, <  0.89,  -6.54, -35.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, < -0.86,  -6.53, -36.68>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -7.35, -37.18>, < -0.86,  -6.53, -36.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, < -0.00,  -6.53, -34.77>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -33.37>, < -0.00,  -6.53, -34.77>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, < -0.89,  -5.60, -35.29>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -34.41>, < -0.89,  -5.60, -35.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, <  0.86,  -4.87, -35.72>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.03, -35.26>, <  0.86,  -4.87, -35.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -36.17>, < -0.83,  -4.86, -36.75>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -37.33>, < -0.83,  -4.86, -36.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -33.37>, < -0.83,  -8.43, -33.75>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -34.14>, < -0.83,  -8.43, -33.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -33.37>, <  0.89,  -7.35, -34.44>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -35.50>, <  0.89,  -7.35, -34.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -33.37>, <  0.83,  -6.46, -32.61>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -5.57, -31.86>, <  0.83,  -6.46, -32.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -33.37>, < -0.89,  -6.41, -33.89>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -34.41>, < -0.89,  -6.41, -33.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -33.10>, < -1.45,  -4.62, -33.76>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -34.41>, < -1.45,  -4.62, -33.76>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -33.10>, <  0.00,  -3.80, -33.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -33.14>, <  0.00,  -3.80, -33.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -33.10>, < -1.42,  -2.79, -33.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -1.83, -33.99>, < -1.42,  -2.79, -33.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -33.10>, < -1.38,  -3.88, -32.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -30.95>, < -1.38,  -3.88, -32.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -33.14>, <  1.38,  -4.70, -32.50>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -5.57, -31.86>, <  1.38,  -4.70, -32.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -33.14>, <  1.42,  -3.93, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.03, -35.26>, <  1.42,  -3.93, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -33.14>, <  1.45,  -2.83, -32.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.84, -32.31>, <  1.45,  -2.83, -32.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.81, -36.56>, < -0.83,  -2.91, -36.94>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -37.33>, < -0.83,  -2.91, -36.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -26.60>, < -0.83, -10.39, -27.18>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -27.76>, < -0.83, -10.39, -27.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -26.60>, < -0.89, -11.12, -25.72>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79, -11.00, -24.84>, < -0.89, -11.12, -25.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -26.60>, <  0.83, -11.17, -27.63>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -11.10, -28.67>, <  0.83, -11.17, -27.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.24, -26.60>, <  0.86, -10.40, -26.15>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -9.56, -25.69>, <  0.86, -10.40, -26.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, <  0.83,  -5.65, -30.82>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -5.57, -31.86>, <  0.83,  -5.65, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, < -0.86,  -6.53, -30.30>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -7.35, -30.80>, < -0.86,  -6.53, -30.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, <  0.89,  -6.54, -29.46>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -29.12>, <  0.89,  -6.54, -29.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, < -0.00,  -6.53, -28.39>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -26.99>, < -0.00,  -6.53, -28.39>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, < -0.89,  -5.60, -28.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -28.03>, < -0.89,  -5.60, -28.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, <  0.86,  -4.87, -29.34>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.03, -28.88>, <  0.86,  -4.87, -29.34>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -5.72, -29.79>, < -0.83,  -4.86, -30.37>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -30.95>, < -0.83,  -4.86, -30.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -26.99>, < -0.83,  -8.43, -27.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -9.53, -27.76>, < -0.83,  -8.43, -27.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -26.99>, <  0.89,  -7.35, -28.06>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -7.36, -29.12>, <  0.89,  -7.35, -28.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -26.99>, <  0.83,  -6.46, -26.23>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -5.57, -25.48>, <  0.83,  -6.46, -26.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.34, -26.99>, < -0.89,  -6.41, -27.51>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -28.03>, < -0.89,  -6.41, -27.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -26.72>, < -1.45,  -4.62, -27.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.79,  -5.48, -28.03>, < -1.45,  -4.62, -27.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -26.72>, < -1.42,  -2.79, -27.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -1.83, -27.61>, < -1.42,  -2.79, -27.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -26.72>, < -1.38,  -3.88, -25.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -24.57>, < -1.38,  -3.88, -25.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -3.76, -26.72>, <  0.00,  -3.80, -26.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -26.76>, <  0.00,  -3.80, -26.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -26.76>, <  1.38,  -4.70, -26.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -5.57, -25.48>, <  1.38,  -4.70, -26.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -26.76>, <  1.42,  -3.93, -27.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -4.03, -28.88>, <  1.42,  -3.93, -27.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.11,  -3.83, -26.76>, <  1.45,  -2.83, -26.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.84, -25.93>, <  1.45,  -2.83, -26.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.81, -30.18>, <  0.89,  -1.82, -31.25>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.79,  -1.84, -32.31>, <  0.89,  -1.82, -31.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.81, -30.18>, < -0.83,  -2.91, -30.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.65,  -4.00, -30.95>, < -0.83,  -2.91, -30.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
