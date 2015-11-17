background {rgb<1,1,1>}

camera{
    location<30,35,-35>
    look_at <0,0,0>
    } 
    
media{                                //makes fog and dust and such
    scattering {2, rgb 0.01}
    intervals 2
    samples 50 //higher makes it take longer, but will give fewer artefacts
    method 3 
    }    
    
light_source{
    <0,15,0>
    color rgb .7
    media_interaction off
    } 
    
light_source{
    <1,115,90>
    color rgb <1,1,.25> *10
    spotlight
    point_at <0,0,-5>
    radius 10
    falloff 5
    media_attenuation on
    }    
    
#declare Window=prism{
    linear_sweep
    linear_spline
    -20,20
    6
    <0,15>
    <2.5,10>
    <2.5,0>
    <-2.5,0>
    <-2.5,10>
    <0,15>
    };
              
    
#declare Step=prism{
    linear_sweep //how the top and bottom are connected
    linear_spline //how it moves horizontally around the shape 
    0,1 //how thick you want it to be (goes to y=1)
    7 //how many points there will be - note that you need to start and end at the same spot
    #declare Index =0;
    #while (Index <=360)
        <cos(radians(Index)),
        sin(radians(Index))>
        #declare Index=Index+360/6;
        #end
    rotate y*360/12 //rotates just in y    
    }; 
    
#declare Room=prism{
    linear_sweep //how the top and bottom are connected
    linear_spline //how it moves horizontally around the shape 
    0,1 //how thick you want it to be (goes to y=1)
    9 //how many points there will be - note that you need to start and end at the same spot
    #declare Index =0;
    #while (Index <=360)
        <cos(radians(Index)),
        sin(radians(Index))>
        #declare Index=Index+360/8;
        #end
    rotate y*360/16    
    }       
    
object{
    Step
    scale<20,1,20>
    pigment {rgb .42}
    } 
    
object{
    Step
    scale<16,1,16>
    pigment {rgb .42}
    translate <0,1,0>
    } 
    
object{
    Step
    scale<7,1,7>
    pigment {rgb .7}
    translate <0,2,0>
    } 

difference{    
    object{
        Room
        scale<62,122,62>
        translate <0,-1,0>
        pigment{rgb .42}
        } 
    object{
        Room
        scale<60,120,60>
        pigment {rgb .42}
        }
    object{
        Window
        rotate x*-90
        translate <0,70,60>
        }
    hollow //this tells POV-ray that you're gonna be inside the object, and makes media work better    
        }                           