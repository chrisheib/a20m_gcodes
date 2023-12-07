; start


;GeeeTech A20M start script
G0 F5000 ; set move speed
M140 S{material_bed_temperature_layer_0} ;set bed temp
M104 S165 ;set extruder temp
G28 ;home
G0 F5000 ; set move speed
G29 ;Level Bed
G90 ; absolute positioning
G92 E0 ; set Extruder position to 0 for multiple prints in the same session
G0 F5000 ; set move speed
G1 X0 Y0 Z10 E0 ;go to wait position
M104 S{material_print_temperature_layer_0} ;set extruder temp
M190 S{material_bed_temperature_layer_0} ;wait for bed temp
M109 S{material_print_temperature_layer_0} ;wait for extruder temp
G0 Z0.2 ;set extruder height
G0 F1000 ; Set speed for purge
G92 X-10
G0 X0 Y0 Z10 ;go to wait position
G1 X220 Y0 Z0.2 E20 ;purge line
;end of start script



; end


G91 ; relative position
G1 E-1 ; retract 
M104 S0 ; hotend temp 0
M140 S0 ; bed temp 0
G90 ; absolute positioning
G0 F1000 ; set move speed
G0 X0 Y{machine_depth} Z{machine_height} ; set printer pos
G92 E0 ; reset perceived extruder pos
M400 ; wait
M84 ; disable steppers
