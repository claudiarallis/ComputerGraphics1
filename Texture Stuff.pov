//Textures 

#include "colors.inc"

camera{
    location <0,0,-5>
    look_at <0,0,0> }
    
    light_source{
        <2,2,-4> 
        rgb<1,1,1>
        }
        
#declare Box=box{
    <-1,-1,-2>
    <1,1,4>
    };
    
    
//ColorListPigments    
#declare BrickPigment=pigment{
    brick 
    color Red      //mortar
    color Blue     //brick
    scale .01   //this is the equivalent of <.1,.1,.1>
    warp{
        spherical
        orientation <1,0,0>
        }
        };

#declare CheckerPigment=pigment{
    checker
    color Red
    color Blue
    scale .05
    warp{
        spherical
        orientation <1,0,0>
        }
        };
        
#declare HexagonPigment=pigment{
    hexagon
    color Red
    color Blue
    color White
    scale .01
    warp{
        spherical
        orientation <0,1,0>
        }
        }; 
        
//object {Box}
        
#declare ObjectPigment = pigment{   //to map shapes onto other shapes
    object{
        Box
        color Red  //outside
        color Blue //inside
        }
        turbulence .1 //messes with the edges
        };


//ColorMapPigments
#declare ColorMap=color_map{          //you can also do pigment maps, including stuff like brick and checkers
    [0.1 color Red]
    [0.3 color Yellow]                //to create a sharp transition, assign two colors the same value
    [0.6 color Green]
    [0.9 color Blue]
    };
    
#declare GradientPigment=pigment{
    gradient <0,1,0> //chooses which direction the gradient goes
    color_map {ColorMap}
    scale 4
    translate <0,-2,0>
    //turbulence .5
    }; 
      
#declare AgatePigment=pigment{
    agate //banded pattern
    agate_turb 1
    color_map {ColorMap}
    };
    
#declare BumpsPigment=pigment{
    bumps
    color_map {ColorMap}
    scale .2
    };
    
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
    scale <1,6,1>
   /* scale .1
    warp{
        spherical
        orientation <0,0,1>   //this edited out bit makes a swirly thing wrap around the sphere
        }*/
    };    
    
#declare Function=function(x,y,z,hi){x*x + y+hi}  //you can put any function in terms of x, y, and z in here
#declare FunctionPigment=pigment{
    function{Function(x,y,z,3)}
    color_map{ColorMap}
    //scale.2
    };   
    
sphere{
    <0,0,0>
    2
    texture{
        WoodPigment
        }
    /*finish{
        ambient .02     //good for making things look like they glow
        specular.3       //changes highlight intensity
        roughness.04}*/    //changes the size of the specular highlight
        normal{       
            //bumps  //just what it sounds like
            facets    //makes it look like a cut gem (though only in texture, not in shape)
                coords 1.0
                size .1
            //bump_map{jpeg "filename.jpg"}     //will give it a texture based on some file from the internet
                //bump_size 2.0      //search for seamless normal maps. yes, they're supposed to look like 3-d images
                //scale 10 
            }
        } 
        
     /*texture{          //to map an image onto an object, do this for texture...
        pigment{           //may need to be fiddled with in terms of scaling and such
            image_map{jpeg"nameoffile.jpg" //the file MUST be in the same folder as the script 
            */     
            
     //search uv mapping checker to get a pattern to map onto things to help determine proper scales/transforms of a wrapped image       
     //when searching for textures on Google Images, include the word seamless
     //this mapping stuff could be good for doing windows...
     //look for mathced pairs of texture and normal maps (in online libraries and such)
                   
                   
//__________cameras____________

/*camera{
    perspective  //all rays in the scene start from the camera and are angled; this is the default setting
    location <0,1,-1>    //can also be orthographic, w/ rays coming into the scene parallel; no perspective/depth
    look_at<0,1,0>       //also fisheye, which is what it sounds like
    angle //things appear closer/farther; alters angle of rays to plane that determines pixelly things; default=67.38
    focal_point BoxPos //default=origin; this is the point that is in focus
    aperture .1 //makes things not in focus blurry; default=0 (no blur); larger values = more blurry
    blur_samples 20  //higher values = less grainy blur
    normal{         //warps the picture
        bumps 0.2   //increasing this value warps it more
        }           //the focal point should be about a third of the way into a scene
    } */                   