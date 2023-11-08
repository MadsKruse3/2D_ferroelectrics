#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -40.15*x up 35.91*y
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

cylinder {< -6.41, -17.10,  -0.00>, < 19.12, -17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<-19.12, -17.10, -46.79>, <  6.41, -17.10, -46.82>, Rcell pigment {Black}}
cylinder {<-19.12,  17.10, -46.79>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {< -6.41,  17.10,   0.00>, < 19.12,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {< -6.41, -17.10,  -0.00>, <-19.12, -17.10, -46.79>, Rcell pigment {Black}}
cylinder {< 19.12, -17.10,  -0.03>, <  6.41, -17.10, -46.82>, Rcell pigment {Black}}
cylinder {< 19.12,  17.10,  -0.03>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {< -6.41,  17.10,   0.00>, <-19.12,  17.10, -46.79>, Rcell pigment {Black}}
cylinder {< -6.41, -17.10,  -0.00>, < -6.41,  17.10,   0.00>, Rcell pigment {Black}}
cylinder {< 19.12, -17.10,  -0.03>, < 19.12,  17.10,  -0.03>, Rcell pigment {Black}}
cylinder {<  6.41, -17.10, -46.82>, <  6.41,  17.10, -46.82>, Rcell pigment {Black}}
cylinder {<-19.12, -17.10, -46.79>, <-19.12,  17.10, -46.79>, Rcell pigment {Black}}
atom(< -4.67,   2.79,  -1.68>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -4.66,  -2.44,  -3.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -4.69,   1.56,  -5.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -2.52,  -1.08,  -1.91>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #3
atom(< -4.63,  -1.08,  -9.70>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -0.42,   2.79,  -1.68>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #5
atom(< -2.60,  -0.38,  -4.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(< -0.40,  -2.44,  -3.49>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -0.43,   1.56,  -5.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -2.55,   1.46,  -0.54>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(<  1.74,  -1.08,  -1.91>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -2.54,   2.79,  -9.48>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(< -4.72,  -0.38, -12.63>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -2.52,  -2.44, -11.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -2.55,   1.56, -13.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -4.66,   1.46,  -8.34>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(< -0.38,  -1.08,  -9.71>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -4.65,   2.79, -17.28>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(< -4.64,  -2.44, -19.09>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -4.67,   1.56, -21.08>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(< -2.50,  -1.08, -17.51>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #20
atom(<  3.84,   2.79,  -1.69>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #21
atom(<  1.65,  -0.38,  -4.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #22
atom(<  3.85,  -2.44,  -3.49>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(<  3.82,   1.56,  -5.49>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(<  1.71,   1.46,  -0.54>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #25
atom(<  5.99,  -1.08,  -1.92>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #26
atom(<  1.72,   2.79,  -9.49>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #27
atom(< -0.46,  -0.38, -12.64>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #28
atom(<  1.74,  -2.44, -11.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  1.71,   1.56, -13.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(< -0.41,   1.46,  -8.34>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #31
atom(<  3.87,  -1.08,  -9.71>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #32
atom(< -0.40,   2.79, -17.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #33
atom(< -2.58,  -0.38, -20.43>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #34
atom(< -0.38,  -2.44, -19.09>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(< -0.41,   1.56, -21.08>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(< -2.53,   1.46, -16.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #37
atom(<  1.76,  -1.08, -17.51>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #38
atom(<  5.91,  -0.38,  -4.84>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #39
atom(<  5.96,   1.46,  -0.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(<  5.97,   2.79,  -9.49>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(<  3.79,  -0.38, -12.64>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(<  5.99,  -2.44, -11.30>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(<  5.96,   1.56, -13.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(<  3.85,   1.46,  -8.35>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(<  3.86,   2.79, -17.29>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #46
atom(<  1.67,  -0.38, -20.44>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(<  3.87,  -2.44, -19.10>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #48
atom(<  3.84,   1.56, -21.09>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(<  1.73,   1.46, -16.14>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #50
atom(<  6.01,  -1.08, -17.52>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #51
atom(<  5.93,  -0.38, -20.44>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(<  5.98,   1.46, -16.15>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
cylinder {< -4.67,   2.79,  -1.68>, < -3.61,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.46,  -0.54>, < -3.61,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -2.44,  -3.48>, < -3.59,  -1.76,  -2.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -1.08,  -1.91>, < -3.59,  -1.76,  -2.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.69,   1.56,  -5.48>, < -4.68,   1.51,  -6.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   1.46,  -8.34>, < -4.68,   1.51,  -6.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.69,   1.56,  -5.48>, < -3.64,   0.59,  -5.15>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.60,  -0.38,  -4.83>, < -3.64,   0.59,  -5.15>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -1.08,  -1.91>, < -2.56,  -0.73,  -3.37>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.60,  -0.38,  -4.83>, < -2.56,  -0.73,  -3.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -1.08,  -1.91>, < -2.53,   0.19,  -1.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.46,  -0.54>, < -2.53,   0.19,  -1.22>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -1.08,  -1.91>, < -1.46,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -2.44,  -3.49>, < -1.46,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63,  -1.08,  -9.70>, < -4.65,   0.19,  -9.02>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   1.46,  -8.34>, < -4.65,   0.19,  -9.02>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.63,  -1.08,  -9.70>, < -4.68,  -0.73, -11.17>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72,  -0.38, -12.63>, < -4.68,  -0.73, -11.17>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.63,  -1.08,  -9.70>, < -3.58,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -2.44, -11.29>, < -3.58,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   2.79,  -1.68>, < -1.48,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.46,  -0.54>, < -1.48,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42,   2.79,  -1.68>, <  0.64,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.46,  -0.54>, <  0.64,   2.12,  -1.11>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.60,  -0.38,  -4.83>, < -1.52,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.43,   1.56,  -5.48>, < -1.52,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -2.44,  -3.49>, <  0.67,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -1.08,  -1.91>, <  0.67,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43,   1.56,  -5.48>, < -0.42,   1.51,  -6.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.46,  -8.34>, < -0.42,   1.51,  -6.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43,   1.56,  -5.48>, <  0.61,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.38,  -4.84>, <  0.61,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -1.08,  -1.91>, <  1.70,  -0.73,  -3.37>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.38,  -4.84>, <  1.70,  -0.73,  -3.37>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -1.08,  -1.91>, <  1.72,   0.19,  -1.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.46,  -0.54>, <  1.72,   0.19,  -1.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -1.08,  -1.91>, <  2.80,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -2.44,  -3.49>, <  2.80,  -1.76,  -2.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   2.79,  -9.48>, < -3.60,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,   1.46,  -8.34>, < -3.60,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,   2.79,  -9.48>, < -1.47,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.46,  -8.34>, < -1.47,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.72,  -0.38, -12.63>, < -3.63,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.56, -13.28>, < -3.63,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.52,  -2.44, -11.29>, < -1.45,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -1.08,  -9.71>, < -1.45,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.56, -13.28>, < -2.54,   1.51, -14.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,   1.46, -16.14>, < -2.54,   1.51, -14.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55,   1.56, -13.28>, < -1.51,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.46,  -0.38, -12.64>, < -1.51,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -1.08,  -9.71>, < -0.39,   0.19,  -9.03>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.46,  -8.34>, < -0.39,   0.19,  -9.03>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -1.08,  -9.71>, < -0.42,  -0.73, -11.17>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46,  -0.38, -12.64>, < -0.42,  -0.73, -11.17>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -1.08,  -9.71>, <  0.68,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -2.44, -11.29>, <  0.68,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,   2.79, -17.28>, < -3.59,   2.12, -16.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,   1.46, -16.14>, < -3.59,   2.12, -16.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.64,  -2.44, -19.09>, < -3.57,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -1.08, -17.51>, < -3.57,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67,   1.56, -21.08>, < -3.62,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -0.38, -20.43>, < -3.62,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -1.08, -17.51>, < -2.51,   0.19, -16.82>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,   1.46, -16.14>, < -2.51,   0.19, -16.82>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -1.08, -17.51>, < -2.54,  -0.73, -18.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -0.38, -20.43>, < -2.54,  -0.73, -18.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.50,  -1.08, -17.51>, < -1.44,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -2.44, -19.09>, < -1.44,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   2.79,  -1.69>, <  2.77,   2.12,  -1.12>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.46,  -0.54>, <  2.77,   2.12,  -1.12>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   2.79,  -1.69>, <  4.90,   2.12,  -1.12>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,   1.46,  -0.55>, <  4.90,   2.12,  -1.12>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.65,  -0.38,  -4.84>, <  2.74,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.56,  -5.49>, <  2.74,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -2.44,  -3.49>, <  4.92,  -1.76,  -2.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99,  -1.08,  -1.92>, <  4.92,  -1.76,  -2.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.56,  -5.49>, <  3.83,   1.51,  -6.92>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   1.46,  -8.35>, <  3.83,   1.51,  -6.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.82,   1.56,  -5.49>, <  4.87,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -0.38,  -4.84>, <  4.87,   0.59,  -5.16>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99,  -1.08,  -1.92>, <  5.95,  -0.73,  -3.38>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.91,  -0.38,  -4.84>, <  5.95,  -0.73,  -3.38>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.99,  -1.08,  -1.92>, <  5.98,   0.19,  -1.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,   1.46,  -0.55>, <  5.98,   0.19,  -1.23>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   2.79,  -9.49>, <  0.65,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.46,  -8.34>, <  0.65,   2.12,  -8.91>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,   2.79,  -9.49>, <  2.78,   2.12,  -8.92>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   1.46,  -8.35>, <  2.78,   2.12,  -8.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.46,  -0.38, -12.64>, <  0.62,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.56, -13.29>, <  0.62,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.74,  -2.44, -11.29>, <  2.81,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -1.08,  -9.71>, <  2.81,  -1.76, -10.50>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.56, -13.29>, <  1.72,   1.51, -14.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   1.46, -16.14>, <  1.72,   1.51, -14.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71,   1.56, -13.29>, <  2.75,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.79,  -0.38, -12.64>, <  2.75,   0.59, -12.96>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -1.08,  -9.71>, <  3.86,   0.19,  -9.03>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   1.46,  -8.35>, <  3.86,   0.19,  -9.03>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -1.08,  -9.71>, <  3.83,  -0.73, -11.18>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79,  -0.38, -12.64>, <  3.83,  -0.73, -11.18>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -1.08,  -9.71>, <  4.93,  -1.76, -10.51>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.99,  -2.44, -11.30>, <  4.93,  -1.76, -10.51>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,   2.79, -17.29>, < -1.46,   2.12, -16.71>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,   1.46, -16.14>, < -1.46,   2.12, -16.71>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,   2.79, -17.29>, <  0.66,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   1.46, -16.14>, <  0.66,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.58,  -0.38, -20.43>, < -1.50,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.56, -21.08>, < -1.50,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.38,  -2.44, -19.09>, <  0.69,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -1.08, -17.51>, <  0.69,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,   1.56, -21.08>, <  0.63,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -0.38, -20.44>, <  0.63,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -1.08, -17.51>, <  1.72,  -0.73, -18.98>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -0.38, -20.44>, <  1.72,  -0.73, -18.98>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -1.08, -17.51>, <  1.74,   0.19, -16.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   1.46, -16.14>, <  1.74,   0.19, -16.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.76,  -1.08, -17.51>, <  2.82,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -2.44, -19.10>, <  2.82,  -1.76, -18.30>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,   2.79,  -9.49>, <  4.91,   2.12,  -8.92>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,   1.46,  -8.35>, <  4.91,   2.12,  -8.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.79,  -0.38, -12.64>, <  4.88,   0.59, -12.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,   1.56, -13.29>, <  4.88,   0.59, -12.97>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96,   1.56, -13.29>, <  5.97,   1.51, -14.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,   1.46, -16.15>, <  5.97,   1.51, -14.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,   2.79, -17.29>, <  2.79,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,   1.46, -16.14>, <  2.79,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,   2.79, -17.29>, <  4.92,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,   1.46, -16.15>, <  4.92,   2.12, -16.72>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.67,  -0.38, -20.44>, <  2.76,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.56, -21.09>, <  2.76,   0.59, -20.76>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.87,  -2.44, -19.10>, <  4.94,  -1.76, -18.31>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -1.08, -17.52>, <  4.94,  -1.76, -18.31>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84,   1.56, -21.09>, <  4.89,   0.59, -20.77>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -0.38, -20.44>, <  4.89,   0.59, -20.77>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -1.08, -17.52>, <  6.00,   0.19, -16.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,   1.46, -16.15>, <  6.00,   0.19, -16.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  6.01,  -1.08, -17.52>, <  5.97,  -0.73, -18.98>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.93,  -0.38, -20.44>, <  5.97,  -0.73, -18.98>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
