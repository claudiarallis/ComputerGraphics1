#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAngleCameraPos = <1,3,-7>;

background{    //sky
    rgb<0,.5,1>
    }
    
camera{
    location TopFrontAngleCameraPos
    look_at <0,1,0> 
    } 
    
/*light_source{    //light source #1
    <2,7,-3>
    rgb <1,1,1>  
    }

light_source{   //light source #2
    <3,5,-4>
    rgb <.5,.5,.6>
    }*/ 
    
#declare FillLight= light_source{
    <-4,4,-4>
    rgb<.8,.9,1> *.5 
    spotlight
    radius 10
    falloff 20
    shadowless
    };
    
light_source{FillLight}    
    
#declare DirectionalLight=light_source{
    <100,100,-100> *1.75
    rgb<1,1,.8>
    parallel
    point_at<0,0,0>           
    }; 

light_source{DirectionalLight}

#declare RimLight=light_source{
    <0,12,4>
    rgb<1,1,1> *.6
    spotlight
    radius 15
    falloff 30
    point_at<0,0,0>
    };
    
light_source{RimLight} 
    
plane{     //ocean
    <0,1,0>
    0
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
          
#declare IceWhite=texture{    //color of ice
    pigment{
        rgbf <.9,.9,1,.3>
        }
        };

union{    //chunk of ice
    object{
        IceBox
        rotate <0,0,0>
        translate <0,0,0>
        texture{IceWhite}
    } 
    object{
        IceBox
        rotate <0,25,0>
        translate <0,0,0>
        texture{IceWhite}
    }
    object{
        IceBox
        scale <.94,1,.94>
        rotate <0,40,0>
        translate <0,0,0>
        texture{IceWhite}
    }
    }
    
#declare Black=texture{  //color of penguin
    pigment{
        rgb <.1,.1,.1>
        }
        }; 

union{
    cone{    //penguin's body
        <0,.5,0>
        1.25
        <0,3,0>
        .75
        texture{Black}
    }        


    sphere{  //penguin's head
        <0,1.75,0>
        .85
        texture{Black}
        translate<0,1.5,0>
    } 
    
    #declare Flipper =cone{
        <0,1,0>
        .1
        <0,2.75,0>
        .3
        texture{Black}
    };

    object{   //flipper 1
        Flipper
        rotate<0,0,-35>
        translate<-2.15,.25,0>
    }    
    
    object{   //flipper 2
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

    object{   //foot 1
        Foot
        translate<.3,0,-1>
    }

    object{  //foot 2
        Foot
        translate<-.7,0,-1>
    } 
    
    cone{   //beak
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


    cone{   //white belly
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
        <0,3.5,-.75>
        .2
        texture{
            pigment{
                rgb<1,1,1>
            } 
            }
    };
    

    difference{  //eye 1
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
    
    difference{  //eye 2   
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
    translate<0,0,0> //moves the penguin
    }
