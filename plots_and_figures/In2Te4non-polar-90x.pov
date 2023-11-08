#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -40.15*x up 35.91*y
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

cylinder {< -6.41, -17.10,  -0.00>, < 19.12, -17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<-19.12, -17.10, -46.79>, <  6.41, -17.10, -46.82>, Rcell pigment {Black}}
cylinder {<-19.12,  17.10, -46.79>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {< -6.41,  17.10,   0.00>, < 19.12,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {< -6.41, -17.10,  -0.00>, <-19.12, -17.10, -46.79>, Rcell pigment {Black}}
cylinder {< 19.12, -17.10,  -0.03>, <  6.41, -17.10, -46.82>, Rcell pigment {Black}}
cylinder {< 19.12,  17.10,  -0.03>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {< -6.41,  17.10,   0.00>, <-19.12,  17.10, -46.79>, Rcell pigment {Black}}
cylinder {< -6.41, -17.10,  -0.00>, < -6.41,  17.10,   0.00>, Rcell pigment {Black}}
cylinder {< 19.12, -17.10,  -0.03>, < 19.12,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<  6.41, -17.10, -46.82>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {<-19.12, -17.10, -46.79>, <-19.12,  17.10, -46.79>, Rcell pigment {Black}}
atom(< -4.68,   3.27,  -0.46>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -6.80,  -0.61,  -5.23>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -4.68,  -2.63,  -2.91>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -4.67,   1.25,  -5.93>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #3
atom(< -6.81,   1.55,  -1.04>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -2.55,  -0.91,  -2.33>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #5
atom(< -6.80,   3.27,  -8.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(< -6.79,  -2.63, -10.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -6.79,   1.25, -13.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -4.67,  -0.91, -10.13>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(< -6.78,  -0.91, -17.93>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -0.43,   3.27,  -0.46>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(< -2.55,  -0.61,  -5.24>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -0.42,  -2.63,  -2.92>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -0.42,   1.25,  -5.94>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -2.56,   1.55,  -1.04>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(<  1.71,  -0.91,  -2.34>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -2.54,   3.27,  -8.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(< -4.66,  -0.61, -13.04>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -2.54,  -2.63, -10.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(< -2.54,   1.25, -13.74>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #20
atom(< -4.67,   1.55,  -8.84>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #21
atom(< -0.41,  -0.91, -10.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #22
atom(< -4.66,   3.27, -16.06>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(< -6.78,  -0.61, -20.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(< -4.66,  -2.63, -18.51>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #25
atom(< -4.65,   1.25, -21.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #26
atom(< -6.79,   1.55, -16.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #27
atom(< -2.53,  -0.91, -17.93>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #28
atom(<  3.83,   3.27,  -0.47>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  1.71,  -0.61,  -5.24>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(<  3.83,  -2.63,  -2.92>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #31
atom(<  3.84,   1.25,  -5.95>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #32
atom(<  1.70,   1.55,  -1.05>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #33
atom(<  5.96,  -0.91,  -2.34>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #34
atom(<  1.71,   3.27,  -8.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(< -0.41,  -0.61, -13.04>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(<  1.72,  -2.63, -10.72>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #37
atom(<  1.72,   1.25, -13.74>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #38
atom(< -0.42,   1.55,  -8.85>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #39
atom(<  3.84,  -0.91, -10.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(< -0.41,   3.27, -16.06>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(< -2.53,  -0.61, -20.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(< -0.40,  -2.63, -18.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(< -0.40,   1.25, -21.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(< -2.54,   1.55, -16.64>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(<  1.73,  -0.91, -17.94>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #46
atom(<  5.96,  -0.61,  -5.25>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(<  5.95,   1.55,  -1.05>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #48
atom(<  5.97,   3.27,  -8.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(<  3.85,  -0.61, -13.05>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #50
atom(<  5.97,  -2.63, -10.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #51
atom(<  5.97,   1.25, -13.75>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(<  3.84,   1.55,  -8.85>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
atom(<  3.85,   3.27, -16.07>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #54
atom(<  1.73,  -0.61, -20.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #55
atom(<  3.85,  -2.63, -18.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #56
atom(<  3.86,   1.25, -21.55>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #57
atom(<  1.72,   1.55, -16.65>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #58
atom(<  5.98,  -0.91, -17.94>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #59
atom(<  5.98,  -0.61, -20.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #60
atom(<  5.97,   1.55, -16.66>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #61
cylinder {< -4.68,   3.27,  -0.46>, < -3.62,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.55,  -1.04>, < -3.62,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -0.61,  -5.23>, < -5.74,   0.32,  -5.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.25,  -5.93>, < -5.74,   0.32,  -5.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -2.63,  -2.91>, < -3.61,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.91,  -2.33>, < -3.61,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.25,  -5.93>, < -3.61,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.61,  -5.24>, < -3.61,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.25,  -5.93>, < -4.67,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.55,  -8.84>, < -4.67,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.81,   1.55,  -1.04>, < -5.75,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   3.27,  -0.46>, < -5.75,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.91,  -2.33>, < -2.55,   0.32,  -1.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.55,  -1.04>, < -2.55,   0.32,  -1.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.91,  -2.33>, < -1.48,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -2.63,  -2.92>, < -1.48,  -1.77,  -2.62>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.91,  -2.33>, < -2.55,  -0.76,  -3.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.61,  -5.24>, < -2.55,  -0.76,  -3.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,   3.27,  -8.26>, < -5.74,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.55,  -8.84>, < -5.74,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -2.63, -10.71>, < -5.73,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,  -0.91, -10.13>, < -5.73,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.25, -13.73>, < -5.73,   0.32, -13.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -0.61, -13.04>, < -5.73,   0.32, -13.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.25, -13.73>, < -6.79,   1.40, -15.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.55, -16.64>, < -6.79,   1.40, -15.19>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,  -0.91, -10.13>, < -4.67,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.55,  -8.84>, < -4.67,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,  -0.91, -10.13>, < -4.66,  -0.76, -11.58>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -0.61, -13.04>, < -4.66,  -0.76, -11.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,  -0.91, -10.13>, < -3.60,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -2.63, -10.72>, < -3.60,  -1.77, -10.42>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -0.91, -17.93>, < -6.78,  -0.76, -19.38>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -0.61, -20.83>, < -6.78,  -0.76, -19.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -0.91, -17.93>, < -5.72,  -1.77, -18.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -2.63, -18.51>, < -5.72,  -1.77, -18.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -0.91, -17.93>, < -6.79,   0.32, -17.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.55, -16.64>, < -6.79,   0.32, -17.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43,   3.27,  -0.46>, < -1.49,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56,   1.55,  -1.04>, < -1.49,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43,   3.27,  -0.46>, <  0.64,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   1.55,  -1.05>, <  0.64,   2.41,  -0.75>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,  -0.61,  -5.24>, < -1.48,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.25,  -5.94>, < -1.48,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,  -2.63,  -2.92>, <  0.64,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.91,  -2.34>, <  0.64,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.25,  -5.94>, < -0.42,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.55,  -8.85>, < -0.42,   1.40,  -7.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.25,  -5.94>, <  0.64,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.61,  -5.24>, <  0.64,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.91,  -2.34>, <  1.70,   0.32,  -1.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   1.55,  -1.05>, <  1.70,   0.32,  -1.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.91,  -2.34>, <  1.71,  -0.76,  -3.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.61,  -5.24>, <  1.71,  -0.76,  -3.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.91,  -2.34>, <  2.77,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.83,  -2.63,  -2.92>, <  2.77,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   3.27,  -8.26>, < -1.48,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.55,  -8.85>, < -1.48,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   3.27,  -8.26>, < -3.61,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.55,  -8.84>, < -3.61,   2.41,  -8.55>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -0.61, -13.04>, < -3.60,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.25, -13.74>, < -3.60,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -2.63, -10.72>, < -1.47,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.91, -10.14>, < -1.47,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.25, -13.74>, < -1.47,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.61, -13.04>, < -1.47,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.25, -13.74>, < -2.54,   1.40, -15.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.55, -16.64>, < -2.54,   1.40, -15.19>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.91, -10.14>, < -0.41,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.55,  -8.85>, < -0.41,   0.32,  -9.49>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.91, -10.14>, < -0.41,  -0.76, -11.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.61, -13.04>, < -0.41,  -0.76, -11.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.91, -10.14>, <  0.65,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -2.63, -10.72>, <  0.65,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   3.27, -16.06>, < -3.60,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.55, -16.64>, < -3.60,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   3.27, -16.06>, < -5.73,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,   1.55, -16.64>, < -5.73,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -0.61, -20.83>, < -5.72,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,   1.25, -21.54>, < -5.72,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -2.63, -18.51>, < -3.59,  -1.77, -18.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.91, -17.93>, < -3.59,  -1.77, -18.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,   1.25, -21.54>, < -3.59,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.61, -20.84>, < -3.59,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.91, -17.93>, < -2.53,   0.32, -17.29>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.55, -16.64>, < -2.53,   0.32, -17.29>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.91, -17.93>, < -2.53,  -0.76, -19.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.61, -20.84>, < -2.53,  -0.76, -19.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.91, -17.93>, < -1.46,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -2.63, -18.52>, < -1.46,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.83,   3.27,  -0.47>, <  2.76,   2.41,  -0.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70,   1.55,  -1.05>, <  2.76,   2.41,  -0.76>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.83,   3.27,  -0.47>, <  4.89,   2.41,  -0.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.95,   1.55,  -1.05>, <  4.89,   2.41,  -0.76>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,  -0.61,  -5.24>, <  2.77,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.25,  -5.95>, <  2.77,   0.32,  -5.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.83,  -2.63,  -2.92>, <  4.90,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,  -0.91,  -2.34>, <  4.90,  -1.77,  -2.63>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.25,  -5.95>, <  3.84,   1.40,  -7.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.55,  -8.85>, <  3.84,   1.40,  -7.40>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.25,  -5.95>, <  4.90,   0.32,  -5.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,  -0.61,  -5.25>, <  4.90,   0.32,  -5.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,  -0.91,  -2.34>, <  5.96,   0.32,  -1.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.95,   1.55,  -1.05>, <  5.96,   0.32,  -1.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,  -0.91,  -2.34>, <  5.96,  -0.76,  -3.80>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,  -0.61,  -5.25>, <  5.96,  -0.76,  -3.80>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   3.27,  -8.27>, <  0.65,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   1.55,  -8.85>, <  0.65,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   3.27,  -8.27>, <  2.77,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.55,  -8.85>, <  2.77,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -0.61, -13.04>, <  0.65,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.25, -13.74>, <  0.65,   0.32, -13.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -2.63, -10.72>, <  2.78,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -0.91, -10.14>, <  2.78,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.25, -13.74>, <  2.78,   0.32, -13.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -0.61, -13.05>, <  2.78,   0.32, -13.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.25, -13.74>, <  1.72,   1.40, -15.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.55, -16.65>, <  1.72,   1.40, -15.20>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -0.91, -10.14>, <  3.84,   0.32,  -9.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.55,  -8.85>, <  3.84,   0.32,  -9.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -0.91, -10.14>, <  4.91,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -2.63, -10.73>, <  4.91,  -1.77, -10.43>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,  -0.91, -10.14>, <  3.85,  -0.76, -11.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -0.61, -13.05>, <  3.85,  -0.76, -11.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   3.27, -16.06>, < -1.47,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   1.55, -16.64>, < -1.47,   2.41, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   3.27, -16.06>, <  0.66,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.55, -16.65>, <  0.66,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -0.61, -20.84>, < -1.46,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,   1.25, -21.54>, < -1.46,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -2.63, -18.52>, <  0.66,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.91, -17.94>, <  0.66,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,   1.25, -21.54>, <  0.66,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.61, -20.84>, <  0.66,   0.32, -21.19>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.91, -17.94>, <  1.72,   0.32, -17.29>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.55, -16.65>, <  1.72,   0.32, -17.29>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.91, -17.94>, <  1.73,  -0.76, -19.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.61, -20.84>, <  1.73,  -0.76, -19.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.91, -17.94>, <  2.79,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -2.63, -18.52>, <  2.79,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   3.27,  -8.27>, <  4.90,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.55,  -8.85>, <  4.90,   2.41,  -8.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -0.61, -13.05>, <  4.91,   0.32, -13.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   1.25, -13.75>, <  4.91,   0.32, -13.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   1.25, -13.75>, <  5.97,   1.40, -15.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   1.55, -16.66>, <  5.97,   1.40, -15.20>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   3.27, -16.07>, <  2.78,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   1.55, -16.65>, <  2.78,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   3.27, -16.07>, <  4.91,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   1.55, -16.66>, <  4.91,   2.41, -16.36>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -0.61, -20.84>, <  2.79,   0.32, -21.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,   1.25, -21.55>, <  2.79,   0.32, -21.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -2.63, -18.52>, <  4.92,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -0.91, -17.94>, <  4.92,  -1.77, -18.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,   1.25, -21.55>, <  4.92,   0.32, -21.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -0.61, -20.85>, <  4.92,   0.32, -21.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -0.91, -17.94>, <  5.98,   0.32, -17.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   1.55, -16.66>, <  5.98,   0.32, -17.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -0.91, -17.94>, <  5.98,  -0.76, -19.40>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -0.61, -20.85>, <  5.98,  -0.76, -19.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
