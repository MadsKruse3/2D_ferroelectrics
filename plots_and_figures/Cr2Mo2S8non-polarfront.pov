#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -39.40*x up 28.36*y
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

cylinder {<-18.73, -13.51, -18.09>, < 18.76, -13.51, -18.09>, Rcell pigment {Black}}
cylinder {<-18.73,  13.51, -18.09>, < 18.76,  13.51, -18.09>, Rcell pigment {Black}}
cylinder {<-18.73,  13.51,   0.00>, < 18.76,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73, -13.51,   0.00>, < 18.76, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73, -13.51, -18.09>, <-18.73,  13.51, -18.09>, Rcell pigment {Black}}
cylinder {< 18.76, -13.51, -18.09>, < 18.76,  13.51, -18.09>, Rcell pigment {Black}}
cylinder {< 18.76, -13.51,   0.00>, < 18.76,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73, -13.51,   0.00>, <-18.73,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73, -13.51, -18.09>, <-18.73, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {< 18.76, -13.51, -18.09>, < 18.76, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {< 18.76,  13.51, -18.09>, < 18.76,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.73,  13.51, -18.09>, <-18.73,  13.51,   0.00>, Rcell pigment {Black}}
atom(<-18.24,  -6.22, -16.78>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-17.91,  -7.27, -20.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(<-17.15, -10.77, -18.69>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #2
atom(<-14.05, -10.84, -17.50>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #3
atom(<-15.60,  -8.10, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #4
atom(<-12.48,  -8.10, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #5
atom(<-16.45,  -8.92, -20.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-14.76,  -7.29, -15.95>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-16.07, -10.00, -16.76>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-15.13,  -6.20, -19.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<-12.97,  -9.99, -19.40>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-11.99,  -6.22, -16.78>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<-13.29,  -8.94, -15.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<-11.66,  -7.27, -20.22>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-17.15,  -5.37, -18.69>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #14
atom(<-14.05,  -5.44, -17.50>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #15
atom(<-15.60,  -2.70, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #16
atom(<-12.48,  -2.70, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #17
atom(<-16.45,  -3.52, -20.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(<-16.07,  -4.60, -16.76>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #19
atom(<-12.97,  -4.59, -19.40>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<-13.29,  -3.53, -15.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-10.90, -10.77, -18.69>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #22
atom(< -9.35,  -8.10, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #23
atom(<-10.20,  -8.92, -20.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -9.82, -10.00, -16.76>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -8.88,  -6.20, -19.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(<-10.90,  -5.37, -18.69>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #27
atom(< -9.35,  -2.70, -18.09>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #28
atom(<-10.20,  -3.52, -20.24>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(< -9.82,  -4.60, -16.76>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
cylinder {<-18.24,  -6.22, -16.78>, <-17.69,  -5.79, -17.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-17.69,  -5.79, -17.74>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.91,  -7.27, -20.22>, <-17.18,  -8.10, -20.23>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -8.92, -20.24>, <-17.18,  -8.10, -20.23>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.91,  -7.27, -20.22>, <-17.53,  -6.32, -19.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-17.53,  -6.32, -19.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.15, -10.77, -18.69>, <-16.38,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-16.38,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.15, -10.77, -18.69>, <-16.80,  -9.84, -19.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -8.92, -20.24>, <-16.80,  -9.84, -19.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -10.84, -17.50>, <-13.27,  -9.47, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-13.27,  -9.47, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -10.84, -17.50>, <-15.06, -10.42, -17.13>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07, -10.00, -16.76>, <-15.06, -10.42, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -10.84, -17.50>, <-13.67,  -9.89, -16.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -8.94, -15.97>, <-13.67,  -9.89, -16.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -10.84, -17.50>, <-14.83,  -9.47, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-14.83,  -9.47, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05, -10.84, -17.50>, <-13.51, -10.42, -18.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.99, -19.40>, <-13.51, -10.42, -18.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-16.03,  -8.51, -19.17>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -8.92, -20.24>, <-16.03,  -8.51, -19.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-16.38,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-16.38,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-15.37,  -7.15, -18.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -6.20, -19.42>, <-15.37,  -7.15, -18.76>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-13.27,  -6.77, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-13.27,  -6.77, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-12.23,  -7.16, -17.44>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.22, -16.78>, <-12.23,  -7.16, -17.44>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-12.89,  -8.52, -17.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -8.94, -15.97>, <-12.89,  -8.52, -17.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-14.04,  -8.10, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-14.04,  -8.10, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-12.72,  -9.05, -18.75>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.99, -19.40>, <-12.72,  -9.05, -18.75>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-12.07,  -7.69, -19.16>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -7.27, -20.22>, <-12.07,  -7.69, -19.16>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-11.69,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90, -10.77, -18.69>, <-11.69,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-10.92,  -8.10, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, <-10.92,  -8.10, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -8.10, -18.09>, <-11.69,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-11.69,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.29, -15.95>, <-14.41,  -6.36, -16.72>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-14.41,  -6.36, -16.72>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.29, -15.95>, <-14.02,  -8.11, -15.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -8.94, -15.97>, <-14.02,  -8.11, -15.96>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.29, -15.95>, <-15.18,  -7.70, -17.02>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-15.18,  -7.70, -17.02>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07, -10.00, -16.76>, <-15.84,  -9.05, -17.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-15.84,  -9.05, -17.43>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07, -10.00, -16.76>, <-16.61, -10.39, -17.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15, -10.77, -18.69>, <-16.61, -10.39, -17.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -6.20, -19.42>, <-16.14,  -5.78, -19.06>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-16.14,  -5.78, -19.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -9.99, -19.40>, <-11.93, -10.38, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90, -10.77, -18.69>, <-11.93, -10.38, -19.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.22, -16.78>, <-13.02,  -5.83, -17.14>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-13.02,  -5.83, -17.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -6.22, -16.78>, <-11.45,  -5.79, -17.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-11.45,  -5.79, -17.74>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -7.27, -20.22>, <-10.93,  -8.10, -20.23>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -8.92, -20.24>, <-10.93,  -8.10, -20.23>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.66,  -7.27, -20.22>, <-11.28,  -6.32, -19.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-11.28,  -6.32, -19.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-16.80,  -4.44, -19.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -3.52, -20.24>, <-16.80,  -4.44, -19.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-16.38,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -2.70, -18.09>, <-16.38,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-15.06,  -5.02, -17.13>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -4.60, -16.76>, <-15.06,  -5.02, -17.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-13.27,  -4.07, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-13.27,  -4.07, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-13.67,  -4.49, -16.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -3.53, -15.97>, <-13.67,  -4.49, -16.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-14.83,  -6.77, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -8.10, -18.09>, <-14.83,  -6.77, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-14.59,  -5.82, -18.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.13,  -6.20, -19.42>, <-14.59,  -5.82, -18.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-14.83,  -4.07, -17.80>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -2.70, -18.09>, <-14.83,  -4.07, -17.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -5.44, -17.50>, <-13.51,  -5.01, -18.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -4.59, -19.40>, <-13.51,  -5.01, -18.45>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -2.70, -18.09>, <-16.03,  -3.11, -19.17>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.45,  -3.52, -20.24>, <-16.03,  -3.11, -19.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-12.89,  -3.12, -17.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-13.29,  -3.53, -15.97>, <-12.89,  -3.12, -17.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-14.04,  -2.70, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -2.70, -18.09>, <-14.04,  -2.70, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-12.72,  -3.64, -18.75>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -4.59, -19.40>, <-12.72,  -3.64, -18.75>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-11.69,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-11.69,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.48,  -2.70, -18.09>, <-10.92,  -2.70, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -2.70, -18.09>, <-10.92,  -2.70, -18.09>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -4.60, -16.76>, <-16.61,  -4.98, -17.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.15,  -5.37, -18.69>, <-16.61,  -4.98, -17.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-16.07,  -4.60, -16.76>, <-15.84,  -3.65, -17.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.60,  -2.70, -18.09>, <-15.84,  -3.65, -17.43>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.97,  -4.59, -19.40>, <-11.93,  -4.98, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-11.93,  -4.98, -19.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.90, -10.77, -18.69>, <-10.13,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, <-10.13,  -9.44, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90, -10.77, -18.69>, <-10.55,  -9.84, -19.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -8.92, -20.24>, <-10.55,  -9.84, -19.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, < -9.78,  -8.51, -19.17>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -8.92, -20.24>, < -9.78,  -8.51, -19.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, <-10.13,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-10.13,  -6.73, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, < -9.12,  -7.15, -18.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.88,  -6.20, -19.42>, < -9.12,  -7.15, -18.76>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.82, -10.00, -16.76>, <-10.36, -10.39, -17.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90, -10.77, -18.69>, <-10.36, -10.39, -17.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.82, -10.00, -16.76>, < -9.59,  -9.05, -17.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -8.10, -18.09>, < -9.59,  -9.05, -17.43>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -8.88,  -6.20, -19.42>, < -9.89,  -5.78, -19.06>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, < -9.89,  -5.78, -19.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-10.55,  -4.44, -19.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -3.52, -20.24>, <-10.55,  -4.44, -19.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-10.13,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -2.70, -18.09>, <-10.13,  -4.03, -18.39>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -2.70, -18.09>, < -9.78,  -3.11, -19.17>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.20,  -3.52, -20.24>, < -9.78,  -3.11, -19.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -4.60, -16.76>, <-10.36,  -4.98, -17.73>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.90,  -5.37, -18.69>, <-10.36,  -4.98, -17.73>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.82,  -4.60, -16.76>, < -9.59,  -3.65, -17.43>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.35,  -2.70, -18.09>, < -9.59,  -3.65, -17.43>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
// no constraints
