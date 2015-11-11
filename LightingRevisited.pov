//indirect lighting/global illumination
#include "rad_def.inc"

global_settings{
    radiosity{
        (Radiosity_Default, off, off)//type of radiosity, whether to ignore normals and stuff like mist
        }
        } 
//gives you not only ambient light, but colors things based on adjacent brightly colored objects  
//beneath the "New" thing, there's the option to turn on AntiAliasing. Turn it on when you're in the
//  very, very final stages and want to show off. It'll make jagged edges less jagged, but takes a while
//Radiosity_Final is REALLY nice, but will take a while to render
//put everything in your scene before attempting to use Radiosity, even if they're just rough stand-ins
//will interact with high ambients (in finishes)
//do not use bounce or fill lights with this, though continue to have sun and sky lights 
radiosity{
    pretrace_start 0.08  //prepping thing ("coarse grit sandpaper")
    pretrace_end 0.01   //finishing touches
    count 500 //should be inversely proportional to error bound, can be as high as 1600
    nearest_count 20
    error_bound .35  //as count increases, this decreases, and vice versa...both these -> long renders 
    //recursion_limit //how much the light bounces around
    

//reflections
object{
    shape4
    texture{
        pigment{
            color rgbt<1,1,1,1> //the t is "transmit", and controls transparency
            }
        finish{
            ambient 0
            specular 0.6
            roughness 0.005
            reflection {
                0.1, 1.0     //1=perfectly reflective; numbers are min and max amount of reflectivity
                fresnel on} //the two numbers + the fresnel will change where/how it is reflective 
            metallic //will make it more like metal...obviously    
            conserve_energy //put this in if you're making something transparent and reflective
        }
        } 
      interior{   //tells POVray what to do with the inside of the objects - good for transparents
        ior 1.5 //index of refraction of glass ...water is 1.33, 2.4 is diamond
        fade_color <0,1,0> //using this interior stuff on an opaque object will make it GLOSSY
        }      //fresnel will NOT WORK without an interior specified
      }            