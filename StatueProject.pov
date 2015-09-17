#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAngleCameraPos = <1,3,-7>;

background{
    rgb<0,.5,1>
    }
    
camera{
    location TopFrontAngleCameraPos
    look_at <0,1,0> 
    } 
    
light_source{
    <2,7,-3>
    rgb <1,1,1>
    }

light_source{
    <3,5,-4>
    rgb <.5,.5,.6>
    }
    
plane{
    <0,1,0>//normal vector
    0//distance from the origin
    texture{
    pigment{
        rgb<0,.1,.5>
        }
        }
    }
        
#declare IceBox = box{
    <-2.5,0,-2.5>  
    <2.5,.5,2.5>
    };
          
#declare IceWhite=texture{
    pigment{
        rgbf <.9,.9,1,.3>
        }
        };

union{
    object{
        IceBox
        rotate <0,0,0>
        translate <0,0,0> //translate last
        texture{IceWhite}
    } 
    object{
        IceBox
        rotate <0,25,0>
        translate <0,0,0> //translate last
        texture{IceWhite}
    }
    object{
        IceBox
        scale <.94,1,.94>
        rotate <0,40,0>
        translate <0,0,0> //translate last
        texture{IceWhite}
    }
    }
    
#declare Black=texture{
    pigment{
        rgb <.1,.1,.1>
        }
        }; 

cone{
    <0,.5,0>//point 1
    1.25//radius of point 1
    <0,3,0>//point 2
    .75//radius of point 2 
    texture{Black}
    }        


sphere{
    <0,1.75,0>//center
    .85//radius
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
    
object{
    Flipper
    rotate<0,0,35>
    translate<2.15,.25,0>
    }

#declare Foot =box{
    <0,.5,-.4>
    <.5,.65,0>
    texture{
        pigment{
            rgb<.6,.3,0>
            }
            }
            };

object{
    Foot
    translate<.3,0,-1>
    }

object{
    Foot
    translate<-.7,0,-1>
    } 
    
cone{
    <0,3.2,-2>
    .01
    <0,3.25,-1>
    .2
   texture{
    pigment{
        rgb<.6,.3,0>
        }
        }
   rotate<0,0,0>
        }   


cone{
    <1,-1.5,-0.6>
    0.5
    <0,0,-0.6>
    0.8
    texture{
        pigment{
            rgb<1,1,1>
            }
            }
    rotate<0,0,146>
    translate<0,.75,.05>
    }

#declare Eye =sphere{
    <0,3.5,-.75>//center
    .2//radius
    texture{
        pigment{
            rgb<1,1,1>
            } 
    }
    };
    

difference{
    object{
    Eye
    translate<-.35,0,0>
    }
    object{
    Eye
    texture{
        pigment{
            rgb<0,0,0>
            }
            }
    scale<.5,.5,.5>
    translate<-.35,1.8,-.55>
    }
    }
    
difference{    
    object{
    Eye
    translate<.35,0,0>
    }
    object{
    Eye
    texture{
        pigment{
            rgb<0,0,0>
            }
            }
    scale<.5,.5,.5> 
    translate<.35,1.8,-.55>
    }
    }
