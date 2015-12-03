//doorknob code 

background {
    rgb<.85,.85,.85>
    }

#declare FrontCameraPos=<-5,5,5>;
#declare SideCameraPos=<10,0,15>;
#declare TrunkCameraPos=<100,50,-200>;   //<-80,150,-200> 
#declare TopCameraPos=<0,20,0>; 
#declare BarCameraPos=<-90,200,0>;

camera{
    location <-80,150,-200>         
    look_at <80,50,-200>                    
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
    <-80,100,-250>
    rgb <1,1,1> *3
    }
light_source{
    <120,200,-300>
    rgb <1,1,1> *5
    } 
    
light_source{
    <80,100,-400>
    rgb<1,1,1>*2
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
                
/*box{
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
        }  */
        
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
    //translate<0,5,10>
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
    turbulence 1                //1.75
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
            pigment{
            TrunkBumpsPigment1                   
            }
            finish{
                roughness 4 
               }
                }
         texture{
            pigment{ 
            TrunkBumpsPigment2                   
            }
            finish{
                roughness 4 
                }
                }
         texture{
            pigment{
            TrunkBumpsPigment3                   
            }
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
                roughness 1
                }        
            }
        texture{
            pigment{
                WornTrimBumpsPigment
               }
            finish{
                roughness 1 
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
    texture{
        FadedTrimTexture
            }
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
    texture{                            
        FadedTrimTexture
            } 
            };             
#declare TackTrunkTrimLong=box{
    <78,0,-159>
    <79,5,-268>
    /*texture{
        FadedTrimTexture
            }*/
            };
object{TackTrunkEndTrim
    translate<80,0,-266.5>
    }
object{TackTrunkEndTrim
    translate<80,0,-159>
    }                
object{TackTrunkTrimBig}
object{TackTrunkTrimBig
    scale .99
    translate<1,40,-2>
    }
object{TackTrunkTrimLong
    translate <1,55,0>
    texture{FadedTrimTexture}
    } 
object{TackTrunkTrimLong
    translate <66,55,0>
    texture{FadedTrimTexture
        translate<0,0,40>
        }
    }    
object{TackTrunkTrimLong
    rotate <0,0,-55>
    translate <34,124,0>
    texture{FadedTrimTexture}
    }
object{TackTrunkTrimLong
    rotate<0,0,55>
    translate<100,-5,0>
    texture{FadedTrimTexture
        translate<0,0,100>
        }
    }
object{TackTrunkTrimLong
    rotate<0,0,55>
    translate<88,3,0>
    texture{FadedTrimTexture
        translate<15,15,15>}
    } 
object{TackTrunkTrimLong
    rotate<0,0,-55>
    translate <47,132,0>
    texture{FadedTrimTexture
        translate<0,0,205>
        } 
    } 
object{TackTrunkTrimLong
    rotate<0,0,75>
    translate<98,-4,0> 
    texture{FadedTrimTexture}
    } 
object{TackTrunkTrimLong
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
object{TackTrunkLatch
    translate<4,-3,0>}
object{TackTrunkLatch
    scale <1,1.5,1.5>
    translate<4,-28,65>
    }
object{TackTrunkLatch
    translate<4,-3,-55>
    }
    
/*#declare RustColorMap=color_map{
                    [.1 color rgbt <.1,.1,.1,1>]
                    [.5 color rgbt <.1,.1,.1,1>]  
                    [.65 color rgbt <.1,.1,.1,1>]
                    //[.7 color rgbt <.35,.2,.05,.85>] 
                    //[.85 color rgbt <.35,.2,.05,.85>]
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
            pigment{
                RustBumpsPigment}
                scale <1,.1,1>            
            finish{
                roughness 2 
                }           
            };             
    
#declare StallBar=cylinder{
    <-149,150,0>          // -150
    <-149,300,0> 
    1.5
    texture{RustyTexture
            }
    };   
    
object{StallBar} */
      
                                  