#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.24*x up 37.59*y
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

cylinder {< 16.78, -17.16, -40.48>, < 16.78, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {< 16.78,  17.90, -60.72>, < 16.78,  17.90, -20.24>, Rcell pigment {Black}}
cylinder {<-16.78,  17.90, -60.72>, <-16.78,  17.90, -20.24>, Rcell pigment {Black}}
cylinder {<-16.78, -17.16, -40.48>, <-16.78, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {< 16.78, -17.16, -40.48>, < 16.78,  17.90, -60.72>, Rcell pigment {Black}}
cylinder {< 16.78, -17.16,   0.00>, < 16.78,  17.90, -20.24>, Rcell pigment {Black}}
cylinder {<-16.78, -17.16,   0.00>, <-16.78,  17.90, -20.24>, Rcell pigment {Black}}
cylinder {<-16.78, -17.16, -40.48>, <-16.78,  17.90, -60.72>, Rcell pigment {Black}}
cylinder {< 16.78, -17.16, -40.48>, <-16.78, -17.16, -40.48>, Rcell pigment {Black}}
cylinder {< 16.78, -17.16,   0.00>, <-16.78, -17.16,   0.00>, Rcell pigment {Black}}
cylinder {< 16.78,  17.90, -20.24>, <-16.78,  17.90, -20.24>, Rcell pigment {Black}}
cylinder {< 16.78,  17.90, -60.72>, <-16.78,  17.90, -60.72>, Rcell pigment {Black}}
atom(< -0.12, -17.16, -33.73>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #0
atom(<  1.89, -13.32, -38.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -1.70, -13.51, -35.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(< -1.70, -17.17, -36.27>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -1.70, -14.96, -39.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -1.10, -15.21, -37.11>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(<  1.19, -15.21, -37.11>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(<  0.57, -13.26, -40.48>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #7
atom(< -0.12, -11.32, -37.11>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #8
atom(< -1.70,  -7.67, -39.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(< -1.70, -11.33, -39.65>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(< -1.10,  -9.37, -40.48>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #11
atom(<  1.19,  -9.37, -40.48>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #12
atom(< -0.12,  -5.47, -40.48>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #13
atom(<  1.89, -13.32, -31.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<  1.89, -15.36, -35.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(<  1.89, -11.12, -34.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.70, -13.51, -29.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -1.70, -17.17, -29.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -1.70, -14.95, -32.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(< -1.10, -15.21, -30.36>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #20
atom(<  1.19, -15.21, -30.36>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #21
atom(<  0.57, -13.26, -33.73>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #22
atom(< -0.12, -11.32, -30.36>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #23
atom(<  1.89,  -7.47, -34.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(<  1.89,  -9.51, -38.37>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.89,  -5.28, -38.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(< -1.70,  -7.67, -32.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -1.70, -11.33, -32.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -1.70,  -9.11, -35.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(< -1.10,  -9.37, -33.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(<  1.19,  -9.37, -33.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(<  0.57,  -7.42, -37.11>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #32
atom(< -0.12,  -5.47, -33.73>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #33
atom(<  1.89,  -1.63, -38.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(< -1.70,  -1.82, -35.83>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(< -1.70,  -5.48, -36.27>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -1.70,  -3.27, -39.22>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -1.10,  -3.53, -37.11>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #38
atom(<  1.19,  -3.53, -37.11>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #39
atom(<  0.57,  -1.58, -40.48>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #40
atom(< -0.12,   0.37, -37.11>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #41
atom(< -1.70,   4.02, -39.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #42
atom(< -1.70,   0.36, -39.65>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #43
atom(< -1.10,   2.32, -40.48>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #44
atom(<  1.19,   2.32, -40.48>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #45
atom(<  1.89, -15.36, -28.25>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #46
atom(<  1.89, -11.12, -28.17>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #47
atom(<  1.89,  -9.51, -31.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #48
atom(<  1.89,  -5.28, -31.54>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #49
atom(< -1.70,  -9.11, -29.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #50
atom(<  0.57,  -7.42, -30.36>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #51
atom(<  1.89,  -1.63, -31.29>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #52
atom(<  1.89,  -3.67, -35.00>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #53
atom(<  1.89,   0.57, -34.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #54
atom(< -1.70,  -1.82, -29.08>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #55
atom(< -1.70,  -5.48, -29.53>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #56
atom(< -1.70,  -3.27, -32.47>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #57
atom(< -1.10,  -3.53, -30.36>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #58
atom(<  1.19,  -3.53, -30.36>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #59
atom(<  0.57,  -1.58, -33.73>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #60
atom(< -0.12,   0.37, -30.36>, 0.74, rgb <0.62, 0.31, 0.71>, 0.0, ase3) // #61
atom(<  1.89,   4.21, -34.66>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #62
atom(<  1.89,   2.17, -38.37>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #63
atom(< -1.70,   4.02, -32.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #64
atom(< -1.70,   0.36, -32.90>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #65
atom(< -1.70,   2.57, -35.85>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #66
atom(< -1.10,   2.32, -33.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #67
atom(<  1.19,   2.32, -33.73>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #68
atom(<  0.57,   4.27, -37.11>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #69
atom(<  1.89,  -3.67, -28.25>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #70
atom(<  1.89,   0.57, -28.16>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #71
atom(<  1.89,   2.17, -31.63>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #72
atom(< -1.70,   2.57, -29.10>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #73
atom(<  0.57,   4.27, -30.36>, 0.72, rgb <0.75, 0.75, 0.75>, 0.0, ase3) // #74
cylinder {< -0.12, -17.16, -33.73>, < -0.91, -17.16, -35.00>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -17.17, -36.27>, < -0.91, -17.16, -35.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -17.16, -33.73>, <  0.89, -16.26, -34.37>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -15.36, -35.00>, <  0.89, -16.26, -34.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -17.16, -33.73>, < -0.91, -16.06, -33.10>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -14.95, -32.47>, < -0.91, -16.06, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -38.03>, <  1.23, -13.29, -39.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -13.26, -40.48>, <  1.23, -13.29, -39.26>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -38.03>, <  1.54, -14.26, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -37.11>, <  1.54, -14.26, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -38.03>, <  0.89, -12.32, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, <  0.89, -12.32, -37.57>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -13.51, -35.83>, < -1.40, -14.36, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -37.11>, < -1.40, -14.36, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -13.51, -35.83>, < -0.91, -12.41, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, < -0.91, -12.41, -36.47>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -17.17, -36.27>, < -1.40, -16.19, -36.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -37.11>, < -1.40, -16.19, -36.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -14.96, -39.22>, < -1.40, -15.08, -38.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -37.11>, < -1.40, -15.08, -38.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -37.11>, <  0.04, -15.21, -37.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -37.11>, <  0.04, -15.21, -37.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -37.11>, <  1.54, -15.28, -36.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -15.36, -35.00>, <  1.54, -15.28, -36.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, < -0.91, -11.32, -38.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -11.33, -39.65>, < -0.91, -11.32, -38.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, <  0.89, -11.22, -36.01>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -11.12, -34.91>, <  0.89, -11.22, -36.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, <  0.89, -10.41, -37.74>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -38.37>, <  0.89, -10.41, -37.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -37.11>, < -0.91, -10.21, -36.48>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -9.11, -35.85>, < -0.91, -10.21, -36.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.67, -39.20>, < -1.40,  -8.52, -39.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -40.48>, < -1.40,  -8.52, -39.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.67, -39.20>, < -0.91,  -6.57, -39.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -40.48>, < -0.91,  -6.57, -39.84>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -11.33, -39.65>, < -1.40, -10.35, -40.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -40.48>, < -1.40, -10.35, -40.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -40.48>, <  0.04,  -9.37, -40.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -40.48>, <  0.04,  -9.37, -40.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -40.48>, <  1.54,  -9.44, -39.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -38.37>, <  1.54,  -9.44, -39.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -40.48>, <  0.89,  -5.37, -39.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -38.29>, <  0.89,  -5.37, -39.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -40.48>, < -0.91,  -4.37, -39.85>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -3.27, -39.22>, < -0.91,  -4.37, -39.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -31.29>, <  0.89, -12.32, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, <  0.89, -12.32, -30.82>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -31.29>, <  1.54, -14.26, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -30.36>, <  1.54, -14.26, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -13.32, -31.29>, <  1.23, -13.29, -32.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -13.26, -33.73>, <  1.23, -13.29, -32.51>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -15.36, -35.00>, <  1.23, -14.31, -34.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -13.26, -33.73>, <  1.23, -14.31, -34.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -11.12, -34.91>, <  1.23, -12.19, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57, -13.26, -33.73>, <  1.23, -12.19, -34.32>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -11.12, -34.91>, <  1.54, -10.24, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -33.73>, <  1.54, -10.24, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -13.51, -29.08>, < -0.91, -12.41, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, < -0.91, -12.41, -29.72>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -13.51, -29.08>, < -1.40, -14.36, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -30.36>, < -1.40, -14.36, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -17.17, -29.53>, < -1.40, -16.19, -29.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -30.36>, < -1.40, -16.19, -29.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -14.95, -32.47>, < -1.40, -15.08, -31.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -30.36>, < -1.40, -15.08, -31.42>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10, -15.21, -30.36>, <  0.04, -15.21, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -30.36>, <  0.04, -15.21, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19, -15.21, -30.36>, <  1.54, -15.28, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -15.36, -28.25>, <  1.54, -15.28, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, < -0.91, -11.32, -31.63>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -11.33, -32.90>, < -0.91, -11.32, -31.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, <  0.89, -11.22, -29.26>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89, -11.12, -28.17>, <  0.89, -11.22, -29.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, <  0.89, -10.41, -30.99>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -31.63>, <  0.89, -10.41, -30.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12, -11.32, -30.36>, < -0.91, -10.21, -29.73>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -9.11, -29.10>, < -0.91, -10.21, -29.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -7.47, -34.66>, <  1.23,  -7.45, -35.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -7.42, -37.11>, <  1.23,  -7.45, -35.88>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -7.47, -34.66>, <  1.54,  -8.42, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -33.73>, <  1.54,  -8.42, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -7.47, -34.66>, <  0.89,  -6.47, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, <  0.89,  -6.47, -34.20>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -38.37>, <  1.23,  -8.47, -37.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -7.42, -37.11>, <  1.23,  -8.47, -37.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -38.29>, <  1.23,  -6.35, -37.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -7.42, -37.11>, <  1.23,  -6.35, -37.70>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -38.29>, <  1.54,  -4.40, -37.70>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -37.11>, <  1.54,  -4.40, -37.70>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.67, -32.46>, < -1.40,  -8.52, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -33.73>, < -1.40,  -8.52, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -7.67, -32.46>, < -0.91,  -6.57, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, < -0.91,  -6.57, -33.10>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70, -11.33, -32.90>, < -1.40, -10.35, -33.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -33.73>, < -1.40, -10.35, -33.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -9.11, -35.85>, < -1.40,  -9.24, -34.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -33.73>, < -1.40,  -9.24, -34.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -9.37, -33.73>, <  0.04,  -9.37, -33.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -33.73>, <  0.04,  -9.37, -33.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -9.37, -33.73>, <  1.54,  -9.44, -32.68>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -31.63>, <  1.54,  -9.44, -32.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, < -0.91,  -5.48, -35.00>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -5.48, -36.27>, < -0.91,  -5.48, -35.00>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, <  0.89,  -4.57, -34.37>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -3.67, -35.00>, <  0.89,  -4.57, -34.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, <  0.89,  -5.37, -32.64>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -31.54>, <  0.89,  -5.37, -32.64>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,  -5.47, -33.73>, < -0.91,  -4.37, -33.10>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -3.27, -32.47>, < -0.91,  -4.37, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -38.03>, <  1.23,  -1.60, -39.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -1.58, -40.48>, <  1.23,  -1.60, -39.26>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -38.03>, <  1.54,  -2.58, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -37.11>, <  1.54,  -2.58, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -38.03>, <  0.89,  -0.63, -37.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, <  0.89,  -0.63, -37.57>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.82, -35.83>, < -1.40,  -2.67, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -37.11>, < -1.40,  -2.67, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.82, -35.83>, < -0.91,  -0.73, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, < -0.91,  -0.73, -36.47>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -5.48, -36.27>, < -1.40,  -4.50, -36.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -37.11>, < -1.40,  -4.50, -36.69>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -3.27, -39.22>, < -1.40,  -3.40, -38.16>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -37.11>, < -1.40,  -3.40, -38.16>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -37.11>, <  0.04,  -3.53, -37.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -37.11>, <  0.04,  -3.53, -37.11>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -37.11>, <  1.54,  -3.60, -36.05>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -3.67, -35.00>, <  1.54,  -3.60, -36.05>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, < -0.91,   0.36, -38.38>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.36, -39.65>, < -0.91,   0.36, -38.38>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, <  0.89,   1.27, -37.74>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -38.37>, <  0.89,   1.27, -37.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, < -0.91,   1.47, -36.48>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.57, -35.85>, < -0.91,   1.47, -36.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -37.11>, <  0.89,   0.47, -36.01>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   0.57, -34.91>, <  0.89,   0.47, -36.01>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   4.02, -39.20>, < -1.40,   3.17, -39.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -40.48>, < -1.40,   3.17, -39.84>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.36, -39.65>, < -1.40,   1.34, -40.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -40.48>, < -1.40,   1.34, -40.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -40.48>, <  0.04,   2.32, -40.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -40.48>, <  0.04,   2.32, -40.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -40.48>, <  1.54,   2.25, -39.43>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -38.37>, <  1.54,   2.25, -39.43>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -9.51, -31.63>, <  1.23,  -8.47, -30.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -7.42, -30.36>, <  1.23,  -8.47, -30.99>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -31.54>, <  1.23,  -6.35, -30.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -7.42, -30.36>, <  1.23,  -6.35, -30.95>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -5.28, -31.54>, <  1.54,  -4.40, -30.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -30.36>, <  1.54,  -4.40, -30.95>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -31.29>, <  1.54,  -2.58, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -30.36>, <  1.54,  -2.58, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -31.29>, <  1.23,  -1.60, -32.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -1.58, -33.73>, <  1.23,  -1.60, -32.51>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -1.63, -31.29>, <  0.89,  -0.63, -30.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, <  0.89,  -0.63, -30.82>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -3.67, -35.00>, <  1.23,  -2.62, -34.37>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -1.58, -33.73>, <  1.23,  -2.62, -34.37>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   0.57, -34.91>, <  1.23,  -0.51, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,  -1.58, -33.73>, <  1.23,  -0.51, -34.32>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   0.57, -34.91>, <  1.54,   1.44, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -33.73>, <  1.54,   1.44, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.82, -29.08>, < -1.40,  -2.67, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -30.36>, < -1.40,  -2.67, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -1.82, -29.08>, < -0.91,  -0.73, -29.72>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, < -0.91,  -0.73, -29.72>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -5.48, -29.53>, < -1.40,  -4.50, -29.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -30.36>, < -1.40,  -4.50, -29.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,  -3.27, -32.47>, < -1.40,  -3.40, -31.42>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -30.36>, < -1.40,  -3.40, -31.42>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,  -3.53, -30.36>, <  0.04,  -3.53, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -30.36>, <  0.04,  -3.53, -30.36>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,  -3.53, -30.36>, <  1.54,  -3.60, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,  -3.67, -28.25>, <  1.54,  -3.60, -29.31>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, < -0.91,   0.36, -31.63>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.36, -32.90>, < -0.91,   0.36, -31.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, <  0.89,   0.47, -29.26>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   0.57, -28.16>, <  0.89,   0.47, -29.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, <  0.89,   1.27, -30.99>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -31.63>, <  0.89,   1.27, -30.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.12,   0.37, -30.36>, < -0.91,   1.47, -29.73>, Rbond texture{pigment {color rgb <0.62, 0.31, 0.71> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.57, -29.10>, < -0.91,   1.47, -29.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   4.21, -34.66>, <  1.23,   4.24, -35.88>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,   4.27, -37.11>, <  1.23,   4.24, -35.88>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   4.21, -34.66>, <  1.54,   3.27, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -33.73>, <  1.54,   3.27, -34.20>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -38.37>, <  1.23,   3.22, -37.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,   4.27, -37.11>, <  1.23,   3.22, -37.74>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   4.02, -32.46>, < -1.40,   3.17, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -33.73>, < -1.40,   3.17, -33.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   0.36, -32.90>, < -1.40,   1.34, -33.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -33.73>, < -1.40,   1.34, -33.32>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.70,   2.57, -35.85>, < -1.40,   2.45, -34.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -33.73>, < -1.40,   2.45, -34.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.10,   2.32, -33.73>, <  0.04,   2.32, -33.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -33.73>, <  0.04,   2.32, -33.73>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.19,   2.32, -33.73>, <  1.54,   2.25, -32.68>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -31.63>, <  1.54,   2.25, -32.68>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.89,   2.17, -31.63>, <  1.23,   3.22, -30.99>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.57,   4.27, -30.36>, <  1.23,   3.22, -30.99>, Rbond texture{pigment {color rgb <0.75, 0.75, 0.75> transmit 0.0} finish{ase3}}}
// no constraints
