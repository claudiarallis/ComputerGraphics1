#declare Box=box{
    <-1,-1,-1>  //important that box is centered about the origin
    <1,1,1>
    };
#declare SolidRed=texture{
    pigment{
        rgb <1,0,0>
        }
        };
#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAngleCameraPos = <0,3,-5>;

background{
    rgb<0,1,1>
    }
    
camera{
    location TopFrontAngleCameraPos
    look_at <0,0,0> 
    } 
    
light_source{
    <2,5,-3>
    rgb <1,1,1>
    }
      
object{
    Box
    scale <2,2,1>
    rotate <45,0,45>
    translate <0,0,1> //translate last
    texture{SolidRed}
}        