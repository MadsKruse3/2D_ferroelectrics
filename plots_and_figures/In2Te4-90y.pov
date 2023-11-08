#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.91*x up 49.35*y
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

cylinder {< 17.10, -23.32, -25.53>, < 17.10, -23.29,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.47, -38.23>, < 17.10,  23.50, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10,  23.47, -38.23>, <-17.10,  23.50, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.32, -25.53>, <-17.10, -23.29,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10, -23.32, -25.53>, < 17.10,  23.47, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.29,  -0.00>, < 17.10,  23.50, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.29,   0.00>, <-17.10,  23.50, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.32, -25.53>, <-17.10,  23.47, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.32, -25.53>, <-17.10, -23.32, -25.53>, Rcell pigment {Black}}
cylinder {< 17.10, -23.29,  -0.00>, <-17.10, -23.29,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.50, -12.70>, <-17.10,  23.50, -12.70>, Rcell pigment {Black}}
cylinder {< 17.10,  23.47, -38.23>, <-17.10,  23.47, -38.23>, Rcell pigment {Black}}
atom(< -2.79, -21.65, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(<  2.44, -19.84, -23.77>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -1.56, -17.85, -23.80>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(<  1.08, -21.42, -21.63>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(<  1.08, -13.62, -23.75>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -2.79, -21.64, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(<  0.38, -18.49, -21.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  2.44, -19.84, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -1.56, -17.84, -19.55>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -1.46, -22.79, -21.66>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(<  1.08, -21.41, -17.38>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -2.79, -13.84, -21.65>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(<  0.38, -10.69, -23.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(<  2.44, -12.04, -21.64>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -1.56, -10.04, -21.67>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -1.46, -14.99, -23.78>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(<  1.08, -13.62, -19.50>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -2.79,  -6.04, -23.77>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(<  2.44,  -4.24, -23.75>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -1.56,  -2.25, -23.78>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(<  1.08,  -5.82, -21.61>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #20
atom(< -2.79, -21.63, -15.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #21
atom(<  0.38, -18.49, -17.46>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #22
atom(<  2.44, -19.83, -15.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(< -1.56, -17.84, -15.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(< -1.46, -22.78, -17.41>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #25
atom(<  1.08, -21.41, -13.12>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #26
atom(< -2.79, -13.84, -17.40>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #27
atom(<  0.38, -10.69, -19.58>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #28
atom(<  2.44, -12.03, -17.38>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(< -1.56, -10.04, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(< -1.46, -14.98, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #31
atom(<  1.08, -13.61, -15.24>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
atom(< -2.79,  -6.04, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #33
atom(<  0.38,  -2.89, -21.70>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #34
atom(<  2.44,  -4.23, -19.50>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(< -1.56,  -2.24, -19.53>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(< -1.46,  -7.19, -21.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #37
atom(<  1.08,  -5.81, -17.36>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #38
atom(<  0.38, -18.48, -13.21>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #39
atom(< -1.46, -22.78, -13.15>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(< -2.79, -13.83, -13.14>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(<  0.38, -10.68, -15.33>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(<  2.44, -12.03, -13.13>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(< -1.56, -10.03, -13.16>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(< -1.46, -14.98, -15.27>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(< -2.79,  -6.03, -15.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #46
atom(<  0.38,  -2.89, -17.44>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(<  2.44,  -4.23, -15.24>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #48
atom(< -1.56,  -2.24, -15.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(< -1.46,  -7.18, -17.39>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #50
atom(<  1.08,  -5.81, -13.10>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #51
atom(<  0.38,  -2.88, -13.19>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(< -1.46,  -7.17, -13.13>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
cylinder {< -2.79, -21.65, -23.79>, < -2.12, -22.22, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.79, -21.66>, < -2.12, -22.22, -22.73>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.84, -23.77>, <  1.76, -20.63, -22.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.42, -21.63>, <  1.76, -20.63, -22.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.85, -23.80>, < -1.51, -16.42, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.99, -23.78>, < -1.51, -16.42, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.85, -23.80>, < -0.59, -18.17, -22.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -21.72>, < -0.59, -18.17, -22.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.42, -21.63>, <  0.73, -19.96, -21.68>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -21.72>, <  0.73, -19.96, -21.68>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.42, -21.63>, < -0.19, -22.10, -21.65>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.79, -21.66>, < -0.19, -22.10, -21.65>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.42, -21.63>, <  1.76, -20.63, -20.58>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.84, -19.52>, <  1.76, -20.63, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -23.75>, < -0.19, -14.30, -23.77>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.99, -23.78>, < -0.19, -14.30, -23.77>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -23.75>, <  0.73, -12.16, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.69, -23.84>, <  0.73, -12.16, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -23.75>, <  1.76, -12.83, -22.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.04, -21.64>, <  1.76, -12.83, -22.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -21.64, -19.54>, < -2.12, -22.21, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.79, -21.66>, < -2.12, -22.21, -20.60>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -21.64, -19.54>, < -2.12, -22.21, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.78, -17.41>, < -2.12, -22.21, -18.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -21.72>, < -0.59, -18.17, -20.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -19.55>, < -0.59, -18.17, -20.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.84, -19.52>, <  1.76, -20.62, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -17.38>, <  1.76, -20.62, -18.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -19.55>, < -1.51, -16.41, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -19.53>, < -1.51, -16.41, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -19.55>, < -0.59, -18.17, -18.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -17.46>, < -0.59, -18.17, -18.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -17.38>, <  0.73, -19.95, -17.42>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -17.46>, <  0.73, -19.95, -17.42>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -17.38>, < -0.19, -22.10, -17.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.78, -17.41>, < -0.19, -22.10, -17.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -17.38>, <  1.76, -20.62, -16.32>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.83, -15.26>, <  1.76, -20.62, -16.32>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.84, -21.65>, < -2.12, -14.42, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.99, -23.78>, < -2.12, -14.42, -22.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.84, -21.65>, < -2.12, -14.41, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -19.53>, < -2.12, -14.41, -20.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.69, -23.84>, < -0.59, -10.37, -22.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -21.67>, < -0.59, -10.37, -22.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.04, -21.64>, <  1.76, -12.83, -20.57>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -19.50>, <  1.76, -12.83, -20.57>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -21.67>, < -1.51,  -8.62, -21.66>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.19, -21.64>, < -1.51,  -8.62, -21.66>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -21.67>, < -0.59, -10.37, -20.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.69, -19.58>, < -0.59, -10.37, -20.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -19.50>, < -0.19, -14.30, -19.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -19.53>, < -0.19, -14.30, -19.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -19.50>, <  0.73, -12.15, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.69, -19.58>, <  0.73, -12.15, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.62, -19.50>, <  1.76, -12.82, -18.44>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.03, -17.38>, <  1.76, -12.82, -18.44>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79,  -6.04, -23.77>, < -2.12,  -6.61, -22.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.19, -21.64>, < -2.12,  -6.61, -22.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -4.24, -23.75>, <  1.76,  -5.03, -22.68>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.82, -21.61>, <  1.76,  -5.03, -22.68>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.25, -23.78>, < -0.59,  -2.57, -22.74>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -21.70>, < -0.59,  -2.57, -22.74>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.82, -21.61>, < -0.19,  -6.50, -21.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.19, -21.64>, < -0.19,  -6.50, -21.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.82, -21.61>, <  0.73,  -4.35, -21.66>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -21.70>, <  0.73,  -4.35, -21.66>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.82, -21.61>, <  1.76,  -5.03, -20.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -4.23, -19.50>, <  1.76,  -5.03, -20.56>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -21.63, -15.28>, < -2.12, -22.21, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.78, -17.41>, < -2.12, -22.21, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -21.63, -15.28>, < -2.12, -22.21, -14.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.78, -13.15>, < -2.12, -22.21, -14.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.49, -17.46>, < -0.59, -18.16, -16.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -15.29>, < -0.59, -18.16, -16.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -19.83, -15.26>, <  1.76, -20.62, -14.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -13.12>, <  1.76, -20.62, -14.19>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -15.29>, < -1.51, -16.41, -15.28>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -15.27>, < -1.51, -16.41, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -17.84, -15.29>, < -0.59, -18.16, -14.25>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.48, -13.21>, < -0.59, -18.16, -14.25>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -13.12>, <  0.73, -19.95, -13.17>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -18.48, -13.21>, <  0.73, -19.95, -13.17>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -21.41, -13.12>, < -0.19, -22.09, -13.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -22.78, -13.15>, < -0.19, -22.09, -13.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.84, -17.40>, < -2.12, -14.41, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -19.53>, < -2.12, -14.41, -18.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.84, -17.40>, < -2.12, -14.41, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -15.27>, < -2.12, -14.41, -16.34>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.69, -19.58>, < -0.59, -10.36, -18.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -17.41>, < -0.59, -10.36, -18.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.03, -17.38>, <  1.76, -12.82, -16.31>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.61, -15.24>, <  1.76, -12.82, -16.31>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -17.41>, < -1.51,  -8.61, -17.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.18, -17.39>, < -1.51,  -8.61, -17.40>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.04, -17.41>, < -0.59, -10.36, -16.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.68, -15.33>, < -0.59, -10.36, -16.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.61, -15.24>, < -0.19, -14.29, -15.26>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -15.27>, < -0.19, -14.29, -15.26>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.61, -15.24>, <  0.73, -12.15, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.68, -15.33>, <  0.73, -12.15, -15.28>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08, -13.61, -15.24>, <  1.76, -12.82, -14.18>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44, -12.03, -13.13>, <  1.76, -12.82, -14.18>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79,  -6.04, -19.52>, < -2.12,  -6.61, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.19, -21.64>, < -2.12,  -6.61, -20.58>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79,  -6.04, -19.52>, < -2.12,  -6.61, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.18, -17.39>, < -2.12,  -6.61, -18.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -21.70>, < -0.59,  -2.57, -20.61>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.24, -19.53>, < -0.59,  -2.57, -20.61>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -4.23, -19.50>, <  1.76,  -5.02, -18.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -17.36>, <  1.76,  -5.02, -18.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.24, -19.53>, < -0.59,  -2.56, -18.49>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -17.44>, < -0.59,  -2.56, -18.49>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -17.36>, <  0.73,  -4.35, -17.40>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -17.44>, <  0.73,  -4.35, -17.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -17.36>, < -0.19,  -6.50, -17.37>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.18, -17.39>, < -0.19,  -6.50, -17.37>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -17.36>, <  1.76,  -5.02, -16.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -4.23, -15.24>, <  1.76,  -5.02, -16.30>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.79, -13.83, -13.14>, < -2.12, -14.40, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46, -14.98, -15.27>, < -2.12, -14.40, -14.21>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38, -10.68, -15.33>, < -0.59, -10.36, -14.24>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.03, -13.16>, < -0.59, -10.36, -14.24>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56, -10.03, -13.16>, < -1.51,  -8.60, -13.15>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.17, -13.13>, < -1.51,  -8.60, -13.15>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79,  -6.03, -15.26>, < -2.12,  -6.61, -16.33>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.18, -17.39>, < -2.12,  -6.61, -16.33>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.79,  -6.03, -15.26>, < -2.12,  -6.60, -14.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.17, -13.13>, < -2.12,  -6.60, -14.20>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.89, -17.44>, < -0.59,  -2.56, -16.36>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.24, -15.27>, < -0.59,  -2.56, -16.36>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.44,  -4.23, -15.24>, <  1.76,  -5.02, -14.17>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -13.10>, <  1.76,  -5.02, -14.17>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.56,  -2.24, -15.27>, < -0.59,  -2.56, -14.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.88, -13.19>, < -0.59,  -2.56, -14.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -13.10>, < -0.19,  -6.49, -13.12>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.46,  -7.17, -13.13>, < -0.19,  -6.49, -13.12>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.08,  -5.81, -13.10>, <  0.73,  -4.34, -13.15>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.38,  -2.88, -13.19>, <  0.73,  -4.34, -13.15>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
