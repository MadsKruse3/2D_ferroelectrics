#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.91*x up 49.16*y
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

cylinder {< 17.10, -23.41, -25.53>, < 17.10, -23.38,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.38, -38.23>, < 17.10,  23.41, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10,  23.38, -38.23>, <-17.10,  23.41, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.41, -25.53>, <-17.10, -23.38,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10, -23.41, -25.53>, < 17.10,  23.38, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.38,  -0.00>, < 17.10,  23.41, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.38,   0.00>, <-17.10,  23.41, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.41, -25.53>, <-17.10,  23.38, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.41, -25.53>, <-17.10, -23.41, -25.53>, Rcell pigment {Black}}
cylinder {< 17.10, -23.38,  -0.00>, <-17.10, -23.38,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.41, -12.70>, <-17.10,  23.41, -12.70>, Rcell pigment {Black}}
cylinder {< 17.10,  23.38, -38.23>, <-17.10,  23.38, -38.23>, Rcell pigment {Black}}
atom(< -2.79, -21.73, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(<  2.44, -19.93, -23.77>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -1.56, -17.94, -23.80>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(<  1.08, -21.51, -21.63>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(<  1.08, -13.71, -23.75>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -2.79, -21.73, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(<  0.38, -18.58, -21.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  2.44, -19.92, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -1.56, -17.93, -19.55>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(<  1.08, -21.50, -17.38>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(< -2.79, -13.93, -21.65>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #10
atom(<  0.38, -10.78, -23.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(<  2.44, -12.12, -21.64>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -1.56, -10.13, -21.67>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -1.46, -15.08, -23.78>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #14
atom(<  1.08, -13.70, -19.50>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(< -2.79, -21.72, -15.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #16
atom(<  0.38, -18.57, -17.46>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(<  2.44, -19.92, -15.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -1.56, -17.92, -15.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(<  1.08, -21.49, -13.12>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #20
atom(< -2.79, -13.92, -17.40>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #21
atom(<  0.38, -10.78, -19.58>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #22
atom(<  2.44, -12.12, -17.38>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(< -1.56, -10.13, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(< -1.46, -15.07, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #25
atom(<  1.08, -13.70, -15.24>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #26
atom(<  0.38, -18.57, -13.21>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #27
atom(< -2.79, -13.92, -13.14>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #28
atom(<  0.38, -10.77, -15.33>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  2.44, -12.11, -13.13>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(< -1.56, -10.12, -13.16>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #31
atom(< -1.46, -15.07, -15.27>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
cylinder {<  2.44, -19.93, -23.77>, <  1.76, -20.72, -22.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.51, -21.63>, <  1.76, -20.72, -22.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.94, -23.80>, < -0.59, -18.26, -22.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.58, -21.72>, < -0.59, -18.26, -22.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.94, -23.80>, < -1.51, -16.51, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.08, -23.78>, < -1.51, -16.51, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.51, -21.63>, <  1.76, -20.71, -20.58>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.92, -19.52>, <  1.76, -20.71, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.51, -21.63>, <  0.73, -20.04, -21.68>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.58, -21.72>, <  0.73, -20.04, -21.68>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.71, -23.75>, < -0.19, -14.39, -23.77>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.08, -23.78>, < -0.19, -14.39, -23.77>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.71, -23.75>, <  0.73, -12.24, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.78, -23.84>, <  0.73, -12.24, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.71, -23.75>, <  1.76, -12.92, -22.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.12, -21.64>, <  1.76, -12.92, -22.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.58, -21.72>, < -0.59, -18.25, -20.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.93, -19.55>, < -0.59, -18.25, -20.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.92, -19.52>, <  1.76, -20.71, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.50, -17.38>, <  1.76, -20.71, -18.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.93, -19.55>, < -0.59, -18.25, -18.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.57, -17.46>, < -0.59, -18.25, -18.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.93, -19.55>, < -1.51, -16.50, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -19.53>, < -1.51, -16.50, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.50, -17.38>, <  1.76, -20.71, -16.32>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.92, -15.26>, <  1.76, -20.71, -16.32>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.50, -17.38>, <  0.73, -20.04, -17.42>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.57, -17.46>, <  0.73, -20.04, -17.42>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.93, -21.65>, < -2.12, -14.50, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.08, -23.78>, < -2.12, -14.50, -22.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.93, -21.65>, < -2.12, -14.50, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -19.53>, < -2.12, -14.50, -20.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.78, -23.84>, < -0.59, -10.46, -22.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.13, -21.67>, < -0.59, -10.46, -22.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.12, -21.64>, <  1.76, -12.91, -20.57>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -19.50>, <  1.76, -12.91, -20.57>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.13, -21.67>, < -0.59, -10.45, -20.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.78, -19.58>, < -0.59, -10.45, -20.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -19.50>, < -0.19, -14.39, -19.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -19.53>, < -0.19, -14.39, -19.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -19.50>, <  0.73, -12.24, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.78, -19.58>, <  0.73, -12.24, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -19.50>, <  1.76, -12.91, -18.44>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.12, -17.38>, <  1.76, -12.91, -18.44>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.57, -17.46>, < -0.59, -18.25, -16.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.92, -15.29>, < -0.59, -18.25, -16.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.92, -15.26>, <  1.76, -20.71, -14.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.49, -13.12>, <  1.76, -20.71, -14.19>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.92, -15.29>, < -0.59, -18.25, -14.25>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.57, -13.21>, < -0.59, -18.25, -14.25>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.92, -15.29>, < -1.51, -16.49, -15.28>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -15.27>, < -1.51, -16.49, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.49, -13.12>, <  0.73, -20.03, -13.17>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.57, -13.21>, <  0.73, -20.03, -13.17>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.92, -17.40>, < -2.12, -14.50, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -19.53>, < -2.12, -14.50, -18.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.92, -17.40>, < -2.12, -14.49, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -15.27>, < -2.12, -14.49, -16.34>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.78, -19.58>, < -0.59, -10.45, -18.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.13, -17.41>, < -0.59, -10.45, -18.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.12, -17.38>, <  1.76, -12.91, -16.31>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -15.24>, <  1.76, -12.91, -16.31>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.13, -17.41>, < -0.59, -10.45, -16.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.77, -15.33>, < -0.59, -10.45, -16.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -15.24>, <  0.73, -12.23, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.77, -15.33>, <  0.73, -12.23, -15.28>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -15.24>, <  1.76, -12.90, -14.18>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.11, -13.13>, <  1.76, -12.90, -14.18>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.70, -15.24>, < -0.19, -14.38, -15.26>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -15.27>, < -0.19, -14.38, -15.26>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.92, -13.14>, < -2.12, -14.49, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -15.07, -15.27>, < -2.12, -14.49, -14.21>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.77, -15.33>, < -0.59, -10.45, -14.24>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.12, -13.16>, < -0.59, -10.45, -14.24>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
