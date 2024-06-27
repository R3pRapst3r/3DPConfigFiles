; bed.g
; called to perform automatic bed compensation via G32
;

M561   ; Clear any bed transform

if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28  ; home first
  
G30 P0 X20 Y160 Z-99999
G30 P1 X290 Y160 Z-99999 S2

while move.calibration.initial.deviation > 0.005  ; perform additional tramming if previous deviation was over 0.02mm
  echo "Iteration " ^ iterations ^ " - Deviation: " ^ move.calibration.initial.deviation ^ "mm"
  
  if iterations = 10
    abort "Iteration limit reached"
  
  G30 P0 X20 Y160 Z-99999
  G30 P1 X290 Y160 Z-99999 S2
  continue
;

echo "Final Z Deviation: " ^ move.calibration.initial.deviation ^ "mm"

G1 H0 X155 Y160 Z10 F6000
