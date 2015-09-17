#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAngleCameraPos = <1,3,-7>;

background{
    rgb<0,.5,1>
    }
    
camera{
    location TopFrontAngleCameraPos
    look_at <0,1,0> 
    } 
    
light_source{
    <2,7,-3>
    rgb <1,1,1>
    }

light_source{
    <3,5,-4>
    rgb <.5,.5,.6>
    }

#declare Box=box{
    <-1,-1,-1>  //important that box is centered about the origin
    <1,1,1>
    };

#declare FreeTransform = transform{
    matrix<2,0,0,  //a11 a12 a13
           2,2,0   //a21 a22 a23
           0,0,2,  //a31 a32 a33
           0,0,0>  //a14 a24 a34
           };
           
object{
      Box
      transform{FreeTransform}
      /*transform{FreeTransform inverse}*/ //this will undo the transform above
      texture{
        pigment{
            rgb<1,0,0>
            }
            }
            }