#include "colors.inc"
           
//color map and pigments for wood           
#declare WoodColorMap=color_map{          
    [0.1 color DarkWood]
    [0.3 color LightWood]                
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
    
             
//basic barn stuff
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
    
    
//basic stall stuff    
#declare StallWidth=-HalfBarnWidth+399;
#declare StallLength=399-HalfBarnLength;
    
#declare FrontStallWindowLong=box{
    <-HalfBarnWidth+395,BarnHeight-300,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    };

//the ceiling    
#declare CeilingPannel=box{
    <-HalfBarnWidth,BarnHeight-4,-HalfBarnLength>
    <HalfBarnWidth,BarnHeight,-HalfBarnLength+25>
    texture{
        pigment{
            WoodPigment2
            }
            }
    };        
    
#declare PannelHeight=25;

#declare NumRoofPannels=25;
#declare Ceiling=union{
    #declare Index=-NumRoofPannels;
    #while (Index<=NumRoofPannels)
    object{
        CeilingPannel
        translate<0,0,Index*(PannelHeight+1)>
    }
    #declare Index=Index+1;
    #end
    };
    
              //PUT THIS AT THE END WITH THE REST

//making the walls    
#declare FrontStallPannel=box{
    <-HalfBarnWidth+398,0,-HalfBarnLength>
    <-HalfBarnWidth+402,PannelHeight,HalfBarnLength>
    texture{
        pigment{
            WoodPigment
            }
            }
    };  
    
#declare NumPannels=17;
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
    <153,BarnHeight-150,HalfBarnLength-10>
    }; 

#declare SideStallWindow=box{
    <-HalfBarnWidth,BarnHeight-300,-StallLength-5>     
    <-HalfBarnWidth+401,BarnHeight-150,-StallLength+5>
            }; 
    
#declare SideStallPannel=box{
    <-HalfBarnWidth,0,-StallLength-2>
    <-150,25,-StallLength+2>
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
     
//bars for the stall windows    
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
              
//window stuff starts here
#declare OuterWindow=box{
    <-HalfBarnWidth+395,BarnHeight-250,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    translate<-400,0,0>
    };     
    
#declare OuterWindowGlass=box{
    <-HalfBarnWidth+395,BarnHeight-250,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    texture{
        pigment{
            color rgbt<1,1,1,.95> //the t is "transmit", and controls transparency
            }
        finish{
            ambient 0
            specular 0.6
            roughness 0.005
            reflection {
                0.1, .85     //1=perfectly reflective; numbers are min and max amount of reflectivity
                fresnel on} //the two numbers + the fresnel will change where/how it is reflective 
            conserve_energy //put this in if you're making something transparent and reflective
        }
        } 
      interior{   //tells POVray what to do with the inside of the objects - good for transparents
        ior 1.5 //index of refraction of glass ...water is 1.33, 2.4 is diamond
        fade_color <0,1,0> //using this interior stuff on an opaque object will make it GLOSSY
        }      //fresnel will NOT WORK without an interior specified       
    translate<-400,0,0>
    };
                   
//the stalls' doors    
#declare StallDoorFrameOuter=box{
    <-HalfBarnWidth+403,0,-400>
    <-HalfBarnWidth+409,BarnHeight-140,-200>
    };
    
#declare StallDoorFrameCutout=box{
    <-HalfBarnWidth+401,7,-393>
    <-HalfBarnWidth+411,BarnHeight-147,-207>
    };        
    
#declare StallDoorFrame=difference{
    object {StallDoorFrameOuter}
    object {StallDoorFrameCutout}
    texture{
        pigment{
            rgb<.1,.1,.1>
            }
            }
    };    

#declare StallDoorPanel=box{
    <-HalfBarnWidth+400,0,-393>
    <-HalfBarnWidth+405,PannelHeight,-207>
    texture{
        pigment{
            WoodPigment
            }
            }
    };  
    
#declare NumPannelsDoor=5;
#declare StallDoorWood=union{
    #declare Index=-NumPannelsDoor;
    #while (Index<=NumPannelsDoor)
    object{
        StallDoorPanel
        translate<0,Index*(PannelHeight+1),0>
    }
    #declare Index=Index+1;
    #end
    }; 

#declare StallDoorWindow=box{
    <-HalfBarnWidth+399,BarnHeight-300,-390>
    <-HalfBarnWidth+410,BarnHeight-150,-210>
    texture{
        pigment{
            rgbf<1,1,1,1>
            }
            }
    };
    
#declare WindowedStallDoor=difference{
    object{
        StallDoorWood
        translate <3,0,0>
        }
    object{StallDoorWindow}
    };

#declare NumBarsDoor=6;    
#declare StallDoorBars=union{
    #declare Index=-NumBarsDoor;
    #while (Index<=NumBarsDoor)
    object{
        StallBar
        translate<0,0,Index*15>
       }
    #declare Index=Index+1;
    #end
    };

    
#declare StallDoorRunnerOuter=box{
    <-HalfBarnWidth+403,BarnHeight-125,-575>
    <-HalfBarnWidth+409,BarnHeight-135,-195>
    texture{
        pigment{
            rgb<.5,.5,.5>
            }
        }
    };
    
#declare StallDoorRunnerCutout=box{
    <-HalfBarnWidth+404,BarnHeight-125,-573>
    <-HalfBarnWidth+408,BarnHeight-137,-197>
    texture{
        pigment{
            rgb<.75,.75,.75>
            }
        }
    };
    
#declare StallDoorRunner=difference{
    object{StallDoorRunnerOuter}
    object{StallDoorRunnerCutout}
    }; 
    
#declare RunnerThingy=cylinder{
    <0,BarnHeight-130,0>
    <0,BarnHeight-140,0>
    3.0
    texture{
        pigment{
            rgb <.75,.75,.75>
            }
            }
    translate <-144,0,-215>        
            };
            
//door handle stuff starts here
#declare HandleShaft=cylinder{
    <-132,100,-215>
    <-132,130,-215>
    3
    texture{
        pigment{
            rgb<.1,.1,.1>
            }
            }
    };
    
#declare HandleShaftEnds=difference{
    torus{
    11
    3
    rotate <90,0,0>
        texture{
        pigment{
            rgb<.1,.1,.1>
            }
            }
    }
    box{
       <-15,0,-10>
       <0,25,10>
       }
    box{
       <-15,-20,-10>
       <15,0,10>
       }     
    };
      
#declare DoorHandle=union{      
    object{HandleShaftEnds
     translate <-143,125,-215>       
            }
    object{HandleShaftEnds
    rotate <180,0,0>
    translate <-143,100,-215>}                                   
    object{HandleShaft}
    };                                  

#declare BarredStallDoor=union{
    object{StallDoorFrame}    
    object{StallDoorBars
        translate <3,0,-295>}
    object{WindowedStallDoor}   
    object{RunnerThingy}                        
    object{RunnerThingy
        translate <0,0,-175>
        } 
    object{DoorHandle}      
    };                                       
    
#declare StallDoorOpening=box{
    <-HalfBarnWidth+396,0,-400>
    <-HalfBarnWidth+403,BarnHeight-150,-200>
    };   

//stuff for the main entries/exits
#declare MainDoorWidth=-275;
#declare MainDoorHeight=350;
#declare MainDoorDepth=6; 
#declare MainDoorDistanceFromLeftWall=412;
#declare MainDoorwayCutout=box{
    <0,0,-MainDoorDepth/2>
    <MainDoorWidth,MainDoorHeight,MainDoorDepth/2>
    translate<HalfBarnWidth-MainDoorDistanceFromLeftWall,0,HalfBarnLength>
    }; 
    
//door for the tack/storage room
#declare TackRoomDoorBase=box{
    <146,0,-350>
    <153,300,-225>
    texture{
        pigment{
            rgb<.95,.95,.95>
            }
        finish{    
            roughness 0.75
            specular .35
            }    
            }
    }
#declare TackRoomDoorIndent=box{
    <140,30,-340>
    <148,145,-295>
    texture{
        pigment{
            rgb<.9,.9,.9>
            }
        finish{    
            roughness 0.85
            specular .35
            }
            }
    };
    
#declare TackRoomDoor=difference{
    object{TackRoomDoorBase}
    object{TackRoomDoorIndent}
    object{TackRoomDoorIndent
        translate<0,0,60>
        }
    object{TackRoomDoorIndent
        scale<0,.85,0>
        translate<0,150,0>
     }
    object{TackRoomDoorIndent
        scale<0,.85,0>
        translate<0,150,60>
        }    
    };    
    
#declare Doorknob=lathe{     
    cubic_spline 
    11 
    <1,-.5>,<1,0>,<1,1.25>,<2,1.5>,<2.75,2>,<2.85,2.25>,<2.75,2.5>,<2,3>,<1,3.2>,<0,3.25>,<0,3.25>
    texture{
        pigment{
            rgb <.35,.35,.4>}
        finish{
            ambient .2
            specular .75
            roughness .05
            reflection .1
            metallic
        } 
        }
        };
        
//floor of main aisle
#declare ConcreteColorMap=color_map{          
    [0.1 color <.45,.45,.45>]
    [0.3 color <.2,.2,.2>]              
    [0.4 color <.3,.3,.3>]
    [0.9 color <.4,.4,.4>]
    };
#declare ConcretePigment=pigment{
    bumps
    color_map {ConcreteColorMap}
    scale 4
    };

#declare AisleFloor=box{
    <-150,-1,-HalfBarnLength>
    <150,.5,HalfBarnLength>
    texture{
        pigment{ConcretePigment
            }
            }
    };

//floor of stalls
#declare StallFloor=box{
    <-HalfBarnWidth,-1,-HalfBarnLength>
    <-151,.5,HalfBarnLength>
    texture{
        pigment{
            rgb <.05,.05,.05>
            }
        finish{
            roughness 3
            ambient .5
            specular .05    
            }
            }
    };

//aisle lights
#declare LightBox=box{
    <-130,BarnHeight-45,0>
    <130,BarnHeight-25,35>
    texture{
        pigment{
            rgb<.25,.25,.25>
            }
            }
        finish{
            metallic
            }    
            };
#declare Light=box{
    <-125,BarnHeight-46,5>
    <125,BarnHeight-26,30>
    texture{
        pigment{
            rgb<1,1,1>
            }
        finish{
            ambient .9
            }    
            }
    };  
    
#declare OverHeadLight=union{
    object{LightBox}
    object{Light}
    };
                  
object{OverHeadLight}
object{OverHeadLight
    translate <0,0,350>
    }
object{OverHeadLight
    translate <0,0,-350>
    }                                            
    

#declare CentralCameraPos= <0,EyeHeight,0>;
#declare OuterCameraPos= <0,650,-2000>;
#declare BackEntry= <0,EyeHeight,HalfBarnLength>;
#declare FrontEntry= <0,EyeHeight,-HalfBarnLength>;
#declare TopCameraPos= <0,2000,0>;

camera{
    location FrontEntry
    look_at CentralCameraPos
    }   
    
light_source{
    <0,BarnHeight-46,0>     //Flourescent Light_Middle
    rgb<1,1,1> *.25
    }  
    
light_source{
    <-80,BarnHeight-46,0>     //Flourescent Light_Middle
    rgb<1,1,1> *.25
    }  
    
light_source{
    <80,BarnHeight-46,0>     //Flourescent Light_Middle
    rgb<1,1,1> *.25
    }          
    
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
                                          };
#declare SkyLights=union{
     #declare Index=0;
     #while (Index <NumSkyLights)
    light_source{
    <-HalfBarnWidth,BarnHeight*2,0>
    rgb<.75,.75,.85>*.25
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
    rgb<.75,.75,.85>*.25 
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
    rgb<.75,.75,.85>*.1
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
    rgb<.75,.75,.85>*.1
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
    
object{BarredStallDoor}

object{
    BarredStallDoor
    translate <0,0,400>
    }
    
object{
    BarredStallDoor
    translate <0,0,800>
    }
    
object{
    BarredStallDoor
    translate<143,0,-200>
    rotate<0,180,0>
    translate <144,0,-400>
    }
    
object{
    BarredStallDoor
    translate<143,0,-400>
    rotate<0,180,0>
    translate <144,0,-200>
    } 
    
object{
    StallDoorRunner}
    
object{
    StallDoorRunner
    translate<0,0,400>
    }
    
object{
    StallDoorRunner
    translate<0,0,800>
    }
    
object{
    StallDoorRunner
    translate <289,0,400>
    }
    
object{
    StallDoorRunner
    translate <289,0,800>
    }     
    
object{OuterWindowGlass} 

object{
    OuterWindowGlass
    translate <BarnWidth,0,0>
    } 
    
object{TackRoomDoor
    translate<0,0,-50>} 

object{
    Doorknob
    scale 3
    rotate <0,0,90>
    translate <147,160,-385>} 
    
object{Ceiling
    translate <0,0,HalfBarnLength>} 
    
object{AisleFloor} 

object{StallFloor}

object{StallFloor
    translate <800,0,0>
    }
    
//to be added: nameplates (image map?), shavings, blanket holders, hooks for halters, trunks, lights                                                     