#include "colors.inc" 
#include "rad_def.inc"
           
//color map and pigments for wood           
#declare WoodColorMap=color_map{           
    [0.1 color DarkTan]                    
    [0.3 color MediumWood]                  
    [0.5 color DarkWood]
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
    
#declare BlackTexture=texture{
    pigment{
        rgb<.1,.1,.1>
        }
        };
                     
//length width height definitions
#declare BarnWidth=1100;
#declare BarnLength=1200;
#declare BarnHeight=450;

#declare HalfBarnWidth=BarnWidth/2;
#declare HalfBarnLength=BarnLength/2;
#declare EyeHeight=175;
     
#declare StallWidth=-HalfBarnWidth+399;
#declare StallLength=399-HalfBarnLength;

//main entries/exits
#declare MainDoorWidth=-275;
#declare MainDoorHeight=350;
#declare MainDoorDepth=6; 
#declare MainDoorDistanceFromLeftWall=412;
#declare MainDoorwayCutout=box{
    <0,0,-MainDoorDepth/2>
    <MainDoorWidth,MainDoorHeight,MainDoorDepth/2>
    translate<HalfBarnWidth-MainDoorDistanceFromLeftWall,0,HalfBarnLength>
    }; 

//the ceiling    
#declare CeilingPannel=box{
    <-HalfBarnWidth,BarnHeight-4,-HalfBarnLength>
    <HalfBarnWidth,BarnHeight,-HalfBarnLength+35>
    };        
    
#declare PannelHeight=25;
#declare RoofPannelHeight=35;

#declare NumRoofPannels=17;
#declare Ceiling=union{
    #declare Index=-NumRoofPannels;
    #while (Index<=NumRoofPannels)
    object{
        CeilingPannel
        translate<0,0,Index*(RoofPannelHeight+1)>
        texture{
            pigment{
                WoodPigment2
                translate<Index*20,Index*40,Index*6>
                }
            }
    }
    #declare Index=Index+1;
    #end
    };  
    
object{
    Ceiling
    translate <0,0,HalfBarnLength-20>
    }      
    
//rafters
#declare RafterBeam=box{
    <-HalfBarnWidth,BarnHeight-25,HalfBarnLength>
    <HalfBarnWidth,BarnHeight,HalfBarnLength+20>
            }; 
            
#declare RafterWidth=15;
#declare RafterInterval=220;
 
#declare NumRafters=3;
#declare Rafters=union{
    #declare Index=-NumRafters;
    #while (Index<=NumRafters)
    object{
        RafterBeam
        translate<0,0,Index*(RafterInterval+RafterWidth)>
        texture{
            pigment{
                WoodPigment2
                translate<Index*20,Index*40,Index*6>
                }
            }
    }
    #declare Index=Index+1;
    #end
    };    
      
object{
    Rafters
    translate<0,0,-HalfBarnLength+100>
    } 
    
//the outer (glass) windows
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
            color rgbt<1,1,1,.95>
            }
        finish{
            ambient 0
            specular 0.6
            roughness 0.005
            reflection{
                0.1, .85     
                fresnel on
            }  
            conserve_energy 
        }
        } 
      interior{   
        ior 1.5 
        fade_color <0,1,0> 
        }            
    translate<-400,0,0>
    };
     
object{OuterWindowGlass} 

object{
    OuterWindowGlass
    translate <BarnWidth,0,0>
    }                
          
//walls and stalls
#declare FrontStallWindowLong=box{
    <-HalfBarnWidth+395,BarnHeight-300,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    texture{
        BlackTexture
            }
    };
        
#declare FrontStallPannel=box{
    <-HalfBarnWidth+398,0,-HalfBarnLength>
    <-HalfBarnWidth+402,PannelHeight,HalfBarnLength>
    };  
    
#declare NumPannels=17;
#declare WoodWallLong=union{
    #declare Index=-NumPannels;
    #while (Index<=NumPannels)
    object{
        FrontStallPannel                                                
        translate<0,Index*(PannelHeight+1),0>
        texture{
            pigment{
                WoodPigment
                translate <Index*2,Index*10,Index*10>       
                }
            }
    }
    #declare Index=Index+1;
    #end
    }; 
    
#declare FrontStallWindowShort=box{
    <146,BarnHeight-300,-200>
    <153,BarnHeight-150,HalfBarnLength-10>
    texture{
        BlackTexture
           }
    }; 

#declare SideStallWindow=box{
    <-HalfBarnWidth,BarnHeight-300,-StallLength-5>     
    <-HalfBarnWidth+401,BarnHeight-150,-StallLength+5>
    texture{
        BlackTexture
           }
    }; 
    
#declare SideStallPannel=box{
    <-HalfBarnWidth,0,-StallLength-2>
    <-150,25,-StallLength+2>
    };     
    
#declare WoodWallShort=union{
    #declare Index=-NumPannels;
    #while (Index<=NumPannels)
    object{
        SideStallPannel
        translate<0,Index*(PannelHeight+1),0>
        texture{
            pigment{                                               
                WoodPigment2
                translate <Index*20,Index*40,Index*6>
                }
            }
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
#declare RustColorMap=color_map{
                    [.1 color rgbt <.1,.1,.1,1>]
                    [.5 color rgbt <.1,.1,.1,1>]  
                    [.65 color rgbt <.1,.1,.1,1>]
                    [.7 color rgbt <.2,.2,.25,.85>] 
                    [.85 color rgbt <.2,.2,.25,.85>]
                    [.9 color rgbt <.1,.1,.1,1>] 
    };  
    
#declare RustBumpsPigment=pigment{
    bumps
    color_map {RustColorMap}
    scale <.95,9.5,.95>
    turbulence 1
    };    
    
#declare RustyTexture=                    
        texture{
            pigment{
                rgb <.1,.1,.1>
                }
            finish{
                roughness 2
                }        
            }
        texture{
            pigment{RustBumpsPigment}
                scale <1,.1,1>            
            finish{
                roughness 2 
                }           
            };             
    
#declare StallBar=cylinder{
    <-149,150,0>          
    <-149,300,0> 
    1.5
    texture{RustyTexture}
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
#declare NumBars3=20;    
#declare StallBars3=union{                                                             
    #declare Index=-NumBars3;
    #while (Index<=NumBars3)
    object{
        StallBar
        translate<0,0,Index*15> 
       }
    #declare Index=Index+1;
    #end
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
    texture{RustyTexture}
    };    

#declare StallDoorPanel=box{
    <-HalfBarnWidth+400,0,-393>
    <-HalfBarnWidth+405,PannelHeight,-207>
    };  
    
#declare NumPannelsDoor=11;
#declare StallDoorWood=union{
    #declare Index=-NumPannelsDoor;
    #while (Index<=NumPannelsDoor)
    object{
        StallDoorPanel
        translate<0,Index*(PannelHeight+1),0> 
        texture{
            pigment{
                WoodPigment
                translate<Index*8,Index*22,Index*3>
                }
            }
    }
    #declare Index=Index+1;
    #end
    }; 

#declare StallDoorWindow=box{
    <-HalfBarnWidth+399,BarnHeight-300,-395>
    <-HalfBarnWidth+410,BarnHeight-155,-205>
    texture{BlackTexture}
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
        finish{
            specular .75
            roughness .15
            reflection .1
            metallic
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
            
    //door handles and blanket racks
#declare HandleShaft=cylinder{
    <-132.4,100,-215>
    <-132.4,130,-215>
    3
    texture{RustyTexture}
    };
    
#declare HandleShaftEnds=difference{
    torus{
    11
    3
    rotate <90,0,0>
        texture{RustyTexture}
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
    object{
        HandleShaftEnds
        translate <-143.5,125,-215>       
            }
    object{
        HandleShaftEnds
        rotate <180,0,0>
        translate <-143.5,100,-215>
            }                                   
    object{HandleShaft}
    }; 
    
#declare BlanketRack=object{
    DoorHandle
    translate<132,-100,215>
    rotate<90,0,0>
    scale<1,1,2.5>
    translate<-127,115,-350>      
    };                                         

#declare BarredStallDoor=union{
    object{StallDoorFrame}    
    object{
        StallDoorBars
        translate <3,0,-295>}
    object{WindowedStallDoor}   
    object{RunnerThingy}                        
    object{
        RunnerThingy
        translate <0,0,-175>
        } 
    object{DoorHandle}
    object{BlanketRack}      
    };                                       
    
#declare StallDoorOpening=box{
    <-HalfBarnWidth+396,0,-400>
    <-HalfBarnWidth+403,BarnHeight-150,-200>
    };  
    
#declare OuterBarnWalls=union{
    object{EndWall}
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
    object{OuterBarnWalls}
    object{MainDoorwayCutout}
    object{
        MainDoorwayCutout
        translate<0,0,-BarnLength>
        }
    object{OuterWindow}
    object{
        OuterWindow
        translate<1100,0,0>
        }
    };        
                                         
object{OuterBarn} 
box{
    <-HalfBarnWidth,BarnHeight+1,-HalfBarnLength>
    <HalfBarnWidth,BarnHeight+2,HalfBarnLength>
    }          

#declare InnerWallUnbarred=difference{        
    object{WoodWallLong}
    object{FrontStallWindowLong}
    };
    
#declare InnerWallBarred=union{
    object{InnerWallUnbarred}
    object{StallBars}
        };                                                                             
                    
        
difference{
    object{InnerWallBarred}
    object{StallDoorOpening}
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
        translate<300,0,0>
        }
    object{FrontStallWindowShort}
        };
        
#declare InnerWallBarredShort=union{
    object{InnerWallUnbarredShort}
    object{
        StallBars3
        translate<300,0,110>
        }                                       
    };                      
                   
difference{                   
    object{InnerWallBarredShort}
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
    object{WoodWallShort}
    object{SideStallWindow}
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
    translate<-215,0,-200>
    } 

object{
    StallBars2
    translate<-215,0,200>
    }
    
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
    
object{StallDoorRunner}
    
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
    
//door for the tack/storage room
#declare TackRoomDoorBase=box{
    <146,0,-350>
    <153,300,-225>
    texture{
        pigment{
            rgb<.95,.95,.95>
            }
        finish{    
            roughness 0.5
            specular .35
            }    
        }
    } ;
    
#declare TackRoomDoorIndent=box{
    <140,30,-340>
    <148,145,-295>
    texture{
        pigment{
            rgb<.9,.9,.9>
            }
        finish{    
            roughness 0.5
            specular .35
            }
        }
    };
    
#declare TackRoomDoor=difference{
    object{TackRoomDoorBase}
    object{TackRoomDoorIndent}
    object{
        TackRoomDoorIndent
        translate<0,0,60>
        }
    object{
        TackRoomDoorIndent
        scale<0,.85,0>
        translate<0,150,0>
        }
    object{
        TackRoomDoorIndent
        scale<0,.85,0>
        translate<0,150,60>
        }    
    };
  
difference{
    object{
        TackRoomDoorBase
        scale <.9,1.05,1.09>
        translate<15,-32,-36>                                                 
        }
    object{
        TackRoomDoorBase                                                             
        scale <1.5,.95,.93>
        translate<-75,-14,-82>
        }
    }            
    
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
    
object{
    TackRoomDoor
    scale .9
    translate<14,0,-90>
    } 

object{
    Doorknob
    scale 2.25
    rotate <0,0,90>
    translate <145,145,-385>
    }     
        
//flooring
#declare AisleFloor=box{
    <-150,-1,-HalfBarnLength>
    <150,.5,HalfBarnLength>
    };
    
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
    
object{
    AisleFloor
    texture{
        pigment{
            uv_mapping 
            image_map{
                jpeg "ConcreteTexture5.jpg"  
                }
            scale <2,.5,.5>    
            }
    normal{
        uv_mapping
        bump_map{
            jpeg "ConcreteNormal4.jpg"
            bump_size 1             
            }           
        scale 10
        }
    finish{
        specular .25
        roughness 4
            }    
        }
    }       

object{StallFloor}

object{
    StallFloor
    translate <700,0,0>
    }      

//aisle lights
#declare LightBox=box{
    <-130,BarnHeight-35,18>
    <130,BarnHeight-15,-18>
    texture{
        pigment{
            rgb<.25,.25,.25>
            }
        finish{
            specular .75
            roughness .15 
            reflection .1
            metallic
            } 
        }   
     };
#declare Light=box{
    <-125,BarnHeight-36,14>
    <125,BarnHeight-16,-14>
    texture{
        pigment{
            rgb<1,1,1>
            }
        finish{
            ambient .9
            }    
        }
    };
    
#declare LightSupport=cylinder{
    <-80,BarnHeight-25,0>
    <-80,BarnHeight,0>
    4
    texture{BlackTexture}
    };        
    
#declare OverHeadLight=union{
    object{LightBox}
    object{Light}
    object{LightSupport}                                                    
    object{
        LightSupport
        translate<160,0,0>
        }  
    };
                  
object{OverHeadLight}
object{
    OverHeadLight
    translate <0,0,400>
    }
object{
    OverHeadLight
    translate <0,0,-400>
    }  
    
#declare LightSwitchBox=box{
    <144,150,-HalfBarnLength+130>
    <146,165,-HalfBarnLength+155>
    texture{
        pigment{
            rgb<1,1,1>
            }
        }
    };
    
#declare LightSwitch=box{
    <0,0,0>
    <4,2,2>
    texture{
        pigment{
            rgb<1,1,1>                                        
            }
        }
    rotate<0,0,45>
    translate<142,154,-HalfBarnLength+135>        
    };
            
#declare LightSwitchUnion=union{                                    
    object{LightSwitchBox}
    object{LightSwitch}
    object{
        LightSwitch
        translate<0,0,7>
        }                                                        
    object{
        LightSwitch
        translate<0,0,14>
        }
    };
    
object{LightSwitchUnion}    

//tack trunk
#declare DirtyTrunkColorMap=
                    color_map{
                    [.1 color rgbt <.3,.2,.13,1>]
                    [.3 color rgbt <.3,.2,.13,1>]
                    [.45 color rgbt <.3,.2,.13,1>]
                    [.7 color rgbt <.5,.5,.5,.94>]
                    [.8 color rgbt <.6,.6,.6,.94>]
                    [.9 color rgbt <.3,.2,.13,1>]                
    }; 
    
#declare TrunkBumpsPigment1=pigment{
    bumps
    color_map {DirtyTrunkColorMap}
    turbulence 1.15
    scale <60,38,70>
    };
      
#declare WornTrunkColorMap=
                    color_map{
                    [.1 color rgbt <.3,.2,.13,1>]
                    [.3 color rgbt <.3,.2,.13,1>]
                    [.5 color rgbt <.3,.2,.13,1>]              
                    [.7 color rgbt <.2,.2,.2,.96>]
                    [.8 color rgbt <.3,.2,.13,1>]
                    [.9 color rgbt <.3,.2,.13,1>]                
    }; 
    
#declare TrunkBumpsPigment2=pigment{
    bumps
    color_map {WornTrunkColorMap}
    turbulence 1                
    scale <.5,3.5,1.75>
    };
       
#declare WornTrunkColorMap2=
                    color_map{
                    [.1 color rgbt <.3,.2,.13,1>]
                    [.3 color rgbt <.3,.2,.13,1>]
                    [.5 color rgbt <.3,.2,.13,1>]              
                    [.7 color rgbt <.1,.1,.1,.94>*.85]
                    [.8 color rgbt <.3,.2,.13,1>]
                    [.9 color rgbt <.3,.2,.13,1>]                
    }; 
    
#declare TrunkBumpsPigment3=pigment{
    bumps
    color_map {WornTrunkColorMap2}
    turbulence 2
    scale <3,10,3>
    }; 
          
#declare FadedTrunkTexture=                    
        texture{
            pigment{
                rgb <.3,.2,.15>*.4
                }
            finish{
                roughness 4
                }        
            }
        texture{
            pigment{TrunkBumpsPigment1}
            finish{
                roughness 4 
               }
            }
         texture{
            pigment{TrunkBumpsPigment2}
            finish{
                roughness 4 
                }
            }
         texture{
            pigment{TrunkBumpsPigment3}
            finish{
                roughness 4 
                }                          
            };
            
            
#declare WornTrimColorMap=color_map{
                    [.1 color rgbt <.12,.1,.1,1>]
                    [.5 color rgbt <.12,.1,.1,1>]  
                    [.7 color rgbt <.14,.14,.14,.85>] 
                    [.9 color rgbt <.12,.1,.1,1>] 
    };     
    
#declare WornTrimBumpsPigment=pigment{
    bumps
    color_map {WornTrimColorMap}
    scale <17,17,17>
    turbulence 4
    }; 
                          
#declare FadedTrimTexture=                   
        texture{
            pigment{
                rgb <.12,.1,.1>*.75
                }
            finish{ 
                specular .25
                roughness .75
                }        
            }
        texture{
            pigment{WornTrimBumpsPigment}
            finish{ 
                specular .25
                roughness .75 
                }           
            }; 
                    
#declare TrunkBase=prism{
    linear_sweep
    linear_spline
    0,80
    8
    <0,0>
    <0,45>
    <12,53>
    <24,55>
    <36,53>
    <48,45>
    <48,0>
    <0,0>
    };
    
object{
    TrunkBase
    texture{FadedTrunkTexture}    
    scale 1.35        
    rotate<-90,0,0>
    translate <80,-1,-160>        
    }    
    
#declare TackTrunkEnd=prism{
    linear_sweep
    linear_spline
    0,2
    8
    <0,0>
    <0,45>
    <12,53>
    <24,55>
    <36,53>
    <48,45>
    <48,0>
    <0,0>
    texture{FadedTrimTexture}
    }; 
      
#declare TackTrunkEndTrim=difference{
    object{TackTrunkEnd
        scale <1.35,1,1.35>
        rotate<-90,0,0>}
    object{TackTrunkEnd
        scale <1.12,3,1.13>
        rotate<-90,0,0>
        translate<6,6,2>}
    }; 
                   
#declare TackTrunkTrimBig=box{
    <79,0,-159>
    <146,6,-269>
    texture{FadedTrimTexture} 
    };   
              
#declare TackTrunkTrimLong=box{
    <78,0,-159>
    <79,5,-268>
    };    
    
object{
    TackTrunkEndTrim
    translate<80,0,-266.5>
    }
    
object{
    TackTrunkEndTrim
    translate<80,0,-159>
    } 
                   
object{TackTrunkTrimBig}

object{
    TackTrunkTrimBig
    scale .99
    translate<1,40,-2>
    } 
    
object{
    TackTrunkTrimLong
    translate <1,55,0>
    texture{FadedTrimTexture}
    }       
    
object{
    TackTrunkTrimLong
    translate <66,55,0>
    texture{
        FadedTrimTexture
        translate<0,0,40>
        }
    } 
       
object{
    TackTrunkTrimLong
    rotate <0,0,-55>
    translate <34,124,0>
    texture{FadedTrimTexture}
    } 
    
object{
    TackTrunkTrimLong
    rotate<0,0,55>
    translate<100,-5,0>
    texture{
        FadedTrimTexture
        translate<0,0,100>
        }
    } 
    
object{
    TackTrunkTrimLong
    rotate<0,0,55>
    translate<88,3,0>
    texture{
        FadedTrimTexture
        translate<15,15,15>}
    }  
    
object{
    TackTrunkTrimLong
    rotate<0,0,-55>
    translate <47,132,0>
    texture{
        FadedTrimTexture
        translate<0,0,205>
        } 
    }
     
object{
    TackTrunkTrimLong
    rotate<0,0,75>
    translate<98,-4,0> 
    texture{FadedTrimTexture}
    }    
    
object{
    TackTrunkTrimLong
    rotate<0,0,-75>
    translate<88,148,0>
    texture{FadedTrimTexture}
    }     
    
#declare TackTrunkLatch=union{
    box{
        <75,45,-185>     
        <76,50,-189>    
        }
    cylinder{
        <75,45,-187>     
        <76,45,-187>
        2
        }
    texture{
        pigment{
            rgb<.12,.1,.1>
            }
            }
        };
                    
object{
    TackTrunkLatch
    translate<4,-3,0>}
    
object{
    TackTrunkLatch
    scale <1,1.5,1.5>
    translate<4,-28,65>
    }
    
object{
    TackTrunkLatch
    translate<4,-3,-55>
    }
    
//the barn swallows' nest
#declare NestBitSq=mesh2{
    vertex_vectors{
        9
        <-1,1,-.5>
        <0,1,.5>    
        <-1,0,.25>
        <0,0,.5>
        <1,0,0>
        <1,1,-.5>
        <-1,-1,-1>
        <0,-1,-.5>
        <1,-1,-1>
        }
    face_indices{  
        8
        <0,1,2>
        <1,5,4>      
        <1,2,3>  
        <1,3,4>
        <2,6,7>
        <2,3,7>
        <3,7,4>
        <7,8,4>
        } 
    };

#declare SwallowsNest=union{
    object{NestBitSq}
    object{
        NestBitSq
        rotate<0,60,0>
        translate<1.5,0,-.8>        
            }
    object{
        NestBitSq
        rotate<0,120,0>
        translate<1.5,0,-2.5>        
            }
    object{
        NestBitSq
        rotate<0,180,0>
        translate<0,0,-3.4>        
            }
    object{
        NestBitSq
        rotate<0,240,0>
        translate<-1.5,0,-2.5>        
            }
    object{
        NestBitSq
        rotate<0,300,0>
        translate<-1.5,0,-.75>        
            }  
    };
    
object{
    SwallowsNest
    texture{
        pigment{
            image_map{
                jpeg "Thatch.jpg"
                }
            scale 15    
                }
            }
        finish{
            roughness 10
            }
     scale 6 
     translate<-95,BarnHeight-10,0>              
     }   
             
//outside scenery    
#declare OutsideBoxLong=box{
    <-HalfBarnWidth-400,860,1600>
    <-HalfBarnWidth-499,-860,-1600>
    texture{
        pigment{
            image_map{
                jpeg "1_Outside5_e.jpg"
                }
             rotate<0,90,0>   
             scale 1000                         
             translate<-600,-2430,0>             
             }
         finish{
            ambient .7
             }    
         }
     }; 

box{
    <-HalfBarnWidth-200,-300,HalfBarnLength+1600>
    <HalfBarnWidth+200,BarnHeight+300,HalfBarnLength+1599>
    texture{
        pigment{
            image_map{
                jpeg "1_Outside1.jpg"
                }
             scale 1400                          
             translate<-700,-300,0>              
             }
        finish{
            ambient .7
             }    
        }
     }
             
box{
    <-HalfBarnWidth-200,-300,HalfBarnLength-1600>
    <HalfBarnWidth+200,BarnHeight+300,HalfBarnLength-1599>
    texture{
        pigment{
            image_map{
                jpeg "1_Outside3_e2.jpg"
                }
             scale 1200                          
             translate<-640,-300,0>              
             }
        finish{
            ambient .7
             }    
             }
             }   

object{OutsideBoxLong}
 
object{
    OutsideBoxLong
    translate<HalfBarnWidth*2+800,0,0>
    }                  

                                                                   
//camera positions
#declare CentralCameraPos= <0,EyeHeight,0>;
#declare OuterCameraPos= <0,650,-2000>;
#declare BackEntry= <0,EyeHeight,HalfBarnLength>;
#declare FrontEntry= <0,EyeHeight,-HalfBarnLength>;
#declare TopCameraPos= <0,2000,0>;  
                                                    
camera{
    location FrontEntry      
    look_at CentralCameraPos              
    }    

//lighting and radiosity    
global_settings{
    radiosity {
      pretrace_start 0.08
      pretrace_end   0.04
      count 35

      nearest_count 5
      error_bound 1.8
      recursion_limit 3

      low_error_factor 0.5
      gray_threshold 0.0
      minimum_reuse 0.015
      brightness 1.75

      adc_bailout 0.01/2
    }
  }           
    
#declare SunLight=light_source{
    <-HalfBarnWidth-300,BarnHeight+125,-100>       
    rgb<.85,.8,.75> 
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

background{                                                  
    rgb <1,1,1>
      }                                                                                               