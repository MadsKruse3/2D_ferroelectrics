#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -60.94*x up 35.19*y
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

cylinder {< -9.67, -16.75, -33.47>, < 29.02, -16.75, -33.47>, Rcell pigment {Black}}
cylinder {<-29.02,  16.75, -33.47>, <  9.67,  16.75, -33.47>, Rcell pigment {Black}}
cylinder {<-29.02,  16.75,   0.00>, <  9.67,  16.75,   0.00>, Rcell pigment {Black}}
cylinder {< -9.67, -16.75,   0.00>, < 29.02, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {< -9.67, -16.75, -33.47>, <-29.02,  16.75, -33.47>, Rcell pigment {Black}}
cylinder {< 29.02, -16.75, -33.47>, <  9.67,  16.75, -33.47>, Rcell pigment {Black}}
cylinder {< 29.02, -16.75,   0.00>, <  9.67,  16.75,   0.00>, Rcell pigment {Black}}
cylinder {< -9.67, -16.75,   0.00>, <-29.02,  16.75,   0.00>, Rcell pigment {Black}}
cylinder {< -9.67, -16.75, -33.47>, < -9.67, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {< 29.02, -16.75, -33.47>, < 29.02, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {<  9.67,  16.75, -33.47>, <  9.67,  16.75,   0.00>, Rcell pigment {Black}}
cylinder {<-29.02,  16.75, -33.47>, <-29.02,  16.75,   0.00>, Rcell pigment {Black}}
atom(< -6.45, -14.89, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #0
atom(< -8.78, -11.09, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -8.44, -14.77, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -7.56, -12.89, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -0.00, -14.89, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -3.22, -13.03, -15.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -3.22, -13.03, -17.86>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -2.33, -11.09, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -1.99, -14.77, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -5.35, -13.23, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.11, -12.89, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -4.16, -14.93, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -4.40, -11.27, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.45, -11.17, -15.25>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #13
atom(< -3.22,  -9.31, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #14
atom(< -6.45,  -7.45, -15.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -6.45,  -7.45, -17.86>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(< -5.55,  -5.51, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.22,  -9.19, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -8.57,  -7.64, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -4.33,  -7.30, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -7.38,  -9.35, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -7.63,  -5.69, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -6.45,  -3.72, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #23
atom(< -8.44,  -3.61, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.22, -13.03, -15.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #25
atom(<  3.22, -13.03, -17.86>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #26
atom(<  4.12, -11.09, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  1.10, -13.23, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  2.29, -14.93, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<  2.04, -11.27, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #30
atom(< -0.00, -11.17, -15.25>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #31
atom(<  3.22,  -9.31, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
atom(< -0.00,  -7.45, -15.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #33
atom(< -0.00,  -7.45, -17.86>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #34
atom(<  0.89,  -5.51, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.23,  -9.19, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -2.13,  -7.64, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  2.11,  -7.30, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(< -0.93,  -9.35, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(< -1.18,  -5.69, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(< -3.22,  -5.59, -15.25>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #41
atom(< -0.00,  -3.72, -16.97>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #42
atom(< -1.99,  -3.61, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(< -4.16,  -3.76, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(<  4.32,  -7.64, -14.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #45
atom(<  3.22,  -5.59, -15.25>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #46
atom(<  2.29,  -3.76, -18.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #47
cylinder {< -6.45, -14.89, -16.97>, < -7.45, -14.83, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -8.44, -14.77, -14.88>, < -7.45, -14.83, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -14.89, -16.97>, < -5.30, -14.91, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.16, -14.93, -18.45>, < -5.30, -14.91, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -14.89, -16.97>, < -5.90, -14.06, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.35, -13.23, -14.88>, < -5.90, -14.06, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -14.89, -16.97>, < -7.00, -13.89, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -7.56, -12.89, -18.45>, < -7.00, -13.89, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.78, -11.09, -14.88>, < -7.61, -11.13, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -11.17, -15.25>, < -7.61, -11.13, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.89, -16.97>, <  0.55, -14.06, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.10, -13.23, -14.88>, <  0.55, -14.06, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.89, -16.97>, < -1.00, -14.83, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.99, -14.77, -14.88>, < -1.00, -14.83, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.89, -16.97>, < -0.56, -13.89, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.11, -12.89, -18.45>, < -0.56, -13.89, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.89, -16.97>, <  1.15, -14.91, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.29, -14.93, -18.45>, <  1.15, -14.91, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -15.57>, < -3.22, -13.03, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -17.86>, < -3.22, -13.03, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -15.57>, < -2.61, -13.90, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.99, -14.77, -14.88>, < -2.61, -13.90, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -15.57>, < -4.29, -13.13, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.35, -13.23, -14.88>, < -4.29, -13.13, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -15.57>, < -2.78, -12.06, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.33, -11.09, -14.88>, < -2.78, -12.06, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -17.86>, < -3.81, -12.15, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.40, -11.27, -18.45>, < -3.81, -12.15, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -17.86>, < -3.69, -13.98, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.16, -14.93, -18.45>, < -3.69, -13.98, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22, -13.03, -17.86>, < -2.17, -12.96, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.11, -12.89, -18.45>, < -2.17, -12.96, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.33, -11.09, -14.88>, < -1.17, -11.13, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.17, -15.25>, < -1.17, -11.13, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.33, -11.09, -14.88>, < -2.78, -10.20, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -2.78, -10.20, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.35, -13.23, -14.88>, < -5.90, -12.20, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -11.17, -15.25>, < -5.90, -12.20, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -4.40, -11.27, -18.45>, < -3.81, -10.29, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -3.81, -10.29, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -2.08,  -9.33, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -9.35, -18.45>, < -2.08,  -9.33, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -4.22,  -9.25, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,  -9.19, -14.88>, < -4.22,  -9.25, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -2.68,  -8.47, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -7.64, -14.88>, < -2.68,  -8.47, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -9.31, -16.97>, < -3.78,  -8.31, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.33,  -7.30, -18.45>, < -3.78,  -8.31, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -15.57>, < -7.51,  -7.54, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.57,  -7.64, -14.88>, < -7.51,  -7.54, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -15.57>, < -6.00,  -6.48, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,  -5.51, -14.88>, < -6.00,  -6.48, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -15.57>, < -6.45,  -7.45, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -17.86>, < -6.45,  -7.45, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -17.86>, < -7.04,  -6.57, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.63,  -5.69, -18.45>, < -7.04,  -6.57, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -17.86>, < -5.39,  -7.38, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.33,  -7.30, -18.45>, < -5.39,  -7.38, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -17.86>, < -6.92,  -8.40, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.38,  -9.35, -18.45>, < -6.92,  -8.40, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,  -5.51, -14.88>, < -4.39,  -5.55, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -5.59, -15.25>, < -4.39,  -5.55, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.55,  -5.51, -14.88>, < -6.00,  -4.62, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -3.72, -16.97>, < -6.00,  -4.62, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,  -9.19, -14.88>, < -5.83,  -8.32, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -7.45, -15.57>, < -5.83,  -8.32, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.22,  -9.19, -14.88>, < -5.83, -10.18, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45, -11.17, -15.25>, < -5.83, -10.18, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -7.63,  -5.69, -18.45>, < -7.04,  -4.71, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -3.72, -16.97>, < -7.04,  -4.71, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -3.72, -16.97>, < -7.45,  -3.66, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -8.44,  -3.61, -14.88>, < -7.45,  -3.66, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.45,  -3.72, -16.97>, < -5.30,  -3.74, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.16,  -3.76, -18.45>, < -5.30,  -3.74, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -15.57>, <  2.16, -13.13, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.10, -13.23, -14.88>, <  2.16, -13.13, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -15.57>, <  3.22, -13.03, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -17.86>, <  3.22, -13.03, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -15.57>, <  3.67, -12.06, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.12, -11.09, -14.88>, <  3.67, -12.06, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -17.86>, <  2.76, -13.98, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.29, -14.93, -18.45>, <  2.76, -13.98, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22, -13.03, -17.86>, <  2.63, -12.15, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.04, -11.27, -18.45>, <  2.63, -12.15, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.12, -11.09, -14.88>, <  3.67, -10.20, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -9.31, -16.97>, <  3.67, -10.20, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.10, -13.23, -14.88>, <  0.55, -12.20, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.17, -15.25>, <  0.55, -12.20, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  2.04, -11.27, -18.45>, <  2.63, -10.29, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -9.31, -16.97>, <  2.63, -10.29, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -11.17, -15.25>, <  0.62, -10.18, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,  -9.19, -14.88>, <  0.62, -10.18, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -9.31, -16.97>, <  2.23,  -9.25, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,  -9.19, -14.88>, <  2.23,  -9.25, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -9.31, -16.97>, <  2.67,  -8.31, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -7.30, -18.45>, <  2.67,  -8.31, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -9.31, -16.97>, <  3.77,  -8.47, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  4.32,  -7.64, -14.88>, <  3.77,  -8.47, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -15.57>, <  0.62,  -8.32, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.23,  -9.19, -14.88>, <  0.62,  -8.32, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -15.57>, < -0.00,  -7.45, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -17.86>, < -0.00,  -7.45, -16.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -15.57>, < -1.06,  -7.54, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -7.64, -14.88>, < -1.06,  -7.54, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -15.57>, <  0.45,  -6.48, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -5.51, -14.88>, <  0.45,  -6.48, -15.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -17.86>, < -0.47,  -8.40, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.93,  -9.35, -18.45>, < -0.47,  -8.40, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -17.86>, < -0.59,  -6.57, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -5.69, -18.45>, < -0.59,  -6.57, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -7.45, -17.86>, <  1.06,  -7.38, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11,  -7.30, -18.45>, <  1.06,  -7.38, -18.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -5.51, -14.88>, <  0.45,  -4.62, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.72, -16.97>, <  0.45,  -4.62, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -5.51, -14.88>, <  2.06,  -5.55, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -5.59, -15.25>, <  2.06,  -5.55, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.13,  -7.64, -14.88>, < -2.68,  -6.61, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -5.59, -15.25>, < -2.68,  -6.61, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.18,  -5.69, -18.45>, < -0.59,  -4.71, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.72, -16.97>, < -0.59,  -4.71, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.72, -16.97>, < -1.00,  -3.66, -15.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,  -3.61, -14.88>, < -1.00,  -3.66, -15.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -3.72, -16.97>, <  1.14,  -3.74, -17.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.29,  -3.76, -18.45>, <  1.14,  -3.74, -17.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.99,  -3.61, -14.88>, < -2.61,  -4.60, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.22,  -5.59, -15.25>, < -2.61,  -4.60, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  4.32,  -7.64, -14.88>, <  3.77,  -6.61, -15.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.22,  -5.59, -15.25>, <  3.77,  -6.61, -15.07>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
// no constraints
