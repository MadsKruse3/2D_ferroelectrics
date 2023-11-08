#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -36.70*x up 35.75*y
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

cylinder {< -6.17, -17.02,  -0.00>, < 17.47, -17.02,  -0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -17.02, -33.70>, < 17.47, -17.02, -33.70>, Rcell pigment {Black}}
cylinder {< -6.17,  17.02, -33.70>, < 17.47,  17.02, -33.70>, Rcell pigment {Black}}
cylinder {< -6.17,  17.02,   0.00>, < 17.47,  17.02,  -0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -17.02,  -0.00>, < -6.17, -17.02, -33.70>, Rcell pigment {Black}}
cylinder {< 17.47, -17.02,  -0.00>, < 17.47, -17.02, -33.70>, Rcell pigment {Black}}
cylinder {< 17.47,  17.02,  -0.00>, < 17.47,  17.02, -33.70>, Rcell pigment {Black}}
cylinder {< -6.17,  17.02,   0.00>, < -6.17,  17.02, -33.70>, Rcell pigment {Black}}
cylinder {< -6.17, -17.02,  -0.00>, < -6.17,  17.02,   0.00>, Rcell pigment {Black}}
cylinder {< 17.47, -17.02,  -0.00>, < 17.47,  17.02,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.47, -17.02, -33.70>, < 17.47,  17.02, -33.70>, Rcell pigment {Black}}
cylinder {< -6.17, -17.02, -33.70>, < -6.17,  17.02, -33.70>, Rcell pigment {Black}}
atom(< -9.91,   0.00,  -2.15>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #0
atom(<-11.39,  -1.94,  -1.95>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #1
atom(<-12.88,  -0.00,  -2.15>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #2
atom(<-11.40,   1.94,  -1.95>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #3
atom(<-16.65,   0.00,  -2.15>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #4
atom(<-14.76,  -1.67,  -1.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(<-14.76,   1.67,  -1.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(< -9.91,   0.00,  -6.09>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #7
atom(<-11.39,  -1.94,  -5.89>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(<-12.88,  -0.00,  -6.09>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(<-11.40,   1.94,  -5.89>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< -9.87,   0.00,  -3.92>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-16.65,   0.00,  -6.09>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #12
atom(<-14.76,  -1.67,  -5.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(<-14.76,   1.67,  -5.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(<-16.61,   0.00,  -3.92>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(<-12.92,  -0.00,  -3.92>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -9.91,   0.00, -10.03>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #17
atom(<-11.39,  -1.94,  -9.83>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<-12.88,  -0.00, -10.03>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(<-11.40,   1.94,  -9.83>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(< -9.87,   0.00,  -7.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(<-16.65,   0.00, -10.03>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #22
atom(<-14.76,  -1.67,  -9.79>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(<-14.76,   1.67,  -9.79>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(<-16.61,   0.00,  -7.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(<-12.92,  -0.00,  -7.86>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
cylinder {< -9.91,   0.00,  -2.15>, <-10.65,  -0.97,  -2.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -1.95>, <-10.65,  -0.97,  -2.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -2.15>, <-11.39,   0.00,  -2.15>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-11.39,   0.00,  -2.15>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -2.15>, <-10.65,   0.97,  -2.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -1.95>, <-10.65,   0.97,  -2.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -2.15>, < -9.89,   0.00,  -3.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,   0.00,  -3.92>, < -9.89,   0.00,  -3.03>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -1.95>, <-12.14,  -0.97,  -2.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-12.14,  -0.97,  -2.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-12.14,   0.97,  -2.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -1.95>, <-12.14,   0.97,  -2.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-13.82,  -0.84,  -2.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -1.91>, <-13.82,  -0.84,  -2.03>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-13.82,   0.84,  -2.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -1.91>, <-13.82,   0.84,  -2.03>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -2.15>, <-12.90,  -0.00,  -3.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.00,  -3.92>, <-12.90,  -0.00,  -3.03>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -2.15>, <-15.71,  -0.84,  -2.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -1.91>, <-15.71,  -0.84,  -2.03>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -2.15>, <-15.71,   0.84,  -2.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -1.91>, <-15.71,   0.84,  -2.03>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -2.15>, <-16.63,   0.00,  -3.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,   0.00,  -3.92>, <-16.63,   0.00,  -3.03>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -6.09>, < -9.89,   0.00,  -5.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,   0.00,  -3.92>, < -9.89,   0.00,  -5.00>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -6.09>, <-10.66,   0.97,  -5.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -5.89>, <-10.66,   0.97,  -5.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -6.09>, <-10.65,  -0.97,  -5.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -5.89>, <-10.65,  -0.97,  -5.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -6.09>, <-11.40,   0.00,  -6.09>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-11.40,   0.00,  -6.09>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00,  -6.09>, < -9.89,   0.00,  -6.98>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,   0.00,  -7.86>, < -9.89,   0.00,  -6.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -5.89>, <-12.14,  -0.97,  -5.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-12.14,  -0.97,  -5.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-13.82,  -0.84,  -5.97>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -5.85>, <-13.82,  -0.84,  -5.97>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-12.90,  -0.00,  -5.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.00,  -3.92>, <-12.90,  -0.00,  -5.00>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-12.14,   0.97,  -5.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -5.89>, <-12.14,   0.97,  -5.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-13.82,   0.84,  -5.97>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -5.85>, <-13.82,   0.84,  -5.97>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00,  -6.09>, <-12.90,  -0.00,  -6.98>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.00,  -7.86>, <-12.90,  -0.00,  -6.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -6.09>, <-15.71,  -0.84,  -5.97>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -5.85>, <-15.71,  -0.84,  -5.97>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -6.09>, <-16.63,   0.00,  -5.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,   0.00,  -3.92>, <-16.63,   0.00,  -5.00>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -6.09>, <-15.71,   0.84,  -5.97>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -5.85>, <-15.71,   0.84,  -5.97>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00,  -6.09>, <-16.63,   0.00,  -6.98>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,   0.00,  -7.86>, <-16.63,   0.00,  -6.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00, -10.03>, <-10.65,  -0.97,  -9.93>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -9.83>, <-10.65,  -0.97,  -9.93>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00, -10.03>, <-11.40,   0.00, -10.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-11.40,   0.00, -10.03>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00, -10.03>, <-10.66,   0.97,  -9.93>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -9.83>, <-10.66,   0.97,  -9.93>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,   0.00, -10.03>, < -9.89,   0.00,  -8.95>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,   0.00,  -7.86>, < -9.89,   0.00,  -8.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -1.94,  -9.83>, <-12.14,  -0.97,  -9.93>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-12.14,  -0.97,  -9.93>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-12.90,  -0.00,  -8.95>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -0.00,  -7.86>, <-12.90,  -0.00,  -8.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-12.14,   0.97,  -9.93>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,   1.94,  -9.83>, <-12.14,   0.97,  -9.93>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-13.82,  -0.84,  -9.91>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -9.79>, <-13.82,  -0.84,  -9.91>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -0.00, -10.03>, <-13.82,   0.84,  -9.91>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -9.79>, <-13.82,   0.84,  -9.91>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00, -10.03>, <-15.71,  -0.84,  -9.91>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -1.67,  -9.79>, <-15.71,  -0.84,  -9.91>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00, -10.03>, <-15.71,   0.84,  -9.91>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,   1.67,  -9.79>, <-15.71,   0.84,  -9.91>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,   0.00, -10.03>, <-16.63,   0.00,  -8.95>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,   0.00,  -7.86>, <-16.63,   0.00,  -8.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
