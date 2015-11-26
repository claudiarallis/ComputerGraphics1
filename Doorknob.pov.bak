//doorknob code 

background {
    rgb<0,1,1>
    }

#declare FrontCameraPos=<-5,5,5>;
#declare SideCameraPos=<10,0,15>;
#declare TrunkCameraPos=<100,50,-200>;
#declare TopCameraPos=<0,20,0>;

camera{
    location FrontCameraPos
    look_at <0,2,0>
    }

light_source{
    <0,15,-30>
    rgb<1,1,1>
    } 
    
light_source{
    <-15,20,-30>
    rgb <1,1,1>
    }

light_source{
    <15,20,30>
    rgb <1,1,1>
    }          

#declare Doorknob=lathe{     //lathe makes it 3D around y axis
    cubic_spline //straight lines connect the dots
    11 //how many points you have to connect
    <1,-.5>,<1,0>,<1,1.25>,<2,1.5>,<2.75,2>,<2.85,2.25>,<2.75,2.5>,<2,3>,<1,3.2>,<0,3.25>,<0,3.25>
    texture{
        pigment{
            rgb <1,1,0>}
        finish{
            ambient .2
            specular .4
        } 
        }
        }; 
               

#declare BlanketHalf=mesh2{
    vertex_vectors{
        10
        <0,4,0>//vertex 0
        <.5,4,-2.25>    //order here doesn't matter
        <.5,2,0>
        <0,2,-2>
        <0,0,0>//vertex 4
        <-.5,0,0>
        <.5,-2,0>
        <0,-2,-2>
        <0,-4,0>
        <.5,-4,-2.15>
    }
    face_indices{  //groups three vertices into a single "face" (triangle)
        9
        <0,1,3>
        <0,2,3>      //allows for less duplication, much easier manipulation
        <2,4,3>  //these numbers correspond to the above vertices
        <4,3,5>
        <4,5,7>
        <3,5,7>
        <4,6,7>
        <6,7,8>
        <8,7,9>
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
    
/*object{
    TrunkBase
    texture{
        pigment{
            rgb <.7,.5,0>
            }
            }
    rotate<-90,0,0>        
            } */ 
            
#declare TackTrunkLatch=union{
    box{
        <75,45,-200>
        <76,50,-204>
        }
    cylinder{
        <75,45,-202>
        <76,45,-202>
        2
        }
        };
        
#declare NestBit=mesh2{
    vertex_vectors{
        5
        <0,0,0>//vertex 0
        <3,2,1>    //order here doesn't matter
        <3,0,-1>
        <3,4,1>
        <6,4,-1>//vertex 4
    }
    face_indices{  //groups three vertices into a single "face" (triangle)
        4
        <0,1,2>
        <0,1,3>      //allows for less duplication, much easier manipulation
        <3,1,4>  //these numbers correspond to the above vertices
        <1,2,4>
        }
};       

/*object{
    NestBit
    texture{
        pigment{
            rgb <.5,.5,0>
            }
            }
            }                       

union{
    #declare Index=0;
    #while (Index<360)        
        object{
            NestBit
            rotate<0,Index,0>
            }
    #declare Index=Index+40;
    #end
    texture{
        pigment{
            rgb<.6,.5,.2>
            }
            } 
    } 
    
object{
    NestBit
    texture{
        pigment{
            rgb <.5,.5,0>
            }
            }
            } 
object{
    NestBit
    rotate<0,36,0>
    translate<4,0,1.5> 
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            }  
object{
    NestBit
    rotate<0,72,0>
    translate<8,0,.9>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            } 
object{
    NestBit
    rotate<0,108,0>
    translate<8,0,-3>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            } 
object{
    NestBit
    rotate<0,144,0>
    translate<7,0,-6.5>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            }                         
object{
    NestBit
    rotate<0,180,0>
    translate<4,0,-9.5>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            } 
object{
    NestBit
    rotate<0,216,0>
    translate<0,0,-10>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            } 
object{
    NestBit
    rotate<0,252,0>
    translate<-3,0,-8>
    texture{
    pigment{
            rgb <.5,.5,0>
            }
            }
            }    
object{
    NestBit
    rotate<0,288,0>
    translate<-4,0,-5>
    texture{ 
    pigment{
            rgb <.5,.5,0>
            }
            }
            }                                          
object{
    NestBit
    rotate<0,324,0>
    translate<-3,0,-2>
    texture{ 
    pigment{
            rgb <.5,.5,0>
            }
            }
            }  */

#declare NestBit2=mesh2{
    vertex_vectors{
        9
        <0,0,0>//vertex 0
        <3,2,1>    //order here doesn't matter
        <3,0,-1>
        <3,4,1>
        <6,4,-1>//vertex 4 
        <2.45,2,-2.46>
        <2.45,0,-4.46>
        <2.45,4,-3.36>
        <-4.9,4,-4.46>
    }
    face_indices{  //groups three vertices into a single "face" (triangle)
        8
        <0,1,2>
        <0,1,3>      //allows for less duplication, much easier manipulation
        <3,1,4>  //these numbers correspond to the above vertices
        <1,2,4>
        <0,5,6>
        <0,5,7>
        <8,7,5>
        <8,6,5>
        }
};   

#declare NestBitSq=mesh2{
    vertex_vectors{
        9
        <-1,1,-.5>//vertex 0
        <0,1,.5>    //order here doesn't matter
        <-1,0,.25>
        <0,0,.5>
        <1,0,0>//vertex 4 
        <1,1,-.5>
        <-1,-1,-1>
        <0,-1,-.5>
        <1,-1,-1>
    }
    face_indices{  //groups three vertices into a single "face" (triangle)
        8
        <0,1,2>
        <1,5,4>      //allows for less duplication, much easier manipulation
        <1,2,3>  //these numbers correspond to the above vertices
        <1,3,4>
        <2,6,7>
        <2,3,7>
        <3,7,4>
        <7,8,4>
        } 
};

#declare SwallowsNest=union{
object{NestBitSq       
            }
object{NestBitSq
    rotate<0,60,0>
    translate<1.5,0,-.8>        
            }
object{NestBitSq
    rotate<0,120,0>
    translate<1.5,0,-2.5>        
            }
object{NestBitSq
    rotate<0,180,0>
    translate<0,0,-3.4>        
            }
object{NestBitSq
    rotate<0,240,0>
    translate<-1.5,0,-2.5>        
            }
object{NestBitSq
    rotate<0,300,0>
    translate<-1.5,0,-.75>        
            }  
            };
            
/*object{
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
                } */ 
                
box{
    <0,0,0>
    <5,5,-5>
    texture{
    pigment{
        image_map{
                jpeg "ConcreteTexture.jpg"
                }
            scale 1 //.001   
                }
    normal{
        uv_mapping
        bump_map{
            jpeg "ConcreteNormal4.jpg"
            bump_size 1               
        }
        scale 1 //.001  //when using uv mapping, scale should generally be small
        }
        }
        }                         
            
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
#declare AisleFloor=box{
    <-150,-1,-HalfBarnLength>
    <150,.5,HalfBarnLength>
};

object{
    AisleFloor
    texture{
    pigment{
        uv_mapping 
        image_map{
                jpeg "ConcreteTexture.jpg" 
                }
            scale <.02,.005,.005>    
                }
    normal{
        uv_mapping
        bump_map{
            jpeg "ConcreteNormal4.jpg"
            bump_size 1             
        }           
        scale 1 
        }
        }
        }                         
           
            
                                                                                                              