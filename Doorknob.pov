//doorknob code

background {
    rgb<0,1,1>
    }

#declare FrontCameraPos=<0,5,-15>;

camera{
    location FrontCameraPos
    look_at<0,0,0>
    }

light_source{
    <0,15,-30>
    rgb<1,1,1>
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
               
object{Doorknob}   