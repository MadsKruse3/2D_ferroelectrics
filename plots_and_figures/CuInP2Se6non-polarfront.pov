#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -57.56*x up 29.32*y
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

cylinder {<-11.29, -13.96, -33.47>, < 27.41, -13.96, -33.47>, Rcell pigment {Black}}
cylinder {<-27.41,  13.96, -33.47>, < 11.29,  13.96, -33.47>, Rcell pigment {Black}}
cylinder {<-27.41,  13.96,   0.00>, < 11.29,  13.96,   0.00>, Rcell pigment {Black}}
cylinder {<-11.29, -13.96,   0.00>, < 27.41, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {<-11.29, -13.96, -33.47>, <-27.41,  13.96, -33.47>, Rcell pigment {Black}}
cylinder {< 27.41, -13.96, -33.47>, < 11.29,  13.96, -33.47>, Rcell pigment {Black}}
cylinder {< 27.41, -13.96,   0.00>, < 11.29,  13.96,   0.00>, Rcell pigment {Black}}
cylinder {<-11.29, -13.96,   0.00>, <-27.41,  13.96,   0.00>, Rcell pigment {Black}}
cylinder {<-11.29, -13.96, -33.47>, <-11.29, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {< 27.41, -13.96, -33.47>, < 27.41, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {< 11.29,  13.96, -33.47>, < 11.29,  13.96,   0.00>, Rcell pigment {Black}}
cylinder {<-27.41,  13.96, -33.47>, <-27.41,  13.96,   0.00>, Rcell pigment {Black}}
atom(<-10.49, -10.82, -34.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -6.71, -11.29, -32.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -6.19, -11.05, -34.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< -5.77,  -9.60, -31.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -8.85, -11.51, -32.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -4.05, -10.82, -34.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -7.04,  -9.09, -35.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -8.06,  -8.38, -33.47>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #7
atom(< -4.84,  -8.38, -33.47>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #8
atom(< -9.93,  -5.71, -32.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(< -9.41,  -5.46, -34.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(< -8.99,  -4.02, -31.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -9.08,  -7.66, -31.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -7.27,  -5.24, -34.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<-10.35,  -7.15, -35.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<-10.27,  -3.51, -35.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(< -2.40, -11.51, -32.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.61,  -8.38, -33.47>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #17
atom(< -3.48,  -5.71, -32.31>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #18
atom(< -2.96,  -5.46, -34.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(< -2.54,  -4.02, -31.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -2.63,  -7.66, -31.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -5.63,  -5.93, -32.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -3.91,  -7.15, -35.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< -3.82,  -3.51, -35.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< -6.71, -11.29, -32.31>, < -7.78, -11.40, -32.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.85, -11.51, -32.11>, < -7.78, -11.40, -32.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.71, -11.29, -32.31>, < -6.45, -11.17, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -11.05, -34.62>, < -6.45, -11.17, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.71, -11.29, -32.31>, < -6.24, -10.45, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,  -9.60, -31.28>, < -6.24, -10.45, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -11.05, -34.62>, < -5.12, -10.94, -34.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.05, -10.82, -34.82>, < -5.12, -10.94, -34.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -11.05, -34.62>, < -6.62, -10.07, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.04,  -9.09, -35.34>, < -6.62, -10.07, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77,  -9.60, -31.28>, < -5.30,  -8.99, -32.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -8.38, -33.47>, < -5.30,  -8.99, -32.37>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.05, -10.82, -34.82>, < -4.44,  -9.60, -34.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -8.38, -33.47>, < -4.44,  -9.60, -34.14>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -7.04,  -9.09, -35.34>, < -7.55,  -8.73, -34.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.06,  -8.38, -33.47>, < -7.55,  -8.73, -34.40>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -8.06,  -8.38, -33.47>, < -8.57,  -8.02, -32.53>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -9.08,  -7.66, -31.59>, < -8.57,  -8.02, -32.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -8.38, -33.47>, < -4.37,  -7.77, -34.56>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.91,  -7.15, -35.66>, < -4.37,  -7.77, -34.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84,  -8.38, -33.47>, < -5.23,  -7.15, -32.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.63,  -5.93, -32.11>, < -5.23,  -7.15, -32.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93,  -5.71, -32.31>, < -9.51,  -6.68, -31.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.08,  -7.66, -31.59>, < -9.51,  -6.68, -31.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93,  -5.71, -32.31>, < -9.46,  -4.86, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.99,  -4.02, -31.28>, < -9.46,  -4.86, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93,  -5.71, -32.31>, < -9.67,  -5.58, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41,  -5.46, -34.62>, < -9.67,  -5.58, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41,  -5.46, -34.62>, < -9.88,  -6.31, -35.14>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.35,  -7.15, -35.66>, < -9.88,  -6.31, -35.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41,  -5.46, -34.62>, < -8.34,  -5.35, -34.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.27,  -5.24, -34.82>, < -8.34,  -5.35, -34.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41,  -5.46, -34.62>, < -9.84,  -4.49, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.27,  -3.51, -35.34>, < -9.84,  -4.49, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.61,  -8.38, -33.47>, < -2.12,  -8.02, -32.53>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.63,  -7.66, -31.59>, < -2.12,  -8.02, -32.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48,  -5.71, -32.31>, < -3.22,  -5.58, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,  -5.46, -34.62>, < -3.22,  -5.58, -33.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48,  -5.71, -32.31>, < -3.01,  -4.86, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -4.02, -31.28>, < -3.01,  -4.86, -31.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48,  -5.71, -32.31>, < -3.06,  -6.68, -31.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.63,  -7.66, -31.59>, < -3.06,  -6.68, -31.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48,  -5.71, -32.31>, < -4.56,  -5.82, -32.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.63,  -5.93, -32.11>, < -4.56,  -5.82, -32.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,  -5.46, -34.62>, < -3.44,  -6.31, -35.14>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.91,  -7.15, -35.66>, < -3.44,  -6.31, -35.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96,  -5.46, -34.62>, < -3.39,  -4.49, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.82,  -3.51, -35.34>, < -3.39,  -4.49, -34.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
