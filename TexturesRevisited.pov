//uv map is 2D representation of 3D object's surface
//the u and the v are coordinates on the image/2D representation...generally go from (0,0 to (1,1)
texture{
normal{
    bump_map{
        uv_mapping
        jpeg "FabricNormal.jpg"
        bump_size 1               
        }
        scale 2  //when using uv mapping, scale should generally be small
        }
        }
        }
        
box{
    <-2,0,0>
    <2,1,2>
    texture{
        uv_mapping         //putting uv_mapping up here will apply it to pigments and normals
        pigment{             //many basic shapes will automatically uv map
            tiling 6
            color_map{
                [0.0 color rgb<1,1,1>]
                [1.0 color rgb<0,0,0>]
                }
            scale 0.25
            rotate <-90,0,0>
            scale <1/1.6, 1/.05,1>
            }
            }
            }
            
//in addition to pigment maps, you can also use layer textures - good for dings, stains, and dirt
#declare FADED_TEXTURE                    //include one of these and/or pigment map in final project
    texture{
        pigment{
            checker                       //base texture
            color Red
            color White
            scale <0.25,0.25,0.25>
            }
        finish{
            specular .6
            roughness .01
            }    
            }
     texture{
        pigment{       //adds grey to fade the red/white
            checker
            color rgbf<.6,.6,.6,.85>
            color rgbf<.5,.5,.5,.95>
            turbulence 0.01
            scale <.25,.25,.25>   //note: not having finishes here can mess with other textures' finish
            }
            }
            
//and this is all in the POV-ray documentation                   
box{
    <-1,-1,-1>,<1,1,1>
    texture{
        FADED_TEXTURE
        }
    translate<-1.5,1.2,0>
    }                            
