#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -60.29*x up 34.81*y
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

cylinder {< -9.57, -16.58, -33.47>, < 28.71, -16.58, -33.47>, Rcell pigment {Black}}
cylinder {<-28.71,  16.58, -33.47>, <  9.57,  16.58, -33.47>, Rcell pigment {Black}}
cylinder {<-28.71,  16.58,   0.00>, <  9.57,  16.58,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.58,   0.00>, < 28.71, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.58, -33.47>, <-28.71,  16.58, -33.47>, Rcell pigment {Black}}
cylinder {< 28.71, -16.58, -33.47>, <  9.57,  16.58, -33.47>, Rcell pigment {Black}}
cylinder {< 28.71, -16.58,   0.00>, <  9.57,  16.58,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.58,   0.00>, <-28.71,  16.58,   0.00>, Rcell pigment {Black}}
cylinder {< -9.57, -16.58, -33.47>, < -9.57, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {< 28.71, -16.58, -33.47>, < 28.71, -16.58,   0.00>, Rcell pigment {Black}}
cylinder {<  9.57,  16.58, -33.47>, <  9.57,  16.58,   0.00>, Rcell pigment {Black}}
cylinder {<-28.71,  16.58, -33.47>, <-28.71,  16.58,   0.00>, Rcell pigment {Black}}
atom(< -7.64,  -9.58, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -7.55,  -9.58, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -8.87, -11.32, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.41, -11.26, -16.74>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #3
atom(< -1.26,  -9.58, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -1.17,  -9.58, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -7.60,  -5.74, -16.74>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #6
atom(< -8.50,  -7.60, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -4.41,  -8.02, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -5.49,  -9.86, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.49, -11.32, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -3.32,  -9.86, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -6.69,  -7.60, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.32, -11.32, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -4.45,  -4.06, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.36,  -4.06, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -7.60,  -2.50, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -8.68,  -4.33, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.68,  -5.79, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -6.51,  -4.33, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  1.97, -11.26, -16.74>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #20
atom(< -1.22,  -5.74, -16.74>, 0.77, rgb <0.65, 0.65, 0.67>, 0.0, ase3) // #21
atom(< -2.12,  -7.60, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  1.97,  -8.02, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(<  0.89,  -9.86, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.89, -11.32, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  3.06,  -9.86, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -0.31,  -7.60, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  0.06, -11.32, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  1.93,  -4.06, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  2.02,  -4.06, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -5.31,  -2.07, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.22,  -2.50, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -2.30,  -4.33, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  0.70,  -5.79, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.13,  -4.33, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -3.50,  -2.07, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -3.13,  -5.79, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  4.26,  -7.60, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(<  1.07,  -2.07, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(<  4.08,  -4.33, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  2.88,  -2.07, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  3.25,  -5.79, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -7.64,  -9.58, -15.62>, < -8.25, -10.45, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.87, -11.32, -15.01>, < -8.25, -10.45, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,  -9.58, -15.62>, < -7.60,  -9.58, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -9.58, -17.85>, < -7.60,  -9.58, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,  -9.58, -15.62>, < -6.57,  -9.72, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,  -9.86, -14.95>, < -6.57,  -9.72, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.64,  -9.58, -15.62>, < -8.07,  -8.59, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -7.60, -15.08>, < -8.07,  -8.59, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -9.58, -17.85>, < -6.94, -10.45, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.32, -11.32, -18.46>, < -6.94, -10.45, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.55,  -9.58, -17.85>, < -7.12,  -8.59, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -7.60, -18.39>, < -7.12,  -8.59, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41, -11.26, -16.74>, < -3.45, -11.29, -15.87>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.49, -11.32, -15.01>, < -3.45, -11.29, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41, -11.26, -16.74>, < -5.36, -11.29, -17.60>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.32, -11.32, -18.46>, < -5.36, -11.29, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41, -11.26, -16.74>, < -4.41,  -9.64, -16.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -8.02, -16.74>, < -4.41,  -9.64, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.41, -11.26, -16.74>, < -4.95, -10.56, -15.84>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,  -9.86, -14.95>, < -4.95, -10.56, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41, -11.26, -16.74>, < -3.86, -10.56, -17.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.86, -18.52>, < -3.86, -10.56, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -9.58, -15.62>, < -1.87, -10.45, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.49, -11.32, -15.01>, < -1.87, -10.45, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -9.58, -15.62>, < -1.69,  -8.59, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -7.60, -15.08>, < -1.69,  -8.59, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -9.58, -15.62>, < -1.22,  -9.58, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -9.58, -17.85>, < -1.22,  -9.58, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.26,  -9.58, -15.62>, < -0.19,  -9.72, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -9.86, -14.95>, < -0.19,  -9.72, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -9.58, -17.85>, < -2.25,  -9.72, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.86, -18.52>, < -2.25,  -9.72, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -9.58, -17.85>, < -0.74,  -8.59, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -7.60, -18.39>, < -0.74,  -8.59, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.17,  -9.58, -17.85>, < -0.56, -10.45, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.06, -11.32, -18.46>, < -0.56, -10.45, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -7.14,  -6.67, -17.56>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -7.60, -18.39>, < -7.14,  -6.67, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -8.05,  -6.67, -15.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -7.60, -15.08>, < -8.05,  -6.67, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -6.64,  -5.76, -15.87>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,  -5.79, -15.01>, < -6.64,  -5.76, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -7.05,  -5.03, -17.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -4.33, -18.52>, < -7.05,  -5.03, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -8.14,  -5.03, -15.84>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,  -4.33, -14.95>, < -8.14,  -5.03, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -5.74, -16.74>, < -7.60,  -4.12, -16.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -2.50, -16.74>, < -7.60,  -4.12, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -8.02, -16.74>, < -4.95,  -8.94, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.49,  -9.86, -14.95>, < -4.95,  -8.94, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -8.02, -16.74>, < -3.86,  -8.94, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.32,  -9.86, -18.52>, < -3.86,  -8.94, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -8.02, -16.74>, < -5.55,  -7.81, -17.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.69,  -7.60, -18.39>, < -5.55,  -7.81, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.41,  -8.02, -16.74>, < -3.26,  -7.81, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -7.60, -15.08>, < -3.26,  -7.81, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,  -4.06, -15.62>, < -5.06,  -4.92, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.68,  -5.79, -15.01>, < -5.06,  -4.92, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,  -4.06, -15.62>, < -4.41,  -4.06, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -4.06, -17.85>, < -4.41,  -4.06, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,  -4.06, -15.62>, < -4.88,  -3.06, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.31,  -2.07, -15.08>, < -4.88,  -3.06, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.45,  -4.06, -15.62>, < -3.38,  -4.19, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,  -4.33, -14.95>, < -3.38,  -4.19, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -4.06, -17.85>, < -3.75,  -4.92, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.13,  -5.79, -18.46>, < -3.75,  -4.92, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -4.06, -17.85>, < -5.44,  -4.20, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -4.33, -18.52>, < -5.44,  -4.20, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.36,  -4.06, -17.85>, < -3.93,  -3.06, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.50,  -2.07, -18.39>, < -3.93,  -3.06, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -2.50, -16.74>, < -7.05,  -3.42, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.51,  -4.33, -18.52>, < -7.05,  -3.42, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -2.50, -16.74>, < -8.14,  -3.41, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -8.68,  -4.33, -14.95>, < -8.14,  -3.41, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.60,  -2.50, -16.74>, < -6.45,  -2.28, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.31,  -2.07, -15.08>, < -6.45,  -2.28, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97, -11.26, -16.74>, <  1.97,  -9.64, -16.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -8.02, -16.74>, <  1.97,  -9.64, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.97, -11.26, -16.74>, <  2.52, -10.56, -17.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.06,  -9.86, -18.52>, <  2.52, -10.56, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97, -11.26, -16.74>, <  1.02, -11.29, -17.60>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.06, -11.32, -18.46>, <  1.02, -11.29, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97, -11.26, -16.74>, <  1.43, -10.56, -15.84>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -9.86, -14.95>, <  1.43, -10.56, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97, -11.26, -16.74>, <  2.93, -11.29, -15.87>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  3.89, -11.32, -15.01>, <  2.93, -11.29, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -2.17,  -5.76, -17.60>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -3.13,  -5.79, -18.46>, < -2.17,  -5.76, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -1.67,  -6.67, -15.91>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.12,  -7.60, -15.08>, < -1.67,  -6.67, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -0.76,  -6.67, -17.56>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -7.60, -18.39>, < -0.76,  -6.67, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -0.26,  -5.76, -15.87>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {<  0.70,  -5.79, -15.01>, < -0.26,  -5.76, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -0.67,  -5.03, -17.63>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -4.33, -18.52>, < -0.67,  -5.03, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -1.76,  -5.03, -15.84>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,  -4.33, -14.95>, < -1.76,  -5.03, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -5.74, -16.74>, < -1.22,  -4.12, -16.74>, Rbond texture{pigment {color rgb <0.65, 0.65, 0.67> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -2.50, -16.74>, < -1.22,  -4.12, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -8.02, -16.74>, <  2.52,  -8.94, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.06,  -9.86, -18.52>, <  2.52,  -8.94, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -8.02, -16.74>, <  0.83,  -7.81, -17.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.31,  -7.60, -18.39>, <  0.83,  -7.81, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -8.02, -16.74>, <  1.43,  -8.94, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.89,  -9.86, -14.95>, <  1.43,  -8.94, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.97,  -8.02, -16.74>, <  3.12,  -7.81, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  4.26,  -7.60, -15.08>, <  3.12,  -7.81, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,  -4.06, -15.62>, <  1.32,  -4.92, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.70,  -5.79, -15.01>, <  1.32,  -4.92, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,  -4.06, -15.62>, <  1.97,  -4.06, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -4.06, -17.85>, <  1.97,  -4.06, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,  -4.06, -15.62>, <  1.50,  -3.06, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -2.07, -15.08>, <  1.50,  -3.06, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.93,  -4.06, -15.62>, <  3.00,  -4.19, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.08,  -4.33, -14.95>, <  3.00,  -4.19, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -4.06, -17.85>, <  2.63,  -4.92, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.25,  -5.79, -18.46>, <  2.63,  -4.92, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -4.06, -17.85>, <  0.94,  -4.20, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -4.33, -18.52>, <  0.94,  -4.20, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.02,  -4.06, -17.85>, <  2.45,  -3.06, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.88,  -2.07, -18.39>, <  2.45,  -3.06, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -2.50, -16.74>, < -2.36,  -2.28, -17.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.50,  -2.07, -18.39>, < -2.36,  -2.28, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -2.50, -16.74>, < -0.67,  -3.42, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.13,  -4.33, -18.52>, < -0.67,  -3.42, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -2.50, -16.74>, < -1.76,  -3.41, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.30,  -4.33, -14.95>, < -1.76,  -3.41, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.22,  -2.50, -16.74>, < -0.07,  -2.28, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.07,  -2.07, -15.08>, < -0.07,  -2.28, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
