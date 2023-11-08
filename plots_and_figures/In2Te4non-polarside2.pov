#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.91*x up 40.98*y
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

cylinder {< 17.10, -19.51, -25.53>, < 17.10, -19.48,  -0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  19.48, -36.12>, < 17.10,  19.51, -10.59>, Rcell pigment {Black}}
cylinder {<-17.10,  19.48, -36.12>, <-17.10,  19.51, -10.59>, Rcell pigment {Black}}
cylinder {<-17.10, -19.51, -25.53>, <-17.10, -19.48,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10, -19.51, -25.53>, < 17.10,  19.48, -36.12>, Rcell pigment {Black}}
cylinder {< 17.10, -19.48,  -0.00>, < 17.10,  19.51, -10.59>, Rcell pigment {Black}}
cylinder {<-17.10, -19.48,   0.00>, <-17.10,  19.51, -10.59>, Rcell pigment {Black}}
cylinder {<-17.10, -19.51, -25.53>, <-17.10,  19.48, -36.12>, Rcell pigment {Black}}
cylinder {< 17.10, -19.51, -25.53>, <-17.10, -19.51, -25.53>, Rcell pigment {Black}}
cylinder {< 17.10, -19.48,  -0.00>, <-17.10, -19.48,   0.00>, Rcell pigment {Black}}
cylinder {< 17.10,  19.51, -10.59>, <-17.10,  19.51, -10.59>, Rcell pigment {Black}}
cylinder {< 17.10,  19.48, -36.12>, <-17.10,  19.48, -36.12>, Rcell pigment {Black}}
atom(<  2.63, -16.60, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -1.25, -13.58, -23.79>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(<  0.91, -17.18, -21.67>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #2
atom(<  0.91,  -9.38, -23.78>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(<  0.61, -14.27, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #4
atom(<  2.63, -16.60, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -1.25, -13.57, -19.54>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  0.91, -17.18, -17.41>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #7
atom(< -3.27, -11.25, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(<  2.63,  -8.80, -21.66>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #9
atom(< -1.55, -10.67, -23.79>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(<  0.91,  -9.38, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #11
atom(<  0.61, -14.27, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -3.27, -11.25, -17.41>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(<  2.63,  -8.79, -17.40>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -1.55, -10.67, -19.53>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
cylinder {<  2.63, -16.60, -23.79>, <  1.77, -16.89, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -17.18, -21.67>, <  1.77, -16.89, -22.73>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.58, -23.79>, < -0.32, -13.93, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -14.27, -21.66>, < -0.32, -13.93, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.58, -23.79>, < -1.40, -12.12, -23.79>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -23.79>, < -1.40, -12.12, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -17.18, -21.67>, <  0.76, -15.73, -21.66>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -14.27, -21.66>, <  0.76, -15.73, -21.66>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -17.18, -21.67>, <  1.77, -16.89, -20.60>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -16.60, -19.54>, <  1.77, -16.89, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -9.38, -23.78>, <  1.77,  -9.09, -22.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -8.80, -21.66>, <  1.77,  -9.09, -22.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -9.38, -23.78>, < -0.32, -10.03, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -23.79>, < -0.32, -10.03, -23.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -14.27, -21.66>, < -0.32, -13.92, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.57, -19.54>, < -0.32, -13.92, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  2.63, -16.60, -19.54>, <  1.77, -16.89, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -17.18, -17.41>, <  1.77, -16.89, -18.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.57, -19.54>, < -0.32, -13.92, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -14.27, -17.41>, < -0.32, -13.92, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.57, -19.54>, < -1.40, -12.12, -19.54>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -19.53>, < -1.40, -12.12, -19.54>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91, -17.18, -17.41>, <  0.76, -15.72, -17.41>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.61, -14.27, -17.41>, <  0.76, -15.72, -17.41>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -11.25, -21.66>, < -2.41, -10.96, -22.73>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -23.79>, < -2.41, -10.96, -22.73>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -11.25, -21.66>, < -2.41, -10.96, -20.60>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -19.53>, < -2.41, -10.96, -20.60>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -8.80, -21.66>, <  1.77,  -9.09, -20.59>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -9.38, -19.53>, <  1.77,  -9.09, -20.59>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -9.38, -19.53>, <  1.77,  -9.08, -18.46>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  2.63,  -8.79, -17.40>, <  1.77,  -9.08, -18.46>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.91,  -9.38, -19.53>, < -0.32, -10.02, -19.53>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -19.53>, < -0.32, -10.02, -19.53>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.27, -11.25, -17.41>, < -2.41, -10.96, -18.47>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.55, -10.67, -19.53>, < -2.41, -10.96, -18.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
// no constraints
