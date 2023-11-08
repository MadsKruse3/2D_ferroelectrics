#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -62.77*x up 35.19*y
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

cylinder {< -9.96, -16.76,  -0.00>, < 29.89, -16.76,  -0.00>, Rcell pigment {Black}}
cylinder {<-29.89, -16.76, -34.52>, <  9.96, -16.76, -34.52>, Rcell pigment {Black}}
cylinder {<-29.89,  16.76, -34.52>, <  9.96,  16.76, -34.52>, Rcell pigment {Black}}
cylinder {< -9.96,  16.76,  -0.00>, < 29.89,  16.76,   0.00>, Rcell pigment {Black}}
cylinder {< -9.96, -16.76,  -0.00>, <-29.89, -16.76, -34.52>, Rcell pigment {Black}}
cylinder {< 29.89, -16.76,  -0.00>, <  9.96, -16.76, -34.52>, Rcell pigment {Black}}
cylinder {< 29.89,  16.76,   0.00>, <  9.96,  16.76, -34.52>, Rcell pigment {Black}}
cylinder {< -9.96,  16.76,  -0.00>, <-29.89,  16.76, -34.52>, Rcell pigment {Black}}
cylinder {< -9.96, -16.76,  -0.00>, < -9.96,  16.76,  -0.00>, Rcell pigment {Black}}
cylinder {< 29.89, -16.76,  -0.00>, < 29.89,  16.76,   0.00>, Rcell pigment {Black}}
cylinder {<  9.96, -16.76, -34.52>, <  9.96,  16.76, -34.52>, Rcell pigment {Black}}
cylinder {<-29.89, -16.76, -34.52>, <-29.89,  16.76, -34.52>, Rcell pigment {Black}}
atom(< -7.86,   1.85,  -3.56>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -4.61,   1.85,  -2.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -8.82,  -1.78,  -5.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -8.98,  -1.78,  -1.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -6.64,  -1.34,  -1.92>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #4
atom(< -6.64,   0.35,  -5.75>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #5
atom(< -7.93,   1.85,  -7.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.22,   1.85,  -3.56>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(<  2.03,   1.85,  -2.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -2.18,  -1.78,  -5.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.34,  -1.78,  -1.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -5.44,  -1.78,  -3.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.32,  -1.04,  -3.84>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(< -3.32,   1.25,  -3.84>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  0.00,  -1.34,  -1.92>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #14
atom(<  0.00,   0.35,  -5.75>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #15
atom(< -4.54,   1.85,  -9.31>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.29,   1.85,  -7.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -4.13,   1.85,  -5.80>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -5.50,  -1.78, -11.38>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -5.66,  -1.78,  -7.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -8.77,  -1.78,  -9.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -6.64,  -1.04,  -9.59>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< -6.64,   1.25,  -9.59>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(< -3.32,  -1.34,  -7.67>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #24
atom(< -3.32,   0.35, -11.51>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #25
atom(< -4.61,   1.85, -13.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -7.45,   1.85, -11.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -8.99,  -1.78, -13.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -6.64,  -1.34, -13.43>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #29
atom(<  1.20,  -1.78,  -3.93>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #30
atom(<  3.32,  -1.04,  -3.84>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(<  3.32,   1.25,  -3.84>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #32
atom(<  2.10,   1.85,  -9.31>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  2.51,   1.85,  -5.80>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.15,  -1.78, -11.38>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  0.98,  -1.78,  -7.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -2.12,  -1.78,  -9.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  0.00,  -1.04,  -9.59>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(<  0.00,   1.25,  -9.59>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<  3.32,  -1.34,  -7.67>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #40
atom(<  3.32,   0.35, -11.51>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(<  2.03,   1.85, -13.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -0.81,   1.85, -11.55>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(< -2.34,  -1.78, -13.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(<  0.00,  -1.34, -13.43>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #45
cylinder {< -7.86,   1.85,  -3.56>, < -7.25,   1.10,  -4.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   0.35,  -5.75>, < -7.25,   1.10,  -4.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.61,   1.85,  -2.15>, < -3.97,   1.55,  -3.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   1.25,  -3.84>, < -3.97,   1.55,  -3.00>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.34,  -1.92>, < -6.04,  -1.56,  -2.93>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.44,  -1.78,  -3.93>, < -6.04,  -1.56,  -2.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.34,  -1.92>, < -7.81,  -1.56,  -1.93>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -8.98,  -1.78,  -1.95>, < -7.81,  -1.56,  -1.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   0.35,  -5.75>, < -5.39,   1.10,  -5.78>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.13,   1.85,  -5.80>, < -5.39,   1.10,  -5.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   0.35,  -5.75>, < -7.29,   1.10,  -6.83>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,   1.85,  -7.91>, < -7.29,   1.10,  -6.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,   1.85,  -7.91>, < -7.29,   1.55,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   1.25,  -9.59>, < -7.29,   1.55,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   1.85,  -3.56>, < -2.27,   1.55,  -3.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   1.25,  -3.84>, < -2.27,   1.55,  -3.70>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,   1.85,  -3.56>, < -0.61,   1.10,  -4.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.35,  -5.75>, < -0.61,   1.10,  -4.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.03,   1.85,  -2.15>, <  2.68,   1.55,  -2.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,   1.25,  -3.84>, <  2.68,   1.55,  -2.99>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.18,  -1.78,  -5.63>, < -2.75,  -1.41,  -4.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.04,  -3.84>, < -2.75,  -1.41,  -4.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.18,  -1.78,  -5.63>, < -2.75,  -1.56,  -6.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.34,  -7.67>, < -2.75,  -1.56,  -6.65>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -1.78,  -1.95>, < -1.17,  -1.56,  -1.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.34,  -1.92>, < -1.17,  -1.56,  -1.93>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -1.78,  -1.95>, < -2.83,  -1.41,  -2.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.04,  -3.84>, < -2.83,  -1.41,  -2.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.44,  -1.78,  -3.93>, < -4.38,  -1.41,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.04,  -3.84>, < -4.38,  -1.41,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.04,  -3.84>, < -3.32,   0.11,  -3.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   1.25,  -3.84>, < -3.32,   0.11,  -3.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   1.25,  -3.84>, < -3.73,   1.55,  -4.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.13,   1.85,  -5.80>, < -3.73,   1.55,  -4.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.34,  -1.92>, <  0.60,  -1.56,  -2.93>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -1.78,  -3.93>, <  0.60,  -1.56,  -2.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.35,  -5.75>, < -0.65,   1.10,  -6.83>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.29,   1.85,  -7.91>, < -0.65,   1.10,  -6.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   0.35,  -5.75>, <  1.26,   1.10,  -5.78>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.51,   1.85,  -5.80>, <  1.26,   1.10,  -5.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.54,   1.85,  -9.31>, < -3.93,   1.10, -10.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   0.35, -11.51>, < -3.93,   1.10, -10.41>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.54,   1.85,  -9.31>, < -5.59,   1.55,  -9.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   1.25,  -9.59>, < -5.59,   1.55,  -9.45>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.29,   1.85,  -7.91>, < -0.65,   1.55,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   1.25,  -9.59>, < -0.65,   1.55,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.50,  -1.78, -11.38>, < -6.07,  -1.56, -12.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.34, -13.43>, < -6.07,  -1.56, -12.40>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.50,  -1.78, -11.38>, < -6.07,  -1.41, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.04,  -9.59>, < -6.07,  -1.41, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.66,  -1.78,  -7.70>, < -6.15,  -1.41,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.04,  -9.59>, < -6.15,  -1.41,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.77,  -1.78,  -9.69>, < -7.70,  -1.41,  -9.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.04,  -9.59>, < -7.70,  -1.41,  -9.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.04,  -9.59>, < -6.64,   0.11,  -9.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   1.25,  -9.59>, < -6.64,   0.11,  -9.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,   1.25,  -9.59>, < -7.05,   1.55, -10.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.45,   1.85, -11.55>, < -7.05,   1.55, -10.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.34,  -7.67>, < -2.72,  -1.56,  -8.68>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -1.78,  -9.69>, < -2.72,  -1.56,  -8.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -1.34,  -7.67>, < -4.49,  -1.56,  -7.69>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.66,  -1.78,  -7.70>, < -4.49,  -1.56,  -7.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   0.35, -11.51>, < -2.07,   1.10, -11.53>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.81,   1.85, -11.55>, < -2.07,   1.10, -11.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,   0.35, -11.51>, < -3.97,   1.10, -12.58>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.61,   1.85, -13.66>, < -3.97,   1.10, -12.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.99,  -1.78, -13.46>, < -7.81,  -1.56, -13.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -1.34, -13.43>, < -7.81,  -1.56, -13.44>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.20,  -1.78,  -3.93>, <  2.26,  -1.41,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -1.04,  -3.84>, <  2.26,  -1.41,  -3.88>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -1.04,  -3.84>, <  3.32,   0.11,  -3.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,   1.25,  -3.84>, <  3.32,   0.11,  -3.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,   1.25,  -3.84>, <  2.92,   1.55,  -4.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.51,   1.85,  -5.80>, <  2.92,   1.55,  -4.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,   1.85,  -9.31>, <  1.05,   1.55,  -9.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   1.25,  -9.59>, <  1.05,   1.55,  -9.45>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,   1.85,  -9.31>, <  2.71,   1.10, -10.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,   0.35, -11.51>, <  2.71,   1.10, -10.41>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.15,  -1.78, -11.38>, <  0.57,  -1.56, -12.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.34, -13.43>, <  0.57,  -1.56, -12.40>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.15,  -1.78, -11.38>, <  0.57,  -1.41, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.04,  -9.59>, <  0.57,  -1.41, -10.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.98,  -1.78,  -7.70>, <  0.49,  -1.41,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.04,  -9.59>, <  0.49,  -1.41,  -8.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.98,  -1.78,  -7.70>, <  2.15,  -1.56,  -7.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -1.34,  -7.67>, <  2.15,  -1.56,  -7.69>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -1.78,  -9.69>, < -1.06,  -1.41,  -9.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.04,  -9.59>, < -1.06,  -1.41,  -9.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.04,  -9.59>, <  0.00,   0.11,  -9.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   1.25,  -9.59>, <  0.00,   0.11,  -9.59>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   1.25,  -9.59>, < -0.40,   1.55, -10.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.81,   1.85, -11.55>, < -0.40,   1.55, -10.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,   0.35, -11.51>, <  2.68,   1.10, -12.58>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.03,   1.85, -13.66>, <  2.68,   1.10, -12.58>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -1.34, -13.43>, < -1.17,  -1.56, -13.44>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -1.78, -13.46>, < -1.17,  -1.56, -13.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
