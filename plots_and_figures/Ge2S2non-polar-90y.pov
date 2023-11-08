#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -19.79*x up 23.01*y
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

cylinder {<  7.68, -10.96, -26.89>, <  7.68, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  7.68,  10.96, -26.89>, <  7.68,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -9.42,  10.96, -26.89>, < -9.42,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -9.42, -10.96, -26.89>, < -9.42, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  7.68, -10.96, -26.89>, <  7.68,  10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  7.68, -10.96,   0.00>, <  7.68,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -9.42, -10.96,   0.00>, < -9.42,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {< -9.42, -10.96, -26.89>, < -9.42,  10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  7.68, -10.96, -26.89>, < -9.42, -10.96, -26.89>, Rcell pigment {Black}}
cylinder {<  7.68, -10.96,   0.00>, < -9.42, -10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  7.68,  10.96,   0.00>, < -9.42,  10.96,   0.00>, Rcell pigment {Black}}
cylinder {<  7.68,  10.96, -26.89>, < -9.42,  10.96, -26.89>, Rcell pigment {Black}}
atom(<  6.50,  -8.22, -25.77>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<  8.82,  -8.22, -25.77>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<  6.50,  -4.57, -25.77>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<  8.82,  -4.57, -25.77>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<  6.50,  -0.91, -25.77>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<  8.82,  -0.91, -25.77>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(<  6.50,   2.74, -25.77>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #6
atom(<  8.82,   2.74, -25.77>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<  8.87, -10.04, -23.53>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<  6.50,  -8.22, -21.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #9
atom(<  6.54, -10.04, -23.53>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #10
atom(<  8.82,  -8.22, -21.29>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #11
atom(<  8.87,  -6.39, -23.53>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #12
atom(<  6.50,  -4.57, -21.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #13
atom(<  6.54,  -6.39, -23.53>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #14
atom(<  8.82,  -4.57, -21.29>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(<  8.87,  -2.74, -23.53>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(<  6.50,  -0.91, -21.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #17
atom(<  6.54,  -2.74, -23.53>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #18
atom(<  8.82,  -0.91, -21.29>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
atom(<  8.87,   0.91, -23.53>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<  6.50,   2.74, -21.29>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #21
atom(<  6.54,   0.91, -23.53>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #22
atom(<  8.82,   2.74, -21.29>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(<  8.87, -10.04, -19.05>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #24
atom(<  6.50,  -8.22, -16.81>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #25
atom(<  6.54, -10.04, -19.05>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(<  8.82,  -8.22, -16.81>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(<  8.87,  -6.39, -19.05>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #28
atom(<  6.50,  -4.57, -16.81>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #29
atom(<  6.54,  -6.39, -19.05>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(<  8.82,  -4.57, -16.81>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(<  8.87,  -2.74, -19.05>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #32
atom(<  6.50,  -0.91, -16.81>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #33
atom(<  6.54,  -2.74, -19.05>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(<  8.82,  -0.91, -16.81>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(<  8.87,   0.91, -19.05>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #36
atom(<  6.50,   2.74, -16.81>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #37
atom(<  6.54,   0.91, -19.05>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #38
atom(<  8.82,   2.74, -16.81>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(<  8.87, -10.04, -14.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #40
atom(<  6.54, -10.04, -14.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #41
atom(<  8.87,  -6.39, -14.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #42
atom(<  6.54,  -6.39, -14.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #43
atom(<  8.87,  -2.74, -14.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #44
atom(<  6.54,  -2.74, -14.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #45
atom(<  8.87,   0.91, -14.57>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #46
atom(<  6.54,   0.91, -14.57>, 0.60, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #47
cylinder {<  6.50,  -8.22, -25.77>, <  6.52,  -7.30, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -23.53>, <  6.52,  -7.30, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -25.77>, <  7.66,  -8.22, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -25.77>, <  7.66,  -8.22, -25.77>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -25.77>, <  6.52,  -9.13, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -23.53>, <  6.52,  -9.13, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -25.77>, <  8.85,  -7.30, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -23.53>, <  8.85,  -7.30, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -25.77>, <  8.85,  -9.13, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -23.53>, <  8.85,  -9.13, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -25.77>, <  7.66,  -4.57, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -25.77>, <  7.66,  -4.57, -25.77>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -25.77>, <  6.52,  -5.48, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -23.53>, <  6.52,  -5.48, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -25.77>, <  6.52,  -3.65, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -23.53>, <  6.52,  -3.65, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -25.77>, <  8.85,  -5.48, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -23.53>, <  8.85,  -5.48, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -25.77>, <  8.85,  -3.65, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -23.53>, <  8.85,  -3.65, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -25.77>, <  6.52,  -1.83, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -23.53>, <  6.52,  -1.83, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -25.77>, <  7.66,  -0.91, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -25.77>, <  7.66,  -0.91, -25.77>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -25.77>, <  6.52,  -0.00, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -23.53>, <  6.52,  -0.00, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -25.77>, <  8.85,  -1.83, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -23.53>, <  8.85,  -1.83, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -25.77>, <  8.85,   0.00, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -23.53>, <  8.85,   0.00, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -25.77>, <  7.66,   2.74, -25.77>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -25.77>, <  7.66,   2.74, -25.77>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -25.77>, <  6.52,   1.83, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -23.53>, <  6.52,   1.83, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -25.77>, <  8.85,   1.83, -24.65>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -23.53>, <  8.85,   1.83, -24.65>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -23.53>, <  7.71, -10.04, -23.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -23.53>, <  7.71, -10.04, -23.53>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -23.53>, <  8.85,  -9.13, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -21.29>, <  8.85,  -9.13, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -21.29>, <  6.52,  -7.30, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -23.53>, <  6.52,  -7.30, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -21.29>, <  6.52,  -9.13, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -23.53>, <  6.52,  -9.13, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -21.29>, <  7.66,  -8.22, -21.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -21.29>, <  7.66,  -8.22, -21.29>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -21.29>, <  6.52,  -9.13, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -19.05>, <  6.52,  -9.13, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -21.29>, <  6.52,  -7.30, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -19.05>, <  6.52,  -7.30, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -21.29>, <  8.85,  -7.30, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -23.53>, <  8.85,  -7.30, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -21.29>, <  8.85,  -9.13, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -19.05>, <  8.85,  -9.13, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -21.29>, <  8.85,  -7.30, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -19.05>, <  8.85,  -7.30, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -23.53>, <  7.71,  -6.39, -23.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -23.53>, <  7.71,  -6.39, -23.53>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -23.53>, <  8.85,  -5.48, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -21.29>, <  8.85,  -5.48, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -21.29>, <  6.52,  -5.48, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -23.53>, <  6.52,  -5.48, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -21.29>, <  7.66,  -4.57, -21.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -21.29>, <  7.66,  -4.57, -21.29>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -21.29>, <  6.52,  -5.48, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -19.05>, <  6.52,  -5.48, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -21.29>, <  6.52,  -3.65, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -23.53>, <  6.52,  -3.65, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -21.29>, <  6.52,  -3.65, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -19.05>, <  6.52,  -3.65, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -21.29>, <  8.85,  -5.48, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -19.05>, <  8.85,  -5.48, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -21.29>, <  8.85,  -3.65, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -23.53>, <  8.85,  -3.65, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -21.29>, <  8.85,  -3.65, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -19.05>, <  8.85,  -3.65, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -23.53>, <  7.71,  -2.74, -23.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -23.53>, <  7.71,  -2.74, -23.53>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -23.53>, <  8.85,  -1.83, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -21.29>, <  8.85,  -1.83, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -21.29>, <  6.52,  -1.83, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -23.53>, <  6.52,  -1.83, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -21.29>, <  6.52,  -0.00, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -23.53>, <  6.52,  -0.00, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -21.29>, <  7.66,  -0.91, -21.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -21.29>, <  7.66,  -0.91, -21.29>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -21.29>, <  6.52,  -1.83, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -19.05>, <  6.52,  -1.83, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -21.29>, <  6.52,  -0.00, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -19.05>, <  6.52,  -0.00, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -21.29>, <  8.85,   0.00, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -23.53>, <  8.85,   0.00, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -21.29>, <  8.85,  -1.83, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -19.05>, <  8.85,  -1.83, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -21.29>, <  8.85,   0.00, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -19.05>, <  8.85,   0.00, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -23.53>, <  7.71,   0.91, -23.53>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -23.53>, <  7.71,   0.91, -23.53>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -23.53>, <  8.85,   1.83, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -21.29>, <  8.85,   1.83, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -21.29>, <  6.52,   1.83, -22.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -23.53>, <  6.52,   1.83, -22.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -21.29>, <  7.66,   2.74, -21.29>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -21.29>, <  7.66,   2.74, -21.29>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -21.29>, <  6.52,   1.83, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -19.05>, <  6.52,   1.83, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -21.29>, <  8.85,   1.83, -20.17>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -19.05>, <  8.85,   1.83, -20.17>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -19.05>, <  7.71, -10.04, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -19.05>, <  7.71, -10.04, -19.05>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -19.05>, <  8.85,  -9.13, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -16.81>, <  8.85,  -9.13, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -16.81>, <  6.52,  -9.13, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -19.05>, <  6.52,  -9.13, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -16.81>, <  7.66,  -8.22, -16.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -16.81>, <  7.66,  -8.22, -16.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -16.81>, <  6.52,  -7.30, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -19.05>, <  6.52,  -7.30, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -16.81>, <  6.52,  -9.13, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -14.57>, <  6.52,  -9.13, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -8.22, -16.81>, <  6.52,  -7.30, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -14.57>, <  6.52,  -7.30, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -16.81>, <  8.85,  -7.30, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -19.05>, <  8.85,  -7.30, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -16.81>, <  8.85,  -9.13, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -14.57>, <  8.85,  -9.13, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -8.22, -16.81>, <  8.85,  -7.30, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -14.57>, <  8.85,  -7.30, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -19.05>, <  8.85,  -5.48, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -16.81>, <  8.85,  -5.48, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -19.05>, <  7.71,  -6.39, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -19.05>, <  7.71,  -6.39, -19.05>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -16.81>, <  7.66,  -4.57, -16.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -16.81>, <  7.66,  -4.57, -16.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -16.81>, <  6.52,  -5.48, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -19.05>, <  6.52,  -5.48, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -16.81>, <  6.52,  -5.48, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -14.57>, <  6.52,  -5.48, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -16.81>, <  6.52,  -3.65, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -19.05>, <  6.52,  -3.65, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -4.57, -16.81>, <  6.52,  -3.65, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -14.57>, <  6.52,  -3.65, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -16.81>, <  8.85,  -5.48, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -14.57>, <  8.85,  -5.48, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -16.81>, <  8.85,  -3.65, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -19.05>, <  8.85,  -3.65, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -4.57, -16.81>, <  8.85,  -3.65, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -14.57>, <  8.85,  -3.65, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -19.05>, <  7.71,  -2.74, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -19.05>, <  7.71,  -2.74, -19.05>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -19.05>, <  8.85,  -1.83, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -16.81>, <  8.85,  -1.83, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -16.81>, <  6.52,  -1.83, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -19.05>, <  6.52,  -1.83, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -16.81>, <  6.52,  -0.00, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -19.05>, <  6.52,  -0.00, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -16.81>, <  7.66,  -0.91, -16.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -16.81>, <  7.66,  -0.91, -16.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -16.81>, <  6.52,  -1.83, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -14.57>, <  6.52,  -1.83, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,  -0.91, -16.81>, <  6.52,  -0.00, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -14.57>, <  6.52,  -0.00, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -16.81>, <  8.85,   0.00, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -19.05>, <  8.85,   0.00, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -16.81>, <  8.85,  -1.83, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -14.57>, <  8.85,  -1.83, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,  -0.91, -16.81>, <  8.85,   0.00, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -14.57>, <  8.85,   0.00, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -19.05>, <  7.71,   0.91, -19.05>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -19.05>, <  7.71,   0.91, -19.05>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -19.05>, <  8.85,   1.83, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -16.81>, <  8.85,   1.83, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -16.81>, <  6.52,   1.83, -17.93>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -19.05>, <  6.52,   1.83, -17.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -16.81>, <  7.66,   2.74, -16.81>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -16.81>, <  7.66,   2.74, -16.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  6.50,   2.74, -16.81>, <  6.52,   1.83, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -14.57>, <  6.52,   1.83, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.82,   2.74, -16.81>, <  8.85,   1.83, -15.69>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -14.57>, <  8.85,   1.83, -15.69>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.04, -14.57>, <  7.71, -10.04, -14.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54, -10.04, -14.57>, <  7.71, -10.04, -14.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -6.39, -14.57>, <  7.71,  -6.39, -14.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -6.39, -14.57>, <  7.71,  -6.39, -14.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -2.74, -14.57>, <  7.71,  -2.74, -14.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,  -2.74, -14.57>, <  7.71,  -2.74, -14.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,   0.91, -14.57>, <  7.71,   0.91, -14.57>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  6.54,   0.91, -14.57>, <  7.71,   0.91, -14.57>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
// no constraints
