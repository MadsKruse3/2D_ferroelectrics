#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -38.33*x up 35.38*y
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

cylinder {< 15.79, -16.85, -23.65>, < 15.79, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.79,  16.85, -23.65>, < 15.79,  16.85,  -0.00>, Rcell pigment {Black}}
cylinder {<-18.25,  16.85, -23.65>, <-18.25,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-18.25, -16.85, -23.65>, <-18.25, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.79, -16.85, -23.65>, < 15.79,  16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 15.79, -16.85,  -0.00>, < 15.79,  16.85,  -0.00>, Rcell pigment {Black}}
cylinder {<-18.25, -16.85,  -0.00>, <-18.25,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {<-18.25, -16.85, -23.65>, <-18.25,  16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 15.79, -16.85, -23.65>, <-18.25, -16.85, -23.65>, Rcell pigment {Black}}
cylinder {< 15.79, -16.85,  -0.00>, <-18.25, -16.85,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.79,  16.85,  -0.00>, <-18.25,  16.85,   0.00>, Rcell pigment {Black}}
cylinder {< 15.79,  16.85, -23.65>, <-18.25,  16.85, -23.65>, Rcell pigment {Black}}
atom(< 17.74, -14.88, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #0
atom(< 15.79, -15.06, -28.49>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #1
atom(< 13.84, -14.88, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(< 15.79, -14.70, -32.29>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #3
atom(< 17.46, -14.88, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(< 17.74, -14.88, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(< 14.13, -14.88, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(< 13.84, -14.88, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(< 17.74, -10.94, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(< 15.79, -11.12, -28.49>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(< 13.84, -10.94, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(< 15.79, -10.76, -32.29>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #11
atom(< 17.46, -10.94, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #12
atom(< 17.74, -10.94, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(< 14.13, -10.94, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(< 13.84, -10.94, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(< 15.79, -12.92, -32.27>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(< 15.79, -12.90, -28.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< 17.74,  -6.99, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(< 15.79,  -7.18, -28.49>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(< 13.84,  -6.99, -27.02>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(< 15.79,  -6.81, -32.29>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #21
atom(< 17.46,  -6.99, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #22
atom(< 17.74,  -6.99, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(< 14.13,  -6.99, -30.39>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(< 13.84,  -6.99, -33.76>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #25
atom(< 15.79,  -8.98, -32.27>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(< 15.79,  -8.95, -28.51>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
cylinder {< 17.74, -14.88, -27.02>, < 16.77, -14.97, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -15.06, -28.49>, < 16.77, -14.97, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -15.06, -28.49>, < 14.82, -14.97, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84, -14.88, -27.02>, < 14.82, -14.97, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -15.06, -28.49>, < 16.62, -14.97, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46, -14.88, -30.39>, < 16.62, -14.97, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -15.06, -28.49>, < 14.96, -14.97, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13, -14.88, -30.39>, < 14.96, -14.97, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -15.06, -28.49>, < 15.79, -13.98, -28.50>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -12.90, -28.51>, < 15.79, -13.98, -28.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -14.70, -32.29>, < 16.62, -14.79, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46, -14.88, -30.39>, < 16.62, -14.79, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -14.70, -32.29>, < 16.77, -14.79, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.74, -14.88, -33.76>, < 16.77, -14.79, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -14.70, -32.29>, < 14.96, -14.79, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13, -14.88, -30.39>, < 14.96, -14.79, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -14.70, -32.29>, < 14.82, -14.79, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84, -14.88, -33.76>, < 14.82, -14.79, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -14.70, -32.29>, < 15.79, -13.81, -32.28>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -12.92, -32.27>, < 15.79, -13.81, -32.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.74, -10.94, -27.02>, < 16.77, -11.03, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 16.77, -11.03, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 14.96, -11.03, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13, -10.94, -30.39>, < 14.96, -11.03, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 15.79, -12.01, -28.50>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -12.90, -28.51>, < 15.79, -12.01, -28.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 14.82, -11.03, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84, -10.94, -27.02>, < 14.82, -11.03, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 16.62, -11.03, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46, -10.94, -30.39>, < 16.62, -11.03, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -11.12, -28.49>, < 15.79, -10.04, -28.50>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -8.95, -28.51>, < 15.79, -10.04, -28.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 14.96, -10.85, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13, -10.94, -30.39>, < 14.96, -10.85, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 15.79, -11.84, -32.28>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -12.92, -32.27>, < 15.79, -11.84, -32.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 14.82, -10.85, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84, -10.94, -33.76>, < 14.82, -10.85, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 16.62, -10.85, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46, -10.94, -30.39>, < 16.62, -10.85, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 16.77, -10.85, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.74, -10.94, -33.76>, < 16.77, -10.85, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79, -10.76, -32.29>, < 15.79,  -9.87, -32.28>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -8.98, -32.27>, < 15.79,  -9.87, -32.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 17.74,  -6.99, -27.02>, < 16.77,  -7.09, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -7.18, -28.49>, < 16.77,  -7.09, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -7.18, -28.49>, < 15.79,  -8.07, -28.50>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -8.95, -28.51>, < 15.79,  -8.07, -28.50>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -7.18, -28.49>, < 14.82,  -7.09, -27.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84,  -6.99, -27.02>, < 14.82,  -7.09, -27.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -7.18, -28.49>, < 16.62,  -7.09, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46,  -6.99, -30.39>, < 16.62,  -7.09, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -7.18, -28.49>, < 14.96,  -7.09, -29.44>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13,  -6.99, -30.39>, < 14.96,  -7.09, -29.44>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -6.81, -32.29>, < 15.79,  -7.90, -32.28>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -8.98, -32.27>, < 15.79,  -7.90, -32.28>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -6.81, -32.29>, < 16.62,  -6.90, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.46,  -6.99, -30.39>, < 16.62,  -6.90, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -6.81, -32.29>, < 16.77,  -6.90, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 17.74,  -6.99, -33.76>, < 16.77,  -6.90, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -6.81, -32.29>, < 14.96,  -6.90, -31.34>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 14.13,  -6.99, -30.39>, < 14.96,  -6.90, -31.34>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {< 15.79,  -6.81, -32.29>, < 14.82,  -6.90, -33.02>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< 13.84,  -6.99, -33.76>, < 14.82,  -6.90, -33.02>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
