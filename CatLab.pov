#declare RoomWidth=632;
#declare RoomLength=1016;
#declare RoomHeight=335;

#declare HalfRoomWidth=RoomWidth/2;
#declare HalfRoomLength=RoomLength/2;
#declare SeatedEyeHeight=112;

#declare CatLab=box{
    <0,0,0>
    <RoomWidth, RoomHeight, RoomLength>
    };
    
/*#declare Windows=box{
    <,,>
    <,,>
    };*/
    
#declare DoorWidth=91;
#declare DoorHeight=236;
#declare DoorDepth=16; 
#declare DoorDistanceFromRightWall=188;
#declare DoorwayCutout=box{
    <0,0,-DoorDepth/2>
    <DoorWidth,DoorHeight,DoorDepth/2>
    translate<RoomWidth-DoorDistanceFromRightWall,0,RoomLength>
    };        
    
#declare WindowHeight=150.5;
#declare WindowDistanceFromGround=89;
#declare WindowCutout=box{
    <0,0,-DoorDepth>
    <RoomWidth,WindowHeight,DoorDepth>
    translate<0,WindowDistanceFromGround,0>
    };    
    
#declare Margaret=<HalfRoomWidth,SeatedEyeHeight,40>;
#declare Justin=<HalfRoomWidth,SeatedEyeHeight,RoomLength-40>;

camera{
    location Justin 
    look_at Margaret
    }   
    
light_source{
    <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
    rgb<1,1,1>
    }

background{rgb<0,.25,.5>}    

difference{
    object{
        CatLab             //outer wall
        scale 1.001}
    object{
        CatLab}              //inner wall
    object{
        DoorwayCutout}
    object{
        WindowCutout}
    texture{
        pigment{
            rgb<1,1,1>
            }
            }
            }


            
/*camera{
    location <75,20,-75>
    look_at <0,0,0>}*/
             
             
#declare ComputerWidth=54.5;
#declare ComputerHeight=40.1;
#declare ComputerDepth=4.5; 
#declare DistanceBetweenComputers=39;
//number of computers per row = 5
#declare Computer=box{
    <0,0,0> 
    <ComputerWidth,ComputerHeight,ComputerDepth>
    texture{
        pigment{
            rgb<0,0,0>
            }
            }
            };
     
object{
    Computer
    rotate<15,0,0>
    }
    
