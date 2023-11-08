#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -31.66*x up 35.64*y
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

cylinder {<-12.83, -16.97, -33.86>, < 15.08, -16.78, -33.86>, Rcell pigment {Black}}
cylinder {<-15.08,  16.78, -33.86>, < 12.83,  16.97, -33.86>, Rcell pigment {Black}}
cylinder {<-15.08,  16.78,   0.00>, < 12.83,  16.97,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -16.97,   0.00>, < 15.08, -16.78,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -16.97, -33.86>, <-15.08,  16.78, -33.86>, Rcell pigment {Black}}
cylinder {< 15.08, -16.78, -33.86>, < 12.83,  16.97, -33.86>, Rcell pigment {Black}}
cylinder {< 15.08, -16.78,   0.00>, < 12.83,  16.97,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -16.97,   0.00>, <-15.08,  16.78,   0.00>, Rcell pigment {Black}}
cylinder {<-12.83, -16.97, -33.86>, <-12.83, -16.97,   0.00>, Rcell pigment {Black}}
cylinder {< 15.08, -16.78, -33.86>, < 15.08, -16.78,   0.00>, Rcell pigment {Black}}
cylinder {< 12.83,  16.97, -33.86>, < 12.83,  16.97,   0.00>, Rcell pigment {Black}}
cylinder {<-15.08,  16.78, -33.86>, <-15.08,  16.78,   0.00>, Rcell pigment {Black}}
atom(<-10.67, -14.09, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(<-10.50, -14.74, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #1
atom(< -8.63, -12.29, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<-10.77, -15.12, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(< -8.93, -13.55, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -8.75, -15.24, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(<-11.26, -12.45, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<-11.05,  -8.46, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(<-10.88,  -9.11, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -9.00,  -6.67, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(<-11.14,  -9.49, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(< -9.31,  -7.92, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-11.44, -10.75, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -9.12,  -9.62, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(<-11.64,  -6.82, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(<-11.25,  -3.49, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #15
atom(<-11.52,  -3.87, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-11.82,  -5.12, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< -9.50,  -3.99, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(< -6.02, -14.06, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(< -8.36, -11.91, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #20
atom(< -5.85, -14.71, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< -3.98, -12.26, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -6.11, -15.09, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -4.28, -13.51, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -4.10, -15.21, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -6.61, -12.41, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< -8.54, -11.26, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(< -6.40,  -8.43, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #28
atom(< -8.74,  -6.29, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< -6.23,  -9.08, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -4.35,  -6.63, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(< -6.49,  -9.46, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(< -4.66,  -7.89, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -6.79, -10.72, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(< -4.47,  -9.59, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(< -6.99,  -6.79, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #36
atom(< -8.91,  -5.63, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #37
atom(< -6.60,  -3.46, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(< -6.86,  -3.84, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #39
atom(< -7.17,  -5.09, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #40
atom(< -4.85,  -3.96, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(< -1.37, -14.02, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #42
atom(< -3.71, -11.88, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #43
atom(< -1.20, -14.68, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #44
atom(<  0.67, -12.23, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(< -1.46, -15.06, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(<  0.37, -13.48, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #47
atom(<  0.55, -15.18, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #48
atom(< -1.96, -12.38, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #49
atom(< -3.88, -11.23, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #50
atom(< -1.75,  -8.40, -18.92>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #51
atom(< -4.09,  -6.25, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #52
atom(< -1.58,  -9.05, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #53
atom(<  0.30,  -6.60, -16.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(< -1.84,  -9.43, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(< -0.00,  -7.86, -18.85>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -2.14, -10.68, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #57
atom(<  0.18,  -9.55, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(< -2.34,  -6.76, -18.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #59
atom(< -4.26,  -5.60, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #60
atom(< -1.95,  -3.43, -15.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
atom(< -2.21,  -3.81, -17.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #62
atom(< -2.52,  -5.06, -15.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #63
atom(< -0.20,  -3.93, -15.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #64
atom(<  0.94, -11.85, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #65
atom(<  0.77, -11.20, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #66
atom(<  0.56,  -6.22, -18.22>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #67
atom(<  0.39,  -5.57, -14.95>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #68
cylinder {<-10.67, -14.09, -18.92>, <-10.72, -14.60, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.77, -15.12, -17.42>, <-10.72, -14.60, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.67, -14.09, -18.92>, < -9.80, -13.82, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93, -13.55, -18.85>, < -9.80, -13.82, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.67, -14.09, -18.92>, <-10.97, -13.27, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.26, -12.45, -18.36>, <-10.97, -13.27, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.50, -14.74, -15.65>, < -9.63, -14.99, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.75, -15.24, -15.51>, < -9.63, -14.99, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.50, -14.74, -15.65>, <-10.63, -14.93, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-10.77, -15.12, -17.42>, <-10.63, -14.93, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.63, -12.29, -16.44>, < -8.58, -11.78, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.54, -11.26, -14.95>, < -8.58, -11.78, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.63, -12.29, -16.44>, < -8.50, -12.10, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36, -11.91, -18.22>, < -8.50, -12.10, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.93, -13.55, -18.85>, < -8.65, -12.73, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36, -11.91, -18.22>, < -8.65, -12.73, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -8.46, -18.92>, <-11.09,  -8.98, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.14,  -9.49, -17.42>, <-11.09,  -8.98, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -8.46, -18.92>, <-10.18,  -8.19, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.31,  -7.92, -18.85>, <-10.18,  -8.19, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.05,  -8.46, -18.92>, <-11.34,  -7.64, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.64,  -6.82, -18.36>, <-11.34,  -7.64, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,  -9.11, -15.65>, <-11.16,  -9.93, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.44, -10.75, -15.01>, <-11.16,  -9.93, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,  -9.11, -15.65>, <-11.01,  -9.30, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.14,  -9.49, -17.42>, <-11.01,  -9.30, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-10.88,  -9.11, -15.65>, <-10.00,  -9.37, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.12,  -9.62, -15.51>, <-10.00,  -9.37, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.00,  -6.67, -16.44>, < -8.87,  -6.48, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -6.29, -18.22>, < -8.87,  -6.48, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.00,  -6.67, -16.44>, < -8.96,  -6.15, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,  -5.63, -14.95>, < -8.96,  -6.15, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.31,  -7.92, -18.85>, < -9.02,  -7.10, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -6.29, -18.22>, < -9.02,  -7.10, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.12,  -9.62, -15.51>, < -8.83, -10.44, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.54, -11.26, -14.95>, < -8.83, -10.44, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,  -3.49, -15.65>, <-10.38,  -3.74, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -9.50,  -3.99, -15.51>, <-10.38,  -3.74, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,  -3.49, -15.65>, <-11.54,  -4.31, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.82,  -5.12, -15.01>, <-11.54,  -4.31, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.25,  -3.49, -15.65>, <-11.38,  -3.68, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<-11.52,  -3.87, -17.42>, <-11.38,  -3.68, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.50,  -3.99, -15.51>, < -9.20,  -4.81, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,  -5.63, -14.95>, < -9.20,  -4.81, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.02, -14.06, -18.92>, < -6.07, -14.57, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.11, -15.09, -17.42>, < -6.07, -14.57, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.02, -14.06, -18.92>, < -6.32, -13.24, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.61, -12.41, -18.36>, < -6.32, -13.24, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.02, -14.06, -18.92>, < -5.15, -13.78, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28, -13.51, -18.85>, < -5.15, -13.78, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.36, -11.91, -18.22>, < -7.49, -12.16, -18.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.61, -12.41, -18.36>, < -7.49, -12.16, -18.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.85, -14.71, -15.65>, < -5.98, -14.90, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.11, -15.09, -17.42>, < -5.98, -14.90, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -5.85, -14.71, -15.65>, < -4.97, -14.96, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.10, -15.21, -15.51>, < -4.97, -14.96, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.98, -12.26, -16.44>, < -3.84, -12.07, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71, -11.88, -18.22>, < -3.84, -12.07, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.98, -12.26, -16.44>, < -3.93, -11.74, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.88, -11.23, -14.95>, < -3.93, -11.74, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.28, -13.51, -18.85>, < -4.00, -12.70, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71, -11.88, -18.22>, < -4.00, -12.70, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.54, -11.26, -14.95>, < -7.66, -10.99, -14.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79, -10.72, -15.01>, < -7.66, -10.99, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -8.43, -18.92>, < -6.44,  -8.95, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.49,  -9.46, -17.42>, < -6.44,  -8.95, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -8.43, -18.92>, < -6.69,  -7.61, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.99,  -6.79, -18.36>, < -6.69,  -7.61, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.40,  -8.43, -18.92>, < -5.53,  -8.16, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.89, -18.85>, < -5.53,  -8.16, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -8.74,  -6.29, -18.22>, < -7.86,  -6.54, -18.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.99,  -6.79, -18.36>, < -7.86,  -6.54, -18.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,  -9.08, -15.65>, < -6.51,  -9.90, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.79, -10.72, -15.01>, < -6.51,  -9.90, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,  -9.08, -15.65>, < -6.36,  -9.27, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.49,  -9.46, -17.42>, < -6.36,  -9.27, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.23,  -9.08, -15.65>, < -5.35,  -9.33, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.47,  -9.59, -15.51>, < -5.35,  -9.33, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -6.63, -16.44>, < -4.22,  -6.44, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -6.25, -18.22>, < -4.22,  -6.44, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.35,  -6.63, -16.44>, < -4.31,  -6.12, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,  -5.60, -14.95>, < -4.31,  -6.12, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.89, -18.85>, < -4.37,  -7.07, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -6.25, -18.22>, < -4.37,  -7.07, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.47,  -9.59, -15.51>, < -4.18, -10.41, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.88, -11.23, -14.95>, < -4.18, -10.41, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -8.91,  -5.63, -14.95>, < -8.04,  -5.36, -14.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.17,  -5.09, -15.01>, < -8.04,  -5.36, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,  -3.46, -15.65>, < -6.73,  -3.65, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -6.86,  -3.84, -17.42>, < -6.73,  -3.65, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,  -3.46, -15.65>, < -6.88,  -4.27, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -7.17,  -5.09, -15.01>, < -6.88,  -4.27, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -6.60,  -3.46, -15.65>, < -5.72,  -3.71, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.85,  -3.96, -15.51>, < -5.72,  -3.71, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.85,  -3.96, -15.51>, < -4.55,  -4.78, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,  -5.60, -14.95>, < -4.55,  -4.78, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.37, -14.02, -18.92>, < -1.67, -13.20, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.96, -12.38, -18.36>, < -1.67, -13.20, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.37, -14.02, -18.92>, < -1.42, -14.54, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.06, -17.42>, < -1.42, -14.54, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.37, -14.02, -18.92>, < -0.50, -13.75, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.37, -13.48, -18.85>, < -0.50, -13.75, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -3.71, -11.88, -18.22>, < -2.84, -12.13, -18.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.96, -12.38, -18.36>, < -2.84, -12.13, -18.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.20, -14.68, -15.65>, < -1.33, -14.87, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.06, -17.42>, < -1.33, -14.87, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.20, -14.68, -15.65>, < -0.32, -14.93, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.55, -15.18, -15.51>, < -0.32, -14.93, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.67, -12.23, -16.44>, <  0.81, -12.04, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94, -11.85, -18.22>, <  0.81, -12.04, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.67, -12.23, -16.44>, <  0.72, -11.71, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.77, -11.20, -14.95>, <  0.72, -11.71, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.37, -13.48, -18.85>, <  0.65, -12.66, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.94, -11.85, -18.22>, <  0.65, -12.66, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -3.88, -11.23, -14.95>, < -3.01, -10.96, -14.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.14, -10.68, -15.01>, < -3.01, -10.96, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -8.40, -18.92>, < -1.79,  -8.91, -18.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.84,  -9.43, -17.42>, < -1.79,  -8.91, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -8.40, -18.92>, < -0.88,  -8.13, -18.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.86, -18.85>, < -0.88,  -8.13, -18.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.75,  -8.40, -18.92>, < -2.04,  -7.58, -18.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -6.76, -18.36>, < -2.04,  -7.58, -18.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -4.09,  -6.25, -18.22>, < -3.21,  -6.51, -18.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -6.76, -18.36>, < -3.21,  -6.51, -18.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -9.05, -15.65>, < -1.86,  -9.87, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.14, -10.68, -15.01>, < -1.86,  -9.87, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -9.05, -15.65>, < -1.71,  -9.24, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.84,  -9.43, -17.42>, < -1.71,  -9.24, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.58,  -9.05, -15.65>, < -0.70,  -9.30, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,  -9.55, -15.51>, < -0.70,  -9.30, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.30,  -6.60, -16.44>, <  0.43,  -6.41, -17.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.56,  -6.22, -18.22>, <  0.43,  -6.41, -17.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.30,  -6.60, -16.44>, <  0.35,  -6.09, -15.69>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.39,  -5.57, -14.95>, <  0.35,  -6.09, -15.69>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.86, -18.85>, <  0.28,  -7.04, -18.53>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.56,  -6.22, -18.22>, <  0.28,  -7.04, -18.53>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.18,  -9.55, -15.51>, <  0.47, -10.37, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.77, -11.20, -14.95>, <  0.47, -10.37, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -4.26,  -5.60, -14.95>, < -3.39,  -5.33, -14.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -5.06, -15.01>, < -3.39,  -5.33, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,  -3.43, -15.65>, < -2.08,  -3.62, -16.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.21,  -3.81, -17.42>, < -2.08,  -3.62, -16.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,  -3.43, -15.65>, < -1.07,  -3.68, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.20,  -3.93, -15.51>, < -1.07,  -3.68, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.95,  -3.43, -15.65>, < -2.23,  -4.24, -15.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -5.06, -15.01>, < -2.23,  -4.24, -15.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.20,  -3.93, -15.51>, <  0.10,  -4.75, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.39,  -5.57, -14.95>, <  0.10,  -4.75, -15.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
