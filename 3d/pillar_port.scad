/*
 * Tidegrow Pillar-Port Mount
 * Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.
 *
 */ 

$fn = 36;

pillar_mount();
 
module pillar_mount() {
	
	p_height = 30;
	p_width = 16;
	p_depth = 10;
	p_roundness = 1;

	pn_height = 15;
	pn_width = 12;
	pn_depth = 8;
	pn_roundness = 1;
	
	pp_height = 15;
	pp_width = 30;
	pp_depth = 5;
	pp_roundness = 1;
	
	pl_height = 0;
		
	difference() {
		
		union () {
					
			translate([0,(p_width/2)-(pp_width/2),0])
				roundedcube(pp_depth, pp_width, p_height-pn_height, pp_roundness);

			translate([0,0,0])
				roundedcube(p_depth, p_width, p_height+pl_height, pn_roundness);
		
		}
		
		translate([-1,(p_width/2)-(pn_width/2),p_height-pn_height+pl_height])
			roundedcube(1.5+pn_depth, pn_width, pn_height, pn_roundness);
		
		// top bolt hole
		translate([0,(p_width/2),p_height-(pn_height/2)+pl_height])
			rotate([0,90,0])
				cylinder(d=3.2, h=10);

		// top countersink
		translate([p_depth-0.75,(p_width/2),p_height-(pn_height/2)+pl_height])
			rotate([0,90,0])
				cylinder(d=5, h=10);
			
		// port bolt holes
		translate([-1,(p_width/2)-10,pn_height-5])
			rotate([0,90,0])
				cylinder(d=3, h=20);
			
		translate([-1,(p_width/2)+10,pn_height-5])
			rotate([0,90,0])
				cylinder(d=3, h=20);
				
		// port countersinks
		translate([pp_depth-0.75,(p_width/2)-10,pn_height-5])
			rotate([0,90,0])
				cylinder(d=5, h=10);
				
		translate([pp_depth-0.75,(p_width/2)+10,pn_height-5])
			rotate([0,90,0])
				cylinder(d=5, h=10);

	}
	
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}