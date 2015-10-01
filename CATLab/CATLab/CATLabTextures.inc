//CATLab Textures
#declare WallTexture = texture {
	pigment {
		rgb <1,1,1>
	}
};
   
#declare FloorTexture=texture{
    pigment{
    rgb<.2,.2,.2>
    }
    };   

//Window Frame
#declare Black = texture{pigment{rgb <0,0,0>}};
#declare White = texture{pigment{rgb<1,1,1>}};
#declare Brown = texture{pigment{rgb<.3,.1,0>}};

//Couch
#declare CouchTexture = texture{
        pigment{ 
            rgb <1,1,1>
        }
    };
#declare PipingTexture = texture{
        pigment{ 
            rgb <1,0,0>
        }
    };
    
//Computer
#declare ComputerTexture = texture {
	pigment { 
            rgb <0,0,0>
      }
      finish{
        ambient .05    //specifies what color the darkest shadows on your object will be
        diffuse .6       //the amount of light bouncing from the light source 
        specular 1     //controls the intensity of highlights
        roughness .01  //controls the size of the highlights
        reflection .5 //goes from 0 to 1 and determines how mirror-like it is   there's a metallic subsection of this too
        }
};

//Table
#declare TableTopTexture = texture {
	pigment {
		rgb <0.3, 0.7,0.5>
	}
};

#declare TableLegTexture = texture {
	pigment {
		rgb <0,0,0>
	}
};
//Chair
#declare ChairTexture =  texture {
            pigment { rgb <.5,.5,.5> } 
        }
