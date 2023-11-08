#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -38.28*x up 30.21*y
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

cylinder {< 15.29, -14.38, -39.85>, < 15.29, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {< 15.29,  14.38, -56.46>, < 15.29,  14.38, -16.61>, Rcell pigment {Black}}
cylinder {<-18.23,  14.38, -56.46>, <-18.23,  14.38, -16.61>, Rcell pigment {Black}}
cylinder {<-18.23, -14.38, -39.85>, <-18.23, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {< 15.29, -14.38, -39.85>, < 15.29,  14.38, -56.46>, Rcell pigment {Black}}
cylinder {< 15.29, -14.38,   0.00>, < 15.29,  14.38, -16.61>, Rcell pigment {Black}}
cylinder {<-18.23, -14.38,   0.00>, <-18.23,  14.38, -16.61>, Rcell pigment {Black}}
cylinder {<-18.23, -14.38, -39.85>, <-18.23,  14.38, -56.46>, Rcell pigment {Black}}
cylinder {< 15.29, -14.38, -39.85>, <-18.23, -14.38, -39.85>, Rcell pigment {Black}}
cylinder {< 15.29, -14.38,   0.00>, <-18.23, -14.38,   0.00>, Rcell pigment {Black}}
cylinder {< 15.29,  14.38, -16.61>, <-18.23,  14.38, -16.61>, Rcell pigment {Black}}
cylinder {< 15.29,  14.38, -56.46>, <-18.23,  14.38, -56.46>, Rcell pigment {Black}}
atom(< 13.95, -11.79, -39.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< 15.29,  -8.63, -36.53>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #1
atom(< 13.44,  -7.84, -38.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< 13.95, -11.79, -32.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< 17.13,  -9.42, -34.26>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< 16.62, -11.22, -37.28>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< 16.45, -11.40, -35.13>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< 14.12, -11.61, -34.62>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #7
atom(< 15.29,  -8.63, -29.89>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< 13.95,  -6.04, -35.78>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< 13.44,  -7.84, -32.16>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< 12.94, -10.00, -35.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< 17.13,  -3.66, -37.58>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< 17.63,  -7.26, -37.60>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(< 16.45,  -5.65, -38.45>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #14
atom(< 14.12,  -5.86, -37.94>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(< 15.29,  -8.63, -33.21>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #16
atom(< 12.94,  -4.24, -38.79>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< 16.62, -11.22, -30.64>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< 17.13,  -3.66, -30.94>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< 17.63,  -7.26, -30.96>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< 16.62,  -5.47, -33.96>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< 16.45,  -5.65, -31.81>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< 14.12,  -5.86, -31.30>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(< 12.94,  -4.24, -32.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< 15.29,  -8.63, -36.53>, < 16.46,  -7.95, -37.07>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 17.63,  -7.26, -37.60>, < 16.46,  -7.95, -37.07>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -36.53>, < 14.62,  -7.33, -36.16>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 13.95,  -6.04, -35.78>, < 14.62,  -7.33, -36.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.44,  -7.84, -38.81>, < 13.78,  -6.85, -38.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -37.94>, < 13.78,  -6.85, -38.37>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.95, -11.79, -32.46>, < 14.04, -11.70, -33.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12, -11.61, -34.62>, < 14.04, -11.70, -33.54>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.13,  -9.42, -34.26>, < 16.79, -10.41, -34.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45, -11.40, -35.13>, < 16.79, -10.41, -34.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.13,  -9.42, -34.26>, < 16.21,  -9.02, -33.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -33.21>, < 16.21,  -9.02, -33.74>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< 16.62, -11.22, -37.28>, < 16.53, -11.31, -36.21>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45, -11.40, -35.13>, < 16.53, -11.31, -36.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.62, -11.22, -37.28>, < 15.95,  -9.92, -36.91>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -36.53>, < 15.95,  -9.92, -36.91>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.45, -11.40, -35.13>, < 15.29, -11.51, -34.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12, -11.61, -34.62>, < 15.29, -11.51, -34.87>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12, -11.61, -34.62>, < 13.53, -10.80, -35.04>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 12.94, -10.00, -35.47>, < 13.53, -10.80, -35.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -29.89>, < 15.95,  -9.92, -30.27>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 16.62, -11.22, -30.64>, < 15.95,  -9.92, -30.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -29.89>, < 16.46,  -7.95, -30.42>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 17.63,  -7.26, -30.96>, < 16.46,  -7.95, -30.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.95,  -6.04, -35.78>, < 14.04,  -5.95, -36.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -37.94>, < 14.04,  -5.95, -36.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 13.44,  -7.84, -32.16>, < 14.36,  -8.24, -32.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -33.21>, < 14.36,  -8.24, -32.69>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< 13.44,  -7.84, -32.16>, < 13.78,  -6.85, -31.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -31.30>, < 13.78,  -6.85, -31.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 12.94, -10.00, -35.47>, < 14.11,  -9.31, -36.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 15.29,  -8.63, -36.53>, < 14.11,  -9.31, -36.00>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< 17.13,  -3.66, -37.58>, < 16.79,  -4.66, -38.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -38.45>, < 16.79,  -4.66, -38.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.63,  -7.26, -37.60>, < 17.04,  -6.46, -38.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -38.45>, < 17.04,  -6.46, -38.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -38.45>, < 15.29,  -5.75, -38.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -37.94>, < 15.29,  -5.75, -38.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -37.94>, < 13.53,  -5.05, -38.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 12.94,  -4.24, -38.79>, < 13.53,  -5.05, -38.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.13,  -3.66, -30.94>, < 16.79,  -4.66, -31.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -31.81>, < 16.79,  -4.66, -31.37>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 17.63,  -7.26, -30.96>, < 17.04,  -6.46, -31.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -31.81>, < 17.04,  -6.46, -31.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -31.81>, < 15.29,  -5.75, -31.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -31.30>, < 15.29,  -5.75, -31.55>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.45,  -5.65, -31.81>, < 16.53,  -5.56, -32.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 16.62,  -5.47, -33.96>, < 16.53,  -5.56, -32.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 14.12,  -5.86, -31.30>, < 13.53,  -5.05, -31.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< 12.94,  -4.24, -32.15>, < 13.53,  -5.05, -31.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
