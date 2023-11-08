#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.66*x up 35.56*y
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

cylinder {<-12.83, -16.93,  -0.00>, < 15.08, -16.93,  -0.19>, Rcell pigment {Black}}
cylinder {<-15.08, -16.93, -33.75>, < 12.83, -16.93, -33.94>, Rcell pigment {Black}}
cylinder {<-15.08,  16.93, -33.75>, < 12.83,  16.93, -33.94>, Rcell pigment {Black}}
cylinder {<-12.83,  16.93,   0.00>, < 15.08,  16.93,  -0.19>, Rcell pigment {Black}}
cylinder {<-12.83, -16.93,  -0.00>, <-15.08, -16.93, -33.75>, Rcell pigment {Black}}
cylinder {< 15.08, -16.93,  -0.19>, < 12.83, -16.93, -33.94>, Rcell pigment {Black}}
cylinder {< 15.08,  16.93,  -0.19>, < 12.83,  16.93, -33.94>, Rcell pigment {Black}}
cylinder {<-12.83,  16.93,   0.00>, <-15.08,  16.93, -33.75>, Rcell pigment {Black}}
cylinder {<-12.83, -16.93,  -0.00>, <-12.83,  16.93,   0.00>, Rcell pigment {Black}}
cylinder {< 15.08, -16.93,  -0.19>, < 15.08,  16.93,  -0.19>, Rcell pigment {Black}}
cylinder {< 12.83, -16.93, -33.94>, < 12.83,  16.93, -33.94>, Rcell pigment {Black}}
cylinder {<-15.08, -16.93, -33.75>, <-15.08,  16.93, -33.75>, Rcell pigment {Black}}
atom(<-10.67,  -1.98,  -2.88>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(<-10.50,   1.28,  -2.23>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #1
atom(< -8.63,   0.49,  -4.68>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<-10.77,  -0.49,  -1.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(< -8.93,  -1.92,  -3.43>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -8.75,   1.42,  -1.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(<-11.26,  -1.42,  -4.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-11.05,  -1.98,  -8.51>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(<-10.88,   1.28,  -7.86>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -9.00,   0.49, -10.31>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(<-11.14,  -0.49,  -7.48>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(< -9.31,  -1.92,  -9.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-11.44,   1.92,  -6.22>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -9.12,   1.42,  -7.35>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(<-11.64,  -1.42, -10.15>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(<-11.25,   1.28, -13.48>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #15
atom(<-11.52,  -0.49, -13.10>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-11.82,   1.92, -11.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< -9.50,   1.42, -12.98>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(< -6.02,  -1.98,  -2.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(< -8.36,  -1.28,  -5.06>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #20
atom(< -5.85,   1.28,  -2.26>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< -3.98,   0.49,  -4.71>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -6.11,  -0.49,  -1.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -4.28,  -1.92,  -3.46>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -4.10,   1.42,  -1.76>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -6.61,  -1.42,  -4.56>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< -8.54,   1.98,  -5.71>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(< -6.40,  -1.98,  -8.54>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #28
atom(< -8.74,  -1.28, -10.69>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< -6.23,   1.28,  -7.89>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -4.35,   0.49, -10.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -6.49,  -0.49,  -7.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(< -4.66,  -1.92,  -9.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -6.79,   1.92,  -6.25>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(< -4.47,   1.42,  -7.39>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(< -6.99,  -1.42, -10.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #36
atom(< -8.91,   1.98, -11.34>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #37
atom(< -6.60,   1.28, -13.51>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(< -6.86,  -0.49, -13.13>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #39
atom(< -7.17,   1.92, -11.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #40
atom(< -4.85,   1.42, -13.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(< -1.37,  -1.98,  -2.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #42
atom(< -3.71,  -1.28,  -5.09>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #43
atom(< -1.20,   1.28,  -2.30>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #44
atom(<  0.67,   0.49,  -4.74>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(< -1.46,  -0.49,  -1.92>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(<  0.37,  -1.92,  -3.49>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #47
atom(<  0.55,   1.42,  -1.79>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #48
atom(< -1.96,  -1.42,  -4.59>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #49
atom(< -3.88,   1.98,  -5.74>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #50
atom(< -1.75,  -1.98,  -8.57>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #51
atom(< -4.09,  -1.28, -10.72>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #52
atom(< -1.58,   1.28,  -7.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #53
atom(<  0.30,   0.49, -10.37>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(< -1.84,  -0.49,  -7.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(< -0.00,  -1.92,  -9.12>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -2.14,   1.92,  -6.29>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #57
atom(<  0.18,   1.42,  -7.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(< -2.34,  -1.42, -10.21>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #59
atom(< -4.26,   1.98, -11.37>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #60
atom(< -1.95,   1.28, -13.55>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
atom(< -2.21,  -0.49, -13.17>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #62
atom(< -2.52,   1.92, -11.91>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #63
atom(< -0.20,   1.42, -13.04>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #64
atom(<  0.94,  -1.28,  -5.12>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #65
atom(<  0.77,   1.98,  -5.78>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #66
atom(<  0.56,  -1.28, -10.75>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #67
atom(<  0.39,   1.98, -11.40>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #68
cylinder {<-10.67,  -1.98,  -2.88>, <-10.72,  -1.24,  -2.37>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.77,  -0.49,  -1.85>, <-10.72,  -1.24,  -2.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.67,  -1.98,  -2.88>, < -9.80,  -1.95,  -3.15>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93,  -1.92,  -3.43>, < -9.80,  -1.95,  -3.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.67,  -1.98,  -2.88>, <-10.97,  -1.70,  -3.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.26,  -1.42,  -4.52>, <-10.97,  -1.70,  -3.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.50,   1.28,  -2.23>, < -9.63,   1.35,  -1.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.75,   1.42,  -1.73>, < -9.63,   1.35,  -1.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.50,   1.28,  -2.23>, <-10.63,   0.40,  -2.04>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.77,  -0.49,  -1.85>, <-10.63,   0.40,  -2.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.63,   0.49,  -4.68>, < -8.58,   1.24,  -5.20>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.54,   1.98,  -5.71>, < -8.58,   1.24,  -5.20>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.63,   0.49,  -4.68>, < -8.50,  -0.40,  -4.87>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36,  -1.28,  -5.06>, < -8.50,  -0.40,  -4.87>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93,  -1.92,  -3.43>, < -8.65,  -1.60,  -4.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36,  -1.28,  -5.06>, < -8.65,  -1.60,  -4.24>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -1.98,  -8.51>, <-11.09,  -1.24,  -7.99>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.14,  -0.49,  -7.48>, <-11.09,  -1.24,  -7.99>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -1.98,  -8.51>, <-10.18,  -1.95,  -8.78>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.31,  -1.92,  -9.05>, <-10.18,  -1.95,  -8.78>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -1.98,  -8.51>, <-11.34,  -1.70,  -9.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.64,  -1.42, -10.15>, <-11.34,  -1.70,  -9.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,   1.28,  -7.86>, <-11.16,   1.60,  -7.04>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.44,   1.92,  -6.22>, <-11.16,   1.60,  -7.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,   1.28,  -7.86>, <-11.01,   0.40,  -7.67>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.14,  -0.49,  -7.48>, <-11.01,   0.40,  -7.67>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,   1.28,  -7.86>, <-10.00,   1.35,  -7.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.12,   1.42,  -7.35>, <-10.00,   1.35,  -7.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.00,   0.49, -10.31>, < -8.87,  -0.40, -10.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -1.28, -10.69>, < -8.87,  -0.40, -10.50>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.00,   0.49, -10.31>, < -8.96,   1.24, -10.82>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,   1.98, -11.34>, < -8.96,   1.24, -10.82>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.31,  -1.92,  -9.05>, < -9.02,  -1.60,  -9.87>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -1.28, -10.69>, < -9.02,  -1.60,  -9.87>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.12,   1.42,  -7.35>, < -8.83,   1.70,  -6.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.54,   1.98,  -5.71>, < -8.83,   1.70,  -6.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,   1.28, -13.48>, <-10.38,   1.35, -13.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.50,   1.42, -12.98>, <-10.38,   1.35, -13.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,   1.28, -13.48>, <-11.54,   1.60, -12.66>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.82,   1.92, -11.85>, <-11.54,   1.60, -12.66>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,   1.28, -13.48>, <-11.38,   0.40, -13.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.52,  -0.49, -13.10>, <-11.38,   0.40, -13.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.50,   1.42, -12.98>, < -9.20,   1.70, -12.16>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,   1.98, -11.34>, < -9.20,   1.70, -12.16>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.02,  -1.98,  -2.92>, < -6.07,  -1.24,  -2.40>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -0.49,  -1.88>, < -6.07,  -1.24,  -2.40>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.02,  -1.98,  -2.92>, < -6.32,  -1.70,  -3.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.61,  -1.42,  -4.56>, < -6.32,  -1.70,  -3.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.02,  -1.98,  -2.92>, < -5.15,  -1.95,  -3.19>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -1.92,  -3.46>, < -5.15,  -1.95,  -3.19>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36,  -1.28,  -5.06>, < -7.49,  -1.35,  -4.81>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.61,  -1.42,  -4.56>, < -7.49,  -1.35,  -4.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,   1.28,  -2.26>, < -5.98,   0.40,  -2.07>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.11,  -0.49,  -1.88>, < -5.98,   0.40,  -2.07>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.85,   1.28,  -2.26>, < -4.97,   1.35,  -2.01>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.10,   1.42,  -1.76>, < -4.97,   1.35,  -2.01>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.98,   0.49,  -4.71>, < -3.84,  -0.40,  -4.90>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71,  -1.28,  -5.09>, < -3.84,  -0.40,  -4.90>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.98,   0.49,  -4.71>, < -3.93,   1.24,  -5.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.88,   1.98,  -5.74>, < -3.93,   1.24,  -5.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28,  -1.92,  -3.46>, < -4.00,  -1.60,  -4.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71,  -1.28,  -5.09>, < -4.00,  -1.60,  -4.28>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.54,   1.98,  -5.71>, < -7.66,   1.95,  -5.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.92,  -6.25>, < -7.66,   1.95,  -5.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -1.98,  -8.54>, < -6.44,  -1.24,  -8.02>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.49,  -0.49,  -7.51>, < -6.44,  -1.24,  -8.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -1.98,  -8.54>, < -6.69,  -1.70,  -9.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.99,  -1.42, -10.18>, < -6.69,  -1.70,  -9.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -1.98,  -8.54>, < -5.53,  -1.95,  -8.81>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -1.92,  -9.08>, < -5.53,  -1.95,  -8.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -1.28, -10.69>, < -7.86,  -1.35, -10.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.99,  -1.42, -10.18>, < -7.86,  -1.35, -10.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,   1.28,  -7.89>, < -6.51,   1.60,  -7.07>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.92,  -6.25>, < -6.51,   1.60,  -7.07>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,   1.28,  -7.89>, < -6.36,   0.40,  -7.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.49,  -0.49,  -7.51>, < -6.36,   0.40,  -7.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,   1.28,  -7.89>, < -5.35,   1.35,  -7.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.47,   1.42,  -7.39>, < -5.35,   1.35,  -7.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,   0.49, -10.34>, < -4.22,  -0.40, -10.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -1.28, -10.72>, < -4.22,  -0.40, -10.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,   0.49, -10.34>, < -4.31,   1.24, -10.85>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,   1.98, -11.37>, < -4.31,   1.24, -10.85>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -1.92,  -9.08>, < -4.37,  -1.60,  -9.90>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -1.28, -10.72>, < -4.37,  -1.60,  -9.90>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.47,   1.42,  -7.39>, < -4.18,   1.70,  -6.56>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.88,   1.98,  -5.74>, < -4.18,   1.70,  -6.56>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,   1.98, -11.34>, < -8.04,   1.95, -11.61>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.17,   1.92, -11.88>, < -8.04,   1.95, -11.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,   1.28, -13.51>, < -6.73,   0.40, -13.32>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.86,  -0.49, -13.13>, < -6.73,   0.40, -13.32>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,   1.28, -13.51>, < -6.88,   1.60, -12.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.17,   1.92, -11.88>, < -6.88,   1.60, -12.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,   1.28, -13.51>, < -5.72,   1.35, -13.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.85,   1.42, -13.01>, < -5.72,   1.35, -13.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.85,   1.42, -13.01>, < -4.55,   1.70, -12.19>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,   1.98, -11.37>, < -4.55,   1.70, -12.19>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.37,  -1.98,  -2.95>, < -1.67,  -1.70,  -3.77>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -1.42,  -4.59>, < -1.67,  -1.70,  -3.77>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.37,  -1.98,  -2.95>, < -1.42,  -1.24,  -2.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -0.49,  -1.92>, < -1.42,  -1.24,  -2.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.37,  -1.98,  -2.95>, < -0.50,  -1.95,  -3.22>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -1.92,  -3.49>, < -0.50,  -1.95,  -3.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71,  -1.28,  -5.09>, < -2.84,  -1.35,  -4.84>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.96,  -1.42,  -4.59>, < -2.84,  -1.35,  -4.84>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.28,  -2.30>, < -1.33,   0.40,  -2.11>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -0.49,  -1.92>, < -1.33,   0.40,  -2.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,   1.28,  -2.30>, < -0.32,   1.35,  -2.04>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.55,   1.42,  -1.79>, < -0.32,   1.35,  -2.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.67,   0.49,  -4.74>, <  0.81,  -0.40,  -4.93>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94,  -1.28,  -5.12>, <  0.81,  -0.40,  -4.93>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.67,   0.49,  -4.74>, <  0.72,   1.24,  -5.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.77,   1.98,  -5.78>, <  0.72,   1.24,  -5.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.37,  -1.92,  -3.49>, <  0.65,  -1.60,  -4.31>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94,  -1.28,  -5.12>, <  0.65,  -1.60,  -4.31>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.88,   1.98,  -5.74>, < -3.01,   1.95,  -6.02>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.14,   1.92,  -6.29>, < -3.01,   1.95,  -6.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -1.98,  -8.57>, < -1.79,  -1.24,  -8.06>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.84,  -0.49,  -7.54>, < -1.79,  -1.24,  -8.06>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -1.98,  -8.57>, < -0.88,  -1.95,  -8.84>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.92,  -9.12>, < -0.88,  -1.95,  -8.84>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -1.98,  -8.57>, < -2.04,  -1.70,  -9.39>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -1.42, -10.21>, < -2.04,  -1.70,  -9.39>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -1.28, -10.72>, < -3.21,  -1.35, -10.47>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -1.42, -10.21>, < -3.21,  -1.35, -10.47>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,   1.28,  -7.92>, < -1.86,   1.60,  -7.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.14,   1.92,  -6.29>, < -1.86,   1.60,  -7.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,   1.28,  -7.92>, < -1.71,   0.40,  -7.73>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.84,  -0.49,  -7.54>, < -1.71,   0.40,  -7.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,   1.28,  -7.92>, < -0.70,   1.35,  -7.67>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,   1.42,  -7.42>, < -0.70,   1.35,  -7.67>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.30,   0.49, -10.37>, <  0.43,  -0.40, -10.56>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.56,  -1.28, -10.75>, <  0.43,  -0.40, -10.56>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.30,   0.49, -10.37>, <  0.35,   1.24, -10.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.39,   1.98, -11.40>, <  0.35,   1.24, -10.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -1.92,  -9.12>, <  0.28,  -1.60,  -9.93>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.56,  -1.28, -10.75>, <  0.28,  -1.60,  -9.93>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,   1.42,  -7.42>, <  0.47,   1.70,  -6.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.77,   1.98,  -5.78>, <  0.47,   1.70,  -6.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,   1.98, -11.37>, < -3.39,   1.95, -11.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,   1.92, -11.91>, < -3.39,   1.95, -11.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,   1.28, -13.55>, < -2.08,   0.40, -13.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.21,  -0.49, -13.17>, < -2.08,   0.40, -13.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,   1.28, -13.55>, < -1.07,   1.35, -13.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.20,   1.42, -13.04>, < -1.07,   1.35, -13.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,   1.28, -13.55>, < -2.23,   1.60, -12.73>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,   1.92, -11.91>, < -2.23,   1.60, -12.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.20,   1.42, -13.04>, <  0.10,   1.70, -12.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.39,   1.98, -11.40>, <  0.10,   1.70, -12.22>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
