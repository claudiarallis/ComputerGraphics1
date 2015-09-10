#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAngleCameraPos = <0,3,-7>;

background{
    rgb<0,.5,1>
    }
    
camera{
    location TopFrontAngleCameraPos
    look_at <0,0,0> 
    } 
    
light_source{
    <2,5,-3>
    rgb <1,1,1>
    }

light_source{
    <-2,-5,3>
    rgb <1,1,1>
    }
    
plane{
    <0,1,0>//normal vector
    0//distance from the origin
    texture{
    pigment{
        rgb<0,0,1>
        }
        }
    }

#declare MainCone = cone{
    <0,0,0>//point 1
    1.25//radius of point 1
    <0,3,0>//point 2
    .75//radius of point 2 
    }; 
    
#declare IceBox = box{
    <-1,-1,-1>  //important that box is centered about the origin
    <1,1,1>
    };
    
#declare Black=texture{
    pigment{
        rgb <.1,.1,.1>
        }
        };
          
#declare IceWhite=texture{
    pigment{
        rgb <.9,.9,1>
        }
        };

object{
    IceBox
    scale <2.5,1,2.5>
    rotate <0,0,0>
    translate <0,-.5,0> //translate last
    texture{IceWhite}
} 

object{
    IceBox
    scale <2.5,1,2.5>
    rotate <0,25,0>
    translate <0,-.5,0> //translate last
    texture{IceWhite}
}

object{
    IceBox
    scale <2.25,1,2.25>
    rotate <0,40,0>
    translate <0,-.5,0> //translate last
    texture{IceWhite}
}

object{
    MainCone
    texture{Black}
    }        

#declare Head =sphere{
    <0,1.75,0>//center
    .85//radius
    };

object{
    Head
    texture{Black}
    translate<0,1.5,0>
    } 
    
#declare Flipper =cone{
    <0,1,0>//point 1
    .1//radius of point 1
    <0,2.75,0>//point 2
    .3//radius of point 2
    texture{Black}
    };

object{
    Flipper
    rotate<0,0,-35>
    translate<-2.15,.25,0>
    }