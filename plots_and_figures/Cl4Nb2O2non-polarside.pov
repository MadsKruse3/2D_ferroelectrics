#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.98*x up 38.33*y
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

cylinder {< -6.52, -15.79,  -0.00>, < 17.13, -15.79,  -0.00>, Rcell pigment {Black}}
cylinder {< -6.51, -15.79, -33.70>, < 17.13, -15.79, -33.70>, Rcell pigment {Black}}
cylinder {< -6.51,  18.25, -33.70>, < 17.13,  18.25, -33.70>, Rcell pigment {Black}}
cylinder {< -6.52,  18.25,   0.00>, < 17.13,  18.25,  -0.00>, Rcell pigment {Black}}
cylinder {< -6.52, -15.79,  -0.00>, < -6.51, -15.79, -33.70>, Rcell pigment {Black}}
cylinder {< 17.13, -15.79,  -0.00>, < 17.13, -15.79, -33.70>, Rcell pigment {Black}}
cylinder {< 17.13,  18.25,  -0.00>, < 17.13,  18.25, -33.70>, Rcell pigment {Black}}
cylinder {< -6.52,  18.25,   0.00>, < -6.51,  18.25, -33.70>, Rcell pigment {Black}}
cylinder {< -6.52, -15.79,  -0.00>, < -6.52,  18.25,   0.00>, Rcell pigment {Black}}
cylinder {< 17.13, -15.79,  -0.00>, < 17.13,  18.25,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.13, -15.79, -33.70>, < 17.13,  18.25, -33.70>, Rcell pigment {Black}}
cylinder {< -6.51, -15.79, -33.70>, < -6.51,  18.25, -33.70>, Rcell pigment {Black}}
atom(< -9.88, -17.74,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #0
atom(<-11.36, -15.79,  -1.79>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #1
atom(< -9.88, -13.84,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #2
atom(<-15.15, -15.79,  -2.15>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #3
atom(<-13.25, -17.46,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #4
atom(<-16.62, -17.74,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #5
atom(<-13.25, -14.13,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #6
atom(<-16.62, -13.84,  -1.97>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #7
atom(< -9.88, -17.74,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #8
atom(<-11.36, -15.79,  -5.73>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #9
atom(< -9.88, -13.84,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #10
atom(<-15.15, -15.79,  -6.09>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #11
atom(<-13.25, -17.46,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #12
atom(<-16.62, -17.74,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #13
atom(<-13.25, -14.13,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #14
atom(<-16.62, -13.84,  -5.91>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #15
atom(<-15.13, -15.79,  -3.93>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #16
atom(<-11.38, -15.79,  -3.95>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #17
atom(< -9.88, -17.74,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #18
atom(<-11.36, -15.79,  -9.67>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #19
atom(< -9.88, -13.84,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #20
atom(<-15.15, -15.79, -10.03>, 0.82, rgb <0.45, 0.76, 0.79>, 0.0, ase3) // #21
atom(<-13.25, -17.46,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #22
atom(<-16.62, -17.74,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #23
atom(<-13.25, -14.13,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #24
atom(<-16.62, -13.84,  -9.85>, 0.51, rgb <0.12, 0.94, 0.12>, 0.0, ase3) // #25
atom(<-15.13, -15.79,  -7.87>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #26
atom(<-11.38, -15.79,  -7.89>, 0.33, rgb <1.00, 0.05, 0.05>, 0.0, ase3) // #27
cylinder {< -9.88, -17.74,  -1.97>, <-10.62, -16.77,  -1.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -1.79>, <-10.62, -16.77,  -1.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -1.79>, <-10.62, -14.82,  -1.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -13.84,  -1.97>, <-10.62, -14.82,  -1.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -1.79>, <-12.31, -16.62,  -1.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -1.97>, <-12.31, -16.62,  -1.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -1.79>, <-12.31, -14.96,  -1.88>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -1.97>, <-12.31, -14.96,  -1.88>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -1.79>, <-11.37, -15.79,  -2.87>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -15.79,  -3.95>, <-11.37, -15.79,  -2.87>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -2.15>, <-14.20, -16.62,  -2.06>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -1.97>, <-14.20, -16.62,  -2.06>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -2.15>, <-15.89, -16.77,  -2.06>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -17.74,  -1.97>, <-15.89, -16.77,  -2.06>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -2.15>, <-14.20, -14.96,  -2.06>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -1.97>, <-14.20, -14.96,  -2.06>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -2.15>, <-15.89, -14.82,  -2.06>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -13.84,  -1.97>, <-15.89, -14.82,  -2.06>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -2.15>, <-15.14, -15.79,  -3.04>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -15.79,  -3.93>, <-15.14, -15.79,  -3.04>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -17.74,  -5.91>, <-10.62, -16.77,  -5.82>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-10.62, -16.77,  -5.82>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-12.31, -14.96,  -5.82>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -5.91>, <-12.31, -14.96,  -5.82>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-11.37, -15.79,  -4.84>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -15.79,  -3.95>, <-11.37, -15.79,  -4.84>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-10.62, -14.82,  -5.82>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -13.84,  -5.91>, <-10.62, -14.82,  -5.82>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-12.31, -16.62,  -5.82>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -5.91>, <-12.31, -16.62,  -5.82>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -5.73>, <-11.37, -15.79,  -6.81>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -15.79,  -7.89>, <-11.37, -15.79,  -6.81>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-14.20, -14.96,  -6.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -5.91>, <-14.20, -14.96,  -6.00>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-15.14, -15.79,  -5.01>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -15.79,  -3.93>, <-15.14, -15.79,  -5.01>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-15.89, -14.82,  -6.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -13.84,  -5.91>, <-15.89, -14.82,  -6.00>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-14.20, -16.62,  -6.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -5.91>, <-14.20, -16.62,  -6.00>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-15.89, -16.77,  -6.00>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -17.74,  -5.91>, <-15.89, -16.77,  -6.00>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79,  -6.09>, <-15.14, -15.79,  -6.98>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -15.79,  -7.87>, <-15.14, -15.79,  -6.98>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -17.74,  -9.85>, <-10.62, -16.77,  -9.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -9.67>, <-10.62, -16.77,  -9.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -9.67>, <-11.37, -15.79,  -8.78>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-11.38, -15.79,  -7.89>, <-11.37, -15.79,  -8.78>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -9.67>, <-10.62, -14.82,  -9.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {< -9.88, -13.84,  -9.85>, <-10.62, -14.82,  -9.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -9.67>, <-12.31, -16.62,  -9.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -9.85>, <-12.31, -16.62,  -9.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-11.36, -15.79,  -9.67>, <-12.31, -14.96,  -9.76>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -9.85>, <-12.31, -14.96,  -9.76>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79, -10.03>, <-15.14, -15.79,  -8.95>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-15.13, -15.79,  -7.87>, <-15.14, -15.79,  -8.95>, Rbond texture{pigment {color rgb <1.00, 0.05, 0.05> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79, -10.03>, <-14.20, -16.62,  -9.94>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -17.46,  -9.85>, <-14.20, -16.62,  -9.94>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79, -10.03>, <-15.89, -16.77,  -9.94>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -17.74,  -9.85>, <-15.89, -16.77,  -9.94>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79, -10.03>, <-14.20, -14.96,  -9.94>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-13.25, -14.13,  -9.85>, <-14.20, -14.96,  -9.94>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
cylinder {<-15.15, -15.79, -10.03>, <-15.89, -14.82,  -9.94>, Rbond texture{pigment {color rgb <0.45, 0.76, 0.79> transmit 0.0} finish{ase3}}}
cylinder {<-16.62, -13.84,  -9.85>, <-15.89, -14.82,  -9.94>, Rbond texture{pigment {color rgb <0.12, 0.94, 0.12> transmit 0.0} finish{ase3}}}
// no constraints
