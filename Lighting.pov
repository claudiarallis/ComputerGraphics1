#declare Box=box{
    <-1,-1,-1>  //important that box is centered about the origin
    <1,1,1>
    };
    
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
    }*/

    
plane{     //ocean
    <0,1,0>
    0
    texture{
    pigment{
        rgb<0,.1,.5>
        }
        }
    }
    
object{
    Box
    texture{
        pigment{
            rgb<1,0,0>
            }
            }
    }
    
//the default lighting is a "point light", where the light comes from a single point and goes in all directions
//a spotlight (below) is exactly what it sounds like. Gives more control than a point light 

#declare Spotlight=light_source{
    <10,10,-20>
    rgb<1,1,1> //multiplying this by 2 will change intensity
    spotlight
    radius 10 //this is an angle, not a distance.
    falloff 0 //distance from center of light to edge of light (higher falloff in relation to radius -> fuzzy edges)
    tightness 10 //higher values will dim the light as it approaches the falloff edge
    point_at<-2,0,0>
    };

//directional light = many sources in one general direction. Sunlighty; makes shadows parallel; put it FAR AWAY
  
#declare DirectionaLight=light_source{
    <100,100,-100>
    rgb<1,1,0.8>
    parallel
    point_at<0,0,0>
    };
     
//area lights will make softer shadows; can be very computationally expensive

#declare AreaLight=light_source{
    <20,20,-20>
    rgb<1,1,1>
    area_light
    <1,0,1>,<0,1,1>,4,4  //two vectors to define the plane light is coming from, then srt of # of light sources
    };
    
#declare ShadowlessLight=light_source{
    <-3,3,-8>
    rgb<1,1,1>
    shadowless
    };
 
light_source{ShadowlessLight}  

//using "looks_like{object{THING}}" w/ a pound-declared shape will make the light source take on that form
              
              
//FRUIT BOWL DEMO
//3-point lighting uses a keylight, filllight, rimlight
        
#declare KeyLightIntensity=.8;       //KeyLights are the main lights in the scene
#declare KeyLight=light_source{     //should be left/right/up/down 15-45 deg of main camera
    CameraPos                       
    rgb<1,1,1>*KeyLightIntensity
    rotate<0,15,0>
    rotate<15,0,0>
    };

#declare FillLight=light_source{        //This will help soften the KeyLight - ambient light
    CameraPos                             
    rgb<.7,1,1>*KeyLightIntensity*.5     //tint it the color that you want your scene
    spotlight
    radius 10
    falloff 20
    tightness 0
    rotate<0,-25,0> 
    shadowless                             //should always bee shadowless
    };       
    
#declare RimLight=light_source{       //comes from behind the object, highlights edges, gives them more shape
    CameraPos
    rgb<1,1,1>*.5
    spotlight
    radius 10
    falloff 30
    point_at <0,0,0>
    rotate <0,200,0>
    rotate <-20,0,0> 
    };
    
    

//unrelated note, you can space things out around a circle by translating first, then rotating