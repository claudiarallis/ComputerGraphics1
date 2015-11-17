//doorknob code

background {
    rgb<0,1,1>
    }

#declare FrontCameraPos=<-150,0,0>;
#declare SideCameraPos=<0,0,-200>;

camera{
    location SideCameraPos
    look_at<0,0,0>
    }

light_source{
    <0,15,-30>
    rgb<1,1,1>
    } 
    
light_source{
    <-15,20,-30>
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
    
object{
    TrunkBase
    texture{
        pigment{
            rgb <.7,.5,0>
            }
            }
    rotate<-90,0,0>        
            }    

                            