motor_thickness = 30;
oversize = 15;
$fn = 25;

union()
{
    difference()
    {
        cube([motor_thickness + oversize, motor_thickness + oversize, 40]);
        translate([oversize / 2, oversize / 2, 30])
        {
            cube([motor_thickness, motor_thickness, 11]);
        }
        translate([(motor_thickness + oversize) / 2, (motor_thickness + oversize) / 2, -1])
        {
            cylinder(d = 13, h = 60);
            translate([0, 0, 27])
            cylinder(d = 24.5, h = 5);
        }
        translate([12.5, 0, 0])
        {
            cube([20, 20, 10]);
        }
        translate([10, 0, 30])
        {
            cube([25, 10, 10]);
        }
    }
        translate([(motor_thickness + oversize) / 2, (motor_thickness + oversize) / 2, -1])
    {
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