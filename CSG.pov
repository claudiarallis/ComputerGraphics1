background {
    rgb<0,1,1>
    }

#declare FrontCameraPos=<0,0,-10>;
#declare SideCameraPos =<5,0,0>;

camera{
    location FrontCameraPos
    look_at<0,0,0>
    }

light_source{
    <2,5,-2>
    rgb<1,1,1>
    }
    
#declare Ball =sphere{
    <0,0,0>//when declaring objects, center them at the origin and move them later
    2
    };

#declare SolidBlue=texture{
    pigment{
        rgbf<0,0,1,.5>
        }
        };    
        
#declare SolidRed=texture{
    pigment{
        rgbf<1,0,0,.5>  //f = filter, making them translucent
        }
        };

/*union{  //doesn't do much on its own     
    object{
    Ball
    texture{SolidBlue}
    }

    object{
    Ball  
    translate<1,0,0>
    texture{SolidRed}
    }
    }*/

/*merge{ //like union, but you won't see the stuff inside when turned transparent   
    object{
    Ball
    texture{SolidBlue}
    }

    object{
    Ball  
    translate<1,0,0>
    texture{SolidRed}
    }
    }*/
    
/*intersection{  //opposite of merge     
    object{
    Ball
    texture{SolidBlue}
    }

    object{
    Ball  
    translate<1,0,0>
    texture{SolidRed}
    }
    }*/
    
difference{  //cuts the second object out of the first object     
    object{
    Ball
    texture{SolidBlue}
    }

    object{
    Ball  
    translate<1,0,0>
    texture{SolidRed}
    }
    } 


