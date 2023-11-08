#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -37.92*x up 40.98*y
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

cylinder {< -7.47, -19.51, -34.20>, < 18.06, -19.48, -34.20>, Rcell pigment {Black}}
cylinder {<-18.06,  19.48, -34.20>, <  7.47,  19.51, -34.20>, Rcell pigment {Black}}
cylinder {<-18.06,  19.48,   0.00>, <  7.47,  19.51,   0.00>, Rcell pigment {Black}}
cylinder {< -7.47, -19.51,   0.00>, < 18.06, -19.48,   0.00>, Rcell pigment {Black}}
cylinder {< -7.47, -19.51, -34.20>, <-18.06,  19.48, -34.20>, Rcell pigment {Black}}
cylinder {< 18.06, -19.48, -34.20>, <  7.47,  19.51, -34.20>, Rcell pigment {Black}}
cylinder {< 18.06, -19.48,   0.00>, <  7.47,  19.51,   0.00>, Rcell pigment {Black}}
cylinder {< -7.47, -19.51,   0.00>, <-18.06,  19.48,   0.00>, Rcell pigment {Black}}
cylinder {< -7.47, -19.51, -34.20>, < -7.47, -19.51,   0.00>, Rcell pigment {Black}}
cylinder {< 18.06, -19.48, -34.20>, < 18.06, -19.48,   0.00>, Rcell pigment {Black}}
cylinder {<  7.47,  19.51, -34.20>, <  7.47,  19.51,   0.00>, Rcell pigment {Black}}
cylinder {<-18.06,  19.48, -34.20>, <-18.06,  19.48,   0.00>, Rcell pigment {Black}}
atom(< -5.73, -16.60, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -5.73, -13.58, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -3.61, -17.18, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #2
atom(< -5.72,  -9.38, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(< -3.60, -14.27, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #4
atom(< -1.48, -16.60, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -1.48, -13.57, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(<  0.65, -17.18, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #7
atom(< -3.60, -11.25, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -3.60,  -8.80, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #9
atom(< -5.73, -10.67, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -1.47,  -9.38, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #11
atom(<  0.65, -14.27, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(<  0.65, -11.25, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(<  0.66,  -8.79, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -1.48, -10.67, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
cylinder {< -5.73, -16.60, -19.73>, < -4.67, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.61, -17.18, -18.01>, < -4.67, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -13.58, -15.85>, < -4.67, -13.93, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60, -14.27, -17.71>, < -4.67, -13.93, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -13.58, -15.85>, < -5.73, -12.12, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -10.67, -15.55>, < -5.73, -12.12, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.61, -17.18, -18.01>, < -3.61, -15.73, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60, -14.27, -17.71>, < -3.61, -15.73, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.61, -17.18, -18.01>, < -2.54, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -16.60, -19.73>, < -2.54, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.72,  -9.38, -18.01>, < -4.66,  -9.09, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -8.80, -19.73>, < -4.66,  -9.09, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.72,  -9.38, -18.01>, < -5.73, -10.03, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -10.67, -15.55>, < -5.73, -10.03, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60, -14.27, -17.71>, < -2.54, -13.92, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -13.57, -15.85>, < -2.54, -13.92, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -16.60, -19.73>, < -0.42, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.65, -17.18, -18.01>, < -0.42, -16.89, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -13.57, -15.85>, < -0.41, -13.92, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.65, -14.27, -17.71>, < -0.41, -13.92, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -13.57, -15.85>, < -1.48, -12.12, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -10.67, -15.55>, < -1.48, -12.12, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65, -17.18, -18.01>, <  0.65, -15.72, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65, -14.27, -17.71>, <  0.65, -15.72, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.60, -11.25, -13.83>, < -4.67, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.73, -10.67, -15.55>, < -4.67, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60, -11.25, -13.83>, < -2.54, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -10.67, -15.55>, < -2.54, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.60,  -8.80, -19.73>, < -2.53,  -9.09, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -9.38, -18.01>, < -2.53,  -9.09, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -9.38, -18.01>, < -0.41,  -9.08, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.66,  -8.79, -19.73>, < -0.41,  -9.08, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.47,  -9.38, -18.01>, < -1.47, -10.02, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -10.67, -15.55>, < -1.47, -10.02, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.65, -11.25, -13.83>, < -0.41, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -10.67, -15.55>, < -0.41, -10.96, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
// no constraints
