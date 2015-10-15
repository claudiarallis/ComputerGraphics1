//==================================================
//Material definitions
#declare Cherries1_MappedPigment = pigment { color rgb <.9,0,.05>*1.15 };
      
#declare Cherry1ColorMap=color_map{          
    [0.1 color rgb <.9,0,.05>*1.15]                //to create a sharp transition, assign two colors the same value
    [0.95 color rgb <.9,0,.05>*1.15]
    [0.95 color rgb <0.9,0.8,0.5>]
    };
#declare Cherry1Pigment=pigment{
    color_map {Cherry1ColorMap}
    scale .01
    };          
      
#declare Cherries1_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Cherries1_Material_ = material {
	texture {
		pigment { uv_mapping Cherries1_MappedPigment }  //Cherries1_MappedPigment
		finish { Cherries1_Finish }
	}
}
//==================================================
#declare Cherries2_MappedPigment = pigment { color rgb <.9,0,0>*1.15 };

#declare Cherries2_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Cherries2_Material_ = material {
	texture {
		pigment { uv_mapping Cherries2_MappedPigment }
		finish { Cherries2_Finish }
	}
}
//==================================================
#declare Plate_MappedPigment = pigment { color rgb <0.01,0.30,0.06> }

#declare Plate_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Plate_Material_ = material {
	texture {
		pigment { uv_mapping Plate_MappedPigment }
		finish { Plate_Finish }
	}
}
//==================================================
#declare GrapeStem_MappedPigment = pigment { color rgb <0.72,0.46,0.07> }

#declare GrapeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare GrapeStem_Material_ = material {
	texture {
		pigment { uv_mapping GrapeStem_MappedPigment }
		finish { GrapeStem_Finish }
	}
}
//==================================================
#declare Sheet_MappedPigment = pigment { color rgb <0.53,0.57,0.65> }

#declare Sheet_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.15 //surface roughness: 0.0005 -> 1             
};

#declare Sheet_Material_ = material {
	texture {
		pigment { uv_mapping Sheet_MappedPigment }
		finish { Sheet_Finish }
	}
}

//==================================================
#declare Plum1_MappedPigment = pigment { color rgb <0.42,0.00,0.19> }

#declare Plum1_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum1_Material_ = material {
	texture {
		pigment { uv_mapping Plum1_MappedPigment }
		finish { Plum1_Finish }
	}
}
//==================================================
#declare Plum2_MappedPigment = pigment { color rgb <0.42,0.07,0.12> }

#declare Plum2_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum2_Material_ = material {
	texture {
		pigment { uv_mapping Plum2_MappedPigment }
		finish { Plum2_Finish }
	}
}
//==================================================
#declare Plum3_MappedPigment = pigment { color rgb <0.44,0.06,0.16> }

#declare Plum3_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum3_Material_ = material {
	texture {
		pigment { uv_mapping Plum3_MappedPigment }
		finish { Plum3_Finish }
	}
}
//==================================================
#declare Plum4_MappedPigment = pigment { color rgb <0.40,0.04,0.14> }

#declare Plum4_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum4_Material_ = material {
	texture {
		pigment { uv_mapping Plum4_MappedPigment }
		finish { Plum4_Finish }
	}
}
//==================================================
#declare Plum5_MappedPigment = pigment { color rgb <0.46,0.08,0.17> }

#declare Plum5_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum5_Material_ = material {
	texture {
		pigment { uv_mapping Plum5_MappedPigment }
		finish { Plum5_Finish }
	}
}
//==================================================
#declare Plum6_MappedPigment = pigment { color rgb <0.44,0.10,0.13> }

#declare Plum6_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum6_Material_ = material {
	texture {
		pigment { uv_mapping Plum6_MappedPigment }
		finish { Plum6_Finish }
	}
}
//==================================================
#declare Orange_MappedPigment = pigment { color rgb <0.94,0.42,0.02>*1.25 }

#declare Orange_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Orange_Material_ = material {
	texture {
		pigment { uv_mapping Orange_MappedPigment }
		finish { Orange_Finish }
	}
}
//==================================================
#declare OrangeStem_MappedPigment = pigment { color rgb <0.50,0.15,0.10> }

#declare OrangeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare OrangeStem_Material_ = material {
	texture {
		pigment { uv_mapping OrangeStem_MappedPigment }
		finish { OrangeStem_Finish }
	}
}
//==================================================
#declare Pear_MappedPigment = pigment { color rgb <0.80,0.75,0.06> }


#declare PearColorMap=color_map{       
    [0.1 color rgb<0.80,0.75,0.06>]
    [0.3 color rgb<0.80,0.75,0.06>]                
    [0.6 color rgb<0.80,0.75,0.06>]
    [0.9 color rgb<0.5,0.3,0>]
    };
#declare PearBumpsPigment=pigment{
    bumps
    color_map {PearColorMap}
    scale .03
    turbulence .5
    };

#declare Pear_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.05 //surface roughness: 0.0005 -> 1             
};

#declare Pear_Material_ = material {
	texture {
		pigment { uv_mapping PearBumpsPigment }
		finish { Pear_Finish }
	}
}
//==================================================
#declare LeftGrapeStems_MappedPigment = pigment { color rgb <0.71,0.53,0.05> }

#declare LeftGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping LeftGrapeStems_MappedPigment }
		finish { LeftGrapeStems_Finish }
	}
}
//==================================================
#declare LeftGrapes_MappedPigment = pigment { color rgb <0.73,0.78,0.26> }

#declare LeftGrapes_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.065 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapes_Material_ = material {
	texture {
		pigment { uv_mapping LeftGrapes_MappedPigment }
		finish { LeftGrapes_Finish }
	}
}
//==================================================
#declare Apple_MappedPigment = pigment { color rgb <0.84,0.05,0.1> }

#declare Apple_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Apple_Material_ = material {
	texture {
		pigment { uv_mapping Apple_MappedPigment }
		finish { Apple_Finish }
	}
}
//==================================================
#declare RightGrapes_MappedPigment = pigment { color rgb <0.36,0.07,0.18> }

#declare RightGrapes_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.065 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapes_Material_ = material {
	texture {
		pigment { uv_mapping RightGrapes_MappedPigment }
		finish { RightGrapes_Finish }
	}
}
//==================================================
#declare RightGrapeStems_MappedPigment = pigment { color rgb <0.66,0.41,0.13> }

#declare RightGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping RightGrapeStems_MappedPigment }
		finish { RightGrapeStems_Finish }
	}
}
//==================================================
#declare AppleLeaf_MappedPigment = pigment { color rgb <0.24,0.57,0.20> }

#declare AppleLeaf_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare AppleLeaf_Material_ = material {
	texture {
		pigment { uv_mapping AppleLeaf_MappedPigment }
		finish { AppleLeaf_Finish }
	}
}
//==================================================
#declare AppleStem_MappedPigment = pigment { color rgb <0.40,0.35,0.11> }

#declare AppleStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare AppleStem_Material_ = material {
	texture {
		pigment { uv_mapping AppleStem_MappedPigment }
		finish { AppleStem_Finish }
	}
}
//==================================================
#declare Banana1_MappedPigment = pigment { color rgb <0.92,0.97,0.05>*1.15 }

#declare Banana1_Finish = finish {
	specular 0.4 //Max highlight intensity: 0 -> 1
      roughness 0.17 //surface roughness: 0.0005 -> 1             
};

#declare Banana1_Material_ = material {
	texture {
		pigment { uv_mapping Banana1_MappedPigment }
		finish { Banana1_Finish }
	}
}
//==================================================
#declare Banana2_MappedPigment = pigment { color rgb <0.89,0.74,0.06>*1.15 }

#declare Banana2_Finish = finish {
	specular 0.4 //Max highlight intensity: 0 -> 1
      roughness 0.17 //surface roughness: 0.0005 -> 1             
}; 

#declare Banana2ColorMap=color_map{       
    [0.1 color rgb<0.89,0.74,0.06>*1.15]
    [0.3 color rgb<0.89,0.74,0.06>*1.15]                
    [0.6 color rgb<0.89,0.74,0.06>*1.15]
    [0.9 color rgb<0.5,0.3,0>]
    };
#declare Banana2BumpsPigment=pigment{
    bumps
    color_map {PearColorMap}
    scale .03
    turbulence .5
    };
//#declare Banana2ColorMap2=pigment_map{    

#declare Banana2_Material_ = material {
	texture {
		pigment { uv_mapping Banana2_MappedPigment }
		finish { Banana2_Finish }
	}
}//==================================================
