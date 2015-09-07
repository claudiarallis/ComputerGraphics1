background{
    rgb<0,.5,1>
    }
camera{
    location<0,2,-5>
    look_at<0,1,0>
    }
light_source{
    <2,3,-2>//location
    rgb<1,1,1>
    }
sphere{
    <0,1.75,0>//center
    1//radius
    texture{
        pigment{
            rgb<0,.75,1>
            } 
    }
    }
plane{
    <0,1,0>//normal vector
    0//distance from the origin
    texture{
    pigment{
        rgb<0,.5,0>
        }
        }
    }
box{
    <-1,0,-1>//near lower left corner
    <1,.75,3>//far upper right corner
    texture{
        pigment{
            rgb<.25,0,.5>
            }
            }
            }
cone{
    <0,1,0>//point 1
    .3//radius of point 1
    <0,3,0>//point 2
    1.25//radius of point 2
   texture{
    pigment{
        rgb<.5,0,.75>
        }
        }
    }
torus{
    1.5//outer radius
    .65//inner radius
    translate<0,.25,0>
    texture{
    pigment{
        rgb<.5,1,0>
        }
        }
    } 