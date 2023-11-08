#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.56*x up 35.64*y
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

cylinder {< 16.93, -16.97, -27.91>, < 16.93, -16.78,  -0.00>, Rcell pigment {Black}}
cylinder {< 16.93,  16.78, -30.16>, < 16.93,  16.97,  -2.25>, Rcell pigment {Black}}
cylinder {<-16.93,  16.78, -30.16>, <-16.93,  16.97,  -2.25>, Rcell pigment {Black}}
cylinder {<-16.93, -16.97, -27.91>, <-16.93, -16.78,   0.00>, Rcell pigment {Black}}
cylinder {< 16.93, -16.97, -27.91>, < 16.93,  16.78, -30.16>, Rcell pigment {Black}}
cylinder {< 16.93, -16.78,  -0.00>, < 16.93,  16.97,  -2.25>, Rcell pigment {Black}}
cylinder {<-16.93, -16.78,   0.00>, <-16.93,  16.97,  -2.25>, Rcell pigment {Black}}
cylinder {<-16.93, -16.97, -27.91>, <-16.93,  16.78, -30.16>, Rcell pigment {Black}}
cylinder {< 16.93, -16.97, -27.91>, <-16.93, -16.97, -27.91>, Rcell pigment {Black}}
cylinder {< 16.93, -16.78,  -0.00>, <-16.93, -16.78,   0.00>, Rcell pigment {Black}}
cylinder {< 16.93,  16.97,  -2.25>, <-16.93,  16.97,  -2.25>, Rcell pigment {Black}}
cylinder {< 16.93,  16.78, -30.16>, <-16.93,  16.78, -30.16>, Rcell pigment {Black}}
atom(<  1.98, -14.09, -25.75>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #0
atom(< -1.28, -14.74, -25.58>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #1
atom(< -0.49, -12.29, -23.71>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #2
atom(<  0.49, -15.12, -25.84>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #3
atom(<  1.92, -13.55, -24.01>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #4
atom(< -1.42, -15.24, -23.83>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #5
atom(<  1.42, -12.45, -26.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #6
atom(<  1.98,  -8.46, -26.13>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #7
atom(< -1.28,  -9.11, -25.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #8
atom(< -0.49,  -6.67, -24.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #9
atom(<  0.49,  -9.49, -26.22>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #10
atom(<  1.92,  -7.92, -24.38>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -1.92, -10.75, -26.52>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #12
atom(< -1.42,  -9.62, -24.20>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #13
atom(<  1.42,  -6.82, -26.72>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #14
atom(< -1.28,  -3.49, -26.33>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #15
atom(<  0.49,  -3.87, -26.59>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -1.92,  -5.12, -26.90>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< -1.42,  -3.99, -24.58>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #18
atom(<  1.98, -14.06, -21.10>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #19
atom(<  1.28, -11.91, -23.44>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #20
atom(< -1.28, -14.71, -20.93>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #21
atom(< -0.49, -12.26, -19.05>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #22
atom(<  0.49, -15.09, -21.19>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #23
atom(<  1.92, -13.51, -19.36>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #24
atom(< -1.42, -15.21, -19.18>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(<  1.42, -12.41, -21.69>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< -1.98, -11.26, -23.61>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #27
atom(<  1.98,  -8.43, -21.48>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #28
atom(<  1.28,  -6.29, -23.82>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #29
atom(< -1.28,  -9.08, -21.30>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #30
atom(< -0.49,  -6.63, -19.43>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #31
atom(<  0.49,  -9.46, -21.57>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #32
atom(<  1.92,  -7.89, -19.73>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #33
atom(< -1.92, -10.72, -21.87>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #34
atom(< -1.42,  -9.59, -19.55>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #35
atom(<  1.42,  -6.79, -22.06>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #36
atom(< -1.98,  -5.63, -23.99>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #37
atom(< -1.28,  -3.46, -21.68>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #38
atom(<  0.49,  -3.84, -21.94>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #39
atom(< -1.92,  -5.09, -22.25>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #40
atom(< -1.42,  -3.96, -19.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #41
atom(<  1.98, -14.02, -16.45>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #42
atom(<  1.28, -11.88, -18.79>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #43
atom(< -1.28, -14.68, -16.28>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #44
atom(< -0.49, -12.23, -14.40>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #45
atom(<  0.49, -15.06, -16.54>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #46
atom(<  1.92, -13.48, -14.71>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #47
atom(< -1.42, -15.18, -14.53>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #48
atom(<  1.42, -12.38, -17.04>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #49
atom(< -1.98, -11.23, -18.96>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #50
atom(<  1.98,  -8.40, -16.82>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #51
atom(<  1.28,  -6.25, -19.17>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #52
atom(< -1.28,  -9.05, -16.65>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #53
atom(< -0.49,  -6.60, -14.78>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #54
atom(<  0.49,  -9.43, -16.92>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #55
atom(<  1.92,  -7.86, -15.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #56
atom(< -1.92, -10.68, -17.22>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #57
atom(< -1.42,  -9.55, -14.90>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #58
atom(<  1.42,  -6.76, -17.41>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #59
atom(< -1.98,  -5.60, -19.34>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #60
atom(< -1.28,  -3.43, -17.03>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #61
atom(<  0.49,  -3.81, -17.29>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #62
atom(< -1.92,  -5.06, -17.60>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #63
atom(< -1.42,  -3.93, -15.28>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #64
atom(<  1.28, -11.85, -14.14>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #65
atom(< -1.98, -11.20, -14.31>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #66
atom(<  1.28,  -6.22, -14.52>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #67
atom(< -1.98,  -5.57, -14.69>, 0.59, rgb <0.74, 0.50, 0.89>, 0.0, ase3) // #68
cylinder {<  1.98, -14.09, -25.75>, <  1.24, -14.60, -25.80>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.12, -25.84>, <  1.24, -14.60, -25.80>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.09, -25.75>, <  1.95, -13.82, -24.88>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.55, -24.01>, <  1.95, -13.82, -24.88>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.09, -25.75>, <  1.70, -13.27, -26.05>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42, -12.45, -26.34>, <  1.70, -13.27, -26.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.74, -25.58>, < -1.35, -14.99, -24.70>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42, -15.24, -23.83>, < -1.35, -14.99, -24.70>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.74, -25.58>, < -0.40, -14.93, -25.71>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.12, -25.84>, < -0.40, -14.93, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.29, -23.71>, < -1.24, -11.78, -23.66>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.26, -23.61>, < -1.24, -11.78, -23.66>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.29, -23.71>, <  0.40, -12.10, -23.57>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.91, -23.44>, <  0.40, -12.10, -23.57>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.55, -24.01>, <  1.60, -12.73, -23.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.91, -23.44>, <  1.60, -12.73, -23.73>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.46, -26.13>, <  1.24,  -8.98, -26.17>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.49, -26.22>, <  1.24,  -8.98, -26.17>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.46, -26.13>, <  1.95,  -8.19, -25.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.92, -24.38>, <  1.95,  -8.19, -25.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.46, -26.13>, <  1.70,  -7.64, -26.42>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42,  -6.82, -26.72>, <  1.70,  -7.64, -26.42>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.11, -25.96>, < -1.60,  -9.93, -26.24>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92, -10.75, -26.52>, < -1.60,  -9.93, -26.24>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.11, -25.96>, < -0.40,  -9.30, -26.09>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.49, -26.22>, < -0.40,  -9.30, -26.09>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.11, -25.96>, < -1.35,  -9.37, -25.08>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.62, -24.20>, < -1.35,  -9.37, -25.08>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.67, -24.08>, <  0.40,  -6.48, -23.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.29, -23.82>, <  0.40,  -6.48, -23.95>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.67, -24.08>, < -1.24,  -6.15, -24.03>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.63, -23.99>, < -1.24,  -6.15, -24.03>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.92, -24.38>, <  1.60,  -7.10, -24.10>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.29, -23.82>, <  1.60,  -7.10, -24.10>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.62, -24.20>, < -1.70, -10.44, -23.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.26, -23.61>, < -1.70, -10.44, -23.91>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.49, -26.33>, < -1.35,  -3.74, -25.45>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.99, -24.58>, < -1.35,  -3.74, -25.45>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.49, -26.33>, < -1.60,  -4.31, -26.61>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92,  -5.12, -26.90>, < -1.60,  -4.31, -26.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.49, -26.33>, < -0.40,  -3.68, -26.46>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -3.87, -26.59>, < -0.40,  -3.68, -26.46>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.99, -24.58>, < -1.70,  -4.81, -24.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.63, -23.99>, < -1.70,  -4.81, -24.28>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.06, -21.10>, <  1.24, -14.57, -21.15>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.09, -21.19>, <  1.24, -14.57, -21.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.06, -21.10>, <  1.70, -13.24, -21.40>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42, -12.41, -21.69>, <  1.70, -13.24, -21.40>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.06, -21.10>, <  1.95, -13.78, -20.23>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.51, -19.36>, <  1.95, -13.78, -20.23>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.91, -23.44>, <  1.35, -12.16, -22.57>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42, -12.41, -21.69>, <  1.35, -12.16, -22.57>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.71, -20.93>, < -0.40, -14.90, -21.06>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.09, -21.19>, < -0.40, -14.90, -21.06>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.71, -20.93>, < -1.35, -14.96, -20.05>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42, -15.21, -19.18>, < -1.35, -14.96, -20.05>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.26, -19.05>, <  0.40, -12.07, -18.92>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.88, -18.79>, <  0.40, -12.07, -18.92>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.26, -19.05>, < -1.24, -11.74, -19.01>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.23, -18.96>, < -1.24, -11.74, -19.01>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.51, -19.36>, <  1.60, -12.70, -19.07>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.88, -18.79>, <  1.60, -12.70, -19.07>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.26, -23.61>, < -1.95, -10.99, -22.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92, -10.72, -21.87>, < -1.95, -10.99, -22.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.43, -21.48>, <  1.24,  -8.95, -21.52>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.46, -21.57>, <  1.24,  -8.95, -21.52>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.43, -21.48>, <  1.70,  -7.61, -21.77>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42,  -6.79, -22.06>, <  1.70,  -7.61, -21.77>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.43, -21.48>, <  1.95,  -8.16, -20.60>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.89, -19.73>, <  1.95,  -8.16, -20.60>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.29, -23.82>, <  1.35,  -6.54, -22.94>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42,  -6.79, -22.06>, <  1.35,  -6.54, -22.94>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.08, -21.30>, < -1.60,  -9.90, -21.59>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92, -10.72, -21.87>, < -1.60,  -9.90, -21.59>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.08, -21.30>, < -0.40,  -9.27, -21.44>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.46, -21.57>, < -0.40,  -9.27, -21.44>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.08, -21.30>, < -1.35,  -9.33, -20.43>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.59, -19.55>, < -1.35,  -9.33, -20.43>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.63, -19.43>, <  0.40,  -6.44, -19.30>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.25, -19.17>, <  0.40,  -6.44, -19.30>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.63, -19.43>, < -1.24,  -6.12, -19.38>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.60, -19.34>, < -1.24,  -6.12, -19.38>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.89, -19.73>, <  1.60,  -7.07, -19.45>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.25, -19.17>, <  1.60,  -7.07, -19.45>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.59, -19.55>, < -1.70, -10.41, -19.26>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.23, -18.96>, < -1.70, -10.41, -19.26>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.63, -23.99>, < -1.95,  -5.36, -23.12>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92,  -5.09, -22.25>, < -1.95,  -5.36, -23.12>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.46, -21.68>, < -0.40,  -3.65, -21.81>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -3.84, -21.94>, < -0.40,  -3.65, -21.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.46, -21.68>, < -1.60,  -4.27, -21.96>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92,  -5.09, -22.25>, < -1.60,  -4.27, -21.96>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.46, -21.68>, < -1.35,  -3.71, -20.80>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.96, -19.93>, < -1.35,  -3.71, -20.80>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.96, -19.93>, < -1.70,  -4.78, -19.63>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.60, -19.34>, < -1.70,  -4.78, -19.63>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.02, -16.45>, <  1.70, -13.20, -16.74>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42, -12.38, -17.04>, <  1.70, -13.20, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.02, -16.45>, <  1.24, -14.54, -16.50>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.06, -16.54>, <  1.24, -14.54, -16.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98, -14.02, -16.45>, <  1.95, -13.75, -15.58>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.48, -14.71>, <  1.95, -13.75, -15.58>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.88, -18.79>, <  1.35, -12.13, -17.91>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42, -12.38, -17.04>, <  1.35, -12.13, -17.91>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.68, -16.28>, < -0.40, -14.87, -16.41>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49, -15.06, -16.54>, < -0.40, -14.87, -16.41>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28, -14.68, -16.28>, < -1.35, -14.93, -15.40>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42, -15.18, -14.53>, < -1.35, -14.93, -15.40>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.23, -14.40>, <  0.40, -12.04, -14.27>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.85, -14.14>, <  0.40, -12.04, -14.27>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49, -12.23, -14.40>, < -1.24, -11.71, -14.36>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.20, -14.31>, < -1.24, -11.71, -14.36>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92, -13.48, -14.71>, <  1.60, -12.66, -14.42>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28, -11.85, -14.14>, <  1.60, -12.66, -14.42>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.23, -18.96>, < -1.95, -10.96, -18.09>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92, -10.68, -17.22>, < -1.95, -10.96, -18.09>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.40, -16.82>, <  1.24,  -8.91, -16.87>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.43, -16.92>, <  1.24,  -8.91, -16.87>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.40, -16.82>, <  1.95,  -8.13, -15.95>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.86, -15.08>, <  1.95,  -8.13, -15.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.98,  -8.40, -16.82>, <  1.70,  -7.58, -17.12>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42,  -6.76, -17.41>, <  1.70,  -7.58, -17.12>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.25, -19.17>, <  1.35,  -6.51, -18.29>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.42,  -6.76, -17.41>, <  1.35,  -6.51, -18.29>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.05, -16.65>, < -1.60,  -9.87, -16.94>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92, -10.68, -17.22>, < -1.60,  -9.87, -16.94>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.05, -16.65>, < -0.40,  -9.24, -16.79>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -9.43, -16.92>, < -0.40,  -9.24, -16.79>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -9.05, -16.65>, < -1.35,  -9.30, -15.78>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.55, -14.90>, < -1.35,  -9.30, -15.78>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.60, -14.78>, <  0.40,  -6.41, -14.65>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.22, -14.52>, <  0.40,  -6.41, -14.65>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -0.49,  -6.60, -14.78>, < -1.24,  -6.09, -14.73>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.57, -14.69>, < -1.24,  -6.09, -14.73>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  1.92,  -7.86, -15.08>, <  1.60,  -7.04, -14.80>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.28,  -6.22, -14.52>, <  1.60,  -7.04, -14.80>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -9.55, -14.90>, < -1.70, -10.37, -14.61>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98, -11.20, -14.31>, < -1.70, -10.37, -14.61>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.60, -19.34>, < -1.95,  -5.33, -18.47>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92,  -5.06, -17.60>, < -1.95,  -5.33, -18.47>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.43, -17.03>, < -0.40,  -3.62, -17.16>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {<  0.49,  -3.81, -17.29>, < -0.40,  -3.62, -17.16>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.43, -17.03>, < -1.35,  -3.68, -16.15>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.93, -15.28>, < -1.35,  -3.68, -16.15>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.28,  -3.43, -17.03>, < -1.60,  -4.24, -17.31>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
cylinder {< -1.92,  -5.06, -17.60>, < -1.60,  -4.24, -17.31>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.42,  -3.93, -15.28>, < -1.70,  -4.75, -14.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -1.98,  -5.57, -14.69>, < -1.70,  -4.75, -14.98>, Rbond texture{pigment {color rgb <0.74, 0.50, 0.89> transmit 0.0} finish{ase3}}}
// no constraints
