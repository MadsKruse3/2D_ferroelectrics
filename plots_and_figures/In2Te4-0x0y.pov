#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -40.15*x up 49.35*y
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

cylinder {< -6.41, -23.32, -34.20>, < 19.12, -23.29, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.47, -34.20>, <  6.41,  23.50, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.47,   0.00>, <  6.41,  23.50,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.32,   0.00>, < 19.12, -23.29,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.32, -34.20>, <-19.12,  23.47, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.29, -34.20>, <  6.41,  23.50, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.29,   0.00>, <  6.41,  23.50,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.32,   0.00>, <-19.12,  23.47,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.32, -34.20>, < -6.41, -23.32,   0.00>, Rcell pigment {Black}}
cylinder {< 19.12, -23.29, -34.20>, < 19.12, -23.29,   0.00>, Rcell pigment {Black}}
cylinder {<  6.41,  23.50, -34.20>, <  6.41,  23.50,   0.00>, Rcell pigment {Black}}
cylinder {<-19.12,  23.47, -34.20>, <-19.12,  23.47,   0.00>, Rcell pigment {Black}}
atom(< -4.67, -21.65, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -4.66, -19.84, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -4.69, -17.85, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -2.52, -21.42, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(< -4.63, -13.62, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -0.42, -21.64, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -2.60, -18.49, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(< -0.40, -19.84, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -0.43, -17.84, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -2.55, -22.79, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(<  1.74, -21.41, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -2.54, -13.84, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(< -4.72, -10.69, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -2.52, -12.04, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -2.55, -10.04, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -4.66, -14.99, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(< -0.38, -13.62, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -4.65,  -6.04, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(< -4.64,  -4.24, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -4.67,  -2.25, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(< -2.50,  -5.82, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #20
atom(<  3.84, -21.63, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #21
atom(<  1.65, -18.49, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #22
atom(<  3.85, -19.83, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(<  3.82, -17.84, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(<  1.71, -22.78, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #25
atom(<  5.99, -21.41, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #26
atom(<  1.72, -13.84, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #27
atom(< -0.46, -10.69, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #28
atom(<  1.74, -12.03, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  1.71, -10.04, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(< -0.41, -14.98, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #31
atom(<  3.87, -13.61, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
atom(< -0.40,  -6.04, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #33
atom(< -2.58,  -2.89, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #34
atom(< -0.38,  -4.23, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(< -0.41,  -2.24, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(< -2.53,  -7.19, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #37
atom(<  1.76,  -5.81, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #38
atom(<  5.91, -18.48, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #39
atom(<  5.96, -22.78, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(<  5.97, -13.83, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(<  3.79, -10.68, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(<  5.99, -12.03, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(<  5.96, -10.03, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(<  3.85, -14.98, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(<  3.86,  -6.03, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #46
atom(<  1.67,  -2.89, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(<  3.87,  -4.23, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #48
atom(<  3.84,  -2.24, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(<  1.73,  -7.18, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #50
atom(<  6.01,  -5.81, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #51
atom(<  5.93,  -2.88, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(<  5.98,  -7.17, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
cylinder {< -4.67, -21.65, -14.31>, < -3.61, -22.22, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -22.79, -15.64>, < -3.61, -22.22, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -19.84, -19.54>, < -3.59, -20.63, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.42, -18.18>, < -3.59, -20.63, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.69, -17.85, -15.54>, < -4.68, -16.42, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -14.99, -15.64>, < -4.68, -16.42, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.69, -17.85, -15.54>, < -3.64, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.49, -17.48>, < -3.64, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.42, -18.18>, < -2.56, -19.96, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.49, -17.48>, < -2.56, -19.96, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.42, -18.18>, < -2.53, -22.10, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -22.79, -15.64>, < -2.53, -22.10, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.42, -18.18>, < -1.46, -20.63, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40, -19.84, -19.54>, < -1.46, -20.63, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.62, -18.18>, < -4.65, -14.30, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -14.99, -15.64>, < -4.65, -14.30, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.62, -18.18>, < -4.68, -12.16, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72, -10.69, -17.48>, < -4.68, -12.16, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.62, -18.18>, < -3.58, -12.83, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -12.04, -19.54>, < -3.58, -12.83, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -21.64, -14.31>, < -1.48, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -22.79, -15.64>, < -1.48, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -21.64, -14.31>, <  0.64, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -22.78, -15.64>, <  0.64, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.49, -17.48>, < -1.52, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.84, -15.54>, < -1.52, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40, -19.84, -19.54>, <  0.67, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.41, -18.18>, <  0.67, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.84, -15.54>, < -0.42, -16.41, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -14.98, -15.64>, < -0.42, -16.41, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.84, -15.54>, <  0.61, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.49, -17.48>, <  0.61, -18.17, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.41, -18.18>, <  1.70, -19.95, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.49, -17.48>, <  1.70, -19.95, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.41, -18.18>, <  1.72, -22.10, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -22.78, -15.64>, <  1.72, -22.10, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.41, -18.18>, <  2.80, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -19.83, -19.54>, <  2.80, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -13.84, -14.31>, < -3.60, -14.42, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -14.99, -15.64>, < -3.60, -14.42, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -13.84, -14.31>, < -1.47, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -14.98, -15.64>, < -1.47, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72, -10.69, -17.48>, < -3.63, -10.37, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -10.04, -15.54>, < -3.63, -10.37, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -12.04, -19.54>, < -1.45, -12.83, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.62, -18.18>, < -1.45, -12.83, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -10.04, -15.54>, < -2.54,  -8.62, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -7.19, -15.64>, < -2.54,  -8.62, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -10.04, -15.54>, < -1.51, -10.37, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.69, -17.48>, < -1.51, -10.37, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.62, -18.18>, < -0.39, -14.30, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -14.98, -15.64>, < -0.39, -14.30, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.62, -18.18>, < -0.42, -12.15, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.69, -17.48>, < -0.42, -12.15, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.62, -18.18>, <  0.68, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -12.03, -19.54>, <  0.68, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -6.04, -14.31>, < -3.59,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -7.19, -15.64>, < -3.59,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -4.24, -19.54>, < -3.57,  -5.03, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -5.82, -18.18>, < -3.57,  -5.03, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,  -2.25, -15.54>, < -3.62,  -2.57, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -2.89, -17.48>, < -3.62,  -2.57, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -5.82, -18.18>, < -2.51,  -6.50, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -7.19, -15.64>, < -2.51,  -6.50, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -5.82, -18.18>, < -2.54,  -4.35, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -2.89, -17.48>, < -2.54,  -4.35, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -5.82, -18.18>, < -1.44,  -5.03, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -4.23, -19.54>, < -1.44,  -5.03, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -21.63, -14.31>, <  2.77, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -22.78, -15.64>, <  2.77, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -21.63, -14.31>, <  4.90, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -22.78, -15.64>, <  4.90, -22.21, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.49, -17.48>, <  2.74, -18.16, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.84, -15.54>, <  2.74, -18.16, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -19.83, -19.54>, <  4.92, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -21.41, -18.18>, <  4.92, -20.62, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.84, -15.54>, <  3.83, -16.41, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -14.98, -15.64>, <  3.83, -16.41, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.84, -15.54>, <  4.87, -18.16, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.91, -18.48, -17.48>, <  4.87, -18.16, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -21.41, -18.18>, <  5.95, -19.95, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.91, -18.48, -17.48>, <  5.95, -19.95, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -21.41, -18.18>, <  5.98, -22.09, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -22.78, -15.64>, <  5.98, -22.09, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -13.84, -14.31>, <  0.65, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -14.98, -15.64>, <  0.65, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -13.84, -14.31>, <  2.78, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -14.98, -15.64>, <  2.78, -14.41, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.69, -17.48>, <  0.62, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -10.04, -15.54>, <  0.62, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -12.03, -19.54>, <  2.81, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.61, -18.18>, <  2.81, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -10.04, -15.54>, <  1.72,  -8.61, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -7.18, -15.64>, <  1.72,  -8.61, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -10.04, -15.54>, <  2.75, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.68, -17.48>, <  2.75, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.61, -18.18>, <  3.86, -14.29, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -14.98, -15.64>, <  3.86, -14.29, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.61, -18.18>, <  3.83, -12.15, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.68, -17.48>, <  3.83, -12.15, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.61, -18.18>, <  4.93, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -12.03, -19.54>, <  4.93, -12.82, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -6.04, -14.31>, < -1.46,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -7.19, -15.64>, < -1.46,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -6.04, -14.31>, <  0.66,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -7.18, -15.64>, <  0.66,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -2.89, -17.48>, < -1.50,  -2.57, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -2.24, -15.54>, < -1.50,  -2.57, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -4.23, -19.54>, <  0.69,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -5.81, -18.18>, <  0.69,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -2.24, -15.54>, <  0.63,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -2.89, -17.48>, <  0.63,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -5.81, -18.18>, <  1.72,  -4.35, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -2.89, -17.48>, <  1.72,  -4.35, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -5.81, -18.18>, <  1.74,  -6.50, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -7.18, -15.64>, <  1.74,  -6.50, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -5.81, -18.18>, <  2.82,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -4.23, -19.54>, <  2.82,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97, -13.83, -14.31>, <  4.91, -14.40, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -14.98, -15.64>, <  4.91, -14.40, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.68, -17.48>, <  4.88, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -10.03, -15.54>, <  4.88, -10.36, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -10.03, -15.54>, <  5.97,  -8.60, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -7.17, -15.64>, <  5.97,  -8.60, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,  -6.03, -14.31>, <  2.79,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -7.18, -15.64>, <  2.79,  -6.61, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,  -6.03, -14.31>, <  4.92,  -6.60, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -7.17, -15.64>, <  4.92,  -6.60, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -2.89, -17.48>, <  2.76,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -2.24, -15.54>, <  2.76,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -4.23, -19.54>, <  4.94,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -5.81, -18.18>, <  4.94,  -5.02, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -2.24, -15.54>, <  4.89,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -2.88, -17.48>, <  4.89,  -2.56, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -5.81, -18.18>, <  6.00,  -6.49, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -7.17, -15.64>, <  6.00,  -6.49, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -5.81, -18.18>, <  5.97,  -4.34, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -2.88, -17.48>, <  5.97,  -4.34, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
