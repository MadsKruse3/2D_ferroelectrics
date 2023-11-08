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
cylinder {<-15.39,  -9.31, -28.98>, < 15.57,  -9.31, -28.98>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31, -28.98>, < 15.57,   9.31, -28.98>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31,   0.00>, < 15.57,   9.31,  -0.00>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31,  -0.00>, <-15.39,  -9.31, -28.98>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31,  -0.00>, < 15.57,  -9.31, -28.98>, Rcell pigment {Black}}
cylinder {< 15.57,   9.31,  -0.00>, < 15.57,   9.31, -28.98>, Rcell pigment {Black}}
cylinder {<-15.39,   9.31,   0.00>, <-15.39,   9.31, -28.98>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31,  -0.00>, <-15.39,   9.31,   0.00>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31,  -0.00>, < 15.57,   9.31,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.57,  -9.31, -28.98>, < 15.57,   9.31, -28.98>, Rcell pigment {Black}}
cylinder {<-15.39,  -9.31, -28.98>, <-15.39,   9.31, -28.98>, Rcell pigment {Black}}
atom(<-12.92,  -0.37,  -3.04>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<-11.08,   0.06,  -4.63>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(<-14.39,   0.45,  -2.51>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #2
atom(<-12.39,  -1.14,  -1.32>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(<-14.93,   0.52,  -6.65>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #4
atom(<-12.92,  -0.37,  -8.84>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #5
atom(<-11.08,   0.06, -10.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-14.39,   0.45,  -8.31>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #7
atom(<-12.26,   0.42,  -6.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-12.39,  -1.14,  -7.12>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(< -7.76,  -0.37,  -3.04>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #10
atom(< -5.92,   0.06,  -4.63>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(< -9.23,   0.45,  -2.51>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #12
atom(< -7.23,  -1.14,  -1.32>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #13
atom(< -9.77,   0.52,  -6.65>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #14
atom(< -7.76,  -0.37,  -8.84>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #15
atom(< -5.92,   0.06, -10.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -9.23,   0.45,  -8.31>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(< -7.10,   0.42,  -6.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -7.23,  -1.14,  -7.12>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #19
atom(< -4.61,   0.52,  -6.65>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #20
cylinder {<-12.92,  -0.37,  -3.04>, <-12.00,  -0.15,  -3.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06,  -4.63>, <-12.00,  -0.15,  -3.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -3.04>, <-13.66,   0.04,  -2.78>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45,  -2.51>, <-13.66,   0.04,  -2.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -3.04>, <-12.66,  -0.75,  -2.18>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14,  -1.32>, <-12.66,  -0.75,  -2.18>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06,  -4.63>, <-11.67,   0.24,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-11.67,   0.24,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06,  -4.63>, <-10.43,   0.29,  -5.64>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, <-10.43,   0.29,  -5.64>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,   0.52,  -6.65>, <-14.66,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45,  -8.31>, <-14.66,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-12.00,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,   0.06, -10.42>, <-12.00,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-13.66,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,   0.45,  -8.31>, <-13.66,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.37,  -8.84>, <-12.66,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14,  -7.12>, <-12.66,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-12.32,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -1.14,  -7.12>, <-12.32,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,   0.42,  -6.19>, <-11.02,   0.47,  -6.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, <-11.02,   0.47,  -6.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -3.04>, < -8.49,   0.04,  -2.78>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45,  -2.51>, < -8.49,   0.04,  -2.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -3.04>, < -7.49,  -0.75,  -2.18>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14,  -1.32>, < -7.49,  -0.75,  -2.18>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -3.04>, < -6.84,  -0.15,  -3.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06,  -4.63>, < -6.84,  -0.15,  -3.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06,  -4.63>, < -6.51,   0.24,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -6.51,   0.24,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06,  -4.63>, < -5.27,   0.29,  -5.64>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.61,   0.52,  -6.65>, < -5.27,   0.29,  -5.64>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,   0.52,  -6.65>, < -9.50,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45,  -8.31>, < -9.50,   0.48,  -7.48>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -8.49,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,   0.45,  -8.31>, < -8.49,   0.04,  -8.58>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -6.84,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,   0.06, -10.42>, < -6.84,  -0.15,  -9.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -0.37,  -8.84>, < -7.49,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14,  -7.12>, < -7.49,  -0.75,  -7.98>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -7.16,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -1.14,  -7.12>, < -7.16,  -0.36,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,   0.42,  -6.19>, < -5.85,   0.47,  -6.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.61,   0.52,  -6.65>, < -5.85,   0.47,  -6.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
// no constraints
