#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -38.07*x up 29.32*y
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

cylinder {< 15.34, -13.96, -38.69>, < 15.34, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {< 15.34,  13.96, -54.81>, < 15.34,  13.96, -16.12>, Rcell pigment {Black}}
cylinder {<-18.13,  13.96, -54.81>, <-18.13,  13.96, -16.12>, Rcell pigment {Black}}
cylinder {<-18.13, -13.96, -38.69>, <-18.13, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {< 15.34, -13.96, -38.69>, < 15.34,  13.96, -54.81>, Rcell pigment {Black}}
cylinder {< 15.34, -13.96,   0.00>, < 15.34,  13.96, -16.12>, Rcell pigment {Black}}
cylinder {<-18.13, -13.96,   0.00>, <-18.13,  13.96, -16.12>, Rcell pigment {Black}}
cylinder {<-18.13, -13.96, -38.69>, <-18.13,  13.96, -54.81>, Rcell pigment {Black}}
cylinder {< 15.34, -13.96, -38.69>, <-18.13, -13.96, -38.69>, Rcell pigment {Black}}
cylinder {< 15.34, -13.96,   0.00>, <-18.13, -13.96,   0.00>, Rcell pigment {Black}}
cylinder {< 15.34,  13.96, -16.12>, <-18.13,  13.96, -16.12>, Rcell pigment {Black}}
cylinder {< 15.34,  13.96, -54.81>, <-18.13,  13.96, -54.81>, Rcell pigment {Black}}
atom(< 16.69, -10.82, -37.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< 14.18, -11.29, -34.12>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< 16.50, -11.05, -33.60>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< 13.15,  -9.60, -33.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< 13.98, -11.51, -36.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< 16.69, -10.82, -31.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< 17.21,  -9.09, -34.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< 15.34,  -8.38, -35.47>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #7
atom(< 15.34,  -8.38, -32.24>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #8
atom(< 14.18,  -5.71, -37.34>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(< 16.50,  -5.46, -36.82>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(< 13.15,  -4.02, -36.40>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< 13.46,  -7.66, -36.48>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< 16.69,  -5.24, -34.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< 17.53,  -7.15, -37.76>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(< 17.21,  -3.51, -37.68>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(< 13.98, -11.51, -29.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< 15.34,  -8.38, -29.02>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #17
atom(< 14.18,  -5.71, -30.89>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #18
atom(< 16.50,  -5.46, -30.37>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(< 13.15,  -4.02, -29.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< 13.46,  -7.66, -30.04>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< 13.98,  -5.93, -33.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< 17.53,  -7.15, -31.31>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< 17.21,  -3.51, -31.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< 14.18, -11.29, -34.12>, < 14.08, -11.40, -35.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.98, -11.51, -36.26>, < 14.08, -11.40, -35.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18, -11.29, -34.12>, < 15.34, -11.17, -33.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50, -11.05, -33.60>, < 15.34, -11.17, -33.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18, -11.29, -34.12>, < 13.66, -10.45, -33.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.15,  -9.60, -33.17>, < 13.66, -10.45, -33.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50, -11.05, -33.60>, < 16.59, -10.94, -32.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.69, -10.82, -31.45>, < 16.59, -10.94, -32.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50, -11.05, -33.60>, < 16.86, -10.07, -34.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.21,  -9.09, -34.45>, < 16.86, -10.07, -34.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.15,  -9.60, -33.17>, < 14.24,  -8.99, -32.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -32.24>, < 14.24,  -8.99, -32.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< 16.69, -10.82, -31.45>, < 16.02,  -9.60, -31.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -32.24>, < 16.02,  -9.60, -31.85>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< 17.21,  -9.09, -34.45>, < 16.28,  -8.73, -34.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -35.47>, < 16.28,  -8.73, -34.96>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -35.47>, < 14.40,  -8.02, -35.98>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< 13.46,  -7.66, -36.48>, < 14.40,  -8.02, -35.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -32.24>, < 16.43,  -7.77, -31.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< 17.53,  -7.15, -31.31>, < 16.43,  -7.77, -31.78>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -32.24>, < 14.66,  -7.15, -32.64>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< 13.98,  -5.93, -33.03>, < 14.66,  -7.15, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -37.34>, < 13.82,  -6.68, -36.91>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.46,  -7.66, -36.48>, < 13.82,  -6.68, -36.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -37.34>, < 13.66,  -4.86, -36.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.15,  -4.02, -36.40>, < 13.66,  -4.86, -36.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -37.34>, < 15.34,  -5.58, -37.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -36.82>, < 15.34,  -5.58, -37.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -36.82>, < 17.01,  -6.31, -37.29>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.53,  -7.15, -37.76>, < 17.01,  -6.31, -37.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -36.82>, < 16.59,  -5.35, -35.75>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.69,  -5.24, -34.68>, < 16.59,  -5.35, -35.75>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -36.82>, < 16.86,  -4.49, -37.25>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.21,  -3.51, -37.68>, < 16.86,  -4.49, -37.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.34,  -8.38, -29.02>, < 14.40,  -8.02, -29.53>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< 13.46,  -7.66, -30.04>, < 14.40,  -8.02, -29.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -30.89>, < 15.34,  -5.58, -30.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -30.37>, < 15.34,  -5.58, -30.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -30.89>, < 13.66,  -4.86, -30.42>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.15,  -4.02, -29.95>, < 13.66,  -4.86, -30.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -30.89>, < 13.82,  -6.68, -30.46>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.46,  -7.66, -30.04>, < 13.82,  -6.68, -30.46>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.18,  -5.71, -30.89>, < 14.08,  -5.82, -31.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.98,  -5.93, -33.03>, < 14.08,  -5.82, -31.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -30.37>, < 17.01,  -6.31, -30.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.53,  -7.15, -31.31>, < 17.01,  -6.31, -30.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.50,  -5.46, -30.37>, < 16.86,  -4.49, -30.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.21,  -3.51, -31.23>, < 16.86,  -4.49, -30.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
