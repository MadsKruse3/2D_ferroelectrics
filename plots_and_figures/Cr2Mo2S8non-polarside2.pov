#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -21.80*x up 28.36*y
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

cylinder {<  7.71, -13.51, -37.49>, <  7.71, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {<  7.71,  13.51, -37.49>, <  7.71,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-10.38,  13.51, -37.49>, <-10.38,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-10.38, -13.51, -37.49>, <-10.38, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {<  7.71, -13.51, -37.49>, <  7.71,  13.51, -37.49>, Rcell pigment {Black}}
cylinder {<  7.71, -13.51,   0.00>, <  7.71,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-10.38, -13.51,   0.00>, <-10.38,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<-10.38, -13.51, -37.49>, <-10.38,  13.51, -37.49>, Rcell pigment {Black}}
cylinder {<  7.71, -13.51, -37.49>, <-10.38, -13.51, -37.49>, Rcell pigment {Black}}
cylinder {<  7.71, -13.51,   0.00>, <-10.38, -13.51,   0.00>, Rcell pigment {Black}}
cylinder {<  7.71,  13.51,   0.00>, <-10.38,  13.51,   0.00>, Rcell pigment {Black}}
cylinder {<  7.71,  13.51, -37.49>, <-10.38,  13.51, -37.49>, Rcell pigment {Black}}
atom(<  6.40,  -6.22, -37.00>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<  9.84,  -7.27, -36.67>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(<  8.31, -10.77, -35.91>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #2
atom(<  7.12, -10.84, -32.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #3
atom(<  7.71,  -8.10, -34.37>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #4
atom(<  7.71,  -8.10, -31.24>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #5
atom(<  9.86,  -8.92, -35.21>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<  5.56,  -7.29, -33.52>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<  6.38, -10.00, -34.84>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<  9.04,  -6.20, -33.89>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<  9.02,  -9.99, -31.73>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<  6.40,  -6.22, -30.75>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #11
atom(<  5.58,  -8.94, -32.06>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<  9.84,  -7.27, -30.43>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<  8.31,  -5.37, -35.91>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #14
atom(<  7.12,  -5.44, -32.82>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #15
atom(<  7.71,  -2.70, -34.37>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #16
atom(<  7.71,  -2.70, -31.24>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #17
atom(<  9.86,  -3.52, -35.21>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(<  6.38,  -4.60, -34.84>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #19
atom(<  9.02,  -4.59, -31.73>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<  5.58,  -3.53, -32.06>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<  8.31, -10.77, -29.66>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #22
atom(<  7.71,  -8.10, -28.12>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #23
atom(<  9.86,  -8.92, -28.96>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(<  6.38, -10.00, -28.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(<  9.04,  -6.20, -27.65>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #26
atom(<  8.31,  -5.37, -29.66>, 0.69, rgb <0.54, 0.60, 0.78>, 0.0, ase3) // #27
atom(<  7.71,  -2.70, -28.12>, 0.77, rgb <0.33, 0.71, 0.71>, 0.0, ase3) // #28
atom(<  9.86,  -3.52, -28.96>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(<  6.38,  -4.60, -28.59>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #30
cylinder {<  6.40,  -6.22, -37.00>, <  7.35,  -5.79, -36.46>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  7.35,  -5.79, -36.46>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.84,  -7.27, -36.67>, <  9.85,  -8.10, -35.94>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -35.21>, <  9.85,  -8.10, -35.94>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.84,  -7.27, -36.67>, <  9.07,  -6.32, -36.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  9.07,  -6.32, -36.29>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -35.91>, <  8.01,  -9.44, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  8.01,  -9.44, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -35.91>, <  9.08,  -9.84, -35.56>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -35.21>, <  9.08,  -9.84, -35.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12, -10.84, -32.82>, <  7.41,  -9.47, -32.03>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  7.41,  -9.47, -32.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12, -10.84, -32.82>, <  6.75, -10.42, -33.83>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.38, -10.00, -34.84>, <  6.75, -10.42, -33.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12, -10.84, -32.82>, <  6.35,  -9.89, -32.44>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.58,  -8.94, -32.06>, <  6.35,  -9.89, -32.44>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12, -10.84, -32.82>, <  7.41,  -9.47, -33.59>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  7.41,  -9.47, -33.59>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12, -10.84, -32.82>, <  8.07, -10.42, -32.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -9.99, -31.73>, <  8.07, -10.42, -32.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  8.78,  -8.51, -34.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -35.21>, <  8.78,  -8.51, -34.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  8.01,  -6.73, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  8.01,  -6.73, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  8.38,  -7.15, -34.13>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.04,  -6.20, -33.89>, <  8.38,  -7.15, -34.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  7.41,  -6.77, -32.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  7.41,  -6.77, -32.03>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  7.06,  -7.16, -31.00>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  6.40,  -6.22, -30.75>, <  7.06,  -7.16, -31.00>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  6.65,  -8.52, -31.65>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  5.58,  -8.94, -32.06>, <  6.65,  -8.52, -31.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  7.71,  -8.10, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  7.71,  -8.10, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  8.37,  -9.05, -31.49>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -9.99, -31.73>, <  8.37,  -9.05, -31.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  8.77,  -7.69, -30.83>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.84,  -7.27, -30.43>, <  8.77,  -7.69, -30.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  8.01,  -9.44, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -29.66>, <  8.01,  -9.44, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  7.71,  -8.10, -29.68>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  7.71,  -8.10, -29.68>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -31.24>, <  8.01,  -6.73, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.01,  -6.73, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.56,  -7.29, -33.52>, <  6.34,  -6.36, -33.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  6.34,  -6.36, -33.17>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.56,  -7.29, -33.52>, <  5.57,  -8.11, -32.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  5.58,  -8.94, -32.06>, <  5.57,  -8.11, -32.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  5.56,  -7.29, -33.52>, <  6.64,  -7.70, -33.94>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  6.64,  -7.70, -33.94>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  6.38, -10.00, -34.84>, <  7.05,  -9.05, -34.60>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  7.05,  -9.05, -34.60>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  6.38, -10.00, -34.84>, <  7.34, -10.39, -35.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -35.91>, <  7.34, -10.39, -35.37>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.04,  -6.20, -33.89>, <  8.67,  -5.78, -34.90>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  8.67,  -5.78, -34.90>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -9.99, -31.73>, <  8.66, -10.38, -30.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -29.66>, <  8.66, -10.38, -30.70>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.40,  -6.22, -30.75>, <  6.76,  -5.83, -31.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  6.76,  -5.83, -31.79>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.40,  -6.22, -30.75>, <  7.35,  -5.79, -30.21>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  7.35,  -5.79, -30.21>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.84,  -7.27, -30.43>, <  9.85,  -8.10, -29.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -28.96>, <  9.85,  -8.10, -29.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.84,  -7.27, -30.43>, <  9.07,  -6.32, -30.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  9.07,  -6.32, -30.05>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  9.08,  -4.44, -35.56>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -3.52, -35.21>, <  9.08,  -4.44, -35.56>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  8.01,  -4.03, -35.14>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -34.37>, <  8.01,  -4.03, -35.14>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  6.75,  -5.02, -33.83>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.38,  -4.60, -34.84>, <  6.75,  -5.02, -33.83>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  7.41,  -4.07, -32.03>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  7.41,  -4.07, -32.03>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  6.35,  -4.49, -32.44>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  5.58,  -3.53, -32.06>, <  6.35,  -4.49, -32.44>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  7.41,  -6.77, -33.59>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -34.37>, <  7.41,  -6.77, -33.59>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  8.08,  -5.82, -33.36>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.04,  -6.20, -33.89>, <  8.08,  -5.82, -33.36>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  7.41,  -4.07, -33.59>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -34.37>, <  7.41,  -4.07, -33.59>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.12,  -5.44, -32.82>, <  8.07,  -5.01, -32.27>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -4.59, -31.73>, <  8.07,  -5.01, -32.27>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -34.37>, <  8.78,  -3.11, -34.79>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -3.52, -35.21>, <  8.78,  -3.11, -34.79>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  6.65,  -3.12, -31.65>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  5.58,  -3.53, -32.06>, <  6.65,  -3.12, -31.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  7.71,  -2.70, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -34.37>, <  7.71,  -2.70, -32.80>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  8.37,  -3.64, -31.49>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -4.59, -31.73>, <  8.37,  -3.64, -31.49>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  8.01,  -4.03, -30.45>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.01,  -4.03, -30.45>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -31.24>, <  7.71,  -2.70, -29.68>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -28.12>, <  7.71,  -2.70, -29.68>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  6.38,  -4.60, -34.84>, <  7.34,  -4.98, -35.37>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -35.91>, <  7.34,  -4.98, -35.37>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.38,  -4.60, -34.84>, <  7.05,  -3.65, -34.60>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -34.37>, <  7.05,  -3.65, -34.60>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.02,  -4.59, -31.73>, <  8.66,  -4.98, -30.70>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.66,  -4.98, -30.70>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -29.66>, <  8.01,  -9.44, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  8.01,  -9.44, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -29.66>, <  9.08,  -9.84, -29.31>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -28.96>, <  9.08,  -9.84, -29.31>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  8.78,  -8.51, -28.54>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -8.92, -28.96>, <  8.78,  -8.51, -28.54>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  8.01,  -6.73, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.01,  -6.73, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  8.38,  -7.15, -27.88>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.04,  -6.20, -27.65>, <  8.38,  -7.15, -27.88>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.38, -10.00, -28.59>, <  7.34, -10.39, -29.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31, -10.77, -29.66>, <  7.34, -10.39, -29.13>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.38, -10.00, -28.59>, <  7.05,  -9.05, -28.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -8.10, -28.12>, <  7.05,  -9.05, -28.35>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.04,  -6.20, -27.65>, <  8.67,  -5.78, -28.66>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.67,  -5.78, -28.66>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  9.08,  -4.44, -29.31>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -3.52, -28.96>, <  9.08,  -4.44, -29.31>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  8.01,  -4.03, -28.89>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -28.12>, <  8.01,  -4.03, -28.89>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -28.12>, <  8.78,  -3.11, -28.54>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  9.86,  -3.52, -28.96>, <  8.78,  -3.11, -28.54>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.38,  -4.60, -28.59>, <  7.34,  -4.98, -29.13>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.31,  -5.37, -29.66>, <  7.34,  -4.98, -29.13>, Rbond texture{pigment {color rgb <0.54, 0.60, 0.78> transmit 0.0} finish{ase3}}}
cylinder {<  6.38,  -4.60, -28.59>, <  7.05,  -3.65, -28.35>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  7.71,  -2.70, -28.12>, <  7.05,  -3.65, -28.35>, Rbond texture{pigment {color rgb <0.33, 0.71, 0.71> transmit 0.0} finish{ase3}}}
// no constraints
