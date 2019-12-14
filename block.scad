$fn=60;


cube_portal([40,40,40]);
translate([40,0,0]){
    cube_portal([40,40,40]);
}
translate([0,40,0]){
    cube_portal([40,40,40]);
}
//doorV([40,40,40]);

module doorV(size) {
     translate([0,0,size[2]/2]) {
        difference() {
            cube(size,true);
            difference() {
                translate([0,0,size[2]/2-size[0]/4]) {
                    cube([size[0],size[1],size[0]/2],true);
                }
                
                scale([0.75/0.3,1,1]){
                intersection(){
                translate([size[0]*0.3,0,size[2]/2-size[0]/2]) {
                    rotate([90,90,0]) {
                        cylinder(h=size[1], r1=size[0]/2, r2=size[0]/2, center=true);
                    }
                }
              
                translate([-size[0]*0.3,0,size[2]/2-size[0]/2]) {
                    rotate([90,90,0]) {
                        cylinder(h=size[1], r1=size[0]/2, r2=size[0]/2, center=true);
                    }
                }
                }
                }
                
            }
        }  
    }
}

module doorU(size) {
    translate([0,0,size[2]/2]) {
        difference() {
            cube(size,true);
            difference() {
                translate([0,0,size[2]/2-size[0]/4]) {
                    cube([size[0],size[1],size[0]/2],true);
                }
                translate([0,0,size[2]/2-size[0]/2]) {
                    rotate([90,90,0]) {
                        cylinder(h=size[1], r1=size[0]/2, r2=size[0]/2, center=true);
                    }
                }  
            }
        }  
    }
}



module cube_portal(size=[60,60,100], portal=[0.7,.5,0.9]) {
    
    difference() {
                
        translate([0,0,size[2]/2]) { 
            cube(size,true);
        }
            
        union(){
            
            translate([0,(size[1]/2-size[1]*portal[1]/2),0]) { 
                doorU([
                    size[0]*portal[0],
                    size[1]*portal[1],
                    size[2]*portal[2],
                ]);
            }
            
            translate([0,-(size[1]/2-size[1]*portal[1]/2),0]) { 
                doorU([
                    size[0]*portal[0],
                    size[1]*portal[1],
                    size[2]*portal[2],
                ]);
            }
            
            rotate([0,0,90]) {
                translate([0,(size[1]/2-size[1]*portal[1]/2),0]) { 
                    doorV([
                        size[0]*portal[0],
                        size[1]*portal[1],
                        size[2]*portal[2],
                    ]);
                }
                
                translate([0,-(size[1]/2-size[1]*portal[1]/2),0]) { 
                    doorV([
                        size[0]*portal[0],
                        size[1]*portal[1],
                        size[2]*portal[2],
                    ]);
                }
            }
        
        }
    
    }
}






