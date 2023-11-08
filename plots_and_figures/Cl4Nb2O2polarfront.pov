#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -36.70*x up 35.38*y
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

cylinder {< -6.17, -16.85, -34.05>, < 17.47, -16.85, -34.05>, Rcell pigment {Black}}
cylinder {< -6.17,  16.85, -34.05>, < 17.47,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< -6.17,  16.85,   0.00>, < 17.47,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -16.85,   0.00>, < 17.47, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -16.85, -34.05>, < -6.17,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< 17.47, -16.85, -34.05>, < 17.47,  16.85, -34.05>, Rcell pigment {Black}}
cylinder {< 17.47, -16.85,   0.00>, < 17.47,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -16.85,   0.00>, < -6.17,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.17, -16.85, -34.05>, < -6.17, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.47, -16.85, -34.05>, < 17.47, -16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.47,  16.85, -34.05>, < 17.47,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< -6.17,  16.85, -34.05>, < -6.17,  16.85,   0.00>, Rcell pigment {Black}}
atom(< -9.91, -14.70, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #0
atom(<-11.39, -14.90, -18.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #1
atom(<-12.88, -14.70, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #2
atom(<-11.40, -14.90, -15.08>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #3
atom(<-16.65, -14.70, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #4
atom(<-14.76, -14.94, -18.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(<-14.76, -14.94, -15.35>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(< -9.91, -10.76, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #7
atom(<-11.39, -10.96, -18.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(<-12.88, -10.76, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(<-11.40, -10.96, -15.08>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< -9.87, -12.93, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(<-16.65, -10.76, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #12
atom(<-14.76, -11.00, -18.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(<-14.76, -11.00, -15.35>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(<-16.61, -12.93, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(<-12.92, -12.93, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -9.91,  -6.82, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #17
atom(<-11.39,  -7.02, -18.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<-12.88,  -6.82, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(<-11.40,  -7.02, -15.08>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(< -9.87,  -8.99, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(<-16.65,  -6.82, -17.02>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #22
atom(<-14.76,  -7.06, -18.70>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(<-14.76,  -7.06, -15.35>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(<-16.61,  -8.99, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(<-12.92,  -8.99, -17.02>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
cylinder {< -9.91, -14.70, -17.02>, <-10.65, -14.80, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39, -14.90, -18.97>, <-10.65, -14.80, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -14.70, -17.02>, <-11.39, -14.70, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-11.39, -14.70, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -14.70, -17.02>, <-10.65, -14.80, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40, -14.90, -15.08>, <-10.65, -14.80, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -14.70, -17.02>, < -9.89, -13.82, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87, -12.93, -17.02>, < -9.89, -13.82, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39, -14.90, -18.97>, <-12.14, -14.80, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-12.14, -14.80, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-12.14, -14.80, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40, -14.90, -15.08>, <-12.14, -14.80, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-13.82, -14.82, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -14.94, -18.70>, <-13.82, -14.82, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-13.82, -14.82, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -14.94, -15.35>, <-13.82, -14.82, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -14.70, -17.02>, <-12.90, -13.82, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92, -12.93, -17.02>, <-12.90, -13.82, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -14.70, -17.02>, <-15.71, -14.82, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -14.94, -18.70>, <-15.71, -14.82, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -14.70, -17.02>, <-15.71, -14.82, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -14.94, -15.35>, <-15.71, -14.82, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -14.70, -17.02>, <-16.63, -13.82, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61, -12.93, -17.02>, <-16.63, -13.82, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -10.76, -17.02>, < -9.89, -11.84, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87, -12.93, -17.02>, < -9.89, -11.84, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -10.76, -17.02>, <-10.66, -10.86, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40, -10.96, -15.08>, <-10.66, -10.86, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -10.76, -17.02>, <-10.65, -10.86, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39, -10.96, -18.97>, <-10.65, -10.86, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -10.76, -17.02>, <-11.40, -10.76, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-11.40, -10.76, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91, -10.76, -17.02>, < -9.89,  -9.87, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,  -8.99, -17.02>, < -9.89,  -9.87, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39, -10.96, -18.97>, <-12.14, -10.86, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-12.14, -10.86, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-13.82, -10.88, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -11.00, -18.70>, <-13.82, -10.88, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-12.90, -11.84, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92, -12.93, -17.02>, <-12.90, -11.84, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-12.14, -10.86, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40, -10.96, -15.08>, <-12.14, -10.86, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-13.82, -10.88, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -11.00, -15.35>, <-13.82, -10.88, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88, -10.76, -17.02>, <-12.90,  -9.87, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.99, -17.02>, <-12.90,  -9.87, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -10.76, -17.02>, <-15.71, -10.88, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -11.00, -18.70>, <-15.71, -10.88, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -10.76, -17.02>, <-16.63, -11.84, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61, -12.93, -17.02>, <-16.63, -11.84, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -10.76, -17.02>, <-15.71, -10.88, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76, -11.00, -15.35>, <-15.71, -10.88, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65, -10.76, -17.02>, <-16.63,  -9.87, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,  -8.99, -17.02>, <-16.63,  -9.87, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,  -6.82, -17.02>, <-10.65,  -6.92, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -7.02, -18.97>, <-10.65,  -6.92, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,  -6.82, -17.02>, <-11.40,  -6.82, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-11.40,  -6.82, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,  -6.82, -17.02>, <-10.66,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,  -7.02, -15.08>, <-10.66,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -9.91,  -6.82, -17.02>, < -9.89,  -7.90, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.87,  -8.99, -17.02>, < -9.89,  -7.90, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.39,  -7.02, -18.97>, <-12.14,  -6.92, -17.99>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-12.14,  -6.92, -17.99>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-12.90,  -7.90, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-12.92,  -8.99, -17.02>, <-12.90,  -7.90, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-12.14,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.40,  -7.02, -15.08>, <-12.14,  -6.92, -16.05>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-13.82,  -6.94, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.06, -18.70>, <-13.82,  -6.94, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-12.88,  -6.82, -17.02>, <-13.82,  -6.94, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.06, -15.35>, <-13.82,  -6.94, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,  -6.82, -17.02>, <-15.71,  -6.94, -17.86>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.06, -18.70>, <-15.71,  -6.94, -17.86>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,  -6.82, -17.02>, <-15.71,  -6.94, -16.19>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-14.76,  -7.06, -15.35>, <-15.71,  -6.94, -16.19>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-16.65,  -6.82, -17.02>, <-16.63,  -7.90, -17.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.61,  -8.99, -17.02>, <-16.63,  -7.90, -17.02>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
