#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -27.25*x up 25.03*y
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

cylinder {<-12.66, -11.92, -102.66>, < 12.98, -11.92, -102.66>, Rcell pigment {Black}}
cylinder {<-12.66,  11.92, -102.66>, < 12.98,  11.92, -102.66>, Rcell pigment {Black}}
cylinder {<-12.66,  11.92,   0.00>, < 12.98,  11.92,   0.00>, Rcell pigment {Black}}
cylinder {<-12.66, -11.92,   0.00>, < 12.98, -11.92,   0.00>, Rcell pigment {Black}}
cylinder {<-12.66, -11.92, -102.66>, <-12.66,  11.92, -102.66>, Rcell pigment {Black}}
cylinder {< 12.98, -11.92, -102.66>, < 12.98,  11.92, -102.66>, Rcell pigment {Black}}
cylinder {< 12.98, -11.92,   0.00>, < 12.98,  11.92,   0.00>, Rcell pigment {Black}}
cylinder {<-12.66, -11.92,   0.00>, <-12.66,  11.92,   0.00>, Rcell pigment {Black}}
cylinder {<-12.66, -11.92, -102.66>, <-12.66, -11.92,   0.00>, Rcell pigment {Black}}
cylinder {< 12.98, -11.92, -102.66>, < 12.98, -11.92,   0.00>, Rcell pigment {Black}}
cylinder {< 12.98,  11.92, -102.66>, < 12.98,  11.92,   0.00>, Rcell pigment {Black}}
cylinder {<-12.66,  11.92, -102.66>, <-12.66,  11.92,   0.00>, Rcell pigment {Black}}
atom(<-11.78,  -8.94, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #0
atom(<-11.41,  -8.94, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #1
atom(<-11.78,  -8.94, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #2
atom(<-11.41,  -8.94, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #3
atom(<-11.78,  -8.94, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #4
atom(<-11.41,  -8.94, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #5
atom(<-11.78,  -8.94, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #6
atom(<-11.41,  -8.94, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #7
atom(<-11.78,  -8.94, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #8
atom(<-11.41,  -8.94, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #9
atom(<-11.78,  -8.94,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #10
atom(<-11.41,  -8.94,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #11
atom(<-11.78,  -4.97, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #12
atom(< -9.64,  -6.95, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #13
atom(<-11.41,  -4.97, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #14
atom(< -9.28,  -6.95, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #15
atom(<-11.78,  -4.97, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #16
atom(< -9.64,  -6.95, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #17
atom(<-11.41,  -4.97, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #18
atom(< -9.28,  -6.95, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #19
atom(<-11.78,  -4.97, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #20
atom(< -9.64,  -6.95, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #21
atom(<-11.41,  -4.97, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #22
atom(< -9.28,  -6.95, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #23
atom(<-11.78,  -4.97, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #24
atom(< -9.64,  -6.95, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #25
atom(<-11.41,  -4.97, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #26
atom(< -9.28,  -6.95, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #27
atom(<-11.78,  -4.97, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #28
atom(< -9.64,  -6.95, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #29
atom(<-11.41,  -4.97, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #30
atom(< -9.28,  -6.95, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #31
atom(<-11.78,  -4.97,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #32
atom(< -9.64,  -6.95,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #33
atom(<-11.41,  -4.97,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #34
atom(< -9.28,  -6.95,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #35
atom(<-11.78,  -0.99, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #36
atom(< -9.64,  -2.98, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #37
atom(<-11.41,  -0.99, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #38
atom(< -9.28,  -2.98, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #39
atom(<-11.78,  -0.99, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #40
atom(< -9.64,  -2.98, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #41
atom(<-11.41,  -0.99, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #42
atom(< -9.28,  -2.98, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #43
atom(<-11.78,  -0.99, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #44
atom(< -9.64,  -2.98, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #45
atom(<-11.41,  -0.99, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #46
atom(< -9.28,  -2.98, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #47
atom(<-11.78,  -0.99, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #48
atom(< -9.64,  -2.98, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #49
atom(<-11.41,  -0.99, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #50
atom(< -9.28,  -2.98, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #51
atom(<-11.78,  -0.99, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #52
atom(< -9.64,  -2.98, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #53
atom(<-11.41,  -0.99, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #54
atom(< -9.28,  -2.98, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #55
atom(<-11.78,  -0.99,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #56
atom(< -9.64,  -2.98,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #57
atom(<-11.41,  -0.99,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #58
atom(< -9.28,  -2.98,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #59
atom(< -9.64,   0.99, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #60
atom(< -9.28,   0.99, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #61
atom(< -9.64,   0.99, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #62
atom(< -9.28,   0.99, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #63
atom(< -9.64,   0.99, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #64
atom(< -9.28,   0.99, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #65
atom(< -9.64,   0.99, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #66
atom(< -9.28,   0.99, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #67
atom(< -9.64,   0.99, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #68
atom(< -9.28,   0.99, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #69
atom(< -9.64,   0.99,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #70
atom(< -9.28,   0.99,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #71
atom(< -7.50,  -8.94, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #72
atom(< -7.14,  -8.94, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #73
atom(< -7.50,  -8.94, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #74
atom(< -7.14,  -8.94, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #75
atom(< -7.50,  -8.94, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #76
atom(< -7.14,  -8.94, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #77
atom(< -7.50,  -8.94, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #78
atom(< -7.14,  -8.94, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #79
atom(< -7.50,  -8.94, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #80
atom(< -7.14,  -8.94, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #81
atom(< -7.50,  -8.94,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #82
atom(< -7.14,  -8.94,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #83
atom(< -7.50,  -4.97, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #84
atom(< -5.37,  -6.95, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #85
atom(< -7.14,  -4.97, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #86
atom(< -5.00,  -6.95, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #87
atom(< -7.50,  -4.97, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #88
atom(< -5.37,  -6.95, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #89
atom(< -7.14,  -4.97, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #90
atom(< -5.00,  -6.95, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #91
atom(< -7.50,  -4.97, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #92
atom(< -5.37,  -6.95, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #93
atom(< -7.14,  -4.97, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #94
atom(< -5.00,  -6.95, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #95
atom(< -7.50,  -4.97, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #96
atom(< -5.37,  -6.95, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #97
atom(< -7.14,  -4.97, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #98
atom(< -5.00,  -6.95, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #99
atom(< -7.50,  -4.97, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #100
atom(< -5.37,  -6.95, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #101
atom(< -7.14,  -4.97, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #102
atom(< -5.00,  -6.95, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #103
atom(< -7.50,  -4.97,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #104
atom(< -5.37,  -6.95,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #105
atom(< -7.14,  -4.97,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #106
atom(< -5.00,  -6.95,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #107
atom(< -7.50,  -0.99, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #108
atom(< -5.37,  -2.98, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #109
atom(< -7.14,  -0.99, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #110
atom(< -5.00,  -2.98, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #111
atom(< -7.50,  -0.99, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #112
atom(< -5.37,  -2.98, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #113
atom(< -7.14,  -0.99, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #114
atom(< -5.00,  -2.98, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #115
atom(< -7.50,  -0.99, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #116
atom(< -5.37,  -2.98, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #117
atom(< -7.14,  -0.99, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #118
atom(< -5.00,  -2.98, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #119
atom(< -7.50,  -0.99, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #120
atom(< -5.37,  -2.98, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #121
atom(< -7.14,  -0.99, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #122
atom(< -5.00,  -2.98, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #123
atom(< -7.50,  -0.99, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #124
atom(< -5.37,  -2.98, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #125
atom(< -7.14,  -0.99, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #126
atom(< -5.00,  -2.98, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #127
atom(< -7.50,  -0.99,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #128
atom(< -5.37,  -2.98,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #129
atom(< -7.14,  -0.99,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #130
atom(< -5.00,  -2.98,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #131
atom(< -5.37,   0.99, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #132
atom(< -5.00,   0.99, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #133
atom(< -5.37,   0.99, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #134
atom(< -5.00,   0.99, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #135
atom(< -5.37,   0.99, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #136
atom(< -5.00,   0.99, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #137
atom(< -5.37,   0.99, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #138
atom(< -5.00,   0.99, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #139
atom(< -5.37,   0.99, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #140
atom(< -5.00,   0.99, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #141
atom(< -5.37,   0.99,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #142
atom(< -5.00,   0.99,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #143
atom(< -3.23,  -8.94, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #144
atom(< -2.87,  -8.94, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #145
atom(< -3.23,  -8.94, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #146
atom(< -2.87,  -8.94, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #147
atom(< -3.23,  -8.94, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #148
atom(< -2.87,  -8.94, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #149
atom(< -3.23,  -8.94, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #150
atom(< -2.87,  -8.94, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #151
atom(< -3.23,  -8.94, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #152
atom(< -2.87,  -8.94, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #153
atom(< -3.23,  -8.94,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #154
atom(< -2.87,  -8.94,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #155
atom(< -3.23,  -4.97, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #156
atom(< -1.09,  -6.95, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #157
atom(< -2.87,  -4.97, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #158
atom(< -0.73,  -6.95, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #159
atom(< -3.23,  -4.97, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #160
atom(< -1.09,  -6.95, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #161
atom(< -2.87,  -4.97, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #162
atom(< -0.73,  -6.95, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #163
atom(< -3.23,  -4.97, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #164
atom(< -1.09,  -6.95, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #165
atom(< -2.87,  -4.97, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #166
atom(< -0.73,  -6.95, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #167
atom(< -3.23,  -4.97, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #168
atom(< -1.09,  -6.95, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #169
atom(< -2.87,  -4.97, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #170
atom(< -0.73,  -6.95, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #171
atom(< -3.23,  -4.97, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #172
atom(< -1.09,  -6.95, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #173
atom(< -2.87,  -4.97, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #174
atom(< -0.73,  -6.95, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #175
atom(< -3.23,  -4.97,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #176
atom(< -1.09,  -6.95,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #177
atom(< -2.87,  -4.97,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #178
atom(< -0.73,  -6.95,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #179
atom(< -3.23,  -0.99, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #180
atom(< -1.09,  -2.98, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #181
atom(< -2.87,  -0.99, -92.89>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #182
atom(< -0.73,  -2.98, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #183
atom(< -3.23,  -0.99, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #184
atom(< -1.09,  -2.98, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #185
atom(< -2.87,  -0.99, -75.78>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #186
atom(< -0.73,  -2.98, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #187
atom(< -3.23,  -0.99, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #188
atom(< -1.09,  -2.98, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #189
atom(< -2.87,  -0.99, -58.67>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #190
atom(< -0.73,  -2.98, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #191
atom(< -3.23,  -0.99, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #192
atom(< -1.09,  -2.98, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #193
atom(< -2.87,  -0.99, -41.56>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #194
atom(< -0.73,  -2.98, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #195
atom(< -3.23,  -0.99, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #196
atom(< -1.09,  -2.98, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #197
atom(< -2.87,  -0.99, -24.45>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #198
atom(< -0.73,  -2.98, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #199
atom(< -3.23,  -0.99,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #200
atom(< -1.09,  -2.98,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #201
atom(< -2.87,  -0.99,  -7.34>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #202
atom(< -0.73,  -2.98,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #203
atom(< -1.09,   0.99, -92.80>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #204
atom(< -0.73,   0.99, -95.31>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #205
atom(< -1.09,   0.99, -75.69>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #206
atom(< -0.73,   0.99, -78.20>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #207
atom(< -1.09,   0.99, -58.58>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #208
atom(< -0.73,   0.99, -61.09>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #209
atom(< -1.09,   0.99, -41.47>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #210
atom(< -0.73,   0.99, -43.98>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #211
atom(< -1.09,   0.99, -24.36>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #212
atom(< -0.73,   0.99, -26.87>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #213
atom(< -1.09,   0.99,  -7.25>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #214
atom(< -0.73,   0.99,  -9.77>, 1.20, rgb <0.40, 0.56, 0.56>, 0.0, ase3) // #215
atom(<  1.04,  -8.94, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #216
atom(<  1.04,  -8.94, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #217
atom(<  1.04,  -8.94, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #218
atom(<  1.04,  -8.94, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #219
atom(<  1.04,  -8.94, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #220
atom(<  1.04,  -8.94,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #221
atom(<  1.04,  -4.97, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #222
atom(<  1.04,  -4.97, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #223
atom(<  1.04,  -4.97, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #224
atom(<  1.04,  -4.97, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #225
atom(<  1.04,  -4.97, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #226
atom(<  1.04,  -4.97,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #227
atom(<  1.04,  -0.99, -95.41>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #228
atom(<  1.04,  -0.99, -78.30>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #229
atom(<  1.04,  -0.99, -61.19>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #230
atom(<  1.04,  -0.99, -44.08>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #231
atom(<  1.04,  -0.99, -26.97>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #232
atom(<  1.04,  -0.99,  -9.86>, 1.20, rgb <1.00, 0.63, 0.00>, 0.0, ase3) // #233
cylinder {<-11.78,  -8.94, -95.41>, <-11.60,  -8.94, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -92.89>, <-11.60,  -8.94, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -92.89>, <-10.53,  -7.95, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -92.80>, <-10.53,  -7.95, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -8.94, -78.30>, <-11.60,  -8.94, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -75.78>, <-11.60,  -8.94, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -75.78>, <-10.53,  -7.95, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -75.69>, <-10.53,  -7.95, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -8.94, -61.19>, <-11.60,  -8.94, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -58.67>, <-11.60,  -8.94, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -58.67>, <-10.53,  -7.95, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -58.58>, <-10.53,  -7.95, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -8.94, -44.08>, <-11.60,  -8.94, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -41.56>, <-11.60,  -8.94, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -41.56>, <-10.53,  -7.95, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -41.47>, <-10.53,  -7.95, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -8.94, -26.97>, <-11.60,  -8.94, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -24.45>, <-11.60,  -8.94, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94, -24.45>, <-10.53,  -7.95, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -24.36>, <-10.53,  -7.95, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -8.94,  -9.86>, <-11.60,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94,  -7.34>, <-11.60,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -8.94,  -7.34>, <-10.53,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95,  -7.25>, <-10.53,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97, -95.41>, <-11.60,  -4.97, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -92.89>, <-11.60,  -4.97, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -92.80>, < -9.46,  -6.95, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -95.31>, < -9.46,  -6.95, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -92.80>, <-10.53,  -5.96, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -92.89>, <-10.53,  -5.96, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -92.89>, <-10.53,  -3.97, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -92.80>, <-10.53,  -3.97, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -95.31>, < -8.39,  -5.96, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -95.41>, < -8.39,  -5.96, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -95.31>, < -8.39,  -7.95, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -95.41>, < -8.39,  -7.95, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97, -78.30>, <-11.60,  -4.97, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -75.78>, <-11.60,  -4.97, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -75.69>, <-10.53,  -5.96, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -75.78>, <-10.53,  -5.96, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -75.69>, < -9.46,  -6.95, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -78.20>, < -9.46,  -6.95, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -75.78>, <-10.53,  -3.97, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -75.69>, <-10.53,  -3.97, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -78.20>, < -8.39,  -7.95, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -78.30>, < -8.39,  -7.95, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -78.20>, < -8.39,  -5.96, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -78.30>, < -8.39,  -5.96, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97, -61.19>, <-11.60,  -4.97, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -58.67>, <-11.60,  -4.97, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -58.58>, < -9.46,  -6.95, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -61.09>, < -9.46,  -6.95, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -58.58>, <-10.53,  -5.96, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -58.67>, <-10.53,  -5.96, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -58.67>, <-10.53,  -3.97, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -58.58>, <-10.53,  -3.97, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -61.09>, < -8.39,  -7.95, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -61.19>, < -8.39,  -7.95, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -61.09>, < -8.39,  -5.96, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -61.19>, < -8.39,  -5.96, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97, -44.08>, <-11.60,  -4.97, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -41.56>, <-11.60,  -4.97, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -41.47>, < -9.46,  -6.95, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -43.98>, < -9.46,  -6.95, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -41.47>, <-10.53,  -5.96, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -41.56>, <-10.53,  -5.96, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -41.56>, <-10.53,  -3.97, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -41.47>, <-10.53,  -3.97, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -43.98>, < -8.39,  -7.95, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -44.08>, < -8.39,  -7.95, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -43.98>, < -8.39,  -5.96, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -44.08>, < -8.39,  -5.96, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97, -26.97>, <-11.60,  -4.97, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -24.45>, <-11.60,  -4.97, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -24.36>, < -9.46,  -6.95, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -26.87>, < -9.46,  -6.95, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95, -24.36>, <-10.53,  -5.96, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -24.45>, <-10.53,  -5.96, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97, -24.45>, <-10.53,  -3.97, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -24.36>, <-10.53,  -3.97, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -26.87>, < -8.39,  -7.95, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -26.97>, < -8.39,  -7.95, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95, -26.87>, < -8.39,  -5.96, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -26.97>, < -8.39,  -5.96, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -4.97,  -9.86>, <-11.60,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97,  -7.34>, <-11.60,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95,  -7.25>, < -9.46,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95,  -9.77>, < -9.46,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -6.95,  -7.25>, <-10.53,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97,  -7.34>, <-10.53,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -4.97,  -7.34>, <-10.53,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98,  -7.25>, <-10.53,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95,  -9.77>, < -8.39,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94,  -9.86>, < -8.39,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -6.95,  -9.77>, < -8.39,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97,  -9.86>, < -8.39,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99, -95.41>, <-11.60,  -0.99, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -92.89>, <-11.60,  -0.99, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -92.80>, < -9.46,  -2.98, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -95.31>, < -9.46,  -2.98, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -92.80>, <-10.53,  -1.99, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -92.89>, <-10.53,  -1.99, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -92.89>, <-10.53,   0.00, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -92.80>, <-10.53,   0.00, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -95.31>, < -8.39,  -3.97, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -95.41>, < -8.39,  -3.97, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -95.31>, < -8.39,  -1.99, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -95.41>, < -8.39,  -1.99, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99, -78.30>, <-11.60,  -0.99, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -75.78>, <-11.60,  -0.99, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -75.69>, <-10.53,  -1.99, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -75.78>, <-10.53,  -1.99, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -75.69>, < -9.46,  -2.98, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -78.20>, < -9.46,  -2.98, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -75.78>, <-10.53,   0.00, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -75.69>, <-10.53,   0.00, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -78.20>, < -8.39,  -1.99, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -78.30>, < -8.39,  -1.99, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -78.20>, < -8.39,  -3.97, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -78.30>, < -8.39,  -3.97, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99, -61.19>, <-11.60,  -0.99, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -58.67>, <-11.60,  -0.99, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -58.58>, < -9.46,  -2.98, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -61.09>, < -9.46,  -2.98, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -58.58>, <-10.53,  -1.99, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -58.67>, <-10.53,  -1.99, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -58.67>, <-10.53,   0.00, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -58.58>, <-10.53,   0.00, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -61.09>, < -8.39,  -3.97, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -61.19>, < -8.39,  -3.97, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -61.09>, < -8.39,  -1.99, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -61.19>, < -8.39,  -1.99, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99, -44.08>, <-11.60,  -0.99, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -41.56>, <-11.60,  -0.99, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -41.47>, < -9.46,  -2.98, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -43.98>, < -9.46,  -2.98, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -41.47>, <-10.53,  -1.99, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -41.56>, <-10.53,  -1.99, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -41.56>, <-10.53,   0.00, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -41.47>, <-10.53,   0.00, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -43.98>, < -8.39,  -3.97, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -44.08>, < -8.39,  -3.97, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -43.98>, < -8.39,  -1.99, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -44.08>, < -8.39,  -1.99, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99, -26.97>, <-11.60,  -0.99, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -24.45>, <-11.60,  -0.99, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -24.36>, < -9.46,  -2.98, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -26.87>, < -9.46,  -2.98, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98, -24.36>, <-10.53,  -1.99, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -24.45>, <-10.53,  -1.99, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99, -24.45>, <-10.53,   0.00, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -24.36>, <-10.53,   0.00, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -26.87>, < -8.39,  -1.99, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -26.97>, < -8.39,  -1.99, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98, -26.87>, < -8.39,  -3.97, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -26.97>, < -8.39,  -3.97, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.78,  -0.99,  -9.86>, <-11.60,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99,  -7.34>, <-11.60,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98,  -7.25>, < -9.46,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98,  -9.77>, < -9.46,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,  -2.98,  -7.25>, <-10.53,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99,  -7.34>, <-10.53,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<-11.41,  -0.99,  -7.34>, <-10.53,   0.00,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99,  -7.25>, <-10.53,   0.00,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98,  -9.77>, < -8.39,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97,  -9.86>, < -8.39,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,  -2.98,  -9.77>, < -8.39,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99,  -9.86>, < -8.39,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -92.80>, < -9.46,   0.99, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -95.31>, < -9.46,   0.99, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -95.31>, < -8.39,   0.00, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -95.41>, < -8.39,   0.00, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -75.69>, < -9.46,   0.99, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -78.20>, < -9.46,   0.99, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -78.20>, < -8.39,   0.00, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -78.30>, < -8.39,   0.00, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -58.58>, < -9.46,   0.99, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -61.09>, < -9.46,   0.99, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -61.09>, < -8.39,   0.00, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -61.19>, < -8.39,   0.00, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -41.47>, < -9.46,   0.99, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -43.98>, < -9.46,   0.99, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -43.98>, < -8.39,   0.00, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -44.08>, < -8.39,   0.00, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99, -24.36>, < -9.46,   0.99, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -26.87>, < -9.46,   0.99, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99, -26.87>, < -8.39,   0.00, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -26.97>, < -8.39,   0.00, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.64,   0.99,  -7.25>, < -9.46,   0.99,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99,  -9.77>, < -9.46,   0.99,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -9.28,   0.99,  -9.77>, < -8.39,   0.00,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99,  -9.86>, < -8.39,   0.00,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -95.41>, < -7.32,  -8.94, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -92.89>, < -7.32,  -8.94, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -92.89>, < -6.25,  -7.95, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -92.80>, < -6.25,  -7.95, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -78.30>, < -7.32,  -8.94, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -75.78>, < -7.32,  -8.94, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -75.78>, < -6.25,  -7.95, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -75.69>, < -6.25,  -7.95, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -61.19>, < -7.32,  -8.94, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -58.67>, < -7.32,  -8.94, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -58.67>, < -6.25,  -7.95, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -58.58>, < -6.25,  -7.95, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -44.08>, < -7.32,  -8.94, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -41.56>, < -7.32,  -8.94, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -41.56>, < -6.25,  -7.95, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -41.47>, < -6.25,  -7.95, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94, -26.97>, < -7.32,  -8.94, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -24.45>, < -7.32,  -8.94, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94, -24.45>, < -6.25,  -7.95, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -24.36>, < -6.25,  -7.95, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -8.94,  -9.86>, < -7.32,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94,  -7.34>, < -7.32,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -8.94,  -7.34>, < -6.25,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95,  -7.25>, < -6.25,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -95.41>, < -7.32,  -4.97, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -92.89>, < -7.32,  -4.97, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -92.80>, < -5.18,  -6.95, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -95.31>, < -5.18,  -6.95, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -92.80>, < -6.25,  -5.96, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -92.89>, < -6.25,  -5.96, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -92.89>, < -6.25,  -3.97, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -92.80>, < -6.25,  -3.97, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -95.31>, < -4.12,  -7.95, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -95.41>, < -4.12,  -7.95, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -95.31>, < -4.12,  -5.96, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -95.41>, < -4.12,  -5.96, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -78.30>, < -7.32,  -4.97, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -75.78>, < -7.32,  -4.97, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -75.69>, < -6.25,  -5.96, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -75.78>, < -6.25,  -5.96, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -75.69>, < -5.18,  -6.95, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -78.20>, < -5.18,  -6.95, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -75.78>, < -6.25,  -3.97, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -75.69>, < -6.25,  -3.97, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -78.20>, < -4.12,  -5.96, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -78.30>, < -4.12,  -5.96, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -78.20>, < -4.12,  -7.95, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -78.30>, < -4.12,  -7.95, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -61.19>, < -7.32,  -4.97, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -58.67>, < -7.32,  -4.97, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -58.58>, < -6.25,  -5.96, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -58.67>, < -6.25,  -5.96, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -58.58>, < -5.18,  -6.95, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -61.09>, < -5.18,  -6.95, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -58.67>, < -6.25,  -3.97, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -58.58>, < -6.25,  -3.97, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -61.09>, < -4.12,  -7.95, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -61.19>, < -4.12,  -7.95, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -61.09>, < -4.12,  -5.96, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -61.19>, < -4.12,  -5.96, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -44.08>, < -7.32,  -4.97, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -41.56>, < -7.32,  -4.97, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -41.47>, < -5.18,  -6.95, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -43.98>, < -5.18,  -6.95, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -41.47>, < -6.25,  -5.96, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -41.56>, < -6.25,  -5.96, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -41.56>, < -6.25,  -3.97, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -41.47>, < -6.25,  -3.97, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -43.98>, < -4.12,  -7.95, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -44.08>, < -4.12,  -7.95, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -43.98>, < -4.12,  -5.96, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -44.08>, < -4.12,  -5.96, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97, -26.97>, < -7.32,  -4.97, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -24.45>, < -7.32,  -4.97, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -24.36>, < -6.25,  -5.96, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -24.45>, < -6.25,  -5.96, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95, -24.36>, < -5.18,  -6.95, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -26.87>, < -5.18,  -6.95, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97, -24.45>, < -6.25,  -3.97, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -24.36>, < -6.25,  -3.97, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -26.87>, < -4.12,  -7.95, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -26.97>, < -4.12,  -7.95, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95, -26.87>, < -4.12,  -5.96, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -26.97>, < -4.12,  -5.96, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -4.97,  -9.86>, < -7.32,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97,  -7.34>, < -7.32,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95,  -7.25>, < -6.25,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97,  -7.34>, < -6.25,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -6.95,  -7.25>, < -5.18,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95,  -9.77>, < -5.18,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -4.97,  -7.34>, < -6.25,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98,  -7.25>, < -6.25,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95,  -9.77>, < -4.12,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94,  -9.86>, < -4.12,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -6.95,  -9.77>, < -4.12,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97,  -9.86>, < -4.12,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -95.41>, < -7.32,  -0.99, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -92.89>, < -7.32,  -0.99, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -92.80>, < -5.18,  -2.98, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -95.31>, < -5.18,  -2.98, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -92.80>, < -6.25,  -1.99, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -92.89>, < -6.25,  -1.99, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -92.89>, < -6.25,   0.00, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -92.80>, < -6.25,   0.00, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -95.31>, < -4.12,  -3.97, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -95.41>, < -4.12,  -3.97, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -95.31>, < -4.12,  -1.99, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -95.41>, < -4.12,  -1.99, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -78.30>, < -7.32,  -0.99, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -75.78>, < -7.32,  -0.99, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -75.69>, < -6.25,  -1.99, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -75.78>, < -6.25,  -1.99, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -75.69>, < -5.18,  -2.98, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -78.20>, < -5.18,  -2.98, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -75.78>, < -6.25,   0.00, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -75.69>, < -6.25,   0.00, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -78.20>, < -4.12,  -3.97, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -78.30>, < -4.12,  -3.97, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -78.20>, < -4.12,  -1.99, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -78.30>, < -4.12,  -1.99, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -61.19>, < -7.32,  -0.99, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -58.67>, < -7.32,  -0.99, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -58.58>, < -6.25,  -1.99, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -58.67>, < -6.25,  -1.99, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -58.58>, < -5.18,  -2.98, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -61.09>, < -5.18,  -2.98, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -58.67>, < -6.25,   0.00, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -58.58>, < -6.25,   0.00, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -61.09>, < -4.12,  -3.97, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -61.19>, < -4.12,  -3.97, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -61.09>, < -4.12,  -1.99, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -61.19>, < -4.12,  -1.99, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -44.08>, < -7.32,  -0.99, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -41.56>, < -7.32,  -0.99, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -41.47>, < -5.18,  -2.98, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -43.98>, < -5.18,  -2.98, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -41.47>, < -6.25,  -1.99, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -41.56>, < -6.25,  -1.99, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -41.56>, < -6.25,   0.00, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -41.47>, < -6.25,   0.00, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -43.98>, < -4.12,  -3.97, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -44.08>, < -4.12,  -3.97, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -43.98>, < -4.12,  -1.99, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -44.08>, < -4.12,  -1.99, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99, -26.97>, < -7.32,  -0.99, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -24.45>, < -7.32,  -0.99, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -24.36>, < -6.25,  -1.99, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -24.45>, < -6.25,  -1.99, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98, -24.36>, < -5.18,  -2.98, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -26.87>, < -5.18,  -2.98, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99, -24.45>, < -6.25,   0.00, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -24.36>, < -6.25,   0.00, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -26.87>, < -4.12,  -3.97, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -26.97>, < -4.12,  -3.97, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98, -26.87>, < -4.12,  -1.99, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -26.97>, < -4.12,  -1.99, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.50,  -0.99,  -9.86>, < -7.32,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99,  -7.34>, < -7.32,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98,  -7.25>, < -6.25,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99,  -7.34>, < -6.25,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,  -2.98,  -7.25>, < -5.18,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98,  -9.77>, < -5.18,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -7.14,  -0.99,  -7.34>, < -6.25,   0.00,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99,  -7.25>, < -6.25,   0.00,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98,  -9.77>, < -4.12,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97,  -9.86>, < -4.12,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,  -2.98,  -9.77>, < -4.12,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99,  -9.86>, < -4.12,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -92.80>, < -5.18,   0.99, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -95.31>, < -5.18,   0.99, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -95.31>, < -4.12,   0.00, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -95.41>, < -4.12,   0.00, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -75.69>, < -5.18,   0.99, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -78.20>, < -5.18,   0.99, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -78.20>, < -4.12,   0.00, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -78.30>, < -4.12,   0.00, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -58.58>, < -5.18,   0.99, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -61.09>, < -5.18,   0.99, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -61.09>, < -4.12,   0.00, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -61.19>, < -4.12,   0.00, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -41.47>, < -5.18,   0.99, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -43.98>, < -5.18,   0.99, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -43.98>, < -4.12,   0.00, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -44.08>, < -4.12,   0.00, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99, -24.36>, < -5.18,   0.99, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -26.87>, < -5.18,   0.99, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99, -26.87>, < -4.12,   0.00, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -26.97>, < -4.12,   0.00, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.37,   0.99,  -7.25>, < -5.18,   0.99,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99,  -9.77>, < -5.18,   0.99,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -5.00,   0.99,  -9.77>, < -4.12,   0.00,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99,  -9.86>, < -4.12,   0.00,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -95.41>, < -3.05,  -8.94, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -92.89>, < -3.05,  -8.94, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -92.89>, < -1.98,  -7.95, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -92.80>, < -1.98,  -7.95, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -78.30>, < -3.05,  -8.94, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -75.78>, < -3.05,  -8.94, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -75.78>, < -1.98,  -7.95, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -75.69>, < -1.98,  -7.95, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -61.19>, < -3.05,  -8.94, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -58.67>, < -3.05,  -8.94, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -58.67>, < -1.98,  -7.95, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -58.58>, < -1.98,  -7.95, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -44.08>, < -3.05,  -8.94, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -41.56>, < -3.05,  -8.94, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -41.56>, < -1.98,  -7.95, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -41.47>, < -1.98,  -7.95, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94, -26.97>, < -3.05,  -8.94, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -24.45>, < -3.05,  -8.94, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94, -24.45>, < -1.98,  -7.95, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -24.36>, < -1.98,  -7.95, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -8.94,  -9.86>, < -3.05,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94,  -7.34>, < -3.05,  -8.94,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -8.94,  -7.34>, < -1.98,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95,  -7.25>, < -1.98,  -7.95,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -95.41>, < -3.05,  -4.97, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -92.89>, < -3.05,  -4.97, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -92.80>, < -0.91,  -6.95, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -95.31>, < -0.91,  -6.95, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -92.80>, < -1.98,  -5.96, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -92.89>, < -1.98,  -5.96, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -92.89>, < -1.98,  -3.97, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -92.80>, < -1.98,  -3.97, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -95.31>, <  0.16,  -5.96, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -95.41>, <  0.16,  -5.96, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -95.31>, <  0.16,  -7.95, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94, -95.41>, <  0.16,  -7.95, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -78.30>, < -3.05,  -4.97, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -75.78>, < -3.05,  -4.97, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -75.69>, < -1.98,  -5.96, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -75.78>, < -1.98,  -5.96, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -75.69>, < -0.91,  -6.95, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -78.20>, < -0.91,  -6.95, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -75.78>, < -1.98,  -3.97, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -75.69>, < -1.98,  -3.97, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -78.20>, <  0.16,  -7.95, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94, -78.30>, <  0.16,  -7.95, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -78.20>, <  0.16,  -5.96, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -78.30>, <  0.16,  -5.96, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -61.19>, < -3.05,  -4.97, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -58.67>, < -3.05,  -4.97, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -58.58>, < -1.98,  -5.96, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -58.67>, < -1.98,  -5.96, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -58.58>, < -0.91,  -6.95, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -61.09>, < -0.91,  -6.95, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -58.67>, < -1.98,  -3.97, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -58.58>, < -1.98,  -3.97, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -61.09>, <  0.16,  -7.95, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94, -61.19>, <  0.16,  -7.95, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -61.09>, <  0.16,  -5.96, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -61.19>, <  0.16,  -5.96, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -44.08>, < -3.05,  -4.97, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -41.56>, < -3.05,  -4.97, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -41.47>, < -0.91,  -6.95, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -43.98>, < -0.91,  -6.95, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -41.47>, < -1.98,  -5.96, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -41.56>, < -1.98,  -5.96, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -41.56>, < -1.98,  -3.97, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -41.47>, < -1.98,  -3.97, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -43.98>, <  0.16,  -5.96, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -44.08>, <  0.16,  -5.96, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -43.98>, <  0.16,  -7.95, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94, -44.08>, <  0.16,  -7.95, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97, -26.97>, < -3.05,  -4.97, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -24.45>, < -3.05,  -4.97, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -24.36>, < -1.98,  -5.96, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -24.45>, < -1.98,  -5.96, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95, -24.36>, < -0.91,  -6.95, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -26.87>, < -0.91,  -6.95, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97, -24.45>, < -1.98,  -3.97, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -24.36>, < -1.98,  -3.97, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -26.87>, <  0.16,  -7.95, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94, -26.97>, <  0.16,  -7.95, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95, -26.87>, <  0.16,  -5.96, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -26.97>, <  0.16,  -5.96, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -4.97,  -9.86>, < -3.05,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97,  -7.34>, < -3.05,  -4.97,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95,  -7.25>, < -1.98,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97,  -7.34>, < -1.98,  -5.96,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -6.95,  -7.25>, < -0.91,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95,  -9.77>, < -0.91,  -6.95,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -4.97,  -7.34>, < -1.98,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98,  -7.25>, < -1.98,  -3.97,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95,  -9.77>, <  0.16,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -8.94,  -9.86>, <  0.16,  -7.95,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -6.95,  -9.77>, <  0.16,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97,  -9.86>, <  0.16,  -5.96,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -95.41>, < -3.05,  -0.99, -94.15>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -92.89>, < -3.05,  -0.99, -94.15>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -92.80>, < -0.91,  -2.98, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -95.31>, < -0.91,  -2.98, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -92.80>, < -1.98,  -1.99, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -92.89>, < -1.98,  -1.99, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -92.89>, < -1.98,   0.00, -92.85>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -92.80>, < -1.98,   0.00, -92.85>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -95.31>, <  0.16,  -3.97, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -95.41>, <  0.16,  -3.97, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -95.31>, <  0.16,  -1.99, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -95.41>, <  0.16,  -1.99, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -78.30>, < -3.05,  -0.99, -77.04>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -75.78>, < -3.05,  -0.99, -77.04>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -75.69>, < -1.98,  -1.99, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -75.78>, < -1.98,  -1.99, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -75.69>, < -0.91,  -2.98, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -78.20>, < -0.91,  -2.98, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -75.78>, < -1.98,   0.00, -75.74>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -75.69>, < -1.98,   0.00, -75.74>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -78.20>, <  0.16,  -3.97, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -78.30>, <  0.16,  -3.97, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -78.20>, <  0.16,  -1.99, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -78.30>, <  0.16,  -1.99, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -61.19>, < -3.05,  -0.99, -59.93>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -58.67>, < -3.05,  -0.99, -59.93>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -58.58>, < -1.98,  -1.99, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -58.67>, < -1.98,  -1.99, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -58.58>, < -0.91,  -2.98, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -61.09>, < -0.91,  -2.98, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -58.67>, < -1.98,   0.00, -58.63>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -58.58>, < -1.98,   0.00, -58.63>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -61.09>, <  0.16,  -3.97, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -61.19>, <  0.16,  -3.97, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -61.09>, <  0.16,  -1.99, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -61.19>, <  0.16,  -1.99, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -44.08>, < -3.05,  -0.99, -42.82>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -41.56>, < -3.05,  -0.99, -42.82>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -41.47>, < -0.91,  -2.98, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -43.98>, < -0.91,  -2.98, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -41.47>, < -1.98,  -1.99, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -41.56>, < -1.98,  -1.99, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -41.56>, < -1.98,   0.00, -41.52>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -41.47>, < -1.98,   0.00, -41.52>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -43.98>, <  0.16,  -3.97, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -44.08>, <  0.16,  -3.97, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -43.98>, <  0.16,  -1.99, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -44.08>, <  0.16,  -1.99, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99, -26.97>, < -3.05,  -0.99, -25.71>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -24.45>, < -3.05,  -0.99, -25.71>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -24.36>, < -1.98,  -1.99, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -24.45>, < -1.98,  -1.99, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98, -24.36>, < -0.91,  -2.98, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -26.87>, < -0.91,  -2.98, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99, -24.45>, < -1.98,   0.00, -24.41>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -24.36>, < -1.98,   0.00, -24.41>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -26.87>, <  0.16,  -3.97, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97, -26.97>, <  0.16,  -3.97, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98, -26.87>, <  0.16,  -1.99, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -26.97>, <  0.16,  -1.99, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -3.23,  -0.99,  -9.86>, < -3.05,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99,  -7.34>, < -3.05,  -0.99,  -8.60>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98,  -7.25>, < -0.91,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98,  -9.77>, < -0.91,  -2.98,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,  -2.98,  -7.25>, < -1.98,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99,  -7.34>, < -1.98,  -1.99,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -2.87,  -0.99,  -7.34>, < -1.98,   0.00,  -7.30>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99,  -7.25>, < -1.98,   0.00,  -7.30>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98,  -9.77>, <  0.16,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -4.97,  -9.86>, <  0.16,  -3.97,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,  -2.98,  -9.77>, <  0.16,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99,  -9.86>, <  0.16,  -1.99,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -92.80>, < -0.91,   0.99, -94.06>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -95.31>, < -0.91,   0.99, -94.06>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -95.31>, <  0.16,   0.00, -95.36>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -95.41>, <  0.16,   0.00, -95.36>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -75.69>, < -0.91,   0.99, -76.95>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -78.20>, < -0.91,   0.99, -76.95>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -78.20>, <  0.16,   0.00, -78.25>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -78.30>, <  0.16,   0.00, -78.25>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -58.58>, < -0.91,   0.99, -59.84>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -61.09>, < -0.91,   0.99, -59.84>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -61.09>, <  0.16,   0.00, -61.14>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -61.19>, <  0.16,   0.00, -61.14>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -41.47>, < -0.91,   0.99, -42.73>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -43.98>, < -0.91,   0.99, -42.73>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -43.98>, <  0.16,   0.00, -44.03>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -44.08>, <  0.16,   0.00, -44.03>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99, -24.36>, < -0.91,   0.99, -25.62>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -26.87>, < -0.91,   0.99, -25.62>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99, -26.87>, <  0.16,   0.00, -26.92>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99, -26.97>, <  0.16,   0.00, -26.92>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -1.09,   0.99,  -7.25>, < -0.91,   0.99,  -8.51>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99,  -9.77>, < -0.91,   0.99,  -8.51>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {< -0.73,   0.99,  -9.77>, <  0.16,   0.00,  -9.81>, Rbond texture{pigment {color rgb <0.40, 0.56, 0.56> transmit 0.0} finish{ase3}}}
cylinder {<  1.04,  -0.99,  -9.86>, <  0.16,   0.00,  -9.81>, Rbond texture{pigment {color rgb <1.00, 0.63, 0.00> transmit 0.0} finish{ase3}}}
// no constraints
