#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -63.76*x up 37.59*y
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

cylinder {<-10.12, -17.16, -33.56>, < 30.36, -17.16, -33.56>, Rcell pigment {Black}}
cylinder {<-30.36,  17.90, -33.56>, < 10.12,  17.90, -33.56>, Rcell pigment {Black}}
cylinder {<-30.36,  17.90,   0.00>, < 10.12,  17.90,   0.00>, Rcell pigment {Black}}
cylinder {<-10.12, -17.16,   0.00>, < 30.36, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {<-10.12, -17.16, -33.56>, <-30.36,  17.90, -33.56>, Rcell pigment {Black}}
cylinder {< 30.36, -17.16, -33.56>, < 10.12,  17.90, -33.56>, Rcell pigment {Black}}
cylinder {< 30.36, -17.16,   0.00>, < 10.12,  17.90,   0.00>, Rcell pigment {Black}}
cylinder {<-10.12, -17.16,   0.00>, <-30.36,  17.90,   0.00>, Rcell pigment {Black}}
cylinder {<-10.12, -17.16, -33.56>, <-10.12, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {< 30.36, -17.16, -33.56>, < 30.36, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {< 10.12,  17.90, -33.56>, < 10.12,  17.90,   0.00>, Rcell pigment {Black}}
cylinder {<-30.36,  17.90, -33.56>, <-30.36,  17.90,   0.00>, Rcell pigment {Black}}
atom(< -3.37, -17.16, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #0
atom(< -7.67, -13.32, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -5.47, -13.51, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -5.91, -17.17, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -8.86, -14.96, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -6.75, -15.21, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -6.75, -15.21, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(<-10.12, -13.26, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -6.75, -11.32, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< -8.84,  -7.67, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -9.29, -11.33, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<-10.12,  -9.37, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #11
atom(<-10.12,  -9.37, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(<-10.12,  -5.47, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #13
atom(< -0.93, -13.32, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(< -4.64, -15.36, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(< -4.55, -11.12, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(<  1.28, -13.51, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<  0.83, -17.17, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -2.11, -14.95, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -0.00, -15.21, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(< -0.00, -15.21, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #21
atom(< -3.37, -13.26, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -0.00, -11.32, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #23
atom(< -4.30,  -7.47, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -8.01,  -9.51, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(< -7.93,  -5.28, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -2.10,  -7.67, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -2.54, -11.33, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -5.49,  -9.11, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(< -3.37,  -9.37, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -3.37,  -9.37, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(< -6.75,  -7.42, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -3.37,  -5.47, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #33
atom(< -7.67,  -1.63, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -5.47,  -1.82, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -5.91,  -5.48, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -8.86,  -3.27, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -6.75,  -3.53, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(< -6.75,  -3.53, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<-10.12,  -1.58, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #40
atom(< -6.75,   0.37, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(< -8.84,   4.02, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -9.29,   0.36, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(<-10.12,   2.32, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #44
atom(<-10.12,   2.32, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #45
atom(<  2.11, -15.36, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #46
atom(<  2.19, -11.12, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #47
atom(< -1.27,  -9.51, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #48
atom(< -1.18,  -5.28, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #49
atom(<  1.26,  -9.11, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #50
atom(<  0.00,  -7.42, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #51
atom(< -0.93,  -1.63, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #52
atom(< -4.64,  -3.67, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #53
atom(< -4.55,   0.57, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #54
atom(<  1.28,  -1.82, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #55
atom(<  0.83,  -5.48, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #56
atom(< -2.11,  -3.27, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #57
atom(< -0.00,  -3.53, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #58
atom(<  0.00,  -3.53, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #59
atom(< -3.37,  -1.58, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #60
atom(< -0.00,   0.37, -16.67>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #61
atom(< -4.30,   4.21, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #62
atom(< -8.01,   2.17, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #63
atom(< -2.10,   4.02, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #64
atom(< -2.54,   0.36, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #65
atom(< -5.49,   2.57, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #66
atom(< -3.37,   2.32, -15.68>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #67
atom(< -3.37,   2.32, -17.97>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #68
atom(< -6.75,   4.27, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #69
atom(<  2.11,  -3.67, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #70
atom(<  2.20,   0.57, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #71
atom(< -1.27,   2.17, -18.67>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #72
atom(<  1.26,   2.57, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #73
atom(<  0.00,   4.27, -17.35>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #74
cylinder {< -3.37, -17.16, -16.67>, < -4.64, -17.16, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91, -17.17, -15.08>, < -4.64, -17.16, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37, -17.16, -16.67>, < -4.01, -16.26, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64, -15.36, -18.67>, < -4.01, -16.26, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37, -17.16, -16.67>, < -2.74, -16.06, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.11, -14.95, -15.08>, < -2.74, -16.06, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67, -13.32, -18.67>, < -8.90, -13.29, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12, -13.26, -17.35>, < -8.90, -13.29, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.67, -13.32, -18.67>, < -7.21, -14.26, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -17.97>, < -7.21, -14.26, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67, -13.32, -18.67>, < -7.21, -12.32, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -7.21, -12.32, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.47, -13.51, -15.08>, < -6.11, -14.36, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -15.68>, < -6.11, -14.36, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.47, -13.51, -15.08>, < -6.11, -12.41, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -6.11, -12.41, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91, -17.17, -15.08>, < -6.33, -16.19, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -15.68>, < -6.33, -16.19, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.86, -14.96, -15.08>, < -7.80, -15.08, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -15.68>, < -7.80, -15.08, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -15.68>, < -6.75, -15.21, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -17.97>, < -6.75, -15.21, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -15.21, -17.97>, < -5.69, -15.28, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.64, -15.36, -18.67>, < -5.69, -15.28, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -8.02, -11.32, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29, -11.33, -15.08>, < -8.02, -11.32, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -5.65, -11.22, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.55, -11.12, -18.67>, < -5.65, -11.22, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -7.38, -10.41, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -9.51, -18.67>, < -7.38, -10.41, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75, -11.32, -16.67>, < -6.12, -10.21, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,  -9.11, -15.08>, < -6.12, -10.21, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,  -7.67, -15.08>, < -9.48,  -8.52, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -9.37, -15.68>, < -9.48,  -8.52, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,  -7.67, -15.08>, < -9.48,  -6.57, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -5.47, -16.67>, < -9.48,  -6.57, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29, -11.33, -15.08>, < -9.70, -10.35, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -9.37, -15.68>, < -9.70, -10.35, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -9.37, -15.68>, <-10.12,  -9.37, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -9.37, -17.97>, <-10.12,  -9.37, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -9.37, -17.97>, < -9.07,  -9.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -9.51, -18.67>, < -9.07,  -9.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -5.47, -16.67>, < -9.02,  -5.37, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -5.28, -18.67>, < -9.02,  -5.37, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -5.47, -16.67>, < -9.49,  -4.37, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.86,  -3.27, -15.08>, < -9.49,  -4.37, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93, -13.32, -18.67>, < -0.46, -12.32, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, < -0.46, -12.32, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.93, -13.32, -18.67>, < -0.46, -14.26, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -17.97>, < -0.46, -14.26, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93, -13.32, -18.67>, < -2.15, -13.29, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37, -13.26, -17.35>, < -2.15, -13.29, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.64, -15.36, -18.67>, < -4.01, -14.31, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37, -13.26, -17.35>, < -4.01, -14.31, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55, -11.12, -18.67>, < -3.96, -12.19, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37, -13.26, -17.35>, < -3.96, -12.19, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55, -11.12, -18.67>, < -3.96, -10.24, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -17.97>, < -3.96, -10.24, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -13.51, -15.08>, <  0.64, -12.41, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, <  0.64, -12.41, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -13.51, -15.08>, <  0.64, -14.36, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -15.68>, <  0.64, -14.36, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.83, -17.17, -15.08>, <  0.42, -16.19, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -15.68>, <  0.42, -16.19, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.11, -14.95, -15.08>, < -1.06, -15.08, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -15.68>, < -1.06, -15.08, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -15.68>, < -0.00, -15.21, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -17.97>, < -0.00, -15.21, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -15.21, -17.97>, <  1.05, -15.28, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11, -15.36, -18.67>, <  1.05, -15.28, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, < -1.27, -11.32, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -11.33, -15.08>, < -1.27, -11.32, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, <  1.10, -11.22, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.19, -11.12, -18.67>, <  1.10, -11.22, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, < -0.63, -10.41, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -9.51, -18.67>, < -0.63, -10.41, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.32, -16.67>, <  0.63, -10.21, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.26,  -9.11, -15.08>, <  0.63, -10.21, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -7.47, -18.67>, < -5.52,  -7.45, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -7.42, -17.35>, < -5.52,  -7.45, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -7.47, -18.67>, < -3.84,  -8.42, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -17.97>, < -3.84,  -8.42, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,  -7.47, -18.67>, < -3.84,  -6.47, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -3.84,  -6.47, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,  -9.51, -18.67>, < -7.38,  -8.47, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -7.42, -17.35>, < -7.38,  -8.47, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -5.28, -18.67>, < -7.34,  -6.35, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -7.42, -17.35>, < -7.34,  -6.35, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -5.28, -18.67>, < -7.34,  -4.40, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -17.97>, < -7.34,  -4.40, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -7.67, -15.08>, < -2.74,  -8.52, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -15.68>, < -2.74,  -8.52, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,  -7.67, -15.08>, < -2.74,  -6.57, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -2.74,  -6.57, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -11.33, -15.08>, < -2.96, -10.35, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -15.68>, < -2.96, -10.35, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,  -9.11, -15.08>, < -4.43,  -9.24, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -15.68>, < -4.43,  -9.24, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -15.68>, < -3.37,  -9.37, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -17.97>, < -3.37,  -9.37, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -9.37, -17.97>, < -2.32,  -9.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -9.51, -18.67>, < -2.32,  -9.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -4.64,  -5.48, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,  -5.48, -15.08>, < -4.64,  -5.48, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -4.01,  -4.57, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -3.67, -18.67>, < -4.01,  -4.57, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -2.28,  -5.37, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -5.28, -18.67>, < -2.28,  -5.37, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -5.47, -16.67>, < -2.74,  -4.37, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,  -3.27, -15.08>, < -2.74,  -4.37, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.63, -18.67>, < -8.90,  -1.60, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,  -1.58, -17.35>, < -8.90,  -1.60, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.63, -18.67>, < -7.21,  -2.58, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -17.97>, < -7.21,  -2.58, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.67,  -1.63, -18.67>, < -7.21,  -0.63, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -7.21,  -0.63, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,  -1.82, -15.08>, < -6.11,  -2.67, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -15.68>, < -6.11,  -2.67, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.47,  -1.82, -15.08>, < -6.11,  -0.73, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -6.11,  -0.73, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.91,  -5.48, -15.08>, < -6.33,  -4.50, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -15.68>, < -6.33,  -4.50, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.86,  -3.27, -15.08>, < -7.80,  -3.40, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -15.68>, < -7.80,  -3.40, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -15.68>, < -6.75,  -3.53, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -17.97>, < -6.75,  -3.53, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,  -3.53, -17.97>, < -5.69,  -3.60, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -3.67, -18.67>, < -5.69,  -3.60, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -8.02,   0.36, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   0.36, -15.08>, < -8.02,   0.36, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -7.38,   1.27, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,   2.17, -18.67>, < -7.38,   1.27, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -6.12,   1.47, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   2.57, -15.08>, < -6.12,   1.47, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   0.37, -16.67>, < -5.65,   0.47, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,   0.57, -18.67>, < -5.65,   0.47, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.84,   4.02, -15.08>, < -9.48,   3.17, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   2.32, -15.68>, < -9.48,   3.17, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.29,   0.36, -15.08>, < -9.70,   1.34, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   2.32, -15.68>, < -9.70,   1.34, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   2.32, -15.68>, <-10.12,   2.32, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   2.32, -17.97>, <-10.12,   2.32, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.12,   2.32, -17.97>, < -9.07,   2.25, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,   2.17, -18.67>, < -9.07,   2.25, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,  -9.51, -18.67>, < -0.63,  -8.47, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.42, -17.35>, < -0.63,  -8.47, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -5.28, -18.67>, < -0.59,  -6.35, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.42, -17.35>, < -0.59,  -6.35, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -5.28, -18.67>, < -0.59,  -4.40, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.53, -17.97>, < -0.59,  -4.40, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.63, -18.67>, < -0.46,  -2.58, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.53, -17.97>, < -0.46,  -2.58, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.63, -18.67>, < -2.15,  -1.60, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.58, -17.35>, < -2.15,  -1.60, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -1.63, -18.67>, < -0.46,  -0.63, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, < -0.46,  -0.63, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -3.67, -18.67>, < -4.01,  -2.62, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.58, -17.35>, < -4.01,  -2.62, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,   0.57, -18.67>, < -3.96,  -0.51, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,  -1.58, -17.35>, < -3.96,  -0.51, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.55,   0.57, -18.67>, < -3.96,   1.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -17.97>, < -3.96,   1.44, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.82, -15.08>, <  0.64,  -2.67, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.53, -15.68>, <  0.64,  -2.67, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -1.82, -15.08>, <  0.64,  -0.73, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, <  0.64,  -0.73, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.83,  -5.48, -15.08>, <  0.42,  -4.50, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.53, -15.68>, <  0.42,  -4.50, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.11,  -3.27, -15.08>, < -1.06,  -3.40, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.53, -15.68>, < -1.06,  -3.40, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.53, -15.68>, < -0.00,  -3.53, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.53, -17.97>, < -0.00,  -3.53, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.53, -17.97>, <  1.05,  -3.60, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -3.67, -18.67>, <  1.05,  -3.60, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, < -1.27,   0.36, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   0.36, -15.08>, < -1.27,   0.36, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, <  1.10,   0.47, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.20,   0.57, -18.67>, <  1.10,   0.47, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, < -0.63,   1.27, -17.67>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,   2.17, -18.67>, < -0.63,   1.27, -17.67>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,   0.37, -16.67>, <  0.63,   1.47, -15.87>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.26,   2.57, -15.08>, <  0.63,   1.47, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,   4.21, -18.67>, < -5.52,   4.24, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   4.27, -17.35>, < -5.52,   4.24, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.30,   4.21, -18.67>, < -3.84,   3.27, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -17.97>, < -3.84,   3.27, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.01,   2.17, -18.67>, < -7.38,   3.22, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.75,   4.27, -17.35>, < -7.38,   3.22, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.10,   4.02, -15.08>, < -2.74,   3.17, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -15.68>, < -2.74,   3.17, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   0.36, -15.08>, < -2.96,   1.34, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -15.68>, < -2.96,   1.34, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,   2.57, -15.08>, < -4.43,   2.45, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -15.68>, < -4.43,   2.45, -15.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -15.68>, < -3.37,   2.32, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -17.97>, < -3.37,   2.32, -16.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.37,   2.32, -17.97>, < -2.32,   2.25, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,   2.17, -18.67>, < -2.32,   2.25, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.27,   2.17, -18.67>, < -0.63,   3.22, -18.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,   4.27, -17.35>, < -0.63,   3.22, -18.01>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
