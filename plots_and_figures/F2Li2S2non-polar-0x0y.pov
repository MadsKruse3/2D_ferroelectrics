#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.51*x up 36.52*y
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

cylinder {<-15.48, -17.39, -18.62>, < 15.48, -17.39, -18.62>, Rcell pigment {Black}}
cylinder {<-15.48,  17.39, -18.62>, < 15.48,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {<-15.48,  17.39,   0.00>, < 15.48,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.48, -17.39,   0.00>, < 15.48, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.48, -17.39, -18.62>, <-15.48,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {< 15.48, -17.39, -18.62>, < 15.48,  17.39, -18.62>, Rcell pigment {Black}}
cylinder {< 15.48, -17.39,   0.00>, < 15.48,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.48, -17.39,   0.00>, <-15.48,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.48, -17.39, -18.62>, <-15.48, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {< 15.48, -17.39, -18.62>, < 15.48, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {< 15.48,  17.39, -18.62>, < 15.48,  17.39,   0.00>, Rcell pigment {Black}}
cylinder {<-15.48,  17.39, -18.62>, <-15.48,  17.39,   0.00>, Rcell pigment {Black}}
atom(<-13.81, -12.52, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<-11.99, -10.67, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #1
atom(< -9.86,  -9.42, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-13.66, -10.79, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(<-10.78, -13.77, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<-12.14, -12.39, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #5
atom(<-13.81,  -6.72, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #6
atom(<-11.99,  -4.87, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #7
atom(< -9.86,  -3.62, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<-13.66,  -5.00, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(<-10.78,  -7.97, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-12.14,  -6.60, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -8.65, -12.52, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(< -6.83, -10.67, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -4.70,  -9.42, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(< -8.50, -10.79, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #15
atom(< -5.62, -13.77, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(< -6.98, -12.39, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(< -8.65,  -6.72, -18.55>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #18
atom(< -6.83,  -4.87, -18.68>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #19
atom(< -4.70,  -3.62, -19.08>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(< -8.50,  -5.00, -17.90>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #21
atom(< -5.62,  -7.97, -18.16>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(< -6.98,  -6.60, -19.33>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #23
cylinder {<-13.81, -12.52, -18.55>, <-12.90, -11.59, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.99, -10.67, -18.68>, <-12.90, -11.59, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.81, -12.52, -18.55>, <-13.74, -11.65, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.66, -10.79, -17.90>, <-13.74, -11.65, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-13.81, -12.52, -18.55>, <-12.98, -12.46, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.14, -12.39, -19.33>, <-12.98, -12.46, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.99, -10.67, -18.68>, <-12.83, -10.73, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.66, -10.79, -17.90>, <-12.83, -10.73, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.99, -10.67, -18.68>, <-12.07, -11.53, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.14, -12.39, -19.33>, <-12.07, -11.53, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.99, -10.67, -18.68>, <-10.93, -10.05, -18.88>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -9.42, -19.08>, <-10.93, -10.05, -18.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.99, -10.67, -18.68>, <-11.39,  -9.32, -18.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.78,  -7.97, -18.16>, <-11.39,  -9.32, -18.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -9.42, -19.08>, < -9.18, -10.11, -18.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.50, -10.79, -17.90>, < -9.18, -10.11, -18.49>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -9.42, -19.08>, <-10.32,  -8.69, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.78,  -7.97, -18.16>, <-10.32,  -8.69, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -9.42, -19.08>, < -9.26,  -8.07, -18.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.65,  -6.72, -18.55>, < -9.26,  -8.07, -18.81>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.78, -13.77, -18.16>, <-11.46, -13.08, -18.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.14, -12.39, -19.33>, <-11.46, -13.08, -18.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-10.78, -13.77, -18.16>, < -9.72, -13.14, -18.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.65, -12.52, -18.55>, < -9.72, -13.14, -18.35>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.81,  -6.72, -18.55>, <-12.90,  -5.80, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -4.87, -18.68>, <-12.90,  -5.80, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.81,  -6.72, -18.55>, <-13.74,  -5.86, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.66,  -5.00, -17.90>, <-13.74,  -5.86, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-13.81,  -6.72, -18.55>, <-12.98,  -6.66, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.14,  -6.60, -19.33>, <-12.98,  -6.66, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -4.87, -18.68>, <-12.83,  -4.93, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.66,  -5.00, -17.90>, <-12.83,  -4.93, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -4.87, -18.68>, <-10.93,  -4.25, -18.88>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -3.62, -19.08>, <-10.93,  -4.25, -18.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-11.99,  -4.87, -18.68>, <-12.07,  -5.74, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.14,  -6.60, -19.33>, <-12.07,  -5.74, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -9.86,  -3.62, -19.08>, < -9.18,  -4.31, -18.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -5.00, -17.90>, < -9.18,  -4.31, -18.49>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-10.78,  -7.97, -18.16>, < -9.72,  -7.34, -18.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.65,  -6.72, -18.55>, < -9.72,  -7.34, -18.35>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.78,  -7.97, -18.16>, <-11.46,  -7.28, -18.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-12.14,  -6.60, -19.33>, <-11.46,  -7.28, -18.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.65, -12.52, -18.55>, < -7.82, -12.46, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.98, -12.39, -19.33>, < -7.82, -12.46, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.65, -12.52, -18.55>, < -8.58, -11.65, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50, -10.79, -17.90>, < -8.58, -11.65, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.65, -12.52, -18.55>, < -7.74, -11.59, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.83, -10.67, -18.68>, < -7.74, -11.59, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.83, -10.67, -18.68>, < -6.91, -11.53, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.98, -12.39, -19.33>, < -6.91, -11.53, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.83, -10.67, -18.68>, < -7.67, -10.73, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50, -10.79, -17.90>, < -7.67, -10.73, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.83, -10.67, -18.68>, < -5.77, -10.05, -18.88>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.70,  -9.42, -19.08>, < -5.77, -10.05, -18.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.83, -10.67, -18.68>, < -6.23,  -9.32, -18.42>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.62,  -7.97, -18.16>, < -6.23,  -9.32, -18.42>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -4.70,  -9.42, -19.08>, < -5.16,  -8.69, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.62,  -7.97, -18.16>, < -5.16,  -8.69, -18.62>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -5.62, -13.77, -18.16>, < -6.30, -13.08, -18.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.98, -12.39, -19.33>, < -6.30, -13.08, -18.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.65,  -6.72, -18.55>, < -7.74,  -5.80, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.83,  -4.87, -18.68>, < -7.74,  -5.80, -18.62>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.65,  -6.72, -18.55>, < -8.58,  -5.86, -18.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -5.00, -17.90>, < -8.58,  -5.86, -18.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.65,  -6.72, -18.55>, < -7.82,  -6.66, -18.94>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.98,  -6.60, -19.33>, < -7.82,  -6.66, -18.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.83,  -4.87, -18.68>, < -5.77,  -4.25, -18.88>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.70,  -3.62, -19.08>, < -5.77,  -4.25, -18.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.83,  -4.87, -18.68>, < -7.67,  -4.93, -18.29>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.50,  -5.00, -17.90>, < -7.67,  -4.93, -18.29>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.83,  -4.87, -18.68>, < -6.91,  -5.74, -19.01>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.98,  -6.60, -19.33>, < -6.91,  -5.74, -19.01>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -5.62,  -7.97, -18.16>, < -6.30,  -7.28, -18.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -6.98,  -6.60, -19.33>, < -6.30,  -7.28, -18.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
