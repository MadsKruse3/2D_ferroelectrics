#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.78*x up 35.65*y
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

cylinder {< 17.04, -16.98, -27.94>, < 17.04, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.04,  16.85, -30.70>, < 17.04,  16.98,  -2.76>, Rcell pigment {Black}}
cylinder {<-17.04,  16.85, -30.70>, <-17.04,  16.98,  -2.76>, Rcell pigment {Black}}
cylinder {<-17.04, -16.98, -27.94>, <-17.04, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.04, -16.98, -27.94>, < 17.04,  16.85, -30.70>, Rcell pigment {Black}}
cylinder {< 17.04, -16.85,  -0.00>, < 17.04,  16.98,  -2.76>, Rcell pigment {Black}}
cylinder {<-17.04, -16.85,   0.00>, <-17.04,  16.98,  -2.76>, Rcell pigment {Black}}
cylinder {<-17.04, -16.98, -27.94>, <-17.04,  16.85, -30.70>, Rcell pigment {Black}}
cylinder {< 17.04, -16.98, -27.94>, <-17.04, -16.98, -27.94>, Rcell pigment {Black}}
cylinder {< 17.04, -16.85,  -0.00>, <-17.04, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.04,  16.98,  -2.76>, <-17.04,  16.98,  -2.76>, Rcell pigment {Black}}
cylinder {< 17.04,  16.85, -30.70>, <-17.04,  16.85, -30.70>, Rcell pigment {Black}}
atom(<  2.08, -14.11, -25.83>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(< -1.35, -14.62, -25.69>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #1
atom(< -2.01, -16.45, -26.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<  2.01, -13.62, -24.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<  0.57, -15.12, -25.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -0.57, -12.29, -23.83>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(< -1.49, -15.26, -23.78>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<  1.49, -12.45, -26.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #7
atom(<  2.08,  -8.47, -26.29>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -1.35,  -8.98, -26.15>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #9
atom(< -2.01, -10.81, -26.64>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(<  2.01,  -7.98, -24.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<  0.57,  -9.48, -26.39>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -0.57,  -6.65, -24.29>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(< -1.49,  -9.62, -24.24>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(<  1.49,  -6.82, -26.80>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(< -2.01,  -5.18, -27.10>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<  2.08, -14.09, -21.17>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #17
atom(< -1.35, -14.60, -21.03>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #18
atom(<  1.35, -11.79, -23.59>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #19
atom(< -2.01, -16.43, -21.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #20
atom(<  2.01, -13.60, -19.42>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(<  0.57, -15.09, -21.27>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(< -0.57, -12.27, -19.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(< -1.49, -15.24, -19.12>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(<  1.49, -12.43, -21.68>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(< -2.08, -11.28, -23.73>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #26
atom(<  2.08,  -8.45, -21.63>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(< -1.35,  -8.96, -21.49>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #28
atom(<  1.35,  -6.15, -24.05>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #29
atom(< -2.01, -10.79, -21.98>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #30
atom(<  2.01,  -7.96, -19.88>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(<  0.57,  -9.46, -21.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(< -0.57,  -6.63, -19.63>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -1.49,  -9.60, -19.58>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(<  1.49,  -6.79, -22.14>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(< -2.08,  -5.64, -24.19>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #36
atom(< -2.01,  -5.15, -22.44>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #37
atom(<  2.08, -14.07, -16.51>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(< -1.35, -14.57, -16.38>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #39
atom(<  1.35, -11.77, -18.93>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #40
atom(< -2.01, -16.41, -16.87>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(<  2.01, -13.58, -14.77>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #42
atom(<  0.57, -15.07, -16.62>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #43
atom(< -0.57, -12.24, -14.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #44
atom(< -1.49, -15.22, -14.47>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(<  1.49, -12.41, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(< -2.08, -11.26, -19.07>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #47
atom(<  2.08,  -8.43, -16.97>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #48
atom(< -1.35,  -8.94, -16.84>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #49
atom(<  1.35,  -6.13, -19.39>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #50
atom(< -2.01, -10.77, -17.33>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #51
atom(<  2.01,  -7.94, -15.23>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #52
atom(<  0.57,  -9.44, -17.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #53
atom(< -0.57,  -6.61, -14.98>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(< -1.49,  -9.58, -14.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(<  1.49,  -6.77, -17.48>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -2.08,  -5.62, -19.53>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #57
atom(< -2.01,  -5.13, -17.79>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(< -2.08, -11.24, -14.41>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #59
atom(<  1.35,  -6.11, -14.74>, 0.69, rgb <0.62, 0.39, 0.71>, 0.0, ase3) // #60
atom(< -2.08,  -5.60, -14.87>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
cylinder {<  2.08, -14.11, -25.83>, <  1.32, -14.61, -25.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.12, -25.93>, <  1.32, -14.61, -25.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.11, -25.83>, <  2.05, -13.87, -24.95>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01, -13.62, -24.08>, <  2.05, -13.87, -24.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.11, -25.83>, <  1.79, -13.28, -26.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -12.45, -26.34>, <  1.79, -13.28, -26.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.62, -25.69>, < -1.68, -15.53, -25.93>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -16.45, -26.18>, < -1.68, -15.53, -25.93>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.62, -25.69>, < -0.39, -14.87, -25.81>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.12, -25.93>, < -0.39, -14.87, -25.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.62, -25.69>, < -1.42, -14.94, -24.73>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -15.26, -23.78>, < -1.42, -14.94, -24.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.01, -13.62, -24.08>, <  1.68, -12.70, -23.84>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.79, -23.59>, <  1.68, -12.70, -23.84>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57, -12.29, -23.83>, <  0.39, -12.04, -23.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.79, -23.59>, <  0.39, -12.04, -23.71>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57, -12.29, -23.83>, < -1.32, -11.78, -23.78>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.28, -23.73>, < -1.32, -11.78, -23.78>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.47, -26.29>, <  1.32,  -8.97, -26.34>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.48, -26.39>, <  1.32,  -8.97, -26.34>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.47, -26.29>, <  2.05,  -8.23, -25.41>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.98, -24.54>, <  2.05,  -8.23, -25.41>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.47, -26.29>, <  1.79,  -7.64, -26.54>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.82, -26.80>, <  1.79,  -7.64, -26.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.98, -26.15>, < -1.68,  -9.90, -26.39>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -10.81, -26.64>, < -1.68,  -9.90, -26.39>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.98, -26.15>, < -1.42,  -9.30, -25.19>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.62, -24.24>, < -1.42,  -9.30, -25.19>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.98, -26.15>, < -0.39,  -9.23, -26.27>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.48, -26.39>, < -0.39,  -9.23, -26.27>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.98, -24.54>, <  1.68,  -7.07, -24.30>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.15, -24.05>, <  1.68,  -7.07, -24.30>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.65, -24.29>, <  0.39,  -6.40, -24.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.15, -24.05>, <  0.39,  -6.40, -24.17>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.65, -24.29>, < -1.32,  -6.14, -24.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08,  -5.64, -24.19>, < -1.32,  -6.14, -24.24>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.62, -24.24>, < -1.79, -10.45, -23.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.28, -23.73>, < -1.79, -10.45, -23.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.09, -21.17>, <  1.32, -14.59, -21.22>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.09, -21.27>, <  1.32, -14.59, -21.22>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.09, -21.17>, <  1.79, -13.26, -21.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -12.43, -21.68>, <  1.79, -13.26, -21.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.09, -21.17>, <  2.05, -13.84, -20.30>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01, -13.60, -19.42>, <  2.05, -13.84, -20.30>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.60, -21.03>, < -1.68, -15.51, -21.28>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -16.43, -21.52>, < -1.68, -15.51, -21.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.60, -21.03>, < -0.39, -14.85, -21.15>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.09, -21.27>, < -0.39, -14.85, -21.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.60, -21.03>, < -1.42, -14.92, -20.08>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -15.24, -19.12>, < -1.42, -14.92, -20.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.79, -23.59>, <  1.42, -12.11, -22.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -12.43, -21.68>, <  1.42, -12.11, -22.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.01, -13.60, -19.42>, <  1.68, -12.68, -19.18>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.77, -18.93>, <  1.68, -12.68, -19.18>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57, -12.27, -19.18>, < -1.32, -11.76, -19.12>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.26, -19.07>, < -1.32, -11.76, -19.12>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.57, -12.27, -19.18>, <  0.39, -12.02, -19.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.77, -18.93>, <  0.39, -12.02, -19.05>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.28, -23.73>, < -2.05, -11.04, -22.86>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -10.79, -21.98>, < -2.05, -11.04, -22.86>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.45, -21.63>, <  1.32,  -8.95, -21.68>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.46, -21.73>, <  1.32,  -8.95, -21.68>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.45, -21.63>, <  1.79,  -7.62, -21.89>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.79, -22.14>, <  1.79,  -7.62, -21.89>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.45, -21.63>, <  2.05,  -8.21, -20.76>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.96, -19.88>, <  2.05,  -8.21, -20.76>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.96, -21.49>, < -1.68,  -9.88, -21.74>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -10.79, -21.98>, < -1.68,  -9.88, -21.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.96, -21.49>, < -0.39,  -9.21, -21.61>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.46, -21.73>, < -0.39,  -9.21, -21.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.96, -21.49>, < -1.42,  -9.28, -20.54>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.60, -19.58>, < -1.42,  -9.28, -20.54>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.15, -24.05>, <  1.42,  -6.47, -23.10>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.79, -22.14>, <  1.42,  -6.47, -23.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.96, -19.88>, <  1.68,  -7.05, -19.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.13, -19.39>, <  1.68,  -7.05, -19.64>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.63, -19.63>, <  0.39,  -6.38, -19.51>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.13, -19.39>, <  0.39,  -6.38, -19.51>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.63, -19.63>, < -1.32,  -6.12, -19.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08,  -5.62, -19.53>, < -1.32,  -6.12, -19.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.60, -19.58>, < -1.79, -10.43, -19.33>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.26, -19.07>, < -1.79, -10.43, -19.33>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.08,  -5.64, -24.19>, < -2.05,  -5.40, -23.32>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.01,  -5.15, -22.44>, < -2.05,  -5.40, -23.32>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.07, -16.51>, <  2.05, -13.82, -15.64>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01, -13.58, -14.77>, <  2.05, -13.82, -15.64>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.07, -16.51>, <  1.32, -14.57, -16.56>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.07, -16.62>, <  1.32, -14.57, -16.56>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08, -14.07, -16.51>, <  1.79, -13.24, -16.77>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -12.41, -17.02>, <  1.79, -13.24, -16.77>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.57, -16.38>, < -1.42, -14.90, -15.42>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49, -15.22, -14.47>, < -1.42, -14.90, -15.42>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.57, -16.38>, < -0.39, -14.82, -16.50>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -15.07, -16.62>, < -0.39, -14.82, -16.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35, -14.57, -16.38>, < -1.68, -15.49, -16.62>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -16.41, -16.87>, < -1.68, -15.49, -16.62>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35, -11.77, -18.93>, <  1.42, -12.09, -17.98>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49, -12.41, -17.02>, <  1.42, -12.09, -17.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.57, -12.24, -14.52>, < -1.32, -11.74, -14.47>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.24, -14.41>, < -1.32, -11.74, -14.47>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.26, -19.07>, < -2.05, -11.01, -18.20>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -10.77, -17.33>, < -2.05, -11.01, -18.20>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.43, -16.97>, <  1.32,  -8.93, -17.02>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.44, -17.08>, <  1.32,  -8.93, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.43, -16.97>, <  2.05,  -8.19, -16.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.94, -15.23>, <  2.05,  -8.19, -16.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.08,  -8.43, -16.97>, <  1.79,  -7.60, -17.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.77, -17.48>, <  1.79,  -7.60, -17.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.94, -16.84>, < -1.68,  -9.85, -17.08>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -2.01, -10.77, -17.33>, < -1.68,  -9.85, -17.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.94, -16.84>, < -1.42,  -9.26, -15.88>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.58, -14.93>, < -1.42,  -9.26, -15.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.35,  -8.94, -16.84>, < -0.39,  -9.19, -16.96>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -9.44, -17.08>, < -0.39,  -9.19, -16.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.13, -19.39>, <  1.42,  -6.45, -18.44>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.49,  -6.77, -17.48>, <  1.42,  -6.45, -18.44>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  2.01,  -7.94, -15.23>, <  1.68,  -7.02, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.11, -14.74>, <  1.68,  -7.02, -14.98>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.61, -14.98>, <  0.39,  -6.36, -14.86>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.35,  -6.11, -14.74>, <  0.39,  -6.36, -14.86>, Rbond texture{pigment {color rgb <0.62, 0.39, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.57,  -6.61, -14.98>, < -1.32,  -6.10, -14.93>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08,  -5.60, -14.87>, < -1.32,  -6.10, -14.93>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.49,  -9.58, -14.93>, < -1.79, -10.41, -14.67>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -2.08, -11.24, -14.41>, < -1.79, -10.41, -14.67>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.08,  -5.62, -19.53>, < -2.05,  -5.38, -18.66>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -2.01,  -5.13, -17.79>, < -2.05,  -5.38, -18.66>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
