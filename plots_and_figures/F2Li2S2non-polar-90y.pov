#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -20.60*x up 36.52*y
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

cylinder {<  8.81, -17.39, -30.97>, <  8.81, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  17.39, -30.97>, <  8.81,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81,  17.39, -30.97>, < -9.81,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -17.39, -30.97>, < -9.81, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81, -17.39, -30.97>, <  8.81,  17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -17.39,   0.00>, <  8.81,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -17.39,   0.00>, < -9.81,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {< -9.81, -17.39, -30.97>, < -9.81,  17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -17.39, -30.97>, < -9.81, -17.39, -30.97>, Rcell pigment {Black}}
cylinder {<  8.81, -17.39,   0.00>, < -9.81, -17.39,   0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  17.39,  -0.00>, < -9.81,  17.39,  -0.00>, Rcell pigment {Black}}
cylinder {<  8.81,  17.39, -30.97>, < -9.81,  17.39, -30.97>, Rcell pigment {Black}}
atom(<  8.74, -12.52, -29.30>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #0
atom(<  8.87, -10.67, -27.47>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #1
atom(<  9.27,  -9.42, -25.35>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #2
atom(<  8.09, -10.79, -29.15>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #3
atom(<  8.35, -13.77, -26.26>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #4
atom(<  9.52, -12.39, -27.62>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #5
atom(<  8.74,  -6.72, -29.30>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #6
atom(<  8.87,  -4.87, -27.47>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #7
atom(<  9.27,  -3.62, -25.35>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #8
atom(<  8.09,  -5.00, -29.15>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #9
atom(<  8.35,  -7.97, -26.26>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #10
atom(<  9.52,  -6.60, -27.62>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #11
atom(<  8.74, -12.52, -24.14>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #12
atom(<  8.87, -10.67, -22.31>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #13
atom(<  9.27,  -9.42, -20.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #14
atom(<  8.09, -10.79, -23.98>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #15
atom(<  8.35, -13.77, -21.10>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #16
atom(<  9.52, -12.39, -22.46>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #17
atom(<  8.74,  -6.72, -24.14>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #18
atom(<  8.87,  -4.87, -22.31>, 0.64, rgb <0.80, 0.50, 1.00>, 0.0, ase3) // #19
atom(<  9.27,  -3.62, -20.19>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #20
atom(<  8.09,  -5.00, -23.98>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #21
atom(<  8.35,  -7.97, -21.10>, 0.53, rgb <1.00, 1.00, 0.19>, 0.0, ase3) // #22
atom(<  9.52,  -6.60, -22.46>, 0.28, rgb <0.56, 0.88, 0.31>, 0.0, ase3) // #23
cylinder {<  8.74, -12.52, -29.30>, <  8.81, -11.59, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -27.47>, <  8.81, -11.59, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -29.30>, <  8.41, -11.65, -29.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09, -10.79, -29.15>, <  8.41, -11.65, -29.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -29.30>, <  9.13, -12.46, -28.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -27.62>, <  9.13, -12.46, -28.46>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -27.47>, <  8.48, -10.73, -28.31>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09, -10.79, -29.15>, <  8.48, -10.73, -28.31>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -27.47>, <  9.20, -11.53, -27.55>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -27.62>, <  9.20, -11.53, -27.55>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -27.47>, <  9.07, -10.05, -26.41>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -25.35>, <  9.07, -10.05, -26.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -27.47>, <  8.61,  -9.32, -26.87>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -26.26>, <  8.61,  -9.32, -26.87>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -25.35>, <  8.68, -10.11, -24.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.09, -10.79, -23.98>, <  8.68, -10.11, -24.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -25.35>, <  8.81,  -8.69, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -26.26>, <  8.81,  -8.69, -25.80>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -25.35>, <  9.00,  -8.07, -24.74>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -24.14>, <  9.00,  -8.07, -24.74>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.35, -13.77, -26.26>, <  8.94, -13.08, -26.94>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -27.62>, <  8.94, -13.08, -26.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.35, -13.77, -26.26>, <  8.54, -13.14, -25.20>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -24.14>, <  8.54, -13.14, -25.20>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -29.30>, <  8.81,  -5.80, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -27.47>, <  8.81,  -5.80, -28.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -29.30>, <  8.41,  -5.86, -29.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -5.00, -29.15>, <  8.41,  -5.86, -29.22>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -29.30>, <  9.13,  -6.66, -28.46>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -27.62>, <  9.13,  -6.66, -28.46>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -27.47>, <  8.48,  -4.93, -28.31>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -5.00, -29.15>, <  8.48,  -4.93, -28.31>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -27.47>, <  9.07,  -4.25, -26.41>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -3.62, -25.35>, <  9.07,  -4.25, -26.41>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -27.47>, <  9.20,  -5.74, -27.55>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -27.62>, <  9.20,  -5.74, -27.55>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -3.62, -25.35>, <  8.68,  -4.31, -24.67>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -5.00, -23.98>, <  8.68,  -4.31, -24.67>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -26.26>, <  8.54,  -7.34, -25.20>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -24.14>, <  8.54,  -7.34, -25.20>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -26.26>, <  8.94,  -7.28, -26.94>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -27.62>, <  8.94,  -7.28, -26.94>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -24.14>, <  9.13, -12.46, -23.30>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -22.46>, <  9.13, -12.46, -23.30>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -24.14>, <  8.41, -11.65, -24.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09, -10.79, -23.98>, <  8.41, -11.65, -24.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74, -12.52, -24.14>, <  8.81, -11.59, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -22.31>, <  8.81, -11.59, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -22.31>, <  9.20, -11.53, -22.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -22.46>, <  9.20, -11.53, -22.39>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -22.31>, <  8.48, -10.73, -23.15>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09, -10.79, -23.98>, <  8.48, -10.73, -23.15>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -22.31>, <  9.07, -10.05, -21.25>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -20.19>, <  9.07, -10.05, -21.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87, -10.67, -22.31>, <  8.61,  -9.32, -21.71>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -21.10>, <  8.61,  -9.32, -21.71>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -9.42, -20.19>, <  8.81,  -8.69, -20.64>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -21.10>, <  8.81,  -8.69, -20.64>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.35, -13.77, -21.10>, <  8.94, -13.08, -21.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.52, -12.39, -22.46>, <  8.94, -13.08, -21.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -24.14>, <  8.81,  -5.80, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -22.31>, <  8.81,  -5.80, -23.22>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -24.14>, <  8.41,  -5.86, -24.06>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -5.00, -23.98>, <  8.41,  -5.86, -24.06>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.74,  -6.72, -24.14>, <  9.13,  -6.66, -23.30>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -22.46>, <  9.13,  -6.66, -23.30>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -22.31>, <  9.07,  -4.25, -21.25>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.27,  -3.62, -20.19>, <  9.07,  -4.25, -21.25>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -22.31>, <  8.48,  -4.93, -23.15>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  8.09,  -5.00, -23.98>, <  8.48,  -4.93, -23.15>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.87,  -4.87, -22.31>, <  9.20,  -5.74, -22.39>, Rbond texture{pigment {color rgb <0.80, 0.50, 1.00> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -22.46>, <  9.20,  -5.74, -22.39>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
cylinder {<  8.35,  -7.97, -21.10>, <  8.94,  -7.28, -21.78>, Rbond texture{pigment {color rgb <1.00, 1.00, 0.19> transmit 0.0} finish{ase3}}}
cylinder {<  9.52,  -6.60, -22.46>, <  8.94,  -7.28, -21.78>, Rbond texture{pigment {color rgb <0.56, 0.88, 0.31> transmit 0.0} finish{ase3}}}
// no constraints
