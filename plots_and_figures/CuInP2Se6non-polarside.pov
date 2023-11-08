#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -57.56*x up 38.07*y
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

cylinder {<-11.29, -15.34,  -0.00>, < 27.41, -15.34,  -0.00>, Rcell pigment {Black}}
cylinder {<-27.41, -15.34, -27.92>, < 11.29, -15.34, -27.92>, Rcell pigment {Black}}
cylinder {<-27.41,  18.13, -27.92>, < 11.29,  18.13, -27.92>, Rcell pigment {Black}}
cylinder {<-11.29,  18.13,  -0.00>, < 27.41,  18.13,   0.00>, Rcell pigment {Black}}
cylinder {<-11.29, -15.34,  -0.00>, <-27.41, -15.34, -27.92>, Rcell pigment {Black}}
cylinder {< 27.41, -15.34,  -0.00>, < 11.29, -15.34, -27.92>, Rcell pigment {Black}}
cylinder {< 27.41,  18.13,   0.00>, < 11.29,  18.13, -27.92>, Rcell pigment {Black}}
cylinder {<-11.29,  18.13,  -0.00>, <-27.41,  18.13, -27.92>, Rcell pigment {Black}}
cylinder {<-11.29, -15.34,  -0.00>, <-11.29,  18.13,  -0.00>, Rcell pigment {Black}}
cylinder {< 27.41, -15.34,  -0.00>, < 27.41,  18.13,   0.00>, Rcell pigment {Black}}
cylinder {< 11.29, -15.34, -27.92>, < 11.29,  18.13, -27.92>, Rcell pigment {Black}}
cylinder {<-27.41, -15.34, -27.92>, <-27.41,  18.13, -27.92>, Rcell pigment {Black}}
atom(<-10.49, -16.69,  -3.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(< -6.71, -14.18,  -2.67>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #1
atom(< -6.19, -16.50,  -2.91>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #2
atom(< -5.77, -13.15,  -4.36>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #3
atom(< -8.85, -13.98,  -2.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(< -4.05, -16.69,  -3.14>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #5
atom(< -7.04, -17.21,  -4.87>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(< -8.06, -15.34,  -5.59>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #7
atom(< -4.84, -15.34,  -5.59>, 0.71, rgb <0.65, 0.46, 0.45>, 0.0, ase3) // #8
atom(< -9.93, -14.18,  -8.26>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #9
atom(< -9.41, -16.50,  -8.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #10
atom(< -8.99, -13.15,  -9.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #11
atom(< -9.08, -13.46,  -6.30>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -7.27, -16.69,  -8.72>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<-10.35, -17.53,  -6.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #14
atom(<-10.27, -17.21, -10.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #15
atom(< -2.40, -13.98,  -2.45>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -1.61, -15.34,  -5.59>, 0.66, rgb <0.78, 0.50, 0.20>, 0.0, ase3) // #17
atom(< -3.48, -14.18,  -8.26>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #18
atom(< -2.96, -16.50,  -8.50>, 0.54, rgb <1.00, 0.50, 0.00>, 0.0, ase3) // #19
atom(< -2.54, -13.15,  -9.95>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -2.63, -13.46,  -6.30>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(< -5.63, -13.98,  -8.03>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #22
atom(< -3.91, -17.53,  -6.81>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #23
atom(< -3.82, -17.21, -10.46>, 0.60, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
cylinder {< -6.71, -14.18,  -2.67>, < -7.78, -14.08,  -2.56>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.85, -13.98,  -2.45>, < -7.78, -14.08,  -2.56>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.71, -14.18,  -2.67>, < -6.45, -15.34,  -2.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -16.50,  -2.91>, < -6.45, -15.34,  -2.79>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.71, -14.18,  -2.67>, < -6.24, -13.66,  -3.52>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77, -13.15,  -4.36>, < -6.24, -13.66,  -3.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -16.50,  -2.91>, < -5.12, -16.59,  -3.03>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.05, -16.69,  -3.14>, < -5.12, -16.59,  -3.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -6.19, -16.50,  -2.91>, < -6.62, -16.86,  -3.89>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.04, -17.21,  -4.87>, < -6.62, -16.86,  -3.89>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.77, -13.15,  -4.36>, < -5.30, -14.24,  -4.97>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84, -15.34,  -5.59>, < -5.30, -14.24,  -4.97>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -4.05, -16.69,  -3.14>, < -4.44, -16.02,  -4.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84, -15.34,  -5.59>, < -4.44, -16.02,  -4.36>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -7.04, -17.21,  -4.87>, < -7.55, -16.28,  -5.23>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.06, -15.34,  -5.59>, < -7.55, -16.28,  -5.23>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -8.06, -15.34,  -5.59>, < -8.57, -14.40,  -5.94>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -9.08, -13.46,  -6.30>, < -8.57, -14.40,  -5.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84, -15.34,  -5.59>, < -4.37, -16.43,  -6.20>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -3.91, -17.53,  -6.81>, < -4.37, -16.43,  -6.20>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -4.84, -15.34,  -5.59>, < -5.23, -14.66,  -6.81>, Rbond texture{pigment {color rgb <0.65, 0.46, 0.45> transmit 0.0} finish{ase3}}}
cylinder {< -5.63, -13.98,  -8.03>, < -5.23, -14.66,  -6.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93, -14.18,  -8.26>, < -9.51, -13.82,  -7.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.08, -13.46,  -6.30>, < -9.51, -13.82,  -7.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93, -14.18,  -8.26>, < -9.46, -13.66,  -9.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -8.99, -13.15,  -9.95>, < -9.46, -13.66,  -9.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.93, -14.18,  -8.26>, < -9.67, -15.34,  -8.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41, -16.50,  -8.50>, < -9.67, -15.34,  -8.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41, -16.50,  -8.50>, < -9.88, -17.01,  -7.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.35, -17.53,  -6.81>, < -9.88, -17.01,  -7.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41, -16.50,  -8.50>, < -8.34, -16.59,  -8.61>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.27, -16.69,  -8.72>, < -8.34, -16.59,  -8.61>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.41, -16.50,  -8.50>, < -9.84, -16.86,  -9.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-10.27, -17.21, -10.46>, < -9.84, -16.86,  -9.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.61, -15.34,  -5.59>, < -2.12, -14.40,  -5.94>, Rbond texture{pigment {color rgb <0.78, 0.50, 0.20> transmit 0.0} finish{ase3}}}
cylinder {< -2.63, -13.46,  -6.30>, < -2.12, -14.40,  -5.94>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48, -14.18,  -8.26>, < -3.22, -15.34,  -8.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96, -16.50,  -8.50>, < -3.22, -15.34,  -8.38>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48, -14.18,  -8.26>, < -3.01, -13.66,  -9.10>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.54, -13.15,  -9.95>, < -3.01, -13.66,  -9.10>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48, -14.18,  -8.26>, < -3.06, -13.82,  -7.28>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.63, -13.46,  -6.30>, < -3.06, -13.82,  -7.28>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.48, -14.18,  -8.26>, < -4.56, -14.08,  -8.14>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.63, -13.98,  -8.03>, < -4.56, -14.08,  -8.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96, -16.50,  -8.50>, < -3.44, -17.01,  -7.65>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.91, -17.53,  -6.81>, < -3.44, -17.01,  -7.65>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.96, -16.50,  -8.50>, < -3.39, -16.86,  -9.48>, Rbond texture{pigment {color rgb <1.00, 0.50, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.82, -17.21, -10.46>, < -3.39, -16.86,  -9.48>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
