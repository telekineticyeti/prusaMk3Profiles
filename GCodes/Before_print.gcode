; Adapted from http://projects.ttlexceeded.com/3dprinting_slic3r_gcode.html
;
M115 U3.5.1                                       ; Tell printer latest fw version
                                                  ;
                                                  ; INITIAL WARMUP
                                                  ;
M104 S160                                         ; Set extruder no-ooze temp
M140 S{max(first_layer_bed_temperature[0],65)}    ; Set bed PINDA warmup temp
                                                  ; Nozzle warmup before home to avoid
                                                  ; driving hardened ooze into PEI bed
M109                                              ; Wait for extruder no-ooze warmup 
                                                  ; temp before mesh bed leveling
M300 S40 P10                                      ; Chirp
G28 W                                             ; Home all without mesh bed level
                                                  ;
                                                  ; PINDA WARMUP ROUTINE
                                                  ;
M300 S40 P10                                      ; Chirp
G0 Z3                                             ; Raise nozzle before move
                                                  ; Present bed for final cleaning
G0 X125 Y210 F10200                               ; Move nozzle to PINDA position
G0 Z0.10 F10200                                   ; Lower nozzle to PINDA position
M860 S35                                          ; Wait for PINDA temp to stabilize
G0 Z3                                             ; Raise nozzle before move
M300 S40 P10                                      ; Chirp
G80                                               ; Mesh bed leveling
G0 Z3                                             ; Raise nozzle to avoid denting bed
                                                  ; while nozzle heats
M140 S[first_layer_bed_temperature]               ; Set bed final temp
                                                  ;
                                                  ; FINAL WARMUP ROUTINE
                                                  ;
M104 S[first_layer_temperature]                   ; Set extruder final temp
M109 S[first_layer_temperature]                   ; Wait for extruder final temp
M190 S[first_layer_bed_temperature]               ; Wait for bed final temp
                                                  ;
                                                  ; PRIME LINE ROUTINE
                                                  ;
M300 S25 P10                                      ; Chirp
G0 Z-3                                            ; Restore nozzle position
M83                                               ; Extruder relative mode
M900 K0                                           ; Disable LA for prime line
G92 E0.0                                          ; Reset extrusion distance
G1 Y-3.0 F1000.0                                  ; Go outside print area
G1 E2 F1000                                       ; De-retract and push ooze
G1 X20.0 E6  F1000.0                              ; Fat 20mm intro line @ 0.30
G1 X60.0 E3.2  F1000.0                            ; Thin +40mm intro line @ 0.08
G1 X100.0 E6  F1000.0                             ; Fat +40mm intro line @ 0.15
G1 E-0.8 F2100                                    ; Retract to avoid stringing
G1 X99.5 E0 F1000.0                               ; -0.5mm wipe action to avoid string
G1 X110.0 E0 F1000.0                              ; +10mm intro line @ 0.00
G1 E0.6 F1500                                     ; De-retract
G92 E0.0                                          ; Reset extrusion distance