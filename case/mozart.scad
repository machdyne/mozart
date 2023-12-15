/*
 * Mozart Case
 * Copyright (c) 2023 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 2 x M3 x 6mm bolts
 *  - 2 x M3 x 25mm countersunk bolts
 *  - 4 x M3 nuts
 * 
 */

$fn = 100;

board_width = 60;
board_thickness = 1.404;
board_length = 100;
board_height = 1.6;
board_spacing = 2;

wall = 1.5;

//translate([1,2,-1.6]) ld9_board();

//translate([0,0,0])
//	ld9_case_top();

translate([0,0,-6])
	ld9_case_bottom();

module ld9_board() {
	
	difference() {
		union() {
			color([0,0.5,0])
				roundedcube(board_width,board_length,board_thickness, 5);
			color([0.2,0.2,0.2])
				translate([0.75,8,0]) cube([9.2, 82.7, 55]);
				//translate([0.25,8,0]) cube([9.2, 82.7, 15]);
			color([0.2,0.2,0.2])
				translate([35.725-(7.5/2),-5,0])
					cube([7.5,10,7.5]);

		}
		translate([5, 5, -1]) cylinder(d=3.2, h=100);
		translate([5, 95, -1]) cylinder(d=3.2, h=100);
		translate([55, 5, -1]) cylinder(d=3.2, h=100);
		translate([55, 95, -1]) cylinder(d=3.2, h=100);
	}	
		
}

module ld9_case_top() {

		translate([0,25,19])
				rotate([90,0,270])
					translate([-45,-11,5])
						linear_extrude(1)
							text("M O Z A R T", size=4, halign="center",
								font="Liberation Sans:style=Bold");


		// addl supports
		translate([35.725-(7.5/2)-2.25,2,0]) cube([3.25,2.5,20]);
		translate([46.4-(7.5/2)-2.25,2,0]) cube([3.25,2.5,20]);
		translate([41.5-(7.5/2)-6.75,101,0]) cube([4,1.5,20]);

		translate([58,30.25,0]) cube([4,8,20]);
		translate([58,53.75,0]) cube([4,6.25,20]);
		translate([58,75,0]) cube([4,6.25,20]);

		translate([-3,37,0]) cube([3,30,20]);
		translate([-3,2,0]) cube([3,25,20]);
		translate([-3,77,0]) cube([3,25,20]);

				
		translate([1,2,0]) {
			difference() {
				union() {
					translate([52,0,0]) cube([9,9,20]);
					translate([51.2,91.2,0]) cube([9,9,20]);
				}		
				// bolt holes
				translate([55,5,0]) cylinder(d=3.2, h=50);
				translate([55,95,0]) cylinder(d=3.2, h=50);
				translate([55,5,19]) cylinder(d=6, h=2);
				translate([55,95,19]) cylinder(d=6, h=2);

			}
			difference() {
				translate([2.5,4,2.75]) cube([15,8,5.5], center=true);
				translate([5,5,0]) cylinder(d=3.2, h=50);
			}
			difference() {
				translate([2.5,96,2.75]) cube([15,8,5.5], center=true);
				translate([5,95,0]) cylinder(d=3.2, h=50);
			}

		}
	
		difference () {
			
			// body			
			union() {
				translate([-5,0,0]) roundedcube(68,104,20,5);
//				translate([-6-1.5,104/2-10/2,0]) cube([10,10,5]);			
			}
			
			translate([1,2,-0.1]) {
				
				translate([-4,0,0]) roundedcube(board_width+4,board_length,20-2,5);
				
				// sechzig module
				
				translate([-1,(board_length/2)-(95.5/2),0])
					cube([13.5,95.5,50]);
				
				translate([-2.25,board_length/2+20,0])
					cube([2.5,10,50], center=true);
				
				translate([-2.25,board_length/2-20,0])
					cube([2.5,10,50], center=true);
			
				// ethernet
				translate([55,20-(16.5/2),0])
					cube([10,16.5,15]);

				// hdmi
				translate([55,44-(15.5/2),0])
					cube([10,15.5,7]);
			
				// usb host
				translate([55,65.5-(15/2),0])
					cube([10,15,16.25]);

				// usb-c
				translate([55,84-(9.5/2),0])
					cube([10,9.5,3.25]);

				// activity LED
				translate([13.5,-5,3])
					cube([1.5,10,1.5]);

				// audio jack
				translate([25.5-(6.5/2),-5,0])
					cube([6.5,10,6]);

				// reset button
				translate([35.725-(7.5/2),-5,0])
					cube([7.5,10,7.5]);

				// boot button
				translate([46.4-(7.5/2),-5,0])
					cube([7.5,10,7.5]);

				// sd card
				translate([41.5-(15/2),95,0])
					cube([15,10,3]);

				// expansion
				translate([21-(18/2),95,0])
					cube([18,10,6]);

				// bolt holes
				translate([55,5,0]) cylinder(d=3.2, h=50);
				translate([55,95,0]) cylinder(d=3.2, h=50);

				translate([55,5,19]) cylinder(d=6, h=2);
				translate([55,95,19]) cylinder(d=6, h=2);
				
				translate([0,25,19])
					rotate([0,0,90])
						translate([45,-45,0.5])
							linear_extrude(1)
								text("M O Z A R T", size=4, halign="center",
									font="Liberation Sans:style=Bold");
		
		
			}

		}
	
				
		
}

module ld9_case_bottom() {

		difference () {
			
			union() {
				translate([-5,0,0]) roundedcube(68,104,6.5,5);
//				translate([-9,104/2-25/2,0]) cube([4,25,15]);
//				translate([-5,104/2-25/2,0]) cylinder(d=8, h=5);
//				translate([-5,104/2+25/2,0]) cylinder(d=8, h=5);
			}
			
//			translate([-10,104/2-10.5/2,5]) cube([20,10.5,7]);
			
			translate([1,2,0]) {				
				
				translate([8.5,-0.1,2]) roundedcube(board_width-8.5-9,board_length+0.2,5,5);
				translate([-4,9,2]) roundedcube(board_width+4,board_length-18,5,5);
			
				translate([-0.125,-0.125,6.5-1.6]) roundedcube(board_width+0.25,board_length+0.25,10, 5);
				
				// bolt holes
				translate([5,5,0]) cylinder(d=3.2, h=50);
				translate([5,95,0]) cylinder(d=3.2, h=50);
				translate([55,5,0]) cylinder(d=3.2, h=50);
				translate([55,95,0]) cylinder(d=3.2, h=50);

				// nut holes
				translate([5,5,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([5,95,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([55,5,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([55,95,-1.75]) cylinder(d=7, h=4.5, $fn=6);


			}

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
