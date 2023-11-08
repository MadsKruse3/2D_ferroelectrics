#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -39.40*x up 21.80*y
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

cylinder {<-18.73,  -7.71,  -0.00>, < 18.76,  -7.71,  -0.00>, Rcell pigment {Black}}
cylinder {<-18.73,  -7.71, -27.01>, < 18.76,  -7.71, -27.01>, Rcell pigment {Black}}
cylinder {<-18.73,  10.38, -27.01>, < 18.76,  10.38, -27.01>, Rcell pigment {Black}}
cylinder {<-18.73,  10.38,   0.00>, < 18.76,  10.38,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73,  -7.71,  -0.00>, <-18.73,  -7.71, -27.01>, Rcell pigment {Black}}
cylinder {< 18.76,  -7.71,  -0.00>, < 18.76,  -7.71, -27.01>, Rcell pigment {Black}}
cylinder {< 18.76,  10.38,   0.00>, < 18.76,  10.38, -27.01>, Rcell pigment {Black}}
cylinder {<-18.73,  10.38,   0.00>, <-18.73,  10.38, -27.01>, Rcell pigment {Black}}
cylinder {<-18.73,  -7.71,  -0.00>, <-18.73,  10.38,   0.00>, Rcell pigment {Black}}
cylinder {< 18.76,  -7.71,  -0.00>, < 18.76,  10.38,   0.00>, Rcell pigment {Black}}
cylinder {< 18.76,  -7.71, -27.01>, < 18.76,  10.38, -27.01>, Rcell pigment {Black}}
cylinder {<-18.73,  -7.71, -27.01>, <-18.73,  10.38, -27.01>, Rcell pigment {Black}}
atom(<-18.24,  -6.40,  -7.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-17.91,  -9.84,  -6.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(<-17.15,  -8.31,  -2.74>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #2
atom(<-14.05,  -7.12,  -2.66>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #3
atom(<-15.60,  -7.71,  -5.40>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #4
atom(<-12.48,  -7.71,  -5.40>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #5
atom(<-16.45,  -9.86,  -4.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-14.76,  -5.56,  -6.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-16.07,  -6.38,  -3.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-15.13,  -9.04,  -7.30>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<-12.97,  -9.02,  -3.52>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-11.99,  -6.40,  -7.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<-13.29,  -5.58,  -4.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<-11.66,  -9.84,  -6.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-17.15,  -8.31,  -8.14>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #14
atom(<-14.05,  -7.12,  -8.07>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #15
atom(<-15.60,  -7.71, -10.81>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #16
atom(<-12.48,  -7.71, -10.81>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #17
atom(<-16.45,  -9.86,  -9.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(<-16.07,  -6.38,  -8.91>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #19
atom(<-12.97,  -9.02,  -8.92>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<-13.29,  -5.58,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-10.90,  -8.31,  -2.74>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #22
atom(< -9.35,  -7.71,  -5.40>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #23
atom(<-10.20,  -9.86,  -4.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -9.82,  -6.38,  -3.50>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -8.88,  -9.04,  -7.30>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(<-10.90,  -8.31,  -8.14>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #27
atom(< -9.35,  -7.71, -10.81>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #28
atom(<-10.20,  -9.86,  -9.99>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -9.82,  -6.38,  -8.91>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
cylinder {<-18.24,  -6.40,  -7.29>, <-17.69,  -7.35,  -7.71>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-17.69,  -7.35,  -7.71>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.91,  -9.84,  -6.24>, <-17.18,  -9.85,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -9.86,  -4.59>, <-17.18,  -9.85,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.91,  -9.84,  -6.24>, <-17.53,  -9.07,  -7.19>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-17.53,  -9.07,  -7.19>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -2.74>, <-16.38,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-16.38,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -2.74>, <-16.80,  -9.08,  -3.66>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -9.86,  -4.59>, <-16.80,  -9.08,  -3.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -2.66>, <-13.27,  -7.41,  -4.03>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-13.27,  -7.41,  -4.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -2.66>, <-15.06,  -6.75,  -3.08>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -3.50>, <-15.06,  -6.75,  -3.08>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -2.66>, <-13.67,  -6.35,  -3.62>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -5.58,  -4.57>, <-13.67,  -6.35,  -3.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -2.66>, <-14.83,  -7.41,  -4.03>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-14.83,  -7.41,  -4.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -2.66>, <-13.51,  -8.07,  -3.09>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -3.52>, <-13.51,  -8.07,  -3.09>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-16.03,  -8.78,  -4.99>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -9.86,  -4.59>, <-16.03,  -8.78,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-16.38,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-16.38,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-15.37,  -8.38,  -6.35>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -9.04,  -7.30>, <-15.37,  -8.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-13.27,  -7.41,  -6.73>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-13.27,  -7.41,  -6.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-12.23,  -7.06,  -6.34>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.40,  -7.29>, <-12.23,  -7.06,  -6.34>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-12.89,  -6.65,  -4.99>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -5.58,  -4.57>, <-12.89,  -6.65,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-14.04,  -7.71,  -5.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-14.04,  -7.71,  -5.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-12.72,  -8.37,  -4.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -3.52>, <-12.72,  -8.37,  -4.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-12.07,  -8.77,  -5.82>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -9.84,  -6.24>, <-12.07,  -8.77,  -5.82>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-11.69,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -2.74>, <-11.69,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-10.92,  -7.71,  -5.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, <-10.92,  -7.71,  -5.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71,  -5.40>, <-11.69,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-11.69,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -5.56,  -6.22>, <-14.41,  -6.34,  -7.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-14.41,  -6.34,  -7.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -5.56,  -6.22>, <-14.02,  -5.57,  -5.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -5.58,  -4.57>, <-14.02,  -5.57,  -5.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -5.56,  -6.22>, <-15.18,  -6.64,  -5.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-15.18,  -6.64,  -5.81>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -3.50>, <-15.84,  -7.05,  -4.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-15.84,  -7.05,  -4.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -3.50>, <-16.61,  -7.34,  -3.12>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -2.74>, <-16.61,  -7.34,  -3.12>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -9.04,  -7.30>, <-16.14,  -8.67,  -7.72>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-16.14,  -8.67,  -7.72>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -3.52>, <-11.93,  -8.66,  -3.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -2.74>, <-11.93,  -8.66,  -3.13>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.40,  -7.29>, <-13.02,  -6.76,  -7.68>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-13.02,  -6.76,  -7.68>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.40,  -7.29>, <-11.45,  -7.35,  -7.71>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-11.45,  -7.35,  -7.71>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -9.84,  -6.24>, <-10.93,  -9.85,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -9.86,  -4.59>, <-10.93,  -9.85,  -5.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -9.84,  -6.24>, <-11.28,  -9.07,  -7.19>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-11.28,  -9.07,  -7.19>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-16.80,  -9.08,  -9.07>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -9.86,  -9.99>, <-16.80,  -9.08,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-16.38,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71, -10.81>, <-16.38,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-15.06,  -6.75,  -8.49>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -8.91>, <-15.06,  -6.75,  -8.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-13.27,  -7.41,  -9.44>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-13.27,  -7.41,  -9.44>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-13.67,  -6.35,  -9.02>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -5.58,  -9.97>, <-13.67,  -6.35,  -9.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-14.83,  -7.41,  -6.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71,  -5.40>, <-14.83,  -7.41,  -6.73>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-14.59,  -8.08,  -7.68>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -9.04,  -7.30>, <-14.59,  -8.08,  -7.68>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-14.83,  -7.41,  -9.44>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71, -10.81>, <-14.83,  -7.41,  -9.44>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -7.12,  -8.07>, <-13.51,  -8.07,  -8.49>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -8.92>, <-13.51,  -8.07,  -8.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71, -10.81>, <-16.03,  -8.78, -10.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -9.86,  -9.99>, <-16.03,  -8.78, -10.40>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-12.89,  -6.65, -10.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -5.58,  -9.97>, <-12.89,  -6.65, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-14.04,  -7.71, -10.81>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71, -10.81>, <-14.04,  -7.71, -10.81>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-12.72,  -8.37,  -9.86>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -8.92>, <-12.72,  -8.37,  -9.86>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-11.69,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-11.69,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -7.71, -10.81>, <-10.92,  -7.71, -10.81>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71, -10.81>, <-10.92,  -7.71, -10.81>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -8.91>, <-16.61,  -7.34,  -8.52>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -8.31,  -8.14>, <-16.61,  -7.34,  -8.52>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -6.38,  -8.91>, <-15.84,  -7.05,  -9.86>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -7.71, -10.81>, <-15.84,  -7.05,  -9.86>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.02,  -8.92>, <-11.93,  -8.66,  -8.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-11.93,  -8.66,  -8.53>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -2.74>, <-10.13,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, <-10.13,  -8.01,  -4.07>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -2.74>, <-10.55,  -9.08,  -3.66>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -9.86,  -4.59>, <-10.55,  -9.08,  -3.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, < -9.78,  -8.78,  -4.99>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -9.86,  -4.59>, < -9.78,  -8.78,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, <-10.13,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-10.13,  -8.01,  -6.77>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, < -9.12,  -8.38,  -6.35>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.88,  -9.04,  -7.30>, < -9.12,  -8.38,  -6.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -6.38,  -3.50>, <-10.36,  -7.34,  -3.12>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -2.74>, <-10.36,  -7.34,  -3.12>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -6.38,  -3.50>, < -9.59,  -7.05,  -4.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71,  -5.40>, < -9.59,  -7.05,  -4.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.88,  -9.04,  -7.30>, < -9.89,  -8.67,  -7.72>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, < -9.89,  -8.67,  -7.72>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-10.55,  -9.08,  -9.07>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -9.86,  -9.99>, <-10.55,  -9.08,  -9.07>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-10.13,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71, -10.81>, <-10.13,  -8.01,  -9.47>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71, -10.81>, < -9.78,  -8.78, -10.40>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -9.86,  -9.99>, < -9.78,  -8.78, -10.40>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -6.38,  -8.91>, <-10.36,  -7.34,  -8.52>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -8.31,  -8.14>, <-10.36,  -7.34,  -8.52>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -6.38,  -8.91>, < -9.59,  -7.05,  -9.86>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -7.71, -10.81>, < -9.59,  -7.05,  -9.86>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
// no constraints
