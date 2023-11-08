#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.19*x up 36.25*y
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

cylinder {< 16.76, -17.26, -39.85>, < 16.76, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {< 16.76,  17.26, -59.78>, < 16.76,  17.26, -19.93>, Rcell pigment {Black}}
cylinder {<-16.76,  17.26, -59.78>, <-16.76,  17.26, -19.93>, Rcell pigment {Black}}
cylinder {<-16.76, -17.26, -39.85>, <-16.76, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {< 16.76, -17.26, -39.85>, < 16.76,  17.26, -59.78>, Rcell pigment {Black}}
cylinder {< 16.76, -17.26,   0.00>, < 16.76,  17.26, -19.93>, Rcell pigment {Black}}
cylinder {<-16.76, -17.26,   0.00>, <-16.76,  17.26, -19.93>, Rcell pigment {Black}}
cylinder {<-16.76, -17.26, -39.85>, <-16.76,  17.26, -59.78>, Rcell pigment {Black}}
cylinder {< 16.76, -17.26, -39.85>, <-16.76, -17.26, -39.85>, Rcell pigment {Black}}
cylinder {< 16.76, -17.26,   0.00>, <-16.76, -17.26,   0.00>, Rcell pigment {Black}}
cylinder {< 16.76,  17.26, -19.93>, <-16.76,  17.26, -19.93>, Rcell pigment {Black}}
cylinder {< 16.76,  17.26, -59.78>, <-16.76,  17.26, -59.78>, Rcell pigment {Black}}
atom(< -1.85, -13.70, -37.75>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -1.85, -15.11, -34.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(<  1.78, -11.63, -38.71>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(<  1.78, -15.31, -38.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(<  1.34, -15.34, -36.53>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #4
atom(< -0.35, -11.51, -36.53>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #5
atom(< -1.85,  -9.35, -37.82>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -1.85, -13.70, -31.11>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -1.85, -15.11, -27.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<  1.78, -11.63, -32.07>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.78, -15.31, -32.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.78, -13.33, -35.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.04, -13.42, -33.21>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(< -1.25, -13.42, -33.21>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #13
atom(<  1.34, -15.34, -29.89>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #14
atom(< -0.35, -11.51, -29.89>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #15
atom(< -1.85,  -7.95, -34.43>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.85,  -9.35, -31.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -1.85, -11.46, -34.02>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(<  1.78,  -5.88, -35.39>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  1.78,  -9.56, -35.56>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(<  1.78,  -7.57, -38.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  1.04,  -7.67, -36.53>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #22
atom(< -1.25,  -7.67, -36.53>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(<  1.34,  -9.59, -33.21>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #24
atom(< -0.35,  -5.75, -33.21>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #25
atom(< -1.85,  -3.60, -34.50>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -1.85,  -5.71, -37.34>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(<  1.78,  -3.81, -38.88>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(<  1.34,  -3.84, -36.53>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #29
atom(<  1.78, -13.33, -28.69>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #30
atom(<  1.04, -13.42, -26.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(< -1.25, -13.42, -26.57>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #32
atom(< -1.85,  -7.95, -27.79>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -1.85, -11.46, -27.38>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.78,  -5.88, -28.75>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.78,  -9.56, -28.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.78,  -7.57, -32.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<  1.04,  -7.67, -29.89>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(< -1.25,  -7.67, -29.89>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<  1.34,  -9.59, -26.57>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #40
atom(< -0.35,  -5.75, -26.57>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(< -1.85,  -3.60, -27.86>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -1.85,  -5.71, -30.70>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(<  1.78,  -3.81, -32.23>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(<  1.34,  -3.84, -29.89>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #45
cylinder {< -1.85, -13.70, -37.75>, < -1.10, -12.60, -37.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -36.53>, < -1.10, -12.60, -37.14>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -15.11, -34.50>, < -1.55, -14.27, -33.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -33.21>, < -1.55, -14.27, -33.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34, -15.34, -36.53>, <  1.56, -14.34, -35.93>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -13.33, -35.34>, <  1.56, -14.34, -35.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34, -15.34, -36.53>, <  1.56, -15.33, -37.70>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -15.31, -38.88>, <  1.56, -15.33, -37.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -36.53>, < -1.10, -11.49, -35.28>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.46, -34.02>, < -1.10, -11.49, -35.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -36.53>, < -1.10, -10.43, -37.18>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.35, -37.82>, < -1.10, -10.43, -37.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.35, -37.82>, < -1.55,  -8.51, -37.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -36.53>, < -1.55,  -8.51, -37.18>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.70, -31.11>, < -1.55, -13.56, -32.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -33.21>, < -1.55, -13.56, -32.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.70, -31.11>, < -1.10, -12.60, -30.50>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -29.89>, < -1.10, -12.60, -30.50>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -15.11, -27.86>, < -1.55, -14.27, -27.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -26.57>, < -1.55, -14.27, -27.22>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -11.63, -32.07>, <  1.41, -12.53, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -33.21>, <  1.41, -12.53, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -11.63, -32.07>, <  1.56, -10.61, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -9.59, -33.21>, <  1.56, -10.61, -32.64>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -15.31, -32.23>, <  1.56, -15.33, -31.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34, -15.34, -29.89>, <  1.56, -15.33, -31.06>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -15.31, -32.23>, <  1.41, -14.37, -32.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -33.21>, <  1.41, -14.37, -32.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -13.33, -35.34>, <  1.41, -13.38, -34.27>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -33.21>, <  1.41, -13.38, -34.27>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -33.21>, < -0.11, -13.42, -33.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -33.21>, < -0.11, -13.42, -33.21>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -33.21>, < -1.55, -12.44, -33.62>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.46, -34.02>, < -1.55, -12.44, -33.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34, -15.34, -29.89>, <  1.56, -14.34, -29.29>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -13.33, -28.69>, <  1.56, -14.34, -29.29>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -29.89>, < -1.10, -10.43, -30.54>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.35, -31.18>, < -1.10, -10.43, -30.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35, -11.51, -29.89>, < -1.10, -11.49, -28.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.46, -27.38>, < -1.10, -11.49, -28.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.95, -34.43>, < -1.10,  -6.85, -33.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35,  -5.75, -33.21>, < -1.10,  -6.85, -33.82>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.95, -34.43>, < -1.55,  -7.81, -35.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -36.53>, < -1.55,  -7.81, -35.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.35, -31.18>, < -1.55,  -8.51, -30.54>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -29.89>, < -1.55,  -8.51, -30.54>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -5.88, -35.39>, <  1.56,  -4.86, -35.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -3.84, -36.53>, <  1.56,  -4.86, -35.96>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -5.88, -35.39>, <  1.41,  -6.78, -35.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -36.53>, <  1.41,  -6.78, -35.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -9.56, -35.56>, <  1.41,  -8.61, -36.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -36.53>, <  1.41,  -8.61, -36.04>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -7.57, -38.66>, <  1.41,  -7.62, -37.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -36.53>, <  1.41,  -7.62, -37.60>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -36.53>, < -0.11,  -7.67, -36.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -36.53>, < -0.11,  -7.67, -36.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -36.53>, < -1.55,  -6.69, -36.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.71, -37.34>, < -1.55,  -6.69, -36.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -9.59, -33.21>, <  1.56,  -8.58, -32.61>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -7.57, -32.01>, <  1.56,  -8.58, -32.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -9.59, -33.21>, <  1.56,  -9.57, -34.38>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -9.56, -35.56>, <  1.56,  -9.57, -34.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35,  -5.75, -33.21>, < -1.10,  -5.73, -31.96>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.71, -30.70>, < -1.10,  -5.73, -31.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35,  -5.75, -33.21>, < -1.10,  -4.68, -33.86>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -3.60, -34.50>, < -1.10,  -4.68, -33.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.81, -38.88>, <  1.56,  -3.82, -37.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -3.84, -36.53>, <  1.56,  -3.82, -37.71>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78, -13.33, -28.69>, <  1.41, -13.38, -27.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -26.57>, <  1.41, -13.38, -27.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04, -13.42, -26.57>, < -0.11, -13.42, -26.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -26.57>, < -0.11, -13.42, -26.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25, -13.42, -26.57>, < -1.55, -12.44, -26.98>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.46, -27.38>, < -1.55, -12.44, -26.98>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.95, -27.79>, < -1.55,  -7.81, -28.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -29.89>, < -1.55,  -7.81, -28.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.95, -27.79>, < -1.10,  -6.85, -27.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35,  -5.75, -26.57>, < -1.10,  -6.85, -27.18>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -5.88, -28.75>, <  1.56,  -4.86, -29.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -3.84, -29.89>, <  1.56,  -4.86, -29.32>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -5.88, -28.75>, <  1.41,  -6.78, -29.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -29.89>, <  1.41,  -6.78, -29.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -9.56, -28.91>, <  1.41,  -8.62, -29.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -29.89>, <  1.41,  -8.62, -29.40>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -9.56, -28.91>, <  1.56,  -9.57, -27.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -9.59, -26.57>, <  1.56,  -9.57, -27.74>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -7.57, -32.01>, <  1.41,  -7.62, -30.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -29.89>, <  1.41,  -7.62, -30.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -7.67, -29.89>, < -0.11,  -7.67, -29.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -29.89>, < -0.11,  -7.67, -29.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.25,  -7.67, -29.89>, < -1.55,  -6.69, -30.30>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.71, -30.70>, < -1.55,  -6.69, -30.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.35,  -5.75, -26.57>, < -1.10,  -4.68, -27.22>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -3.60, -27.86>, < -1.10,  -4.68, -27.22>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.34,  -3.84, -29.89>, <  1.56,  -3.82, -31.06>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.78,  -3.81, -32.23>, <  1.56,  -3.82, -31.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
