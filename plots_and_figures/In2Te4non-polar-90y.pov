#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.91*x up 49.41*y
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

cylinder {< 17.10, -23.29, -25.53>, < 17.10, -23.26,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.50, -38.23>, < 17.10,  23.53, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10,  23.50, -38.23>, <-17.10,  23.53, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.29, -25.53>, <-17.10, -23.26,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10, -23.29, -25.53>, < 17.10,  23.50, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.26,  -0.00>, < 17.10,  23.53, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.26,   0.00>, <-17.10,  23.53, -12.70>, Rcell pigment {Black}}
cylinder {<-17.10, -23.29, -25.53>, <-17.10,  23.50, -38.23>, Rcell pigment {Black}}
cylinder {< 17.10, -23.29, -25.53>, <-17.10, -23.29, -25.53>, Rcell pigment {Black}}
cylinder {< 17.10, -23.26,  -0.00>, <-17.10, -23.26,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  23.53, -12.70>, <-17.10,  23.53, -12.70>, Rcell pigment {Black}}
cylinder {< 17.10,  23.50, -38.23>, <-17.10,  23.50, -38.23>, Rcell pigment {Black}}
atom(< -3.27, -22.84, -23.80>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(<  0.61, -18.06, -25.92>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(<  2.63, -20.38, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -1.25, -17.36, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #3
atom(< -1.55, -22.26, -25.93>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(<  0.91, -20.96, -21.67>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #5
atom(< -3.27, -15.04, -25.92>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  2.63, -12.59, -25.91>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -1.25,  -9.56, -25.91>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(<  0.91, -13.16, -23.78>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(<  0.91,  -5.37, -25.90>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -3.27, -22.83, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(<  0.61, -18.06, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(<  2.63, -20.38, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -1.25, -17.35, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -1.55, -22.25, -21.67>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(<  0.91, -20.96, -17.41>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -3.27, -15.03, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(<  0.61, -10.26, -23.78>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(<  2.63, -12.58, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(< -1.25,  -9.56, -21.65>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #20
atom(< -1.55, -14.45, -23.79>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #21
atom(<  0.91, -13.16, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #22
atom(< -3.27,  -7.24, -23.78>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(<  0.61,  -2.46, -25.90>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(<  2.63,  -4.78, -23.77>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #25
atom(< -1.25,  -1.76, -23.77>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #26
atom(< -1.55,  -6.66, -25.91>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #27
atom(<  0.91,  -5.36, -21.65>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #28
atom(< -3.27, -22.83, -15.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  0.61, -18.05, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(<  2.63, -20.37, -15.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #31
atom(< -1.25, -17.35, -15.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #32
atom(< -1.55, -22.25, -17.42>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #33
atom(<  0.91, -20.95, -13.16>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #34
atom(< -3.27, -15.03, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(<  0.61, -10.25, -19.53>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(<  2.63, -12.57, -17.40>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #37
atom(< -1.25,  -9.55, -17.40>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #38
atom(< -1.55, -14.45, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #39
atom(<  0.91, -13.15, -15.27>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(< -3.27,  -7.23, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(<  0.61,  -2.46, -21.64>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(<  2.63,  -4.78, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(< -1.25,  -1.75, -19.52>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(< -1.55,  -6.65, -21.65>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(<  0.91,  -5.36, -17.39>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #46
atom(<  0.61, -18.05, -13.15>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(< -1.55, -22.24, -13.16>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #48
atom(< -3.27, -15.02, -13.15>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(<  0.61, -10.25, -15.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #50
atom(<  2.63, -12.57, -13.15>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #51
atom(< -1.25,  -9.55, -13.14>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(< -1.55, -14.44, -15.28>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
atom(< -3.27,  -7.22, -15.27>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #54
atom(<  0.61,  -2.45, -17.39>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #55
atom(<  2.63,  -4.77, -15.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #56
atom(< -1.25,  -1.75, -15.26>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #57
atom(< -1.55,  -6.65, -17.40>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #58
atom(<  0.91,  -5.35, -13.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #59
atom(<  0.61,  -2.44, -13.13>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #60
atom(< -1.55,  -6.64, -13.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #61
cylinder {< -3.27, -22.84, -23.80>, < -2.41, -22.55, -22.74>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -21.67>, < -2.41, -22.55, -22.74>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.06, -25.92>, < -0.32, -17.71, -24.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.36, -23.79>, < -0.32, -17.71, -24.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -20.38, -23.79>, <  1.77, -20.67, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -21.67>, <  1.77, -20.67, -22.73>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.36, -23.79>, < -0.32, -17.71, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.06, -21.66>, < -0.32, -17.71, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.36, -23.79>, < -1.40, -15.91, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -23.79>, < -1.40, -15.91, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.26, -25.93>, < -2.41, -22.55, -24.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -22.84, -23.80>, < -2.41, -22.55, -24.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -21.67>, < -0.32, -21.61, -21.67>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -21.67>, < -0.32, -21.61, -21.67>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -21.67>, <  1.77, -20.67, -20.60>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -20.38, -19.54>, <  1.77, -20.67, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -21.67>, <  0.76, -19.51, -21.66>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.06, -21.66>, <  0.76, -19.51, -21.66>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.04, -25.92>, < -2.41, -14.75, -24.85>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -23.79>, < -2.41, -14.75, -24.85>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.59, -25.91>, <  1.77, -12.87, -24.85>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -23.78>, <  1.77, -12.87, -24.85>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.56, -25.91>, < -0.32,  -9.91, -24.85>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.26, -23.78>, < -0.32,  -9.91, -24.85>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.56, -25.91>, < -1.40,  -8.11, -25.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.66, -25.91>, < -1.40,  -8.11, -25.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -23.78>, < -0.32, -13.81, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -23.79>, < -0.32, -13.81, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -23.78>, <  0.76, -11.71, -23.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.26, -23.78>, <  0.76, -11.71, -23.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -23.78>, <  1.77, -12.87, -22.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.58, -21.66>, <  1.77, -12.87, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.37, -25.90>, <  0.76,  -3.91, -25.90>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.46, -25.90>, <  0.76,  -3.91, -25.90>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.37, -25.90>, <  1.77,  -5.07, -24.84>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.78, -23.77>, <  1.77,  -5.07, -24.84>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.37, -25.90>, < -0.32,  -6.01, -25.90>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.66, -25.91>, < -0.32,  -6.01, -25.90>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -22.83, -19.54>, < -2.41, -22.54, -20.61>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -21.67>, < -2.41, -22.54, -20.61>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -22.83, -19.54>, < -2.41, -22.54, -18.48>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -17.42>, < -2.41, -22.54, -18.48>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.06, -21.66>, < -0.32, -17.71, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -19.54>, < -0.32, -17.71, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -20.38, -19.54>, <  1.77, -20.67, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -17.41>, <  1.77, -20.67, -18.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -19.54>, < -1.40, -15.90, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -19.53>, < -1.40, -15.90, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -19.54>, < -0.32, -17.70, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.05, -17.41>, < -0.32, -17.70, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -17.41>, < -0.32, -21.60, -17.41>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -17.42>, < -0.32, -21.60, -17.41>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -17.41>, <  0.76, -19.50, -17.41>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.05, -17.41>, <  0.76, -19.50, -17.41>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.96, -17.41>, <  1.77, -20.67, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -20.37, -15.28>, <  1.77, -20.67, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.03, -21.66>, < -2.41, -14.74, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -19.53>, < -2.41, -14.74, -20.60>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.03, -21.66>, < -2.41, -14.74, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -23.79>, < -2.41, -14.74, -22.73>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.26, -23.78>, < -0.32,  -9.91, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.56, -21.65>, < -0.32,  -9.91, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.58, -21.66>, <  1.77, -12.87, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -19.53>, <  1.77, -12.87, -20.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.56, -21.65>, < -0.32,  -9.90, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -19.53>, < -0.32,  -9.90, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.56, -21.65>, < -1.40,  -8.10, -21.65>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -21.65>, < -1.40,  -8.10, -21.65>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -19.53>, < -0.32, -13.80, -19.53>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -19.53>, < -0.32, -13.80, -19.53>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -19.53>, <  0.76, -11.71, -19.53>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -19.53>, <  0.76, -11.71, -19.53>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.16, -19.53>, <  1.77, -12.87, -18.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.57, -17.40>, <  1.77, -12.87, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.24, -23.78>, < -2.41,  -6.94, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -21.65>, < -2.41,  -6.94, -22.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.24, -23.78>, < -2.41,  -6.95, -24.84>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.66, -25.91>, < -2.41,  -6.95, -24.84>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.46, -25.90>, < -0.32,  -2.11, -24.84>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.76, -23.77>, < -0.32,  -2.11, -24.84>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.78, -23.77>, <  1.77,  -5.07, -22.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -21.65>, <  1.77,  -5.07, -22.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.76, -23.77>, < -0.32,  -2.11, -22.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.46, -21.64>, < -0.32,  -2.11, -22.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -21.65>, < -0.32,  -6.01, -21.65>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -21.65>, < -0.32,  -6.01, -21.65>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -21.65>, <  0.76,  -3.91, -21.64>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.46, -21.64>, <  0.76,  -3.91, -21.64>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -21.65>, <  1.77,  -5.07, -20.58>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.78, -19.52>, <  1.77,  -5.07, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -22.83, -15.29>, < -2.41, -22.54, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.25, -17.42>, < -2.41, -22.54, -16.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -22.83, -15.29>, < -2.41, -22.53, -14.23>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.24, -13.16>, < -2.41, -22.53, -14.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.05, -17.41>, < -0.32, -17.70, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -15.28>, < -0.32, -17.70, -16.35>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -20.37, -15.28>, <  1.77, -20.66, -14.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.95, -13.16>, <  1.77, -20.66, -14.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -15.28>, < -1.40, -15.90, -15.28>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.44, -15.28>, < -1.40, -15.90, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -17.35, -15.28>, < -0.32, -17.70, -14.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.05, -13.15>, < -0.32, -17.70, -14.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.95, -13.16>, < -0.32, -21.60, -13.16>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -22.24, -13.16>, < -0.32, -21.60, -13.16>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -20.95, -13.16>, <  0.76, -19.50, -13.15>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -18.05, -13.15>, <  0.76, -19.50, -13.15>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.03, -17.41>, < -2.41, -14.74, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.45, -19.53>, < -2.41, -14.74, -18.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.03, -17.41>, < -2.41, -14.74, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.44, -15.28>, < -2.41, -14.74, -16.34>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -19.53>, < -0.32,  -9.90, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.55, -17.40>, < -0.32,  -9.90, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.57, -17.40>, <  1.77, -12.86, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.15, -15.27>, <  1.77, -12.86, -16.34>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.55, -17.40>, < -0.32,  -9.90, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -15.27>, < -0.32,  -9.90, -16.34>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.55, -17.40>, < -1.40,  -8.10, -17.40>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -17.40>, < -1.40,  -8.10, -17.40>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.15, -15.27>, < -0.32, -13.80, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.44, -15.28>, < -0.32, -13.80, -15.28>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.15, -15.27>, <  1.77, -12.86, -14.21>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -12.57, -13.15>, <  1.77, -12.86, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -13.15, -15.27>, <  0.76, -11.70, -15.27>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -15.27>, <  0.76, -11.70, -15.27>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.23, -19.52>, < -2.41,  -6.94, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -21.65>, < -2.41,  -6.94, -20.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.23, -19.52>, < -2.41,  -6.94, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -17.40>, < -2.41,  -6.94, -18.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.46, -21.64>, < -0.32,  -2.10, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.75, -19.52>, < -0.32,  -2.10, -20.58>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.78, -19.52>, <  1.77,  -5.07, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -17.39>, <  1.77,  -5.07, -18.45>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.75, -19.52>, < -0.32,  -2.10, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.45, -17.39>, < -0.32,  -2.10, -18.45>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -17.39>, < -0.32,  -6.00, -17.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -17.40>, < -0.32,  -6.00, -17.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -17.39>, <  0.76,  -3.90, -17.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.45, -17.39>, <  0.76,  -3.90, -17.39>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.36, -17.39>, <  1.77,  -5.06, -16.33>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.77, -15.26>, <  1.77,  -5.06, -16.33>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -15.02, -13.15>, < -2.41, -14.73, -14.22>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -14.44, -15.28>, < -2.41, -14.73, -14.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -10.25, -15.27>, < -0.32,  -9.90, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.55, -13.14>, < -0.32,  -9.90, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -9.55, -13.14>, < -1.40,  -8.09, -13.14>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.64, -13.14>, < -1.40,  -8.09, -13.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.22, -15.27>, < -2.41,  -6.93, -16.33>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.65, -17.40>, < -2.41,  -6.93, -16.33>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27,  -7.22, -15.27>, < -2.41,  -6.93, -14.21>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.64, -13.14>, < -2.41,  -6.93, -14.21>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.45, -17.39>, < -0.32,  -2.10, -16.33>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.75, -15.26>, < -0.32,  -2.10, -16.33>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -4.77, -15.26>, <  1.77,  -5.06, -14.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.35, -13.14>, <  1.77,  -5.06, -14.20>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -1.75, -15.26>, < -0.32,  -2.10, -14.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.44, -13.13>, < -0.32,  -2.10, -14.20>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.35, -13.14>, < -0.32,  -6.00, -13.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55,  -6.64, -13.14>, < -0.32,  -6.00, -13.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -5.35, -13.14>, <  0.76,  -3.90, -13.13>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61,  -2.44, -13.13>, <  0.76,  -3.90, -13.13>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
