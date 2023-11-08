#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -40.15*x up 49.41*y
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

cylinder {< -6.41, -23.29, -34.20>, < 19.12, -23.26, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.50, -34.20>, <  6.41,  23.53, -34.20>, Rcell pigment {Black}}
cylinder {<-19.12,  23.50,   0.00>, <  6.41,  23.53,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.29,   0.00>, < 19.12, -23.26,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.29, -34.20>, <-19.12,  23.50, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.26, -34.20>, <  6.41,  23.53, -34.20>, Rcell pigment {Black}}
cylinder {< 19.12, -23.26,   0.00>, <  6.41,  23.53,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.29,   0.00>, <-19.12,  23.50,   0.00>, Rcell pigment {Black}}
cylinder {< -6.41, -23.29, -34.20>, < -6.41, -23.29,   0.00>, Rcell pigment {Black}}
cylinder {< 19.12, -23.26, -34.20>, < 19.12, -23.26,   0.00>, Rcell pigment {Black}}
cylinder {<  6.41,  23.53, -34.20>, <  6.41,  23.53,   0.00>, Rcell pigment {Black}}
cylinder {<-19.12,  23.50, -34.20>, <-19.12,  23.50,   0.00>, Rcell pigment {Black}}
atom(< -4.68, -22.84, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #0
atom(< -6.80, -18.06, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #1
atom(< -4.68, -20.38, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #2
atom(< -4.67, -17.36, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #3
atom(< -6.81, -22.26, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -2.55, -20.96, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #5
atom(< -6.80, -15.04, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #6
atom(< -6.79, -12.59, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #7
atom(< -6.79,  -9.56, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #8
atom(< -4.67, -13.16, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #9
atom(< -6.78,  -5.37, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #10
atom(< -0.43, -22.83, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #11
atom(< -2.55, -18.06, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #12
atom(< -0.42, -20.38, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #13
atom(< -0.42, -17.35, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #14
atom(< -2.56, -22.25, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #15
atom(<  1.71, -20.96, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #16
atom(< -2.54, -15.03, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #17
atom(< -4.66, -10.26, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #18
atom(< -2.54, -12.58, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #19
atom(< -2.54,  -9.56, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #20
atom(< -4.67, -14.45, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #21
atom(< -0.41, -13.16, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #22
atom(< -4.66,  -7.24, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #23
atom(< -6.78,  -2.46, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #24
atom(< -4.66,  -4.78, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #25
atom(< -4.65,  -1.76, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #26
atom(< -6.79,  -6.66, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #27
atom(< -2.53,  -5.36, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #28
atom(<  3.83, -22.83, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #29
atom(<  1.71, -18.05, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #30
atom(<  3.83, -20.37, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #31
atom(<  3.84, -17.35, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #32
atom(<  1.70, -22.25, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #33
atom(<  5.96, -20.95, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #34
atom(<  1.71, -15.03, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #35
atom(< -0.41, -10.25, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #36
atom(<  1.72, -12.57, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #37
atom(<  1.72,  -9.55, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #38
atom(< -0.42, -14.45, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #39
atom(<  3.84, -13.15, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #40
atom(< -0.41,  -7.23, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #41
atom(< -2.53,  -2.46, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #42
atom(< -0.40,  -4.78, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #43
atom(< -0.40,  -1.75, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #44
atom(< -2.54,  -6.65, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #45
atom(<  1.73,  -5.36, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #46
atom(<  5.96, -18.05, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #47
atom(<  5.95, -22.24, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #48
atom(<  5.97, -15.02, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #49
atom(<  3.85, -10.25, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #50
atom(<  5.97, -12.57, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #51
atom(<  5.97,  -9.55, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #52
atom(<  3.84, -14.44, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #53
atom(<  3.85,  -7.22, -13.83>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #54
atom(<  1.73,  -2.45, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #55
atom(<  3.85,  -4.77, -19.73>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #56
atom(<  3.86,  -1.75, -15.85>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #57
atom(<  1.72,  -6.65, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #58
atom(<  5.98,  -5.35, -18.01>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #59
atom(<  5.98,  -2.44, -17.71>, 0.69, rgb <0.83, 0.48, 0.00>, 0.0, ase3) // #60
atom(<  5.97,  -6.64, -15.55>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #61
cylinder {< -4.68, -22.84, -13.83>, < -3.62, -22.55, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56, -22.25, -15.55>, < -3.62, -22.55, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.80, -18.06, -17.71>, < -5.74, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -17.36, -15.85>, < -5.74, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.68, -20.38, -19.73>, < -3.61, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -20.96, -18.01>, < -3.61, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -17.36, -15.85>, < -3.61, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -18.06, -17.71>, < -3.61, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -17.36, -15.85>, < -4.67, -15.91, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -14.45, -15.55>, < -4.67, -15.91, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.81, -22.26, -15.55>, < -5.75, -22.55, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.68, -22.84, -13.83>, < -5.75, -22.55, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -20.96, -18.01>, < -2.55, -21.61, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.56, -22.25, -15.55>, < -2.55, -21.61, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -20.96, -18.01>, < -1.48, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -20.38, -19.73>, < -1.48, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -20.96, -18.01>, < -2.55, -19.51, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -18.06, -17.71>, < -2.55, -19.51, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.80, -15.04, -13.83>, < -5.74, -14.75, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -14.45, -15.55>, < -5.74, -14.75, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79, -12.59, -19.73>, < -5.73, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -13.16, -18.01>, < -5.73, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -9.56, -15.85>, < -5.73,  -9.91, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -10.26, -17.71>, < -5.73,  -9.91, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -9.56, -15.85>, < -6.79,  -8.11, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -6.66, -15.55>, < -6.79,  -8.11, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -13.16, -18.01>, < -4.67, -13.81, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -14.45, -15.55>, < -4.67, -13.81, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -13.16, -18.01>, < -4.66, -11.71, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -10.26, -17.71>, < -4.66, -11.71, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -13.16, -18.01>, < -3.60, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -12.58, -19.73>, < -3.60, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -5.37, -18.01>, < -6.78,  -3.91, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -2.46, -17.71>, < -6.78,  -3.91, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -5.37, -18.01>, < -5.72,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -4.78, -19.73>, < -5.72,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -5.37, -18.01>, < -6.79,  -6.01, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -6.66, -15.55>, < -6.79,  -6.01, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -22.83, -13.83>, < -1.49, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.56, -22.25, -15.55>, < -1.49, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.43, -22.83, -13.83>, <  0.64, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70, -22.25, -15.55>, <  0.64, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.55, -18.06, -17.71>, < -1.48, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -17.35, -15.85>, < -1.48, -17.71, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -20.38, -19.73>, <  0.64, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -20.96, -18.01>, <  0.64, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -17.35, -15.85>, < -0.42, -15.90, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -14.45, -15.55>, < -0.42, -15.90, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -17.35, -15.85>, <  0.64, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -18.05, -17.71>, <  0.64, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -20.96, -18.01>, <  1.70, -21.60, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.70, -22.25, -15.55>, <  1.70, -21.60, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -20.96, -18.01>, <  1.71, -19.50, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -18.05, -17.71>, <  1.71, -19.50, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -20.96, -18.01>, <  2.77, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.83, -20.37, -19.73>, <  2.77, -20.67, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -15.03, -13.83>, < -1.48, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -14.45, -15.55>, < -1.48, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -15.03, -13.83>, < -3.61, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.67, -14.45, -15.55>, < -3.61, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66, -10.26, -17.71>, < -3.60,  -9.91, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -9.56, -15.85>, < -3.60,  -9.91, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -12.58, -19.73>, < -1.47, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -13.16, -18.01>, < -1.47, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -9.56, -15.85>, < -1.47,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -10.25, -17.71>, < -1.47,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -9.56, -15.85>, < -2.54,  -8.10, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -6.65, -15.55>, < -2.54,  -8.10, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -13.16, -18.01>, < -0.41, -13.80, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -14.45, -15.55>, < -0.41, -13.80, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -13.16, -18.01>, < -0.41, -11.71, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -10.25, -17.71>, < -0.41, -11.71, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -13.16, -18.01>, <  0.65, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -12.57, -19.73>, <  0.65, -12.87, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.24, -13.83>, < -3.60,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -6.65, -15.55>, < -3.60,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -7.24, -13.83>, < -5.73,  -6.95, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.79,  -6.66, -15.55>, < -5.73,  -6.95, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -6.78,  -2.46, -17.71>, < -5.72,  -2.11, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.76, -15.85>, < -5.72,  -2.11, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.66,  -4.78, -19.73>, < -3.59,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -5.36, -18.01>, < -3.59,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.65,  -1.76, -15.85>, < -3.59,  -2.11, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -2.46, -17.71>, < -3.59,  -2.11, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -5.36, -18.01>, < -2.53,  -6.01, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -6.65, -15.55>, < -2.53,  -6.01, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -5.36, -18.01>, < -2.53,  -3.91, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -2.46, -17.71>, < -2.53,  -3.91, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -5.36, -18.01>, < -1.46,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -4.78, -19.73>, < -1.46,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.83, -22.83, -13.83>, <  2.76, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.70, -22.25, -15.55>, <  2.76, -22.54, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.83, -22.83, -13.83>, <  4.89, -22.53, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.95, -22.24, -15.55>, <  4.89, -22.53, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -18.05, -17.71>, <  2.77, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -17.35, -15.85>, <  2.77, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.83, -20.37, -19.73>, <  4.90, -20.66, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -20.95, -18.01>, <  4.90, -20.66, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -17.35, -15.85>, <  3.84, -15.90, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -14.44, -15.55>, <  3.84, -15.90, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -17.35, -15.85>, <  4.90, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -18.05, -17.71>, <  4.90, -17.70, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -20.95, -18.01>, <  5.96, -21.60, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.95, -22.24, -15.55>, <  5.96, -21.60, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -20.95, -18.01>, <  5.96, -19.50, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.96, -18.05, -17.71>, <  5.96, -19.50, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -15.03, -13.83>, <  0.65, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.42, -14.45, -15.55>, <  0.65, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.71, -15.03, -13.83>, <  2.77, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -14.44, -15.55>, <  2.77, -14.74, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41, -10.25, -17.71>, <  0.65,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.55, -15.85>, <  0.65,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -12.57, -19.73>, <  2.78, -12.86, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -13.15, -18.01>, <  2.78, -12.86, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.55, -15.85>, <  2.78,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -10.25, -17.71>, <  2.78,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.55, -15.85>, <  1.72,  -8.10, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -6.65, -15.55>, <  1.72,  -8.10, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -13.15, -18.01>, <  3.84, -13.80, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -14.44, -15.55>, <  3.84, -13.80, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -13.15, -18.01>, <  4.91, -12.86, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.97, -12.57, -19.73>, <  4.91, -12.86, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -13.15, -18.01>, <  3.85, -11.70, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -10.25, -17.71>, <  3.85, -11.70, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -7.23, -13.83>, < -1.47,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54,  -6.65, -15.55>, < -1.47,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.41,  -7.23, -13.83>, <  0.66,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -6.65, -15.55>, <  0.66,  -6.94, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -2.53,  -2.46, -17.71>, < -1.46,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -1.75, -15.85>, < -1.46,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -4.78, -19.73>, <  0.66,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.36, -18.01>, <  0.66,  -5.07, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -0.40,  -1.75, -15.85>, <  0.66,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -2.45, -17.71>, <  0.66,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.36, -18.01>, <  1.72,  -6.00, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -6.65, -15.55>, <  1.72,  -6.00, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.36, -18.01>, <  1.73,  -3.90, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -2.45, -17.71>, <  1.73,  -3.90, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -5.36, -18.01>, <  2.79,  -5.06, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -4.77, -19.73>, <  2.79,  -5.06, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97, -15.02, -13.83>, <  4.90, -14.73, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.84, -14.44, -15.55>, <  4.90, -14.73, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85, -10.25, -17.71>, <  4.91,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -9.55, -15.85>, <  4.91,  -9.90, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -9.55, -15.85>, <  5.97,  -8.09, -15.70>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -6.64, -15.55>, <  5.97,  -8.09, -15.70>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -7.22, -13.83>, <  2.78,  -6.93, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -6.65, -15.55>, <  2.78,  -6.93, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -7.22, -13.83>, <  4.91,  -6.93, -14.69>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -6.64, -15.55>, <  4.91,  -6.93, -14.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.73,  -2.45, -17.71>, <  2.79,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,  -1.75, -15.85>, <  2.79,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  3.85,  -4.77, -19.73>, <  4.92,  -5.06, -18.87>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -5.35, -18.01>, <  4.92,  -5.06, -18.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  3.86,  -1.75, -15.85>, <  4.92,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -2.44, -17.71>, <  4.92,  -2.10, -16.78>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -5.35, -18.01>, <  5.98,  -6.00, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.97,  -6.64, -15.55>, <  5.98,  -6.00, -16.78>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -5.35, -18.01>, <  5.98,  -3.90, -17.86>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  5.98,  -2.44, -17.71>, <  5.98,  -3.90, -17.86>, Rbond texture{pigment {color rgb <0.83, 0.48, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
