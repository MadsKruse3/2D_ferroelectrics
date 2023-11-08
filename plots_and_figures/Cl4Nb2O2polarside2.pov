#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.75*x up 35.38*y
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

cylinder {< 17.02, -16.85, -23.65>, < 17.02, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.02,  16.85, -23.65>, < 17.02,  16.85,  -0.00>, Rcell pigment {Black}}
cylinder {<-17.02,  16.85, -23.65>, <-17.02,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-17.02, -16.85, -23.65>, <-17.02, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.02, -16.85, -23.65>, < 17.02,  16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 17.02, -16.85,  -0.00>, < 17.02,  16.85,  -0.00>, Rcell pigment {Black}}
cylinder {<-17.02, -16.85,  -0.00>, <-17.02,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-17.02, -16.85, -23.65>, <-17.02,  16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 17.02, -16.85, -23.65>, <-17.02, -16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 17.02, -16.85,  -0.00>, <-17.02, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.02,  16.85,  -0.00>, <-17.02,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 17.02,  16.85, -23.65>, <-17.02,  16.85, -23.65>, Rcell pigment {Black}}
atom(< -0.00, -14.70, -27.39>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #0
atom(<  1.94, -14.90, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #1
atom(<  0.00, -14.70, -30.35>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #2
atom(< -1.94, -14.90, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #3
atom(< -0.00, -14.70, -34.13>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #4
atom(<  1.67, -14.94, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(< -1.67, -14.94, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(< -0.00, -10.76, -27.39>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #7
atom(<  1.94, -10.96, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(<  0.00, -10.76, -30.35>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(< -1.94, -10.96, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< -0.00, -12.93, -27.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #11
atom(< -0.00, -10.76, -34.13>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #12
atom(<  1.67, -11.00, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(< -1.67, -11.00, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(< -0.00, -12.93, -34.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #15
atom(<  0.00, -12.93, -30.40>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< -0.00,  -6.82, -27.39>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #17
atom(<  1.94,  -7.02, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<  0.00,  -6.82, -30.35>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(< -1.94,  -7.02, -28.87>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(< -0.00,  -8.99, -27.34>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #21
atom(< -0.00,  -6.82, -34.13>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #22
atom(<  1.67,  -7.06, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(< -1.67,  -7.06, -32.24>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(< -0.00,  -8.99, -34.08>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #25
atom(<  0.00,  -8.99, -30.40>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
cylinder {< -0.00, -14.70, -27.39>, <  0.97, -14.80, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.94, -14.90, -28.87>, <  0.97, -14.80, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -27.39>, < -0.00, -14.70, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, < -0.00, -14.70, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -27.39>, < -0.97, -14.80, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94, -14.90, -28.87>, < -0.97, -14.80, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -27.39>, < -0.00, -13.82, -27.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -12.93, -27.34>, < -0.00, -13.82, -27.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.94, -14.90, -28.87>, <  0.97, -14.80, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, <  0.97, -14.80, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, < -0.97, -14.80, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94, -14.90, -28.87>, < -0.97, -14.80, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, <  0.84, -14.82, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67, -14.94, -32.24>, <  0.84, -14.82, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, < -0.84, -14.82, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -14.94, -32.24>, < -0.84, -14.82, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -14.70, -30.35>, <  0.00, -13.82, -30.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -12.93, -30.40>, <  0.00, -13.82, -30.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -34.13>, <  0.84, -14.82, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67, -14.94, -32.24>, <  0.84, -14.82, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -34.13>, < -0.84, -14.82, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -14.94, -32.24>, < -0.84, -14.82, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -14.70, -34.13>, < -0.00, -13.82, -34.11>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -12.93, -34.08>, < -0.00, -13.82, -34.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -27.39>, < -0.00, -11.84, -27.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -12.93, -27.34>, < -0.00, -11.84, -27.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -27.39>, < -0.97, -10.86, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94, -10.96, -28.87>, < -0.97, -10.86, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -27.39>, <  0.97, -10.86, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.94, -10.96, -28.87>, <  0.97, -10.86, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -27.39>, < -0.00, -10.76, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, < -0.00, -10.76, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -27.39>, < -0.00,  -9.87, -27.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.99, -27.34>, < -0.00,  -9.87, -27.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.94, -10.96, -28.87>, <  0.97, -10.86, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, <  0.97, -10.86, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, <  0.84, -10.88, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67, -11.00, -32.24>, <  0.84, -10.88, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, <  0.00, -11.84, -30.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -12.93, -30.40>, <  0.00, -11.84, -30.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, < -0.97, -10.86, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94, -10.96, -28.87>, < -0.97, -10.86, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, < -0.84, -10.88, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -11.00, -32.24>, < -0.84, -10.88, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00, -10.76, -30.35>, <  0.00,  -9.87, -30.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.99, -30.40>, <  0.00,  -9.87, -30.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -34.13>, <  0.84, -10.88, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67, -11.00, -32.24>, <  0.84, -10.88, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -34.13>, < -0.00, -11.84, -34.11>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -12.93, -34.08>, < -0.00, -11.84, -34.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -34.13>, < -0.84, -10.88, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67, -11.00, -32.24>, < -0.84, -10.88, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00, -10.76, -34.13>, < -0.00,  -9.87, -34.11>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.99, -34.08>, < -0.00,  -9.87, -34.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -27.39>, <  0.97,  -6.92, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.94,  -7.02, -28.87>, <  0.97,  -6.92, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -27.39>, < -0.00,  -6.82, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, < -0.00,  -6.82, -28.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -27.39>, < -0.97,  -6.92, -28.13>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94,  -7.02, -28.87>, < -0.97,  -6.92, -28.13>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -27.39>, < -0.00,  -7.90, -27.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.99, -27.34>, < -0.00,  -7.90, -27.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  1.94,  -7.02, -28.87>, <  0.97,  -6.92, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, <  0.97,  -6.92, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, <  0.00,  -7.90, -30.37>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -8.99, -30.40>, <  0.00,  -7.90, -30.37>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, < -0.97,  -6.92, -29.61>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.94,  -7.02, -28.87>, < -0.97,  -6.92, -29.61>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, <  0.84,  -6.94, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -7.06, -32.24>, <  0.84,  -6.94, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<  0.00,  -6.82, -30.35>, < -0.84,  -6.94, -31.29>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67,  -7.06, -32.24>, < -0.84,  -6.94, -31.29>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -34.13>, <  0.84,  -6.94, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -7.06, -32.24>, <  0.84,  -6.94, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -34.13>, < -0.84,  -6.94, -33.18>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -1.67,  -7.06, -32.24>, < -0.84,  -6.94, -33.18>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -6.82, -34.13>, < -0.00,  -7.90, -34.11>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -0.00,  -8.99, -34.08>, < -0.00,  -7.90, -34.11>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
// no constraints
