#include "colors.inc"

#declare WoodColorMap=color_map{          //you can also do pigment maps, including stuff like brick and checkers
    [0.1 color DarkWood]
    [0.3 color LightWood]                //to create a sharp transition, assign two colors the same value
    [0.6 color MediumWood]
    [0.9 color DarkBrown]
    };

#declare WoodPigment=pigment{
    wood 
    color_map {WoodColorMap}
    turbulence .2
    scale <100,100,600>
    };
    
#declare WoodPigment2=pigment{
    wood 
    color_map {WoodColorMap}
    turbulence .2
    scale <600,100,100>
    };         

#declare BarnWidth=1100;
#declare BarnLength=1200;
#declare BarnHeight=450;

#declare HalfBarnWidth=BarnWidth/2;
#declare HalfBarnLength=BarnLength/2;
#declare EyeHeight=175;

#declare Barn=box{
    <-HalfBarnWidth,0,-HalfBarnLength>
    <HalfBarnWidth,BarnHeight,HalfBarnLength>
    };
    
#declare OuterBarn=object{
    Barn
    scale 1.001
    }; 
    
#declare Aisle=box{
    <-150,0,-HalfBarnLength>
    <150,BarnHeight,HalfBarnLength>
    };
    
#declare StallWidth=-HalfBarnWidth+399;
#declare StallLength=399-HalfBarnLength;

#declare Stall=box{
    <-HalfBarnWidth,0,-HalfBarnLength+1>
    <StallWidth,BarnHeight,StallLength>
    }; 
    
#declare StallSpace=box{
    <-HalfBarnWidth,0,-HalfBarnLength+5>
    <StallWidth,BarnHeight,HalfBarnLength-5>
    };
    
#declare FrontStallWindowLong=box{
    <-HalfBarnWidth+395,BarnHeight-300,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    };
    
#declare PannelHeight=25;
    
#declare FrontStallPannel=box{
    <-HalfBarnWidth+397,0,-HalfBarnLength>
    <-HalfBarnWidth+403,PannelHeight,HalfBarnLength>
    texture{
        pigment{
            WoodPigment
            }
            }
    };  
    
#declare NumPannels=15;
#declare WoodWallLong=union{
    #declare Index=-NumPannels;
    #while (Index<=NumPannels)
    object{
        FrontStallPannel
        translate<0,Index*(PannelHeight+1),0>
    }
    #declare Index=Index+1;
    #end
    }; 
    
#declare FrontStallWindowShort=box{
    <146,BarnHeight-300,-200>
    <155,BarnHeight-150,HalfBarnLength-10>
    }; 

#declare SideStallWindow=box{
    <-HalfBarnWidth,BarnHeight-300,-StallLength-5>     
    <-HalfBarnWidth+401,BarnHeight-150,-StallLength+5>
    }; 
    
#declare SideStallPannel=box{
    <-HalfBarnWidth,0,-StallLength-3>
    <-150,25,-StallLength+3>
    texture{
        pigment{
            WoodPigment2
            }
            }
            };     
    
#declare WoodWallShort=union{
    #declare Index=-NumPannels;
    #while (Index<=NumPannels)
    object{
        SideStallPannel
        translate<0,Index*(PannelHeight+1),0>
    }
    #declare Index=Index+1;
    #end
    };
    
#declare EndPannel=box{
    <-HalfBarnWidth,0,-HalfBarnLength-2>
    <HalfBarnWidth,25,-HalfBarnLength+2>
    }; 
    
#declare EndWall=union{
    #declare Index=-NumPannels;
    #while (Index<=NumPannels)
    object{
        EndPannel
        translate<0,Index*(PannelHeight+1),0>
        texture{
        pigment{
            WoodPigment2
            translate <Index*20, Index*40, Index*6>
            }
       }
    }
    #declare Index=Index+1;
    #end
    }; 
    
#declare StallBar=cylinder{
    <-150,BarnHeight-300,0>
    <-150,BarnHeight-150,0> 
    1.5
    texture{
        pigment{
            rgb<.1,.1,.1>
            }
            }
    };
    
#declare NumBars=40;    
#declare StallBars=union{
    #declare Index=-NumBars;
    #while (Index<=NumBars)
    object{
        StallBar
        translate<0,0,Index*15>
       }
    #declare Index=Index+1;
    #end
    };
     
#declare NumBars2=13;    
#declare StallBars2=union{
    #declare Index=-NumBars2;
    #while (Index<=NumBars2)
    object{
        StallBar
        translate<Index*15,0,0>
       }
    #declare Index=Index+1;
    #end
    };        
    
#declare StallDoorBase=box{
    <-HalfBarnWidth+403,0,-400>
    <-HalfBarnWidth+409,BarnHeight-125,-200>
    };
    
#declare StallDoorWindow=box{
    <-HalfBarnWidth+402,BarnHeight-300,-390>
    <-HalfBarnWidth+410,BarnHeight-150,-210>
    };
    
#declare StallDoorWindowed=difference{
    object{StallDoorBase}
    object{StallDoorWindow}
    };

#declare OuterWindow=box{
    <-HalfBarnWidth+395,BarnHeight-250,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    translate<-400,0,0>
    };
    
#declare StallDoorOpening=box{
    <-HalfBarnWidth+395,0,-400>
    <-HalfBarnWidth+404,BarnHeight-150,-200>
    };   

#declare MainDoorWidth=-275;
#declare MainDoorHeight=350;
#declare MainDoorDepth=6; 
#declare MainDoorDistanceFromLeftWall=412;
#declare MainDoorwayCutout=box{
    <0,0,-MainDoorDepth/2>
    <MainDoorWidth,MainDoorHeight,MainDoorDepth/2>
    translate<HalfBarnWidth-MainDoorDistanceFromLeftWall,0,HalfBarnLength>
    }; 
    

#declare CentralCameraPos= <0,EyeHeight,0>;
#declare OuterCameraPos= <0,650,-2000>;
#declare BackEntry= <0,EyeHeight,HalfBarnLength>;
#declare FrontEntry= <0,EyeHeight,-HalfBarnLength>;
#declare TopCameraPos= <0,2000,0>;

camera{
    location FrontEntry
    look_at CentralCameraPos
    }   
    
/*light_source{
    <0,BarnHeight-10,0>
    rgb<1,1,1> *.5
    }  */
    
#declare SunLight=light_source{
    <BarnWidth*2,BarnHeight*2,-BarnLength/2>
    rgb<.8,.8,.75> 
    parallel
    point_at<HalfBarnWidth,EyeHeight,HalfBarnLength>
    };
    
light_source{SunLight}   

#declare NumSkyLights=5;
#declare SkyLightPos=array[NumSkyLights] {<-BarnWidth,0,BarnLength>
                                          <-HalfBarnWidth,EyeHeight,-HalfBarnLength>
                                          <-HalfBarnWidth,BarnHeight*2,HalfBarnLength>
                                          <-HalfBarnWidth,0,HalfBarnLength>
                                          <-BarnWidth,EyeHeight,0>
                                          }
#declare SkyLights=union{
     #declare Index=0;
     #while (Index <NumSkyLights)
    light_source{
    <-HalfBarnWidth,BarnHeight*2,0>
    rgb<.75,.75,.85>*.1
    parallel
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    };
    
#declare SkyLightPos2=array[NumSkyLights] {<HalfBarnWidth,EyeHeight,-BarnLength>
                                          <BarnWidth,0,BarnLength>
                                          <HalfBarnWidth,BarnHeight*2,HalfBarnLength>
                                          <HalfBarnWidth,EyeHeight,BarnLength>
                                          <BarnWidth,0,0>}
#declare SkyLights2=union{
     #declare Index=0;
     #while (Index <NumSkyLights)
    light_source{
    <HalfBarnWidth,BarnHeight*2,0>
    rgb<.75,.75,.85>*.1 
    shadowless
    parallel
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    }; 
    

#declare NumSkyLights2=3;
#declare SkyLightPos3=array[NumSkyLights2] {<0,EyeHeight,HalfBarnLength>
                                          <10,BarnHeight,BarnLength>
                                          <-10,BarnHeight*2,HalfBarnLength>
                                         }
#declare SkyLights3=union{
     #declare Index=0;
     #while (Index <NumSkyLights2)
    light_source{
    <0,BarnHeight*2,HalfBarnLength>
    rgb<.75,.75,.85>*.01
    parallel  
    shadowless
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    }; 
         
#declare SkyLightPos4=array[NumSkyLights2] {<0,EyeHeight,-HalfBarnLength>
                                          <10,BarnHeight,-BarnLength>
                                          <-10,BarnHeight,-BarnLength>}
#declare SkyLights4=union{
     #declare Index=0;
     #while (Index <NumSkyLights2)
    light_source{
    <0,BarnHeight*2,HalfBarnLength>
    rgb<.75,.75,.85>*.01
    parallel
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    };          
    
light_source{SkyLights}
light_source{SkyLights2} 
light_source{SkyLights3}
light_source{SkyLights4}

#declare BounceLight1=light_source{
    <-BarnWidth/3,BarnHeight+400,-HalfBarnLength-50>
    rgb<1,1,1>  //multiplying this by 2 will change intensity
    spotlight
    radius 10 //this is an angle, not a distance.
    falloff 100000 //distance from center of light to edge of light (higher falloff in relation to radius -> fuzzy edges)
    tightness 10 //higher values will dim the light as it approaches the falloff edge
    point_at<-BarnWidth/3,BarnHeight/2,250>
  projected_through {Barn}
    };     
    
#declare BounceLight2=light_source{
    <-BarnWidth/3,BarnHeight*1.25,HalfBarnLength+50>
    rgb<1,1,1>  
    spotlight
    radius 10 
    falloff 100000 
    tightness 10
    point_at<-BarnWidth/3,BarnHeight/2,-250>
    projected_through {Barn}
    }; 
    
#declare BounceLight3=light_source{
    <BarnWidth/3,BarnHeight*1.05,HalfBarnLength>
    rgb<1,1,1>  
    spotlight
    radius 10 
    falloff 100000 
    tightness 10
    point_at<BarnWidth/3,BarnHeight/2,250>
    projected_through {Barn}
    };  
    
 
light_source{BounceLight1}
light_source{BounceLight2}
light_source{BounceLight3}

background{rgb<0,.25,.55>}


/*difference{
    //object{OuterBarn             //outer wall} 
    object{
        Barn
        }
    object{Barn
        translate<0,BarnHeight-1,0>}             
    object{
        Aisle}
    object{
        StallSpace
        translate <0,0,0>
        }
    object{
        StallSpace
        translate <0,0,0>
        }
    object{    
        Stall}
    object{
        Stall
        translate<0,0,800>
        }
    object{
        Stall
        translate<0,0,401>
        }
    object{
        Stall
        translate<700,0,0>
        }
    object{
        Stall
        translate<700,0,800>
        }
    object{
        Stall
        translate<700,0,401>
        } 
    object{
        FrontStallWindowLong} 
    object{
        FrontStallWindowShort}
    object{
        SideStallWindow}
    object{
        SideStallWindow
        translate<0,0,-400>
        }
    object{
        SideStallWindow
        translate<700,0,0>
        } 
    object{
        StallDoorOpening}
    object{
        StallDoorOpening
        translate<0,0,400>
        }
    object{
        StallDoorOpening
        translate<0,0,800>
        }
    object{
        StallDoorOpening
        translate<301,0,400>
        }
    object{
        StallDoorOpening
        translate<301,0,800>
        }
    object{
        MainDoorwayCutout}
    object{
        MainDoorwayCutout
        translate<0,0,-BarnLength>
        }
    object{
        OuterWindow}
    object{
        OuterWindow
        translate<1100,0,0>
        }
    texture{
        pigment{
           rgb<1,1,1>
            }
        finish{
            diffuse .5
            specular .001
            roughness 10
            }
            }
            } */
            

#declare BarnWallBaseStructure=difference{
       object{
            Barn}
       object{
            Barn
            scale .999
            }
       texture{
            pigment{
                rgb<1,1,1>
                }
                }     
            };            

#declare OuterBarnWalls=union{
    object{
        BarnWallBaseStructure}
    object{
        EndWall}
    object{
        EndWall
        translate<0,0,BarnLength>
        }
    object{
        WoodWallLong
        translate<-HalfBarnWidth-StallWidth,0,0>
        }
    object{
        WoodWallLong
        translate<HalfBarnWidth+150,0,0>
        } 
        };

#declare OuterBarn=difference{
    object{
        OuterBarnWalls}
    /*object{Barn
        translate<0,BarnHeight-10,0>}*/
    object{
        MainDoorwayCutout}
    object{
        MainDoorwayCutout
        translate<0,0,-BarnLength>
        }
    object{
        OuterWindow}
    object{
        OuterWindow
        translate<1100,0,0>
        }
        };        
            
/*difference{
    object{
        Barn
        }
    object{
        Barn
        scale .999
        }
    object{Barn
        translate<0,BarnHeight-10,0>}
        object{
        MainDoorwayCutout}
    object{
        MainDoorwayCutout
        translate<0,0,-BarnLength>
        }
    object{
        OuterWindow}
    object{
        OuterWindow
        translate<1100,0,0>
        }
    texture{
        pigment{
           rgb<1,1,1>
            }
        }
        }*/
        
object{OuterBarn}           

#declare InnerWallUnbarred=difference{        
    object{
        WoodWallLong}
    object{
        FrontStallWindowLong
        }
    };
    
#declare InnerWallBarred=union{
    object{
        InnerWallUnbarred}
    object{
        StallBars}
        };                                                                             
                    
        
difference{
    object{
        InnerWallBarred}
    object{
        StallDoorOpening}
    object{
        StallDoorOpening
        translate<0,0,400>
        }
    object{
        StallDoorOpening
        translate<0,0,800>
        } 
        }                   

#declare InnerWallUnbarredShort=difference{
    object{
        WoodWallLong
        translate<300,0,0>}
    object{
        FrontStallWindowShort}
        };
        
#declare InnerWallBarredShort=union{
    object{
        InnerWallUnbarredShort}
    object{
        StallBars
        translate<300,0,0>}
        };                      
                   
difference{                   
    object{
        InnerWallBarredShort
    }
    object{
        StallDoorOpening
            translate<301,0,400>
        }
    object{
        StallDoorOpening
            translate<301,0,800>
        }
        }

#declare StallSide=difference{
    object{
        WoodWallShort}
    object{
        SideStallWindow}
        };
        
object{StallSide}

object{
    StallSide
    translate <0,0,-400>
    }
    
object{
    StallSide
    translate <700,0,0>
    }
    
object{
    WoodWallShort
    translate <700,0,-400>  
    } 
    
object{StallBars2
    translate<-215,0,-200>} 

object{
    StallBars2
    translate<-215,0,200>}
    
object{
    StallBars2
    translate<515,0,200>
    }                                          
   