/*
 * Tidegrow Pillar
 * Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.
 *
 */ 

$fn = 36;

pillar();
 
module pillar() {

	p_height = 100;
	p_width = 16;
	p_depth = 10;
	p_roundness = 1;

	pn_height = 15;
	pn_width = 12;
	pn_depth = 8;
	pn_roundness = 1;
	
	difference() {
		
		union () {
			
			translate([0,(p_width/2)-(pn_width/2),0])
				roundedcube(pn_depth, pn_width, pn_height, p_roundness);
			
			translate([0,0,pn_height])
				roundedcube(p_depth, p_width, p_height-pn_height, pn_roundness);
		}
		
		translate([-1,(p_width/2)-(pn_width/2),p_height-pn_height])
			roundedcube(1.5+pn_depth, pn_width, pn_height, pn_roundness);

		// cable cutouts
		translate([-1,(p_width/2)-(pn_width/2),p_height-pn_height-25])
			roundedcube(50, pn_width, 20, pn_roundness);

		// top bolt hole
		translate([0,(p_width/2),p_height-(pn_height/2)])
			rotate([0,90,0])
				cylinder(d=3.2, h=10);

		// top countersink
		translate([p_depth-0.75,(p_width/2),p_height-(pn_height/2)])
			rotate([0,90,0])
				cylinder(d=5, h=10);
			
		// bottom bolt hole
		translate([0,(p_width/2),pn_height/2])
			rotate([0,90,0])
				cylinder(d=3.2, h=10);

		// bottom nut hole
		translate([0,(p_width/2),pn_height/2])
			rotate([0,90,0])
				cylinder(d=7, h=2.5, $fn=6);
		
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