; homeall.g
; called to home all axes
;

G91                          ; relative positioning
G1 H2 Z5 F6000               ; lift Z relative to current position
G1 H1 X-355 U355 Y-320 F2000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 U-5 Y5 F6000        ; go back a few mm
G1 H1 X-355 U355 Y-320 F360  ; move slowly to X and Y axis endstops once more (second pass)
G90                          ; absolute positioning
G1 H0 X155 Y160 F3000        ; move probe to center of the bed
G30                          ; probe Z in center of bed
