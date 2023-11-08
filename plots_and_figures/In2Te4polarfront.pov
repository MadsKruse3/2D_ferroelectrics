#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -40.15*x up 49.16*y
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

cylinder {< -6.41, -23.41, -34.20>, < 19.12, -23.38, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.38, -34.20>, <  6.41,  23.41, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.38,   0.00>, <  6.41,  23.41,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.41,   0.00>, < 19.12, -23.38,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.41, -34.20>, <-19.12,  23.38, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.38, -34.20>, <  6.41,  23.41, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.38,   0.00>, <  6.41,  23.41,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.41,   0.00>, <-19.12,  23.38,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.41, -34.20>, < -6.41, -23.41,   0.00>, Rcell pigment {Black}}
cylinder {< 19.12, -23.38, -34.20>, < 19.12, -23.38,   0.00>, Rcell pigment {Black}}
cylinder {<  6.41,  23.41, -34.20>, <  6.41,  23.41,   0.00>, Rcell pigment {Black}}
cylinder {<-19.12,  23.38, -34.20>, <-19.12,  23.38,   0.00>, Rcell pigment {Black}}
atom(< -4.67, -21.73, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -4.66, -19.93, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -4.69, -17.94, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -2.52, -21.51, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(< -4.63, -13.71, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -0.42, -21.73, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -2.60, -18.58, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(< -0.40, -19.92, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -0.43, -17.93, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(<  1.74, -21.50, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(< -2.54, -13.93, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #10
atom(< -4.72, -10.78, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(< -2.52, -12.12, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -2.55, -10.13, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -4.66, -15.08, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #14
atom(< -0.38, -13.70, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(<  3.84, -21.72, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #16
atom(<  1.65, -18.57, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(<  3.85, -19.92, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(<  3.82, -17.92, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(<  5.99, -21.49, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #20
atom(<  1.72, -13.92, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #21
atom(< -0.46, -10.78, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #22
atom(<  1.74, -12.12, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(<  1.71, -10.13, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(< -0.41, -15.07, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #25
atom(<  3.87, -13.70, -18.18>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #26
atom(<  5.91, -18.57, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #27
atom(<  5.97, -13.92, -14.31>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #28
atom(<  3.79, -10.77, -17.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  5.99, -12.11, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(<  5.96, -10.12, -15.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #31
atom(<  3.85, -15.07, -15.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
cylinder {< -4.66, -19.93, -19.54>, < -3.59, -20.72, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.51, -18.18>, < -3.59, -20.72, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.69, -17.94, -15.54>, < -3.64, -18.26, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.58, -17.48>, < -3.64, -18.26, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.69, -17.94, -15.54>, < -4.68, -16.51, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -15.08, -15.64>, < -4.68, -16.51, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.51, -18.18>, < -1.46, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40, -19.92, -19.54>, < -1.46, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -21.51, -18.18>, < -2.56, -20.04, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.58, -17.48>, < -2.56, -20.04, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.71, -18.18>, < -4.65, -14.39, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -15.08, -15.64>, < -4.65, -14.39, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.71, -18.18>, < -4.68, -12.24, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72, -10.78, -17.48>, < -4.68, -12.24, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63, -13.71, -18.18>, < -3.58, -12.92, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -12.12, -19.54>, < -3.58, -12.92, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.60, -18.58, -17.48>, < -1.52, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.93, -15.54>, < -1.52, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40, -19.92, -19.54>, <  0.67, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.50, -18.18>, <  0.67, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.93, -15.54>, <  0.61, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.57, -17.48>, <  0.61, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -17.93, -15.54>, < -0.42, -16.50, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -15.07, -15.64>, < -0.42, -16.50, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.50, -18.18>, <  2.80, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -19.92, -19.54>, <  2.80, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -21.50, -18.18>, <  1.70, -20.04, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.57, -17.48>, <  1.70, -20.04, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -13.93, -14.31>, < -3.60, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -15.08, -15.64>, < -3.60, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -13.93, -14.31>, < -1.47, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -15.07, -15.64>, < -1.47, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72, -10.78, -17.48>, < -3.63, -10.46, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -10.13, -15.54>, < -3.63, -10.46, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52, -12.12, -19.54>, < -1.45, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.70, -18.18>, < -1.45, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -10.13, -15.54>, < -1.51, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.78, -17.48>, < -1.51, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.70, -18.18>, < -0.39, -14.39, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -15.07, -15.64>, < -0.39, -14.39, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.70, -18.18>, < -0.42, -12.24, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.78, -17.48>, < -0.42, -12.24, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38, -13.70, -18.18>, <  0.68, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -12.12, -19.54>, <  0.68, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65, -18.57, -17.48>, <  2.74, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.92, -15.54>, <  2.74, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -19.92, -19.54>, <  4.92, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -21.49, -18.18>, <  4.92, -20.71, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.92, -15.54>, <  4.87, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.91, -18.57, -17.48>, <  4.87, -18.25, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82, -17.92, -15.54>, <  3.83, -16.49, -15.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -15.07, -15.64>, <  3.83, -16.49, -15.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -21.49, -18.18>, <  5.95, -20.03, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.91, -18.57, -17.48>, <  5.95, -20.03, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -13.92, -14.31>, <  0.65, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -15.07, -15.64>, <  0.65, -14.50, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -13.92, -14.31>, <  2.78, -14.49, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -15.07, -15.64>, <  2.78, -14.49, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46, -10.78, -17.48>, <  0.62, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -10.13, -15.54>, <  0.62, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74, -12.12, -19.54>, <  2.81, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.70, -18.18>, <  2.81, -12.91, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -10.13, -15.54>, <  2.75, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.77, -17.48>, <  2.75, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.70, -18.18>, <  3.83, -12.23, -17.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.77, -17.48>, <  3.83, -12.23, -17.83>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.70, -18.18>, <  4.93, -12.90, -18.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.99, -12.11, -19.54>, <  4.93, -12.90, -18.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -13.70, -18.18>, <  3.86, -14.38, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -15.07, -15.64>, <  3.86, -14.38, -16.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.97, -13.92, -14.31>, <  4.91, -14.49, -14.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -15.07, -15.64>, <  4.91, -14.49, -14.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79, -10.77, -17.48>, <  4.88, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -10.12, -15.54>, <  4.88, -10.45, -16.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
