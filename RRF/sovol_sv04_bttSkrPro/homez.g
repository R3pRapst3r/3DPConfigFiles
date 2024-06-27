; homez.g
; called to home the Z axis
;

G91                     ; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G90				        ; absolute positioning
G1 H0 X155 Y160 F3000   ; move to center of the bed
G30                     ; probe Z
