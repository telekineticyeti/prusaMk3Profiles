                                                  ;
G4                                                ; Wait
G92 E0                                            ; Prepare to retract
G1 E-2 F4800                                      ; Retract quickly to avoid ooze
                                                  ; Move print head up
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+60, max_print_height)}{endif}
G0 X0 Y200 F10200                                 ; Present bed
M220 S100                                         ; Reset speed factor to 100%
M221 S100                                         ; Reset extruder factor to 100%
M900 K0                                           ; Reset linear acceleration
M104 S0                                           ; Turn off temperature
M140 S0                                           ; Turn off heatbed
M107                                              ; Turn off fan
M84                                               ; Disable motors
M300 S100 P10                                     ; Chirp