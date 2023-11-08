#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.24*x up 35.78*y
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

cylinder {<-12.59, -17.04,  -0.00>, < 15.35, -17.04,  -0.13>, Rcell pigment {Black}}
cylinder {<-15.35, -17.04, -33.83>, < 12.59, -17.04, -33.96>, Rcell pigment {Black}}
cylinder {<-15.35,  17.04, -33.83>, < 12.59,  17.04, -33.96>, Rcell pigment {Black}}
cylinder {<-12.59,  17.04,   0.00>, < 15.35,  17.04,  -0.13>, Rcell pigment {Black}}
cylinder {<-12.59, -17.04,  -0.00>, <-15.35, -17.04, -33.83>, Rcell pigment {Black}}
cylinder {< 15.35, -17.04,  -0.13>, < 12.59, -17.04, -33.96>, Rcell pigment {Black}}
cylinder {< 15.35,  17.04,  -0.13>, < 12.59,  17.04, -33.96>, Rcell pigment {Black}}
cylinder {<-12.59,  17.04,   0.00>, <-15.35,  17.04, -33.83>, Rcell pigment {Black}}
cylinder {<-12.59, -17.04,  -0.00>, <-12.59,  17.04,   0.00>, Rcell pigment {Black}}
cylinder {< 15.35, -17.04,  -0.13>, < 15.35,  17.04,  -0.13>, Rcell pigment {Black}}
cylinder {< 12.59, -17.04, -33.96>, < 12.59,  17.04, -33.96>, Rcell pigment {Black}}
cylinder {<-15.35, -17.04, -33.83>, <-15.35,  17.04, -33.83>, Rcell pigment {Black}}
atom(<-10.48,  -2.08,  -2.87>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(<-10.34,   1.35,  -2.36>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #1
atom(<-10.83,   2.01,  -0.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(< -8.73,  -2.01,  -3.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<-10.58,  -0.57,  -1.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -8.48,   0.57,  -4.69>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -8.43,   1.49,  -1.72>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-10.99,  -1.49,  -4.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(<-10.94,  -2.08,  -8.51>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(<-10.80,   1.35,  -8.00>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(<-11.29,   2.01,  -6.16>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(< -9.19,  -2.01,  -8.99>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-11.04,  -0.57,  -7.50>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -8.94,   0.57, -10.33>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< -8.89,   1.49,  -7.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(<-11.45,  -1.49, -10.16>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(<-11.75,   2.01, -11.80>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -5.82,  -2.08,  -2.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< -5.68,   1.35,  -2.38>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #18
atom(< -8.24,  -1.35,  -5.19>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< -6.17,   2.01,  -0.55>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(< -4.07,  -2.01,  -3.38>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< -5.92,  -0.57,  -1.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -3.82,   0.57,  -4.71>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -3.77,   1.49,  -1.74>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -6.33,  -1.49,  -4.55>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -8.38,   2.08,  -5.70>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(< -6.28,  -2.08,  -8.53>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(< -6.14,   1.35,  -8.02>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #28
atom(< -8.70,  -1.35, -10.83>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #29
atom(< -6.63,   2.01,  -6.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #30
atom(< -4.53,  -2.01,  -9.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -6.38,  -0.57,  -7.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(< -4.28,   0.57, -10.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -4.23,   1.49,  -7.38>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(< -6.79,  -1.49, -10.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(< -8.84,   2.08, -11.34>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #36
atom(< -7.09,   2.01, -11.82>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #37
atom(< -1.16,  -2.08,  -2.91>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(< -1.03,   1.35,  -2.40>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #39
atom(< -3.58,  -1.35,  -5.21>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #40
atom(< -1.52,   2.01,  -0.57>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(<  0.58,  -2.01,  -3.40>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #42
atom(< -1.27,  -0.57,  -1.90>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #43
atom(<  0.83,   0.57,  -4.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #44
atom(<  0.88,   1.49,  -1.76>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(< -1.67,  -1.49,  -4.57>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(< -3.72,   2.08,  -5.72>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #47
atom(< -1.62,  -2.08,  -8.55>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #48
atom(< -1.49,   1.35,  -8.04>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #49
atom(< -4.04,  -1.35, -10.85>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #50
atom(< -1.98,   2.01,  -6.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #51
atom(<  0.12,  -2.01,  -9.04>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #52
atom(< -1.73,  -0.57,  -7.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #53
atom(<  0.37,   0.57, -10.37>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(<  0.42,   1.49,  -7.40>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(< -2.13,  -1.49, -10.20>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -4.18,   2.08, -11.36>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #57
atom(< -2.44,   2.01, -11.84>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(<  0.94,   2.08,  -5.74>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #59
atom(<  0.61,  -1.35, -10.87>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #60
atom(<  0.48,   2.08, -11.38>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
cylinder {<-10.48,  -2.08,  -2.87>, <-10.53,  -1.32,  -2.37>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.58,  -0.57,  -1.86>, <-10.53,  -1.32,  -2.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.48,  -2.08,  -2.87>, < -9.60,  -2.05,  -3.11>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.73,  -2.01,  -3.36>, < -9.60,  -2.05,  -3.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.48,  -2.08,  -2.87>, <-10.73,  -1.79,  -3.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.99,  -1.49,  -4.52>, <-10.73,  -1.79,  -3.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34,   1.35,  -2.36>, <-10.58,   1.68,  -1.44>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.83,   2.01,  -0.53>, <-10.58,   1.68,  -1.44>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34,   1.35,  -2.36>, <-10.46,   0.39,  -2.11>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.58,  -0.57,  -1.86>, <-10.46,   0.39,  -2.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.34,   1.35,  -2.36>, < -9.38,   1.42,  -2.04>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.43,   1.49,  -1.72>, < -9.38,   1.42,  -2.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.73,  -2.01,  -3.36>, < -8.49,  -1.68,  -4.27>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24,  -1.35,  -5.19>, < -8.49,  -1.68,  -4.27>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.48,   0.57,  -4.69>, < -8.36,  -0.39,  -4.94>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24,  -1.35,  -5.19>, < -8.36,  -0.39,  -4.94>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.48,   0.57,  -4.69>, < -8.43,   1.32,  -5.20>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.38,   2.08,  -5.70>, < -8.43,   1.32,  -5.20>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -2.08,  -8.51>, <-10.99,  -1.32,  -8.00>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.04,  -0.57,  -7.50>, <-10.99,  -1.32,  -8.00>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -2.08,  -8.51>, <-10.06,  -2.05,  -8.75>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.19,  -2.01,  -8.99>, <-10.06,  -2.05,  -8.75>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.94,  -2.08,  -8.51>, <-11.19,  -1.79,  -9.34>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.45,  -1.49, -10.16>, <-11.19,  -1.79,  -9.34>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,   1.35,  -8.00>, <-11.04,   1.68,  -7.08>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.29,   2.01,  -6.16>, <-11.04,   1.68,  -7.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,   1.35,  -8.00>, < -9.84,   1.42,  -7.68>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.89,   1.49,  -7.35>, < -9.84,   1.42,  -7.68>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.80,   1.35,  -8.00>, <-10.92,   0.39,  -7.75>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.04,  -0.57,  -7.50>, <-10.92,   0.39,  -7.75>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.19,  -2.01,  -8.99>, < -8.95,  -1.68,  -9.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -1.35, -10.83>, < -8.95,  -1.68,  -9.91>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.94,   0.57, -10.33>, < -8.82,  -0.39, -10.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -1.35, -10.83>, < -8.82,  -0.39, -10.58>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.94,   0.57, -10.33>, < -8.89,   1.32, -10.83>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   2.08, -11.34>, < -8.89,   1.32, -10.83>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.89,   1.49,  -7.35>, < -8.63,   1.79,  -6.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.38,   2.08,  -5.70>, < -8.63,   1.79,  -6.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.82,  -2.08,  -2.89>, < -5.87,  -1.32,  -2.39>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,  -0.57,  -1.88>, < -5.87,  -1.32,  -2.39>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.82,  -2.08,  -2.89>, < -6.08,  -1.79,  -3.72>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.33,  -1.49,  -4.55>, < -6.08,  -1.79,  -3.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.82,  -2.08,  -2.89>, < -4.95,  -2.05,  -3.13>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.07,  -2.01,  -3.38>, < -4.95,  -2.05,  -3.13>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,   1.35,  -2.38>, < -5.93,   1.68,  -1.46>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.17,   2.01,  -0.55>, < -5.93,   1.68,  -1.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,   1.35,  -2.38>, < -5.80,   0.39,  -2.13>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,  -0.57,  -1.88>, < -5.80,   0.39,  -2.13>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,   1.35,  -2.38>, < -4.73,   1.42,  -2.06>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.77,   1.49,  -1.74>, < -4.73,   1.42,  -2.06>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.24,  -1.35,  -5.19>, < -7.29,  -1.42,  -4.87>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.33,  -1.49,  -4.55>, < -7.29,  -1.42,  -4.87>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.07,  -2.01,  -3.38>, < -3.83,  -1.68,  -4.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -1.35,  -5.21>, < -3.83,  -1.68,  -4.29>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.82,   0.57,  -4.71>, < -3.77,   1.32,  -5.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.72,   2.08,  -5.72>, < -3.77,   1.32,  -5.22>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.82,   0.57,  -4.71>, < -3.70,  -0.39,  -4.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -1.35,  -5.21>, < -3.70,  -0.39,  -4.96>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.38,   2.08,  -5.70>, < -7.50,   2.05,  -5.94>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.63,   2.01,  -6.18>, < -7.50,   2.05,  -5.94>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -2.08,  -8.53>, < -6.33,  -1.32,  -8.03>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.38,  -0.57,  -7.52>, < -6.33,  -1.32,  -8.03>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -2.08,  -8.53>, < -6.54,  -1.79,  -9.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -1.49, -10.18>, < -6.54,  -1.79,  -9.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.28,  -2.08,  -8.53>, < -5.41,  -2.05,  -8.77>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.53,  -2.01,  -9.01>, < -5.41,  -2.05,  -8.77>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,   1.35,  -8.02>, < -6.39,   1.68,  -7.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.63,   2.01,  -6.18>, < -6.39,   1.68,  -7.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,   1.35,  -8.02>, < -6.26,   0.39,  -7.77>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.38,  -0.57,  -7.52>, < -6.26,   0.39,  -7.77>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.14,   1.35,  -8.02>, < -5.19,   1.42,  -7.70>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.23,   1.49,  -7.38>, < -5.19,   1.42,  -7.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.70,  -1.35, -10.83>, < -7.75,  -1.42, -10.51>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -1.49, -10.18>, < -7.75,  -1.42, -10.51>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.53,  -2.01,  -9.01>, < -4.29,  -1.68,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.35, -10.85>, < -4.29,  -1.68,  -9.93>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,   0.57, -10.35>, < -4.16,  -0.39, -10.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.35, -10.85>, < -4.16,  -0.39, -10.60>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,   0.57, -10.35>, < -4.23,   1.32, -10.86>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.18,   2.08, -11.36>, < -4.23,   1.32, -10.86>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.23,   1.49,  -7.38>, < -3.98,   1.79,  -6.55>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.72,   2.08,  -5.72>, < -3.98,   1.79,  -6.55>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   2.08, -11.34>, < -7.96,   2.05, -11.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.09,   2.01, -11.82>, < -7.96,   2.05, -11.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -2.08,  -2.91>, < -0.29,  -2.05,  -3.15>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.58,  -2.01,  -3.40>, < -0.29,  -2.05,  -3.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -2.08,  -2.91>, < -1.21,  -1.32,  -2.41>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -0.57,  -1.90>, < -1.21,  -1.32,  -2.41>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -2.08,  -2.91>, < -1.42,  -1.79,  -3.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.67,  -1.49,  -4.57>, < -1.42,  -1.79,  -3.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03,   1.35,  -2.40>, < -0.07,   1.42,  -2.08>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.88,   1.49,  -1.76>, < -0.07,   1.42,  -2.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03,   1.35,  -2.40>, < -1.15,   0.39,  -2.15>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -0.57,  -1.90>, < -1.15,   0.39,  -2.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.03,   1.35,  -2.40>, < -1.27,   1.68,  -1.49>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.52,   2.01,  -0.57>, < -1.27,   1.68,  -1.49>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.58,  -1.35,  -5.21>, < -2.63,  -1.42,  -4.89>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.67,  -1.49,  -4.57>, < -2.63,  -1.42,  -4.89>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.83,   0.57,  -4.73>, <  0.88,   1.32,  -5.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94,   2.08,  -5.74>, <  0.88,   1.32,  -5.24>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.72,   2.08,  -5.72>, < -2.85,   2.05,  -5.96>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,   2.01,  -6.21>, < -2.85,   2.05,  -5.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -2.08,  -8.55>, < -1.67,  -1.32,  -8.05>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.57,  -7.54>, < -1.67,  -1.32,  -8.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -2.08,  -8.55>, < -0.75,  -2.05,  -8.79>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.12,  -2.01,  -9.04>, < -0.75,  -2.05,  -8.79>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.62,  -2.08,  -8.55>, < -1.88,  -1.79,  -9.38>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -1.49, -10.20>, < -1.88,  -1.79,  -9.38>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,   1.35,  -8.04>, < -1.73,   1.68,  -7.12>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,   2.01,  -6.21>, < -1.73,   1.68,  -7.12>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,   1.35,  -8.04>, < -0.53,   1.42,  -7.72>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.42,   1.49,  -7.40>, < -0.53,   1.42,  -7.72>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,   1.35,  -8.04>, < -1.61,   0.39,  -7.79>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.73,  -0.57,  -7.54>, < -1.61,   0.39,  -7.79>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.04,  -1.35, -10.85>, < -3.09,  -1.42, -10.53>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -1.49, -10.20>, < -3.09,  -1.42, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.12,  -2.01,  -9.04>, <  0.37,  -1.68,  -9.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -1.35, -10.87>, <  0.37,  -1.68,  -9.95>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,   0.57, -10.37>, <  0.49,  -0.39, -10.62>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -1.35, -10.87>, <  0.49,  -0.39, -10.62>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,   0.57, -10.37>, <  0.42,   1.32, -10.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.48,   2.08, -11.38>, <  0.42,   1.32, -10.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.42,   1.49,  -7.40>, <  0.68,   1.79,  -6.57>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94,   2.08,  -5.74>, <  0.68,   1.79,  -6.57>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.18,   2.08, -11.36>, < -3.31,   2.05, -11.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.44,   2.01, -11.84>, < -3.31,   2.05, -11.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
