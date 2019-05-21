motor_thickness = 40;
oversize = 15;
box = motor_thickness + oversize;
$fn = 25;

union()
{
    difference()
    {
        cube([box, box, 40]);
        translate([oversize / 2, oversize / 2, 30])
        {
            cube([motor_thickness, motor_thickness, 11]);
        }
        translate([(box) / 2, (box) / 2, -1])
        {
            cylinder(d = 13, h = 60);
            translate([0, 0, 27])
            cylinder(d = 24.5, h = 5);
        }
        translate([box / 2 - 20 / 2, 0, 0])
        {
            cube([20, box / 2, 10]);
        }
        translate([box / 2 - 25 / 2, 0, 30])
        {
            cube([25, 10, 10]);
        }
    }
        translate([(motor_thickness + oversize) / 2, (motor_thickness + oversize) / 2, -1])
    {
        //pins
        translate([0, 0, 20])
        {
            translate([9, 0, 0])
            {
                cylinder(d = 2.4, h = 10);
            }
            rotate([0, 0, 120])
            {
                translate([9, 0, 0])
                {
                    cylinder(d = 2.4, h = 10);
                }
            }
            rotate([0, 0, 240])
            {
                translate([9, 0, 0])
                {
                    cylinder(d = 2.4, h = 10);
                }
            }
        }
                
    }
}