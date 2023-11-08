#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -20.60*x up 30.43*y
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

cylinder {<  8.81, -14.49, -30.97>, <  8.81, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  14.49, -30.97>, <  8.81,  14.49,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81,  14.49, -30.97>, < -9.81,  14.49,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -14.49, -30.97>, < -9.81, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81, -14.49, -30.97>, <  8.81,  14.49, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -14.49,   0.00>, <  8.81,  14.49,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -14.49,   0.00>, < -9.81,  14.49,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -14.49, -30.97>, < -9.81,  14.49, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -14.49, -30.97>, < -9.81, -14.49, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -14.49,   0.00>, < -9.81, -14.49,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  14.49,  -0.00>, < -9.81,  14.49,  -0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  14.49, -30.97>, < -9.81,  14.49, -30.97>, Rcell pigment {Black}}
atom(<  9.27, -12.32, -30.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #0
atom(<  9.27,  -6.52, -30.51>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #1
atom(<  9.27, -12.32, -25.35>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<  8.74,  -9.62, -29.30>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #3
atom(<  8.87,  -7.77, -27.47>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #4
atom(<  9.27,  -6.52, -25.35>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #5
atom(<  8.09,  -7.89, -29.15>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #6
atom(<  8.35, -10.87, -26.26>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #7
atom(<  9.52,  -9.50, -27.62>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #8
atom(<  8.74,  -3.82, -29.30>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #9
atom(<  8.35,  -5.07, -26.26>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<  9.52,  -3.70, -27.62>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(<  8.74,  -9.62, -24.14>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(<  8.87,  -7.77, -22.31>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(<  8.09,  -7.89, -23.98>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #14
atom(<  8.35, -10.87, -21.10>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #15
atom(<  9.52,  -9.50, -22.46>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #16
atom(<  8.74,  -3.82, -24.14>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #17
atom(<  8.35,  -5.07, -21.10>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #18
atom(<  9.52,  -3.70, -22.46>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #19
cylinder {<  9.27, -12.32, -25.35>, <  8.81, -11.59, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35, -10.87, -26.26>, <  8.81, -11.59, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -29.30>, <  8.81,  -8.69, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -27.47>, <  8.81,  -8.69, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -29.30>, <  8.41,  -8.76, -29.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -7.89, -29.15>, <  8.41,  -8.76, -29.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -29.30>, <  9.13,  -9.56, -28.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -9.50, -27.62>, <  9.13,  -9.56, -28.46>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -27.47>, <  8.48,  -7.83, -28.31>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -7.89, -29.15>, <  8.48,  -7.83, -28.31>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -27.47>, <  9.20,  -8.63, -27.55>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -9.50, -27.62>, <  9.20,  -8.63, -27.55>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -27.47>, <  9.07,  -7.15, -26.41>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -6.52, -25.35>, <  9.07,  -7.15, -26.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -6.52, -25.35>, <  8.81,  -5.80, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -5.07, -26.26>, <  8.81,  -5.80, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35, -10.87, -26.26>, <  8.54, -10.24, -25.20>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -24.14>, <  8.54, -10.24, -25.20>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -3.82, -29.30>, <  9.13,  -3.76, -28.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -3.70, -27.62>, <  9.13,  -3.76, -28.46>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -5.07, -26.26>, <  8.54,  -4.45, -25.20>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -3.82, -24.14>, <  8.54,  -4.45, -25.20>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -24.14>, <  8.41,  -8.76, -24.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -7.89, -23.98>, <  8.41,  -8.76, -24.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -24.14>, <  9.13,  -9.56, -23.30>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -9.50, -22.46>, <  9.13,  -9.56, -23.30>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -9.62, -24.14>, <  8.81,  -8.69, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -22.31>, <  8.81,  -8.69, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -22.31>, <  8.48,  -7.83, -23.15>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -7.89, -23.98>, <  8.48,  -7.83, -23.15>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -7.77, -22.31>, <  9.20,  -8.63, -22.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -9.50, -22.46>, <  9.20,  -8.63, -22.39>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -3.82, -24.14>, <  9.13,  -3.76, -23.30>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -3.70, -22.46>, <  9.13,  -3.76, -23.30>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
