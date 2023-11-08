#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.70*x up 36.52*y
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

cylinder {<-15.39, -17.39, -18.62>, < 15.57, -17.39, -18.62>, Rcell pigment {Black}}
cylinder {<-15.39,  17.39, -18.62>, < 15.57,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {<-15.39,  17.39,   0.00>, < 15.57,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.39, -17.39,   0.00>, < 15.57, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.39, -17.39, -18.62>, <-15.39,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {< 15.57, -17.39, -18.62>, < 15.57,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {< 15.57, -17.39,   0.00>, < 15.57,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.39, -17.39,   0.00>, <-15.39,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.39, -17.39, -18.62>, <-15.39, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {< 15.57, -17.39, -18.62>, < 15.57, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {< 15.57,  17.39, -18.62>, < 15.57,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.39,  17.39, -18.62>, <-15.39,  17.39,   0.00>, Rcell pigment {Black}}
atom(<-14.93, -10.74,  -8.79>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<-12.92,  -8.55,  -9.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #1
atom(<-11.08,  -6.97,  -9.25>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-14.39,  -9.08,  -8.86>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(<-12.26, -11.20,  -8.89>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.39, -10.27, -10.44>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #5
atom(<-14.93,  -4.95,  -8.79>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #6
atom(<-12.92,  -2.75,  -9.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #7
atom(<-11.08,  -1.17,  -9.25>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-14.39,  -3.28,  -8.86>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(<-12.26,  -5.40,  -8.89>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-12.39,  -4.47, -10.44>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -9.77, -10.74,  -8.79>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(< -7.76,  -8.55,  -9.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -5.92,  -6.97,  -9.25>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -9.23,  -9.08,  -8.86>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #15
atom(< -7.10, -11.20,  -8.89>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -7.23, -10.27, -10.44>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(< -9.77,  -4.95,  -8.79>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #18
atom(< -7.76,  -2.75,  -9.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #19
atom(< -5.92,  -1.17,  -9.25>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -9.23,  -3.28,  -8.86>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #21
atom(< -7.10,  -5.40,  -8.89>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -7.23,  -4.47, -10.44>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #23
cylinder {<-14.93, -10.74,  -8.79>, <-13.93,  -9.65,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.55,  -9.68>, <-13.93,  -9.65,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93, -10.74,  -8.79>, <-14.66,  -9.91,  -8.82>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,  -9.08,  -8.86>, <-14.66,  -9.91,  -8.82>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-14.93, -10.74,  -8.79>, <-13.60, -10.97,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26, -11.20,  -8.89>, <-13.60, -10.97,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.55,  -9.68>, <-13.66,  -8.81,  -9.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,  -9.08,  -8.86>, <-13.66,  -8.81,  -9.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.55,  -9.68>, <-12.59,  -9.87,  -9.28>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26, -11.20,  -8.89>, <-12.59,  -9.87,  -9.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.55,  -9.68>, <-12.66,  -9.41, -10.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39, -10.27, -10.44>, <-12.66,  -9.41, -10.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.55,  -9.68>, <-12.00,  -7.76,  -9.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,  -6.97,  -9.25>, <-12.00,  -7.76,  -9.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,  -6.97,  -9.25>, <-11.67,  -6.18,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,  -5.40,  -8.89>, <-11.67,  -6.18,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,  -6.97,  -9.25>, <-10.43,  -5.96,  -9.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,  -4.95,  -8.79>, <-10.43,  -5.96,  -9.02>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26, -11.20,  -8.89>, <-12.32, -10.73,  -9.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.39, -10.27, -10.44>, <-12.32, -10.73,  -9.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26, -11.20,  -8.89>, <-11.02, -10.97,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77, -10.74,  -8.79>, <-11.02, -10.97,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,  -4.95,  -8.79>, <-13.60,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,  -5.40,  -8.89>, <-13.60,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,  -4.95,  -8.79>, <-13.93,  -3.85,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -2.75,  -9.68>, <-13.93,  -3.85,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.93,  -4.95,  -8.79>, <-14.66,  -4.11,  -8.82>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,  -3.28,  -8.86>, <-14.66,  -4.11,  -8.82>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -2.75,  -9.68>, <-12.59,  -4.08,  -9.28>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,  -5.40,  -8.89>, <-12.59,  -4.08,  -9.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -2.75,  -9.68>, <-13.66,  -3.02,  -9.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-14.39,  -3.28,  -8.86>, <-13.66,  -3.02,  -9.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -2.75,  -9.68>, <-12.00,  -1.96,  -9.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.08,  -1.17,  -9.25>, <-12.00,  -1.96,  -9.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -2.75,  -9.68>, <-12.66,  -3.61, -10.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -4.47, -10.44>, <-12.66,  -3.61, -10.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,  -5.40,  -8.89>, <-11.02,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,  -4.95,  -8.79>, <-11.02,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.26,  -5.40,  -8.89>, <-12.32,  -4.94,  -9.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.39,  -4.47, -10.44>, <-12.32,  -4.94,  -9.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77, -10.74,  -8.79>, < -8.43, -10.97,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10, -11.20,  -8.89>, < -8.43, -10.97,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77, -10.74,  -8.79>, < -9.50,  -9.91,  -8.82>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,  -9.08,  -8.86>, < -9.50,  -9.91,  -8.82>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77, -10.74,  -8.79>, < -8.77,  -9.65,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -8.55,  -9.68>, < -8.77,  -9.65,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -8.55,  -9.68>, < -7.49,  -9.41, -10.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23, -10.27, -10.44>, < -7.49,  -9.41, -10.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -8.55,  -9.68>, < -7.43,  -9.87,  -9.28>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10, -11.20,  -8.89>, < -7.43,  -9.87,  -9.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -8.55,  -9.68>, < -8.49,  -8.81,  -9.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,  -9.08,  -8.86>, < -8.49,  -8.81,  -9.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -8.55,  -9.68>, < -6.84,  -7.76,  -9.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,  -6.97,  -9.25>, < -6.84,  -7.76,  -9.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,  -6.97,  -9.25>, < -6.51,  -6.18,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,  -5.40,  -8.89>, < -6.51,  -6.18,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.10, -11.20,  -8.89>, < -7.16, -10.73,  -9.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.23, -10.27, -10.44>, < -7.16, -10.73,  -9.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,  -4.95,  -8.79>, < -8.43,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,  -5.40,  -8.89>, < -8.43,  -5.18,  -8.84>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,  -4.95,  -8.79>, < -8.77,  -3.85,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -2.75,  -9.68>, < -8.77,  -3.85,  -9.23>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.77,  -4.95,  -8.79>, < -9.50,  -4.11,  -8.82>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,  -3.28,  -8.86>, < -9.50,  -4.11,  -8.82>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -2.75,  -9.68>, < -7.43,  -4.08,  -9.28>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,  -5.40,  -8.89>, < -7.43,  -4.08,  -9.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -2.75,  -9.68>, < -6.84,  -1.96,  -9.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.92,  -1.17,  -9.25>, < -6.84,  -1.96,  -9.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -2.75,  -9.68>, < -8.49,  -3.02,  -9.27>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.23,  -3.28,  -8.86>, < -8.49,  -3.02,  -9.27>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.76,  -2.75,  -9.68>, < -7.49,  -3.61, -10.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -4.47, -10.44>, < -7.49,  -3.61, -10.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -7.10,  -5.40,  -8.89>, < -7.16,  -4.94,  -9.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.23,  -4.47, -10.44>, < -7.16,  -4.94,  -9.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
