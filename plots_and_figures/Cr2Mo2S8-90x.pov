#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -39.36*x up 19.00*y
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

cylinder {<-18.74,  -9.05,  -0.00>, < 18.74,  -9.05,  -0.00>, Rcell pigment {Black}}
cylinder {<-18.74,  -9.05, -32.42>, < 18.74,  -9.05, -32.42>, Rcell pigment {Black}}
cylinder {<-18.74,   9.05, -32.42>, < 18.74,   9.05, -32.42>, Rcell pigment {Black}}
cylinder {<-18.74,   9.05,   0.00>, < 18.74,   9.05,   0.00>, Rcell pigment {Black}}
cylinder {<-18.74,  -9.05,  -0.00>, <-18.74,  -9.05, -32.42>, Rcell pigment {Black}}
cylinder {< 18.74,  -9.05,  -0.00>, < 18.74,  -9.05, -32.42>, Rcell pigment {Black}}
cylinder {< 18.74,   9.05,   0.00>, < 18.74,   9.05, -32.42>, Rcell pigment {Black}}
cylinder {<-18.74,   9.05,   0.00>, <-18.74,   9.05, -32.42>, Rcell pigment {Black}}
cylinder {<-18.74,  -9.05,  -0.00>, <-18.74,   9.05,   0.00>, Rcell pigment {Black}}
cylinder {< 18.74,  -9.05,  -0.00>, < 18.74,   9.05,   0.00>, Rcell pigment {Black}}
cylinder {< 18.74,  -9.05, -32.42>, < 18.74,   9.05, -32.42>, Rcell pigment {Black}}
cylinder {<-18.74,  -9.05, -32.42>, <-18.74,   9.05, -32.42>, Rcell pigment {Black}}
atom(<-17.18,   0.00,  -2.70>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #0
atom(<-14.05,   0.00,  -2.70>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #1
atom(<-17.18,   1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-17.18,  -1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #3
atom(<-15.62,  -1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-14.05,   1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<-15.62,   1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<-14.05,  -1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-15.62,   0.00,  -5.42>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #8
atom(<-17.18,   0.00,  -8.10>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #9
atom(<-14.05,   0.00,  -8.10>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #10
atom(<-17.18,   1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<-17.18,  -1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<-15.62,  -1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<-14.05,   1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(<-15.62,   1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(<-14.05,  -1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(<-15.62,   0.00, -10.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #17
atom(<-10.93,   0.00,  -2.70>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #18
atom(< -7.81,   0.00,  -2.70>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #19
atom(<-12.49,  -1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<-10.93,   1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<-12.49,   1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(<-10.93,  -1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #23
atom(< -9.37,  -1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(< -7.80,   1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(< -9.37,   1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(< -7.81,  -1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #27
atom(<-12.49,   0.00,  -5.42>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #28
atom(< -9.37,   0.00,  -5.42>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #29
atom(<-10.93,   0.00,  -8.10>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #30
atom(< -7.81,   0.00,  -8.10>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #31
atom(<-12.49,  -1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(<-10.93,   1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(<-12.49,   1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #34
atom(<-10.93,  -1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #35
atom(< -9.37,  -1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(< -7.80,   1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(< -9.37,   1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #38
atom(< -7.81,  -1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #39
atom(<-12.49,   0.00, -10.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #40
atom(< -9.37,   0.00, -10.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #41
atom(< -4.68,   0.00,  -2.70>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #42
atom(< -6.24,  -1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #43
atom(< -4.68,   1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #44
atom(< -6.24,   1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #45
atom(< -4.68,  -1.49,  -4.56>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #46
atom(< -3.12,  -1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #47
atom(< -3.12,   1.55,  -1.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #48
atom(< -6.24,   0.00,  -5.42>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #49
atom(< -3.12,   0.00,  -5.42>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #50
atom(< -4.68,   0.00,  -8.10>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #51
atom(< -6.24,  -1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #52
atom(< -4.68,   1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #53
atom(< -6.24,   1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #54
atom(< -4.68,  -1.49,  -9.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #55
atom(< -3.12,  -1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #56
atom(< -3.12,   1.55,  -7.15>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #57
atom(< -6.24,   0.00, -10.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #58
atom(< -3.12,   0.00, -10.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #59
cylinder {<-17.18,   0.00,  -2.70>, <-15.62,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-15.62,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -2.70>, <-16.40,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -1.55,  -1.75>, <-16.40,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -2.70>, <-16.40,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   1.55,  -1.75>, <-16.40,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -2.70>, <-16.40,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-16.40,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -2.70>, <-17.18,   0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   1.49,  -4.56>, <-17.18,   0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -2.70>, <-17.18,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -1.49,  -4.56>, <-17.18,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-12.49,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-12.49,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-13.27,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -1.55,  -1.75>, <-13.27,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-13.27,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   1.55,  -1.75>, <-13.27,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-14.83,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -1.55,  -1.75>, <-14.83,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-14.83,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   1.55,  -1.75>, <-14.83,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-14.83,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-14.83,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-14.05,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -4.56>, <-14.05,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-14.05,   0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -4.56>, <-14.05,   0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -2.70>, <-13.27,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-13.27,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   1.49,  -4.56>, <-16.40,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-16.40,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -1.49,  -4.56>, <-16.40,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-16.40,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -4.56>, <-14.83,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-14.83,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -4.56>, <-13.27,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-13.27,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -4.56>, <-14.83,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-14.83,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -4.56>, <-13.27,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-13.27,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-15.62,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -1.55,  -7.15>, <-15.62,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-15.62,   0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   1.55,  -7.15>, <-15.62,   0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-14.83,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.83,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00,  -5.42>, <-16.40,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-16.40,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-16.40,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -1.55,  -7.15>, <-16.40,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-16.40,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   1.55,  -7.15>, <-16.40,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-16.40,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-16.40,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-17.18,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -1.49,  -9.97>, <-17.18,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-17.18,   0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   1.49,  -9.97>, <-17.18,   0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   0.00,  -8.10>, <-15.62,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-15.62,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-13.27,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-13.27,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.83,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,  -1.55,  -7.15>, <-14.83,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-13.27,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   1.55,  -7.15>, <-13.27,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.83,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   1.55,  -7.15>, <-14.83,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.83,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-14.83,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-13.27,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-13.27,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.05,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -9.97>, <-14.05,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-12.49,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-12.49,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-14.05,   0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -9.97>, <-14.05,   0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   0.00,  -8.10>, <-13.27,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -1.55,  -7.15>, <-13.27,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,   1.49,  -9.97>, <-16.40,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-16.40,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-17.18,  -1.49,  -9.97>, <-16.40,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-16.40,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -9.97>, <-14.83,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-14.83,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,   1.49,  -9.97>, <-13.27,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-13.27,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -9.97>, <-14.83,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-15.62,   0.00, -10.82>, <-14.83,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-14.05,  -1.49,  -9.97>, <-13.27,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-13.27,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-11.71,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -1.55,  -1.75>, <-11.71,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-11.71,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   1.55,  -1.75>, <-11.71,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-10.93,   0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -4.56>, <-10.93,   0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-10.93,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -4.56>, <-10.93,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-11.71,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-11.71,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-10.15,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   1.55,  -1.75>, <-10.15,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-10.15,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -1.55,  -1.75>, <-10.15,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, < -9.37,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -9.37,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -2.70>, <-10.15,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, <-10.15,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -8.59,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   1.55,  -1.75>, < -8.59,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -8.59,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -1.55,  -1.75>, < -8.59,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -7.02,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   1.55,  -1.75>, < -7.02,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -7.81,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -4.56>, < -7.81,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -7.80,   0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -4.56>, < -7.80,   0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -6.24,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -6.24,   0.00,  -2.70>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -7.02,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -1.55,  -1.75>, < -7.02,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -8.59,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -8.59,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -2.70>, < -7.02,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -7.02,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -4.56>, <-11.71,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-11.71,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -4.56>, <-10.15,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, <-10.15,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -4.56>, <-11.71,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-11.71,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -4.56>, <-10.15,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, <-10.15,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -4.56>, < -8.59,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -8.59,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -4.56>, < -7.02,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -7.02,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -4.56>, < -8.59,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -8.59,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -4.56>, < -7.02,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -7.02,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-12.49,   0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   1.55,  -7.15>, <-12.49,   0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-11.71,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-11.71,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00,  -5.42>, <-12.49,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -1.55,  -7.15>, <-12.49,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, <-10.15,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.15,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -9.37,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -1.55,  -7.15>, < -9.37,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -8.59,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -8.59,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00,  -5.42>, < -9.37,   0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   1.55,  -7.15>, < -9.37,   0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-11.71,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   1.55,  -7.15>, <-11.71,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-11.71,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-11.71,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-11.71,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,  -1.55,  -7.15>, <-11.71,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.93,   0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -9.97>, <-10.93,   0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.93,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -9.97>, <-10.93,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.15,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -1.55,  -7.15>, <-10.15,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, < -9.37,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -9.37,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.15,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   1.55,  -7.15>, <-10.15,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   0.00,  -8.10>, <-10.15,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, <-10.15,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.02,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -7.02,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -8.59,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,  -1.55,  -7.15>, < -8.59,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.02,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   1.55,  -7.15>, < -7.02,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -8.59,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   1.55,  -7.15>, < -8.59,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.02,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -1.55,  -7.15>, < -7.02,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -6.24,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -6.24,   0.00,  -8.10>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -8.59,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, < -8.59,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.81,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -9.97>, < -7.81,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.80,   0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -9.97>, < -7.80,   0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,   0.00,  -8.10>, < -7.02,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -7.02,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -9.97>, <-11.71,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-11.71,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,   1.49,  -9.97>, <-10.15,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, <-10.15,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -9.97>, <-11.71,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.49,   0.00, -10.82>, <-11.71,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<-10.93,  -1.49,  -9.97>, <-10.15,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, <-10.15,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -9.97>, < -8.59,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, < -8.59,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.80,   1.49,  -9.97>, < -7.02,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -7.02,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -9.97>, < -8.59,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.37,   0.00, -10.82>, < -8.59,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -7.81,  -1.49,  -9.97>, < -7.02,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -7.02,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -3.90,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,  -1.55,  -1.75>, < -3.90,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -5.46,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   1.55,  -1.75>, < -5.46,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -4.68,   0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -4.56>, < -4.68,   0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -5.46,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -1.55,  -1.75>, < -5.46,  -0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -3.90,   0.77,  -2.22>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   1.55,  -1.75>, < -3.90,   0.77,  -2.22>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -3.90,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.90,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -4.68,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -4.56>, < -4.68,  -0.75,  -3.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -2.70>, < -5.46,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -5.46,   0.00,  -4.06>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -4.56>, < -3.90,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.90,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -4.56>, < -5.46,   0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -5.46,   0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -4.56>, < -3.90,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.90,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -4.56>, < -5.46,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -5.46,  -0.75,  -4.99>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -6.24,   0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   1.55,  -7.15>, < -6.24,   0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -6.24,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -1.55,  -7.15>, < -6.24,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00,  -5.42>, < -5.46,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -5.46,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.12,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,  -1.55,  -7.15>, < -3.12,  -0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.12,   0.77,  -6.28>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   1.55,  -7.15>, < -3.12,   0.77,  -6.28>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00,  -5.42>, < -3.90,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -3.90,   0.00,  -6.76>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -3.90,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,  -1.55,  -7.15>, < -3.90,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -5.46,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   1.55,  -7.15>, < -5.46,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -3.90,   0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   1.55,  -7.15>, < -3.90,   0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -5.46,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,  -1.55,  -7.15>, < -5.46,  -0.77,  -7.63>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -4.68,   0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -9.97>, < -4.68,   0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -4.68,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -9.97>, < -4.68,  -0.75,  -9.03>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -5.46,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -5.46,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   0.00,  -8.10>, < -3.90,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00, -10.82>, < -3.90,   0.00,  -9.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -9.97>, < -5.46,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -5.46,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,   1.49,  -9.97>, < -3.90,   0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00, -10.82>, < -3.90,   0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -9.97>, < -5.46,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.24,   0.00, -10.82>, < -5.46,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {< -4.68,  -1.49,  -9.97>, < -3.90,  -0.75, -10.39>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -3.12,   0.00, -10.82>, < -3.90,  -0.75, -10.39>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
// no constraints
