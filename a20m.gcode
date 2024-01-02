; start

;GeeeTech A20M start script
G0 F5000 ; set move speed
M140 S{material_bed_temperature_layer_0} ;set bed temp
M104 S165 ;set extruder temp
G28 ;home
G0 F5000 ; set move speed
;G29 ;Level Bed
M501 ; load leveling
; M420 S ; enable leveling -> set in marlin config
G90 ; absolute positioning
G92 E0 ; set Extruder position to 0 for multiple prints in the same session
G0 F5000 ; set move speed
G0 X0 Y250 Z{layer_height}; move to zero back
M104 S{material_print_temperature_layer_0} ;set extruder temp
M190 S{material_bed_temperature_layer_0} ;wait for bed temp
M109 S{material_print_temperature_layer_0} ;wait for extruder temp
M400 ; wait
;G92 X-9 ; apply purge offset
;G0 X0 ; repeat offset move
;M400 ; wait
G0 F800 ; Set speed for purge
G1 X0.35 Y0 E30 ;purge line
;G0 X0.7 Y0 ;move side
;G1 X0.7 Y200 E30 ;purge line
; G0 X0.6 Y200  ;move side
; G1 X0.6 Y0 E30 ;purge line
M400 ; wait
;G92 X-1 ; apply final offset
;end of start script


; end


G91 ; relative position
G1 E-1
M104 S0 ; hotend temp 0
M140 S0 ; bed temp 0
G90 ; absolute positioning
G0 F1000 ; set move speed
G0 X0 Y{machine_depth} Z225 ; set printer pos
G92 E0 ; reset perceived extruder pos
M400 ; wait
M84 ; disable steppers
