camera{
    location <2,2,-6>
    look_at <0,0,0> }
    
light_source{
        <2,2,-4> 
        rgb<1,1,1>*2
        }
        
#declare Box=box{
    <-1,-1,-2>
    <1,1,4>
    texture{
        pigment{
            rgb<0,0,1>
            }   
            }
    };   
    
#declare Box2=box{
  <3,3,9>
  <1,2,3>
  texture{
  pigment{rgb<0.5,0.5,0>}
  }
  
};
    
object{Box}
object{Box2}

    