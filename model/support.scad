$fn = 200;

module wall() {
    translate([0, -50, 0]) cube([5, 100, 100]);
    translate([-10, -50, -100]) cube([15, 100, 100]);
    translate([-2.5, 0, 25]) rotate([0, -90, 0]) cylinder(8, 15, 15);
    translate([-2.5, 0, 25]) rotate([0, -90, 0]) cylinder(120, 10, 10);
}

module support() {
    // wall fastener
    intersection() {
        difference() {
            rotate([0, 90, 0]) cylinder(30, 22, 22);
            translate([2.5, 0, 0]) rotate([0, 90, 0]) cylinder(20, 15.5, 15.5);
            translate([-3, 7.5, 0]) cube([20, 20, 5], true);
            translate([-1, 5, -50]) cube([100, 100, 100]);
            translate([3, -50, -10]) rotate([0, 35, 0]) cube([100, 100, 100]);
            translate([3, -50, -10]) cube([100, 100, 100]);
        }
        translate([0, 2, -3]) scale([1, 1, 1]) 
            rotate([0, 90, 0]) cylinder(30, 20, 20);
    }
    
    // support lines
    translate([11, -2, -16]) rotate([-90, 0, 0])
    linear_extrude(7)
    polygon([
        [0, 0], [0, 100], [100, 0],
        [5, 10], [5, 85], [42.5, 47.5],
        [10, 5], [85, 5], [47.5, 42.5]
    ],
    paths=[[0, 1, 2], [3, 4, 5], [6, 7, 8]]);
    
    // tube shelf
    translate([96, -5, -16]) 
    difference() {
        union() {
            rotate([0, 90, 0])
            linear_extrude(10) polygon([[0, 0], [0, 5], [5, 5]]);
            cube([10, 10, 8]);
        }
        translate([-1, 5, 16]) rotate([0, 90, 0]) cylinder(12, 10, 10);
    }
    
}

%color(alpha=0.3) translate([0, 0, -25]) rotate([0, 0, 180]) wall();
support();