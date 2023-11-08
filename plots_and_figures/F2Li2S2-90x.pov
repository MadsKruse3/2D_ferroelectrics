#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.70*x up 19.55*y
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

cylinder {<-15.39,  -9.31,  -0.00>, < 15.57,  -9.31,  -0.00>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31, -34.78>, < 15.57,  -9.31, -34.78>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31, -34.78>, < 15.57,   9.31, -34.78>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31,   0.00>, < 15.57,   9.31,  -0.00>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31,  -0.00>, <-15.39,  -9.31, -34.78>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31,  -0.00>, < 15.57,  -9.31, -34.78>, Rcell pigment {Black}}
cylinder {< 15.57,   9.31,  -0.00>, < 15.57,   9.31, -34.78>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31,   0.00>, <-15.39,   9.31, -34.78>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31,  -0.00>, <-15.39,   9.31,   0.00>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31,  -0.00>, < 15.57,   9.31,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31, -34.78>, < 15.57,   9.31, -34.78>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31, -34.78>, <-15.39,   9.31, -34.78>, Rcell pigment {Black}}
atom(<-14.93,   0.52,  -6.65>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<-12.92,  -0.37,  -8.84>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #1
atom(<-11.08,   0.06, -10.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-14.39,   0.45,  -8.31>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(<-12.26,   0.42,  -6.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.39,  -1.14,  -7.12>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #5
atom(<-14.93,   0.52, -12.44>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #6
atom(<-12.92,  -0.37, -14.64>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #7
atom(<-11.08,   0.06, -16.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-14.39,   0.45, -14.11>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(<-12.26,   0.42, -11.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-12.39,  -1.14, -12.92>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -9.77,   0.52,  -6.65>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(< -7.76,  -0.37,  -8.84>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -5.92,   0.06, -10.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -9.23,   0.45,  -8.31>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #15
atom(< -7.10,   0.42,  -6.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -7.23,  -1.14,  -7.12>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(< -9.77,   0.52, -12.44>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #18
atom(< -7.76,  -0.37, -14.64>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #19
atom(< -5.92,   0.06, -16.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -9.23,   0.45, -14.11>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #21
atom(< -7.10,   0.42, -11.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -7.23,  -1.14, -12.92>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #23
cylinder {<-14.93,   0.52,  -6.65>, <-13.93,   0.07,  -7.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-13.93,   0.07,  -7.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52,  -6.65>, <-14.66,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45,  -8.31>, <-14.66,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52,  -6.65>, <-13.60,   0.47,  -6.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-13.60,   0.47,  -6.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-13.66,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45,  -8.31>, <-13.66,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-12.59,   0.03,  -7.51>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-12.59,   0.03,  -7.51>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-12.66,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14,  -7.12>, <-12.66,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-12.00,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06, -10.42>, <-12.00,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06, -10.42>, <-11.67,   0.24, -11.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42, -11.99>, <-11.67,   0.24, -11.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06, -10.42>, <-10.43,   0.29, -11.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52, -12.44>, <-10.43,   0.29, -11.43>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-12.32,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14,  -7.12>, <-12.32,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-11.02,   0.47,  -6.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, <-11.02,   0.47,  -6.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52, -12.44>, <-13.60,   0.47, -12.21>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42, -11.99>, <-13.60,   0.47, -12.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52, -12.44>, <-13.93,   0.07, -13.54>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37, -14.64>, <-13.93,   0.07, -13.54>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52, -12.44>, <-14.66,   0.48, -13.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45, -14.11>, <-14.66,   0.48, -13.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37, -14.64>, <-12.59,   0.03, -13.31>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42, -11.99>, <-12.59,   0.03, -13.31>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37, -14.64>, <-13.66,   0.04, -14.37>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45, -14.11>, <-13.66,   0.04, -14.37>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37, -14.64>, <-12.00,  -0.15, -15.43>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06, -16.22>, <-12.00,  -0.15, -15.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37, -14.64>, <-12.66,  -0.75, -13.78>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14, -12.92>, <-12.66,  -0.75, -13.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42, -11.99>, <-11.02,   0.47, -12.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52, -12.44>, <-11.02,   0.47, -12.21>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42, -11.99>, <-12.32,  -0.36, -12.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14, -12.92>, <-12.32,  -0.36, -12.45>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, < -8.43,   0.47,  -6.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -8.43,   0.47,  -6.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, < -9.50,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45,  -8.31>, < -9.50,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, < -8.77,   0.07,  -7.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -8.77,   0.07,  -7.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -7.49,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14,  -7.12>, < -7.49,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -7.43,   0.03,  -7.51>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -7.43,   0.03,  -7.51>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -8.49,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45,  -8.31>, < -8.49,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -6.84,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06, -10.42>, < -6.84,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06, -10.42>, < -6.51,   0.24, -11.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42, -11.99>, < -6.51,   0.24, -11.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -7.16,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14,  -7.12>, < -7.16,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52, -12.44>, < -8.43,   0.47, -12.21>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42, -11.99>, < -8.43,   0.47, -12.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52, -12.44>, < -8.77,   0.07, -13.54>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37, -14.64>, < -8.77,   0.07, -13.54>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52, -12.44>, < -9.50,   0.48, -13.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45, -14.11>, < -9.50,   0.48, -13.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37, -14.64>, < -7.43,   0.03, -13.31>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42, -11.99>, < -7.43,   0.03, -13.31>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37, -14.64>, < -6.84,  -0.15, -15.43>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06, -16.22>, < -6.84,  -0.15, -15.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37, -14.64>, < -8.49,   0.04, -14.37>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45, -14.11>, < -8.49,   0.04, -14.37>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37, -14.64>, < -7.49,  -0.75, -13.78>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14, -12.92>, < -7.49,  -0.75, -13.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42, -11.99>, < -7.16,  -0.36, -12.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14, -12.92>, < -7.16,  -0.36, -12.45>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
