#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -35.14*x up 35.19*y
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

cylinder {< 16.73, -16.75, -38.69>, < 16.73, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {< 16.73,  16.75, -58.04>, < 16.73,  16.75, -19.35>, Rcell pigment {Black}}
cylinder {<-16.73,  16.75, -58.04>, <-16.73,  16.75, -19.35>, Rcell pigment {Black}}
cylinder {<-16.73, -16.75, -38.69>, <-16.73, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {< 16.73, -16.75, -38.69>, < 16.73,  16.75, -58.04>, Rcell pigment {Black}}
cylinder {< 16.73, -16.75,   0.00>, < 16.73,  16.75, -19.35>, Rcell pigment {Black}}
cylinder {<-16.73, -16.75,   0.00>, <-16.73,  16.75, -19.35>, Rcell pigment {Black}}
cylinder {<-16.73, -16.75, -38.69>, <-16.73,  16.75, -58.04>, Rcell pigment {Black}}
cylinder {< 16.73, -16.75, -38.69>, <-16.73, -16.75, -38.69>, Rcell pigment {Black}}
cylinder {< 16.73, -16.75,   0.00>, <-16.73, -16.75,   0.00>, Rcell pigment {Black}}
cylinder {< 16.73,  16.75, -19.35>, <-16.73,  16.75, -19.35>, Rcell pigment {Black}}
cylinder {< 16.73,  16.75, -58.04>, <-16.73,  16.75, -58.04>, Rcell pigment {Black}}
atom(<  0.23, -14.89, -35.47>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #0
atom(< -1.85, -11.09, -37.80>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #1
atom(< -1.85, -14.77, -37.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(<  1.72, -12.89, -36.58>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(<  0.23, -14.89, -29.02>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #4
atom(< -1.16, -13.03, -32.24>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #5
atom(<  1.12, -13.03, -32.24>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #6
atom(< -1.85, -11.09, -31.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #7
atom(< -1.85, -14.77, -31.01>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(< -1.85, -13.23, -34.37>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #9
atom(<  1.72, -12.89, -30.13>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<  1.72, -14.93, -33.18>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(<  1.72, -11.27, -33.42>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -1.48, -11.17, -35.47>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #13
atom(<  0.23,  -9.31, -32.24>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #14
atom(< -1.16,  -7.45, -35.47>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #15
atom(<  1.12,  -7.45, -35.47>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #16
atom(< -1.85,  -5.51, -34.57>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(< -1.85,  -9.19, -34.24>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #18
atom(< -1.85,  -7.64, -37.59>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #19
atom(<  1.72,  -7.30, -33.35>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(<  1.72,  -9.35, -36.40>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<  1.72,  -5.69, -36.65>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -1.16, -13.03, -25.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #23
atom(<  1.12, -13.03, -25.80>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #24
atom(< -1.85, -13.23, -27.92>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<  1.72, -14.93, -26.73>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #26
atom(<  1.72, -11.27, -26.98>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #27
atom(< -1.48, -11.17, -29.02>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #28
atom(<  0.23,  -9.31, -25.80>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #29
atom(< -1.16,  -7.45, -29.02>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #30
atom(<  1.12,  -7.45, -29.02>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #31
atom(< -1.85,  -5.51, -28.13>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(< -1.85,  -9.19, -27.79>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(< -1.85,  -7.64, -31.15>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #34
atom(<  1.72,  -7.30, -26.91>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #35
atom(<  1.72,  -9.35, -29.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(<  1.72,  -5.69, -30.20>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(< -1.48,  -5.59, -32.24>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #38
atom(< -1.48,  -5.59, -25.80>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #39
cylinder {<  0.23, -14.89, -35.47>, < -0.81, -14.83, -36.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -14.77, -37.46>, < -0.81, -14.83, -36.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -35.47>, <  0.98, -14.91, -34.32>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -14.93, -33.18>, <  0.98, -14.91, -34.32>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -35.47>, < -0.81, -14.06, -34.92>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -34.37>, < -0.81, -14.06, -34.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -35.47>, <  0.98, -13.89, -36.02>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -12.89, -36.58>, <  0.98, -13.89, -36.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.09, -37.80>, < -1.66, -11.13, -36.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -35.47>, < -1.66, -11.13, -36.63>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -29.02>, <  0.98, -13.89, -29.57>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -12.89, -30.13>, <  0.98, -13.89, -29.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -29.02>, < -0.81, -14.83, -30.02>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -14.77, -31.01>, < -0.81, -14.83, -30.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -29.02>, <  0.98, -14.91, -27.87>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -14.93, -26.73>, <  0.98, -14.91, -27.87>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23, -14.89, -29.02>, < -0.81, -14.06, -28.47>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -27.92>, < -0.81, -14.06, -28.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -32.24>, < -0.02, -13.03, -32.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -32.24>, < -0.02, -13.03, -32.24>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -32.24>, < -1.50, -13.13, -33.31>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -34.37>, < -1.50, -13.13, -33.31>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -32.24>, < -1.50, -13.90, -31.63>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -14.77, -31.01>, < -1.50, -13.90, -31.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -32.24>, < -1.50, -12.06, -31.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.09, -31.35>, < -1.50, -12.06, -31.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -32.24>, <  1.42, -12.96, -31.19>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -12.89, -30.13>, <  1.42, -12.96, -31.19>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -32.24>, <  1.42, -13.98, -32.71>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -14.93, -33.18>, <  1.42, -13.98, -32.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -32.24>, <  1.42, -12.15, -32.83>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -11.27, -33.42>, <  1.42, -12.15, -32.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.09, -31.35>, < -1.66, -11.13, -30.18>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -29.02>, < -1.66, -11.13, -30.18>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -11.09, -31.35>, < -0.81, -10.20, -31.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, < -0.81, -10.20, -31.80>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -34.37>, < -1.66, -12.20, -34.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -35.47>, < -1.66, -12.20, -34.92>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -11.27, -33.42>, <  0.98, -10.29, -32.83>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, <  0.98, -10.29, -32.83>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, <  0.98,  -9.33, -31.10>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.35, -29.95>, <  0.98,  -9.33, -31.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, < -0.81,  -8.47, -31.69>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.64, -31.15>, < -0.81,  -8.47, -31.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, < -0.81,  -9.25, -33.24>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -34.24>, < -0.81,  -9.25, -33.24>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -32.24>, <  0.98,  -8.31, -32.80>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.30, -33.35>, <  0.98,  -8.31, -32.80>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -35.47>, < -1.50,  -7.54, -36.53>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.64, -37.59>, < -1.50,  -7.54, -36.53>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -35.47>, < -1.50,  -6.48, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.51, -34.57>, < -1.50,  -6.48, -35.02>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -35.47>, < -0.02,  -7.45, -35.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -35.47>, < -0.02,  -7.45, -35.47>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -35.47>, <  1.42,  -6.57, -36.06>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -5.69, -36.65>, <  1.42,  -6.57, -36.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -35.47>, <  1.42,  -7.38, -34.41>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.30, -33.35>, <  1.42,  -7.38, -34.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -35.47>, <  1.42,  -8.40, -35.94>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.35, -36.40>, <  1.42,  -8.40, -35.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.51, -34.57>, < -1.66,  -5.55, -33.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,  -5.59, -32.24>, < -1.66,  -5.55, -33.41>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -34.24>, < -1.50,  -8.32, -34.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -35.47>, < -1.50,  -8.32, -34.85>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -34.24>, < -1.66, -10.18, -34.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -35.47>, < -1.66, -10.18, -34.85>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -25.80>, < -1.50, -13.13, -26.86>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -27.92>, < -1.50, -13.13, -26.86>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16, -13.03, -25.80>, < -0.02, -13.03, -25.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -25.80>, < -0.02, -13.03, -25.80>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -25.80>, <  1.42, -13.98, -26.26>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -14.93, -26.73>, <  1.42, -13.98, -26.26>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12, -13.03, -25.80>, <  1.42, -12.15, -26.39>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -11.27, -26.98>, <  1.42, -12.15, -26.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85, -13.23, -27.92>, < -1.66, -12.20, -28.47>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -29.02>, < -1.66, -12.20, -28.47>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {<  1.72, -11.27, -26.98>, <  0.98, -10.29, -26.39>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -25.80>, <  0.98, -10.29, -26.39>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.48, -11.17, -29.02>, < -1.66, -10.18, -28.40>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -27.79>, < -1.66, -10.18, -28.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -25.80>, < -0.81,  -9.25, -26.79>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -27.79>, < -0.81,  -9.25, -26.79>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  0.23,  -9.31, -25.80>, <  0.98,  -8.31, -26.35>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.30, -26.91>, <  0.98,  -8.31, -26.35>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -29.02>, < -1.50,  -7.54, -30.08>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.64, -31.15>, < -1.50,  -7.54, -30.08>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -29.02>, < -0.02,  -7.45, -29.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -29.02>, < -0.02,  -7.45, -29.02>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -29.02>, < -1.50,  -6.48, -28.57>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.51, -28.13>, < -1.50,  -6.48, -28.57>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.16,  -7.45, -29.02>, < -1.50,  -8.32, -28.40>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -9.19, -27.79>, < -1.50,  -8.32, -28.40>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -29.02>, <  1.42,  -8.40, -29.49>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -9.35, -29.95>, <  1.42,  -8.40, -29.49>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -29.02>, <  1.42,  -6.57, -29.61>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -5.69, -30.20>, <  1.42,  -6.57, -29.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.12,  -7.45, -29.02>, <  1.42,  -7.38, -27.96>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<  1.72,  -7.30, -26.91>, <  1.42,  -7.38, -27.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -5.51, -28.13>, < -1.66,  -5.55, -26.96>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,  -5.59, -25.80>, < -1.66,  -5.55, -26.96>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -1.85,  -7.64, -31.15>, < -1.66,  -6.61, -31.69>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.48,  -5.59, -32.24>, < -1.66,  -6.61, -31.69>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
// no constraints
