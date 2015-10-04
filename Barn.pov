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
    
#declare Aisle=box{
    <-150,0,-HalfBarnLength>
    <150,BarnHeight,HalfBarnLength>
    };
    
#declare StallWidth=-HalfBarnWidth+399;
#declare StallLength=399-HalfBarnLength;

#declare Stall=box{
    <-HalfBarnWidth+1,0,-HalfBarnLength+1>
    <StallWidth,BarnHeight,StallLength>
    };
    
#declare FrontStallWindowLong=box{
    <-HalfBarnWidth+395,BarnHeight-300,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    };
    
#declare FrontStallWindowShort=box{
    <148,BarnHeight-300,-200>
    <153,BarnHeight-150,HalfBarnLength-10>
    }; 

#declare SideStallWindow=box{
    <-HalfBarnWidth+10,BarnHeight-300,-StallLength-5>     
    <-HalfBarnWidth+390,BarnHeight-150,-StallLength+5>
    };
    
#declare OuterWindow=box{
    <-HalfBarnWidth+395,BarnHeight-250,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    translate<-400,0,0>
    };
    
#declare StallDoorOpening=box{
    <-HalfBarnWidth+395,3,-400>
    <-HalfBarnWidth+401,BarnHeight-150,-200>
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
    look_at  CentralCameraPos
    }   
    
light_source{
    <0,BarnHeight-10,0>
    rgb<1,1,1> *.5
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
    <-BarnWidth/3,BarnHeight*1.25,-HalfBarnLength-50>
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

difference{
    object{
        Barn             //outer wall
        scale 1.001}
    /*object{Barn
        translate<0,BarnHeight-5,0>}*/             //inner wall
    object{
        Aisle}
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
    /*object{
        Stall
        translate<700,0,0>
        }*/
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
            }
            
            
    