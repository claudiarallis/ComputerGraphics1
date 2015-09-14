background {
    rgb<0,1,1>
    }

#declare FrontCameraPos=<0,0,-15>;
#declare SideCameraPos =<5,0,0>;
#declare FrontSideCameraPos=<10,0,-35>;

camera{
    location FrontSideCameraPos
    look_at<0,0,0>
    }

light_source{
    <2,5,-2>
    rgb<1,1,1>
    }

#declare LinkRadius=.3;
#declare HalfTorus=difference{
    torus{
        1
        .3 
        rotate<90,0,0>
        }
    box{
        <-1-LinkRadius,-1-LinkRadius,-LinkRadius>
        <1+LinkRadius,0,LinkRadius>
        }
    };

#declare LinkLength=4; //value must be greater than 2*HalfLinkWidth
#declare HalfLinkWidth=1;
#declare SideLength=LinkLength-2*HalfLinkWidth; 
#declare HalfSideLength=SideLength/2;

#declare LinkSides=cylinder{
    <0,HalfSideLength,0>
    <0,-HalfSideLength,0>
    LinkRadius
    };
    
#declare ChainLink=union{
    object{
        HalfTorus
        translate<0,HalfSideLength,0>
        }
    object{
        HalfTorus
        rotate<180,0,0>
        translate<0,-HalfSideLength,0>
        }
    object{
        LinkSides
        translate<HalfLinkWidth,0,0>
        }
    object{
        LinkSides
        translate<-HalfLinkWidth,0,0>
        }
        };
        
#declare TwoLinks=union{
    object{
        ChainLink
        }
    object{
        ChainLink
        rotate<0,90,0>
        translate<0,LinkLength-2*(LinkRadius),0>
        }
        };
           
#declare NumLinks=30;
#declare FullChain=union{
    #declare Index=-NumLinks/2;
    #while (Index<=NumLinks)
    object{
        TwoLinks
        translate<0,Index*(2*LinkLength - 4*LinkRadius),0>
    }
    #declare Index=Index+1;
    #end
    };
        
object{
    FullChain
    texture{
        pigment{
            rgb<1,0,0>
            }
            }
    }
    
