#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -32.58*x up 20.60*y
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

cylinder {<-15.45,  -8.81,  -0.00>, < 15.52,  -8.81,  -0.00>, Rcell pigment {Black}}
cylinder {<-15.45,  -8.81, -28.98>, < 15.52,  -8.81, -28.98>, Rcell pigment {Black}}
cylinder {<-15.45,   9.81, -28.98>, < 15.52,   9.81, -28.98>, Rcell pigment {Black}}
cylinder {<-15.45,   9.81,   0.00>, < 15.52,   9.81,  -0.00>, Rcell pigment {Black}}
cylinder {<-15.45,  -8.81,  -0.00>, <-15.45,  -8.81, -28.98>, Rcell pigment {Black}}
cylinder {< 15.52,  -8.81,  -0.00>, < 15.52,  -8.81, -28.98>, Rcell pigment {Black}}
cylinder {< 15.52,   9.81,  -0.00>, < 15.52,   9.81, -28.98>, Rcell pigment {Black}}
cylinder {<-15.45,   9.81,   0.00>, <-15.45,   9.81, -28.98>, Rcell pigment {Black}}
cylinder {<-15.45,  -8.81,  -0.00>, <-15.45,   9.81,   0.00>, Rcell pigment {Black}}
cylinder {< 15.52,  -8.81,  -0.00>, < 15.52,   9.81,  -0.00>, Rcell pigment {Black}}
cylinder {< 15.52,  -8.81, -28.98>, < 15.52,   9.81, -28.98>, Rcell pigment {Black}}
cylinder {<-15.45,  -8.81, -28.98>, <-15.45,   9.81, -28.98>, Rcell pigment {Black}}
atom(<-14.99,  -9.27,  -2.17>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<-14.99,  -9.27,  -7.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(< -9.83,  -9.27,  -2.17>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<-13.78,  -8.74,  -4.87>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #3
atom(<-11.96,  -8.87,  -6.72>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #4
atom(< -9.83,  -9.27,  -7.97>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<-13.63,  -8.09,  -6.60>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #6
atom(<-10.75,  -8.35,  -3.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<-12.11,  -9.52,  -5.00>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #8
atom(<-13.78,  -8.74, -10.67>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #9
atom(<-10.75,  -8.35,  -9.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<-12.11,  -9.52, -10.79>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(< -8.62,  -8.74,  -4.87>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(< -6.80,  -8.87,  -6.72>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(< -8.47,  -8.09,  -6.60>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #14
atom(< -5.59,  -8.35,  -3.62>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(< -6.95,  -9.52,  -5.00>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #16
atom(< -8.62,  -8.74, -10.67>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #17
atom(< -5.59,  -8.35,  -9.42>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(< -6.95,  -9.52, -10.79>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #19
cylinder {< -9.83,  -9.27,  -2.17>, <-10.29,  -8.81,  -2.90>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -8.35,  -3.62>, <-10.29,  -8.81,  -2.90>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -8.74,  -4.87>, <-12.87,  -8.81,  -5.80>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -8.87,  -6.72>, <-12.87,  -8.81,  -5.80>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -8.74,  -4.87>, <-13.71,  -8.41,  -5.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.63,  -8.09,  -6.60>, <-13.71,  -8.41,  -5.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -8.74,  -4.87>, <-12.94,  -9.13,  -4.93>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -9.52,  -5.00>, <-12.94,  -9.13,  -4.93>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -8.87,  -6.72>, <-12.79,  -8.48,  -6.66>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.63,  -8.09,  -6.60>, <-12.79,  -8.48,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -8.87,  -6.72>, <-12.03,  -9.20,  -5.86>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -9.52,  -5.00>, <-12.03,  -9.20,  -5.86>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-11.96,  -8.87,  -6.72>, <-10.89,  -9.07,  -7.34>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.83,  -9.27,  -7.97>, <-10.89,  -9.07,  -7.34>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -9.83,  -9.27,  -7.97>, <-10.29,  -8.81,  -8.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -8.35,  -9.42>, <-10.29,  -8.81,  -8.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -8.35,  -3.62>, < -9.68,  -8.54,  -4.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74,  -4.87>, < -9.68,  -8.54,  -4.25>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-13.78,  -8.74, -10.67>, <-12.94,  -9.13, -10.73>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<-12.11,  -9.52, -10.79>, <-12.94,  -9.13, -10.73>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<-10.75,  -8.35,  -9.42>, < -9.68,  -8.54, -10.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74, -10.67>, < -9.68,  -8.54, -10.05>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74,  -4.87>, < -8.54,  -8.41,  -5.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -8.09,  -6.60>, < -8.54,  -8.41,  -5.74>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74,  -4.87>, < -7.78,  -9.13,  -4.93>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -9.52,  -5.00>, < -7.78,  -9.13,  -4.93>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74,  -4.87>, < -7.71,  -8.81,  -5.80>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -8.87,  -6.72>, < -7.71,  -8.81,  -5.80>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -8.87,  -6.72>, < -7.63,  -8.48,  -6.66>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.47,  -8.09,  -6.60>, < -7.63,  -8.48,  -6.66>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -6.80,  -8.87,  -6.72>, < -6.87,  -9.20,  -5.86>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -9.52,  -5.00>, < -6.87,  -9.20,  -5.86>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {< -8.62,  -8.74, -10.67>, < -7.78,  -9.13, -10.73>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.95,  -9.52, -10.79>, < -7.78,  -9.13, -10.73>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
