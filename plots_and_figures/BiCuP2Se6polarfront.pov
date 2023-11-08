#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -62.77*x up 36.25*y
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

cylinder {< -9.96, -17.26, -33.52>, < 29.89, -17.26, -33.52>, Rcell pigment {Black}}
cylinder {<-29.89,  17.26, -33.52>, <  9.96,  17.26, -33.52>, Rcell pigment {Black}}
cylinder {<-29.89,  17.26,   0.00>, <  9.96,  17.26,   0.00>, Rcell pigment {Black}}
cylinder {< -9.96, -17.26,   0.00>, < 29.89, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {< -9.96, -17.26, -33.52>, <-29.89,  17.26, -33.52>, Rcell pigment {Black}}
cylinder {< 29.89, -17.26, -33.52>, <  9.96,  17.26, -33.52>, Rcell pigment {Black}}
cylinder {< 29.89, -17.26,   0.00>, <  9.96,  17.26,   0.00>, Rcell pigment {Black}}
cylinder {< -9.96, -17.26,   0.00>, <-29.89,  17.26,   0.00>, Rcell pigment {Black}}
cylinder {< -9.96, -17.26, -33.52>, < -9.96, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {< 29.89, -17.26, -33.52>, < 29.89, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {<  9.96,  17.26, -33.52>, <  9.96,  17.26,   0.00>, Rcell pigment {Black}}
cylinder {<-29.89,  17.26, -33.52>, <-29.89,  17.26,   0.00>, Rcell pigment {Black}}
atom(< -7.86, -13.70, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -4.61, -15.11, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -8.82, -11.63, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -8.98, -15.31, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -6.64, -15.34, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #4
atom(< -6.64, -11.51, -16.41>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #5
atom(< -7.93,  -9.35, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.22, -13.70, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(<  2.03, -15.11, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -2.18, -11.63, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.34, -15.31, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -5.44, -13.33, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -3.32, -13.42, -17.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(< -3.32, -13.42, -15.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  0.00, -15.34, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #14
atom(<  0.00, -11.51, -16.41>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #15
atom(< -4.54,  -7.95, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.29,  -9.35, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -4.13, -11.46, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -5.50,  -5.88, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -5.66,  -9.56, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -8.77,  -7.57, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -6.64,  -7.67, -17.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< -6.64,  -7.67, -15.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(< -3.32,  -9.59, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #24
atom(< -3.32,  -5.75, -16.41>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #25
atom(< -4.61,  -3.60, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -7.45,  -5.71, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -8.99,  -3.81, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -6.64,  -3.84, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #29
atom(<  1.20, -13.33, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #30
atom(<  3.32, -13.42, -17.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(<  3.32, -13.42, -15.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #32
atom(<  2.10,  -7.95, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  2.51, -11.46, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.15,  -5.88, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  0.98,  -9.56, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -2.12,  -7.57, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  0.00,  -7.67, -17.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(<  0.00,  -7.67, -15.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<  3.32,  -9.59, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #40
atom(<  3.32,  -5.75, -16.41>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(<  2.03,  -3.60, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -0.81,  -5.71, -14.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(< -2.34,  -3.81, -18.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(<  0.00,  -3.84, -18.10>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #45
cylinder {< -7.86, -13.70, -14.91>, < -7.25, -12.60, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64, -11.51, -16.41>, < -7.25, -12.60, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.61, -15.11, -14.91>, < -3.97, -14.27, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -15.50>, < -3.97, -14.27, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64, -15.34, -18.10>, < -6.04, -14.34, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.44, -13.33, -18.53>, < -6.04, -14.34, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64, -15.34, -18.10>, < -7.81, -15.33, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -8.98, -15.31, -18.53>, < -7.81, -15.33, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64, -11.51, -16.41>, < -5.39, -11.49, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.13, -11.46, -14.91>, < -5.39, -11.49, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64, -11.51, -16.41>, < -7.29, -10.43, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -9.35, -14.91>, < -7.29, -10.43, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.93,  -9.35, -14.91>, < -7.29,  -8.51, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -15.50>, < -7.29,  -8.51, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22, -13.70, -14.91>, < -2.27, -13.56, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -15.50>, < -2.27, -13.56, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22, -13.70, -14.91>, < -0.61, -12.60, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.51, -16.41>, < -0.61, -12.60, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.03, -15.11, -14.91>, <  2.68, -14.27, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32, -13.42, -15.50>, <  2.68, -14.27, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.18, -11.63, -18.53>, < -2.75, -12.53, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -17.80>, < -2.75, -12.53, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.18, -11.63, -18.53>, < -2.75, -10.61, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.59, -18.10>, < -2.75, -10.61, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34, -15.31, -18.53>, < -1.17, -15.33, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -15.34, -18.10>, < -1.17, -15.33, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34, -15.31, -18.53>, < -2.83, -14.37, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -17.80>, < -2.83, -14.37, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.44, -13.33, -18.53>, < -4.38, -13.38, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -17.80>, < -4.38, -13.38, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -17.80>, < -3.32, -13.42, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -15.50>, < -3.32, -13.42, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32, -13.42, -15.50>, < -3.73, -12.44, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.13, -11.46, -14.91>, < -3.73, -12.44, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -15.34, -18.10>, <  0.60, -14.34, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.20, -13.33, -18.53>, <  0.60, -14.34, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.51, -16.41>, < -0.65, -10.43, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.29,  -9.35, -14.91>, < -0.65, -10.43, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -11.51, -16.41>, <  1.26, -11.49, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.51, -11.46, -14.91>, <  1.26, -11.49, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.54,  -7.95, -14.91>, < -3.93,  -6.85, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -5.75, -16.41>, < -3.93,  -6.85, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.54,  -7.95, -14.91>, < -5.59,  -7.81, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -15.50>, < -5.59,  -7.81, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.29,  -9.35, -14.91>, < -0.65,  -8.51, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -15.50>, < -0.65,  -8.51, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.50,  -5.88, -18.53>, < -6.07,  -4.86, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -3.84, -18.10>, < -6.07,  -4.86, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.50,  -5.88, -18.53>, < -6.07,  -6.78, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -17.80>, < -6.07,  -6.78, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.66,  -9.56, -18.53>, < -6.15,  -8.61, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -17.80>, < -6.15,  -8.61, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.77,  -7.57, -18.53>, < -7.70,  -7.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -17.80>, < -7.70,  -7.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -17.80>, < -6.64,  -7.67, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -15.50>, < -6.64,  -7.67, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -7.67, -15.50>, < -7.05,  -6.69, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.45,  -5.71, -14.91>, < -7.05,  -6.69, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.59, -18.10>, < -2.72,  -8.58, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -7.57, -18.53>, < -2.72,  -8.58, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.59, -18.10>, < -4.49,  -9.57, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -5.66,  -9.56, -18.53>, < -4.49,  -9.57, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -5.75, -16.41>, < -2.07,  -5.73, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -0.81,  -5.71, -14.91>, < -2.07,  -5.73, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -5.75, -16.41>, < -3.97,  -4.68, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.61,  -3.60, -14.91>, < -3.97,  -4.68, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.99,  -3.81, -18.53>, < -7.81,  -3.82, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.64,  -3.84, -18.10>, < -7.81,  -3.82, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.20, -13.33, -18.53>, <  2.26, -13.38, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32, -13.42, -17.80>, <  2.26, -13.38, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32, -13.42, -17.80>, <  3.32, -13.42, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32, -13.42, -15.50>, <  3.32, -13.42, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32, -13.42, -15.50>, <  2.92, -12.44, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.51, -11.46, -14.91>, <  2.92, -12.44, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -7.95, -14.91>, <  1.05,  -7.81, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -15.50>, <  1.05,  -7.81, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.10,  -7.95, -14.91>, <  2.71,  -6.85, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -5.75, -16.41>, <  2.71,  -6.85, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.15,  -5.88, -18.53>, <  0.57,  -4.86, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.84, -18.10>, <  0.57,  -4.86, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.15,  -5.88, -18.53>, <  0.57,  -6.78, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -17.80>, <  0.57,  -6.78, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.98,  -9.56, -18.53>, <  0.49,  -8.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -17.80>, <  0.49,  -8.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.98,  -9.56, -18.53>, <  2.15,  -9.57, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -9.59, -18.10>, <  2.15,  -9.57, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -7.57, -18.53>, < -1.06,  -7.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -17.80>, < -1.06,  -7.62, -18.17>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -17.80>, <  0.00,  -7.67, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -15.50>, <  0.00,  -7.67, -16.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -7.67, -15.50>, < -0.40,  -6.69, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.81,  -5.71, -14.91>, < -0.40,  -6.69, -15.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.32,  -5.75, -16.41>, <  2.68,  -4.68, -15.66>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  2.03,  -3.60, -14.91>, <  2.68,  -4.68, -15.66>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -3.84, -18.10>, < -1.17,  -3.82, -18.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.34,  -3.81, -18.53>, < -1.17,  -3.82, -18.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
