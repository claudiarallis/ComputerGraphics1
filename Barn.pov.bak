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
    
#declare StallWindow=box{
    <-HalfBarnWidth+395,BarnHeight-300,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    };
    
#declare OuterWindow=box{
    <-HalfBarnWidth+395,BarnHeight-250,10-HalfBarnLength>
    <-HalfBarnWidth+405,BarnHeight-150,HalfBarnLength-10>
    translate<-400,0,0>
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
#declare BackEntryway= <0,EyeHeight,HalfBarnLength>;
#declare FrontEntryway= <0,EyeHeight,-HalfBarnLength>;
#declare TopCameraPos= <0,2000,0>;

camera{
    location TopCameraPos
    look_at  CentralCameraPos
    }   
    
/*light_source{
    <0,BarnHeight-10,0>
    rgb<1,1,1> 
    } */
    
#declare SunLight=light_source{
    <BarnWidth*2,BarnHeight*2,-BarnLength/2>
    rgb<.8,.8,.75> 
    parallel
    point_at<HalfBarnWidth,EyeHeight,HalfBarnLength>
    };
    
light_source{SunLight}   

#declare NumSkyLights=5;
#declare SkyLightPos=array[NumSkyLights] {<-HalfBarnWidth,0,BarnLength>
                                          <-HalfBarnWidth,EyeHeight,-HalfBarnLength>
                                          <-HalfBarnWidth,BarnHeight*2,HalfBarnLength>
                                          <-HalfBarnWidth,0,HalfBarnLength>
                                          <-HalfBarnWidth,EyeHeight,0>}
#declare SkyLights=union{
     #declare Index=0;
     #while (Index <NumSkyLights)
    light_source{
    <-HalfBarnWidth,BarnHeight*2,0>
    rgb<.75,.75,.85>*.2
    parallel
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    };
    
#declare SkyLightPos2=array[NumSkyLights] {<HalfBarnWidth,EyeHeight,-BarnLength>
                                          <HalfBarnWidth,0,BarnLength>
                                          <HalfBarnWidth,BarnHeight*2,HalfBarnLength>
                                          <HalfBarnWidth,EyeHeight,BarnLength>
                                          <HalfBarnWidth,0,0>}
#declare SkyLights2=union{
     #declare Index=0;
     #while (Index <NumSkyLights)
    light_source{
    <HalfBarnWidth,BarnHeight*2,0>
    rgb<.75,.75,.85>*.2
    parallel
    point_at <0,0,0> 
    }   
    #declare Index=Index+1;
    #end   
    };
    
//light_source{SkyLights}
light_source{SkyLights2}

background{rgb<0,.25,.5>}    

difference{
    object{
        Barn             //outer wall
        scale 1.001}
    object{Barn
        translate<0,BarnHeight-5,0>}              //inner wall
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
        StallWindow} 
    object{
        StallWindow
        translate<300,0,0>}
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
    //object{WindowCutout}
    texture{
        pigment{
            rgb<1,1,1>
            }
            }
            }