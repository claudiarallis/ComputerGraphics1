background{
    rgb<1,1,1>
    } 
    
camera{
    location<10,0,-10>
    look_at<0,0,0>
    } 
    
light_source{
    <0,0,-5>
    rgb<1,1,1>
    }       
    
#declare leaf=mesh{    //written like this, meshes are easy to visualize, but a pain to edit
    triangle{
        <0,0,0>
        <2,4,0>
        <2,3,-1>
        }
     triangle{
        <0,0,0>
        <2,4,0>
        <2,3,1>
        }
     triangle{
        <6,3,0>
        <2,4,0>
        <2,3,1>
        }
     triangle{
        <6,3,0>
        <2,4,0>
        <2,3,-1>
        }         
     texture{
        pigment{
            rgb<.3,.6,.35>
            }
            }   
        };
           
#declare Leaf2=mesh2{
    vertex_vectors{
        5
        <0,0,0>//vertex 0
        <2,4,0>    //order here doesn't matter
        <2,3,-1>
        <2,3,1>
        <6,3,0>//vertex 4
    }
    face_indices{  //groups three vertices into a single "face" (triangle)
        4
        <0,1,2>
        <0,1,3>      //allows for less duplication, much easier manipulation
        <4,1,2>  //these numbers correspond to the above vertices
        <4,1,3>
        }
};           
           
union{
    #declare Index=0;
    #while (Index<360)        
        object{
            Leaf2
            rotate<0,Index,0>
            }
    #declare Index=Index+30;
    #end
    texture{
        pigment{
            rgb<.3,.6,.35>
            }
            }
    }        
    
            