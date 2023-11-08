#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.58*x up 30.43*y
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

cylinder {<-15.45, -14.49, -18.62>, < 15.52, -14.49, -18.62>, Rcell pigment {Black}}
cylinder {<-15.45,  14.49, -18.62>, < 15.52,  14.49, -18.62>, Rcell pigment {Black}}
cylinder {<-15.45,  14.49,   0.00>, < 15.52,  14.49,   0.00>, Rcell pigment {Black}}
cylinder {<-15.45, -14.49,   0.00>, < 15.52, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {<-15.45, -14.49, -18.62>, <-15.45,  14.49, -18.62>, Rcell pigment {Black}}
cylinder {< 15.52, -14.49, -18.62>, < 15.52,  14.49, -18.62>, Rcell pigment {Black}}
cylinder {< 15.52, -14.49,   0.00>, < 15.52,  14.49,   0.00>, Rcell pigment {Black}}
cylinder {<-15.45, -14.49,   0.00>, <-15.45,  14.49,   0.00>, Rcell pigment {Black}}
cylinder {<-15.45, -14.49, -18.62>, <-15.45, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {< 15.52, -14.49, -18.62>, < 15.52, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {< 15.52,  14.49, -18.62>, < 15.52,  14.49,   0.00>, Rcell pigment {Black}}
cylinder {<-15.45,  14.49, -18.62>, <-15.45,  14.49,   0.00>, Rcell pigment {Black}}
atom(<-14.99, -12.32, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-14.99,  -6.52, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(< -9.83, -12.32, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-13.78,  -9.62, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #3
atom(<-11.96,  -7.77, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #4
atom(< -9.83,  -6.52, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<-13.63,  -7.89, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #6
atom(<-10.75, -10.87, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-12.11,  -9.50, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #8
atom(<-13.78,  -3.82, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #9
atom(<-10.75,  -5.07, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-12.11,  -3.70, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -8.62,  -9.62, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(< -6.80,  -7.77, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -8.47,  -7.89, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #14
atom(< -5.59, -10.87, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(< -6.95,  -9.50, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #16
atom(< -8.62,  -3.82, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #17
atom(< -5.59,  -5.07, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -6.95,  -3.70, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #19
cylinder {< -9.83, -12.32, -19.08>, <-10.29, -11.59, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75, -10.87, -18.16>, <-10.29, -11.59, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -9.62, -18.55>, <-12.87,  -8.69, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -7.77, -18.68>, <-12.87,  -8.69, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -9.62, -18.55>, <-13.71,  -8.76, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.63,  -7.89, -17.90>, <-13.71,  -8.76, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -9.62, -18.55>, <-12.94,  -9.56, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -9.50, -19.33>, <-12.94,  -9.56, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -7.77, -18.68>, <-12.79,  -7.83, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.63,  -7.89, -17.90>, <-12.79,  -7.83, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -7.77, -18.68>, <-12.03,  -8.63, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -9.50, -19.33>, <-12.03,  -8.63, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -7.77, -18.68>, <-10.89,  -7.15, -18.88>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.83,  -6.52, -19.08>, <-10.89,  -7.15, -18.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.83,  -6.52, -19.08>, <-10.29,  -5.80, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -5.07, -18.16>, <-10.29,  -5.80, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75, -10.87, -18.16>, < -9.68, -10.24, -18.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -9.62, -18.55>, < -9.68, -10.24, -18.35>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -3.82, -18.55>, <-12.94,  -3.76, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -3.70, -19.33>, <-12.94,  -3.76, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -5.07, -18.16>, < -9.68,  -4.45, -18.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -3.82, -18.55>, < -9.68,  -4.45, -18.35>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -9.62, -18.55>, < -8.54,  -8.76, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -7.89, -17.90>, < -8.54,  -8.76, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -9.62, -18.55>, < -7.78,  -9.56, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -9.50, -19.33>, < -7.78,  -9.56, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -9.62, -18.55>, < -7.71,  -8.69, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -7.77, -18.68>, < -7.71,  -8.69, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -7.77, -18.68>, < -7.63,  -7.83, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -7.89, -17.90>, < -7.63,  -7.83, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -7.77, -18.68>, < -6.87,  -8.63, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -9.50, -19.33>, < -6.87,  -8.63, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -3.82, -18.55>, < -7.78,  -3.76, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -3.70, -19.33>, < -7.78,  -3.76, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
