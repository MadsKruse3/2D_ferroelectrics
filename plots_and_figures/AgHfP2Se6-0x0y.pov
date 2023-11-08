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
atom(< -7.58,  -9.28, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #0
atom(< -7.62,  -9.36, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -8.89, -11.00, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -4.27, -11.24, -16.74>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #3
atom(< -1.20,  -9.28, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #4
atom(< -1.24,  -9.36, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(< -7.46,  -5.72, -16.74>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #6
atom(< -8.47,  -7.35, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -4.66,  -7.34, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #8
atom(< -5.43,  -9.53, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -2.51, -11.00, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -3.36,  -9.56, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -6.79,  -7.36, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -6.34, -11.10, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< -4.39,  -3.76, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< -4.43,  -3.83, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< -7.85,  -1.81, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #16
atom(< -8.62,  -4.00, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -5.70,  -5.48, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -6.55,  -4.03, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  2.11, -11.24, -16.74>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #20
atom(< -1.08,  -5.72, -16.74>, 0.88, rgb <0.30, 0.76, 1.00>, 0.0, ase3) // #21
atom(< -2.09,  -7.35, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(<  1.72,  -7.34, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #23
atom(<  0.95,  -9.53, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  3.87, -11.00, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  3.02,  -9.56, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -0.41,  -7.36, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  0.04, -11.10, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  1.99,  -3.76, -15.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #29
atom(<  1.95,  -3.83, -17.85>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(< -5.28,  -1.83, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #31
atom(< -1.47,  -1.81, -16.74>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -2.24,  -4.00, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<  0.68,  -5.48, -14.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -0.17,  -4.03, -18.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -3.60,  -1.84, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -3.15,  -5.57, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  4.29,  -7.35, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #38
atom(<  1.10,  -1.83, -15.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #39
atom(<  4.14,  -4.00, -15.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(<  2.78,  -1.84, -18.52>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<  3.23,  -5.57, -18.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
cylinder {< -7.58,  -9.28, -15.62>, < -7.60,  -9.32, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -9.36, -17.85>, < -7.60,  -9.32, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,  -9.28, -15.62>, < -8.24, -10.14, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.89, -11.00, -14.95>, < -8.24, -10.14, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,  -9.28, -15.62>, < -6.51,  -9.41, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,  -9.53, -15.08>, < -6.51,  -9.41, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.58,  -9.28, -15.62>, < -8.03,  -8.32, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -7.35, -15.01>, < -8.03,  -8.32, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -9.36, -17.85>, < -6.98, -10.23, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.34, -11.10, -18.39>, < -6.98, -10.23, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.62,  -9.36, -17.85>, < -7.21,  -8.36, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -7.36, -18.52>, < -7.21,  -8.36, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27, -11.24, -16.74>, < -5.30, -11.17, -17.56>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.34, -11.10, -18.39>, < -5.30, -11.17, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27, -11.24, -16.74>, < -3.39, -11.12, -15.84>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.51, -11.00, -14.95>, < -3.39, -11.12, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27, -11.24, -16.74>, < -3.82, -10.40, -17.60>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -9.56, -18.46>, < -3.82, -10.40, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.27, -11.24, -16.74>, < -4.85, -10.39, -15.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,  -9.53, -15.08>, < -4.85, -10.39, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,  -9.28, -15.62>, < -1.86, -10.14, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.51, -11.00, -14.95>, < -1.86, -10.14, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,  -9.28, -15.62>, < -1.65,  -8.32, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.09,  -7.35, -15.01>, < -1.65,  -8.32, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,  -9.28, -15.62>, < -0.13,  -9.41, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,  -9.53, -15.08>, < -0.13,  -9.41, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.20,  -9.28, -15.62>, < -1.22,  -9.32, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -9.36, -17.85>, < -1.22,  -9.32, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -9.36, -17.85>, < -2.30,  -9.46, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.36,  -9.56, -18.46>, < -2.30,  -9.46, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -9.36, -17.85>, < -0.83,  -8.36, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -7.36, -18.52>, < -0.83,  -8.36, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.24,  -9.36, -17.85>, < -0.60, -10.23, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.04, -11.10, -18.39>, < -0.60, -10.23, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -7.13,  -6.54, -17.63>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -7.36, -18.52>, < -7.13,  -6.54, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -7.97,  -6.53, -15.87>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -7.35, -15.01>, < -7.97,  -6.53, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -6.06,  -6.53, -16.74>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.34, -16.74>, < -6.06,  -6.53, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -6.58,  -5.60, -15.84>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,  -5.48, -14.95>, < -6.58,  -5.60, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -7.01,  -4.87, -17.60>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.55,  -4.03, -18.46>, < -7.01,  -4.87, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.46,  -5.72, -16.74>, < -8.04,  -4.86, -15.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -4.00, -15.08>, < -8.04,  -4.86, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.34, -16.74>, < -5.04,  -8.43, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.43,  -9.53, -15.08>, < -5.04,  -8.43, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.34, -16.74>, < -5.73,  -7.35, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -7.36, -18.52>, < -5.73,  -7.35, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.34, -16.74>, < -3.90,  -6.46, -17.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -5.57, -18.39>, < -3.90,  -6.46, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.34, -16.74>, < -5.18,  -6.41, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,  -5.48, -14.95>, < -5.18,  -6.41, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,  -3.76, -15.62>, < -5.05,  -4.62, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.70,  -5.48, -14.95>, < -5.05,  -4.62, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,  -3.76, -15.62>, < -4.41,  -3.80, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -3.83, -17.85>, < -4.41,  -3.80, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,  -3.76, -15.62>, < -4.84,  -2.79, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.28,  -1.83, -15.01>, < -4.84,  -2.79, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.39,  -3.76, -15.62>, < -3.32,  -3.88, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,  -4.00, -15.08>, < -3.32,  -3.88, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -3.83, -17.85>, < -3.79,  -4.70, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -5.57, -18.39>, < -3.79,  -4.70, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -3.83, -17.85>, < -5.49,  -3.93, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.55,  -4.03, -18.46>, < -5.49,  -3.93, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.43,  -3.83, -17.85>, < -4.02,  -2.83, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -1.84, -18.52>, < -4.02,  -2.83, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.85,  -1.81, -16.74>, < -8.23,  -2.91, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -4.00, -15.08>, < -8.23,  -2.91, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11, -11.24, -16.74>, <  1.53, -10.39, -15.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,  -9.53, -15.08>, <  1.53, -10.39, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11, -11.24, -16.74>, <  2.99, -11.12, -15.84>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87, -11.00, -14.95>, <  2.99, -11.12, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11, -11.24, -16.74>, <  1.08, -11.17, -17.56>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.04, -11.10, -18.39>, <  1.08, -11.17, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.11, -11.24, -16.74>, <  2.56, -10.40, -17.60>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.02,  -9.56, -18.46>, <  2.56, -10.40, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -2.11,  -5.65, -17.56>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.15,  -5.57, -18.39>, < -2.11,  -5.65, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -1.59,  -6.53, -15.87>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.09,  -7.35, -15.01>, < -1.59,  -6.53, -15.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -0.75,  -6.54, -17.63>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -7.36, -18.52>, < -0.75,  -6.54, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, <  0.32,  -6.53, -16.74>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.34, -16.74>, <  0.32,  -6.53, -16.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -0.20,  -5.60, -15.84>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,  -5.48, -14.95>, < -0.20,  -5.60, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -0.63,  -4.87, -17.60>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.17,  -4.03, -18.46>, < -0.63,  -4.87, -17.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.08,  -5.72, -16.74>, < -1.66,  -4.86, -15.91>, Rbond texture{pigment {color rgb <0.30, 0.76, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,  -4.00, -15.08>, < -1.66,  -4.86, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.34, -16.74>, <  1.34,  -8.43, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.95,  -9.53, -15.08>, <  1.34,  -8.43, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.34, -16.74>, <  0.65,  -7.35, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -7.36, -18.52>, <  0.65,  -7.35, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.34, -16.74>, <  2.48,  -6.46, -17.56>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  3.23,  -5.57, -18.39>, <  2.48,  -6.46, -17.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.34, -16.74>, <  1.20,  -6.41, -15.84>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,  -5.48, -14.95>, <  1.20,  -6.41, -15.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,  -3.76, -15.62>, <  1.33,  -4.62, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.68,  -5.48, -14.95>, <  1.33,  -4.62, -15.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,  -3.76, -15.62>, <  1.54,  -2.79, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.10,  -1.83, -15.01>, <  1.54,  -2.79, -15.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,  -3.76, -15.62>, <  3.06,  -3.88, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  4.14,  -4.00, -15.08>, <  3.06,  -3.88, -15.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.99,  -3.76, -15.62>, <  1.97,  -3.80, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -3.83, -17.85>, <  1.97,  -3.80, -16.74>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -3.83, -17.85>, <  2.59,  -4.70, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.23,  -5.57, -18.39>, <  2.59,  -4.70, -18.12>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -3.83, -17.85>, <  0.89,  -3.93, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.17,  -4.03, -18.46>, <  0.89,  -3.93, -18.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.95,  -3.83, -17.85>, <  2.36,  -2.83, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.78,  -1.84, -18.52>, <  2.36,  -2.83, -18.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -1.81, -16.74>, < -2.54,  -1.82, -17.63>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -1.84, -18.52>, < -2.54,  -1.82, -17.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -1.81, -16.74>, < -1.85,  -2.91, -15.91>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -2.24,  -4.00, -15.08>, < -1.85,  -2.91, -15.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
