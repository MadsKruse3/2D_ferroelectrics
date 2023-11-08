#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -60.94*x up 35.14*y
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

cylinder {< -9.67, -16.73,  -0.00>, < 29.02, -16.73,  -0.00>, Rcell pigment {Black}}
cylinder {<-29.02, -16.73, -33.51>, <  9.67, -16.73, -33.51>, Rcell pigment {Black}}
cylinder {<-29.02,  16.73, -33.51>, <  9.67,  16.73, -33.51>, Rcell pigment {Black}}
cylinder {< -9.67,  16.73,  -0.00>, < 29.02,  16.73,   0.00>, Rcell pigment {Black}}
cylinder {< -9.67, -16.73,  -0.00>, <-29.02, -16.73, -33.51>, Rcell pigment {Black}}
cylinder {< 29.02, -16.73,  -0.00>, <  9.67, -16.73, -33.51>, Rcell pigment {Black}}
cylinder {< 29.02,  16.73,   0.00>, <  9.67,  16.73, -33.51>, Rcell pigment {Black}}
cylinder {< -9.67,  16.73,  -0.00>, <-29.02,  16.73, -33.51>, Rcell pigment {Black}}
cylinder {< -9.67, -16.73,  -0.00>, < -9.67,  16.73,  -0.00>, Rcell pigment {Black}}
cylinder {< 29.02, -16.73,  -0.00>, < 29.02,  16.73,   0.00>, Rcell pigment {Black}}
cylinder {<  9.67, -16.73, -33.51>, <  9.67,  16.73, -33.51>, Rcell pigment {Black}}
cylinder {<-29.02, -16.73, -33.51>, <-29.02,  16.73, -33.51>, Rcell pigment {Black}}
atom(< -6.45,  -0.23,  -1.86>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #0
atom(< -8.78,   1.85,  -5.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -8.44,   1.85,  -1.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -7.56,  -1.72,  -3.87>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -0.00,  -0.23,  -1.86>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -3.22,   1.16,  -3.72>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -3.22,  -1.12,  -3.72>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -2.33,   1.85,  -5.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -1.99,   1.85,  -1.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -5.35,   1.85,  -3.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.11,  -1.72,  -3.87>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.16,  -1.72,  -1.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -4.40,  -1.72,  -5.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.45,   1.48,  -5.58>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #13
atom(< -3.22,  -0.23,  -7.45>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #14
atom(< -6.45,   1.16,  -9.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -6.45,  -1.12,  -9.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(< -5.55,   1.85, -11.25>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.22,   1.85,  -7.56>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -8.57,   1.85,  -9.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -4.33,  -1.72,  -9.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -7.38,  -1.72,  -7.41>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -7.63,  -1.72, -11.07>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -6.45,  -0.23, -13.03>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #23
atom(< -8.44,   1.85, -13.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.22,   1.16,  -3.72>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #25
atom(<  3.22,  -1.12,  -3.72>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #26
atom(<  4.12,   1.85,  -5.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  1.10,   1.85,  -3.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  2.29,  -1.72,  -1.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  2.04,  -1.72,  -5.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #30
atom(< -0.00,   1.48,  -5.58>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #31
atom(<  3.22,  -0.23,  -7.45>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
atom(< -0.00,   1.16,  -9.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #33
atom(< -0.00,  -1.12,  -9.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #34
atom(<  0.89,   1.85, -11.25>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.23,   1.85,  -7.56>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -2.13,   1.85,  -9.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  2.11,  -1.72,  -9.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(< -0.93,  -1.72,  -7.41>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(< -1.18,  -1.72, -11.07>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(< -3.22,   1.48, -11.17>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #41
atom(< -0.00,  -0.23, -13.03>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #42
atom(< -1.99,   1.85, -13.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(< -4.16,  -1.72, -12.99>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(<  4.32,   1.85,  -9.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #45
atom(<  3.22,   1.48, -11.17>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #46
atom(<  2.29,  -1.72, -12.99>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #47
cylinder {< -6.45,  -0.23,  -1.86>, < -7.45,   0.81,  -1.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -8.44,   1.85,  -1.98>, < -7.45,   0.81,  -1.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23,  -1.86>, < -5.30,  -0.98,  -1.84>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.16,  -1.72,  -1.82>, < -5.30,  -0.98,  -1.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23,  -1.86>, < -5.90,   0.81,  -2.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.35,   1.85,  -3.53>, < -5.90,   0.81,  -2.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23,  -1.86>, < -7.00,  -0.98,  -2.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -7.56,  -1.72,  -3.87>, < -7.00,  -0.98,  -2.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.78,   1.85,  -5.66>, < -7.61,   1.66,  -5.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.48,  -5.58>, < -7.61,   1.66,  -5.62>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23,  -1.86>, <  0.55,   0.81,  -2.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.10,   1.85,  -3.53>, <  0.55,   0.81,  -2.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23,  -1.86>, < -1.00,   0.81,  -1.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,   1.85,  -1.98>, < -1.00,   0.81,  -1.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23,  -1.86>, < -0.56,  -0.98,  -2.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -1.72,  -3.87>, < -0.56,  -0.98,  -2.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23,  -1.86>, <  1.15,  -0.98,  -1.84>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.29,  -1.72,  -1.82>, <  1.15,  -0.98,  -1.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.16,  -3.72>, < -3.22,   0.02,  -3.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -1.12,  -3.72>, < -3.22,   0.02,  -3.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.16,  -3.72>, < -2.61,   1.50,  -2.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,   1.85,  -1.98>, < -2.61,   1.50,  -2.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.16,  -3.72>, < -4.29,   1.50,  -3.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.35,   1.85,  -3.53>, < -4.29,   1.50,  -3.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.16,  -3.72>, < -2.78,   1.50,  -4.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.33,   1.85,  -5.66>, < -2.78,   1.50,  -4.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -1.12,  -3.72>, < -3.81,  -1.42,  -4.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.40,  -1.72,  -5.48>, < -3.81,  -1.42,  -4.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -1.12,  -3.72>, < -3.69,  -1.42,  -2.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.16,  -1.72,  -1.82>, < -3.69,  -1.42,  -2.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -1.12,  -3.72>, < -2.17,  -1.42,  -3.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11,  -1.72,  -3.87>, < -2.17,  -1.42,  -3.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.33,   1.85,  -5.66>, < -1.17,   1.66,  -5.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.48,  -5.58>, < -1.17,   1.66,  -5.62>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.33,   1.85,  -5.66>, < -2.78,   0.81,  -6.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -2.78,   0.81,  -6.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.35,   1.85,  -3.53>, < -5.90,   1.66,  -4.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.48,  -5.58>, < -5.90,   1.66,  -4.56>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -4.40,  -1.72,  -5.48>, < -3.81,  -0.98,  -6.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -3.81,  -0.98,  -6.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -2.08,  -0.98,  -7.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.72,  -7.41>, < -2.08,  -0.98,  -7.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -4.22,   0.81,  -7.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,   1.85,  -7.56>, < -4.22,   0.81,  -7.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -2.68,   0.81,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,   1.85,  -9.11>, < -2.68,   0.81,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -0.23,  -7.45>, < -3.78,  -0.98,  -8.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.33,  -1.72,  -9.45>, < -3.78,  -0.98,  -8.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.16,  -9.31>, < -7.51,   1.50,  -9.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.57,   1.85,  -9.11>, < -7.51,   1.50,  -9.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.16,  -9.31>, < -6.00,   1.50, -10.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,   1.85, -11.25>, < -6.00,   1.50, -10.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.16,  -9.31>, < -6.45,   0.02,  -9.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -1.12,  -9.31>, < -6.45,   0.02,  -9.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -1.12,  -9.31>, < -7.04,  -1.42, -10.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.63,  -1.72, -11.07>, < -7.04,  -1.42, -10.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -1.12,  -9.31>, < -5.39,  -1.42,  -9.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.33,  -1.72,  -9.45>, < -5.39,  -1.42,  -9.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -1.12,  -9.31>, < -6.92,  -1.42,  -8.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.38,  -1.72,  -7.41>, < -6.92,  -1.42,  -8.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,   1.85, -11.25>, < -4.39,   1.66, -11.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.48, -11.17>, < -4.39,   1.66, -11.21>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,   1.85, -11.25>, < -6.00,   0.81, -12.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23, -13.03>, < -6.00,   0.81, -12.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,   1.85,  -7.56>, < -5.83,   1.50,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.16,  -9.31>, < -5.83,   1.50,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,   1.85,  -7.56>, < -5.83,   1.66,  -6.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,   1.48,  -5.58>, < -5.83,   1.66,  -6.57>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -7.63,  -1.72, -11.07>, < -7.04,  -0.98, -12.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23, -13.03>, < -7.04,  -0.98, -12.05>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23, -13.03>, < -7.45,   0.81, -13.09>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -8.44,   1.85, -13.15>, < -7.45,   0.81, -13.09>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -0.23, -13.03>, < -5.30,  -0.98, -13.01>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.16,  -1.72, -12.99>, < -5.30,  -0.98, -13.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,   1.16,  -3.72>, <  2.16,   1.50,  -3.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.10,   1.85,  -3.53>, <  2.16,   1.50,  -3.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,   1.16,  -3.72>, <  3.22,   0.02,  -3.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -1.12,  -3.72>, <  3.22,   0.02,  -3.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,   1.16,  -3.72>, <  3.67,   1.50,  -4.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.12,   1.85,  -5.66>, <  3.67,   1.50,  -4.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -1.12,  -3.72>, <  2.76,  -1.42,  -2.77>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.29,  -1.72,  -1.82>, <  2.76,  -1.42,  -2.77>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -1.12,  -3.72>, <  2.63,  -1.42,  -4.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.04,  -1.72,  -5.48>, <  2.63,  -1.42,  -4.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.12,   1.85,  -5.66>, <  3.67,   0.81,  -6.55>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -0.23,  -7.45>, <  3.67,   0.81,  -6.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.10,   1.85,  -3.53>, <  0.55,   1.66,  -4.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.48,  -5.58>, <  0.55,   1.66,  -4.56>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  2.04,  -1.72,  -5.48>, <  2.63,  -0.98,  -6.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -0.23,  -7.45>, <  2.63,  -0.98,  -6.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.48,  -5.58>, <  0.62,   1.66,  -6.57>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   1.85,  -7.56>, <  0.62,   1.66,  -6.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -0.23,  -7.45>, <  2.23,   0.81,  -7.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   1.85,  -7.56>, <  2.23,   0.81,  -7.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -0.23,  -7.45>, <  2.67,  -0.98,  -8.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -1.72,  -9.45>, <  2.67,  -0.98,  -8.45>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -0.23,  -7.45>, <  3.77,   0.81,  -8.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  4.32,   1.85,  -9.11>, <  3.77,   0.81,  -8.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.16,  -9.31>, <  0.62,   1.50,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,   1.85,  -7.56>, <  0.62,   1.50,  -8.44>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.16,  -9.31>, < -0.00,   0.02,  -9.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.12,  -9.31>, < -0.00,   0.02,  -9.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.16,  -9.31>, < -1.06,   1.50,  -9.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,   1.85,  -9.11>, < -1.06,   1.50,  -9.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   1.16,  -9.31>, <  0.45,   1.50, -10.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.85, -11.25>, <  0.45,   1.50, -10.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.12,  -9.31>, < -0.47,  -1.42,  -8.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.72,  -7.41>, < -0.47,  -1.42,  -8.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.12,  -9.31>, < -0.59,  -1.42, -10.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -1.72, -11.07>, < -0.59,  -1.42, -10.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.12,  -9.31>, <  1.06,  -1.42,  -9.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -1.72,  -9.45>, <  1.06,  -1.42,  -9.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.85, -11.25>, <  0.45,   0.81, -12.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23, -13.03>, <  0.45,   0.81, -12.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,   1.85, -11.25>, <  2.06,   1.66, -11.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,   1.48, -11.17>, <  2.06,   1.66, -11.21>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,   1.85,  -9.11>, < -2.68,   1.66, -10.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.48, -11.17>, < -2.68,   1.66, -10.14>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -1.72, -11.07>, < -0.59,  -0.98, -12.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23, -13.03>, < -0.59,  -0.98, -12.05>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23, -13.03>, < -1.00,   0.81, -13.09>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,   1.85, -13.15>, < -1.00,   0.81, -13.09>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -0.23, -13.03>, <  1.14,  -0.98, -13.01>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.29,  -1.72, -12.99>, <  1.14,  -0.98, -13.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,   1.85, -13.15>, < -2.61,   1.66, -12.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,   1.48, -11.17>, < -2.61,   1.66, -12.16>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  4.32,   1.85,  -9.11>, <  3.77,   1.66, -10.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,   1.48, -11.17>, <  3.77,   1.66, -10.14>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
// no constraints
