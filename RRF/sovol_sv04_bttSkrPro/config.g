; Configuration file for Sovol SV04 + BTT SKR Pro v1.2 F407
; Wed Apr 10 2024 13:17:41 GMT-0400 (Eastern Daylight Time)

; General preferences
G90                                 ; send absolute coordinates...
M83                                 ; ...but relative extruder moves
M550 P"Dexter"                      ; set printer name

; Network
M552 S1                             ; enable network
M586 P0 S1                          ; enable HTTP
M586 P1 S0                          ; disable FTP
M586 P2 S0                          ; disable Telnet

; Drives
M569 P0.0 S0                        ; physical drive 0.0 goes backwards (Y)
M569 P0.1 S0                        ; physical drive 0.1 goes backwards (U)
M569 P0.2 S0                        ; physical drive 0.2 goes backwards (X)
M569 P0.3 S0                        ; physical drive 0.3 goes backwards (Z0)
M569 P0.4 S0                        ; physical drive 0.4 goes backwards (Z1)
M569 P123.0 S0                      ; physical drive 123.0 goes backwards (E0)
M569 P125.0 S1                      ; physical drive 125.0 goes forwards (E1)

M584 Y0.0 U0.1 X0.2 Z0.3:0.4 E123.0:125.0        ; set drive mapping
M350 X16 U16 Y16 Z16 E16:16 I1                   ; configure microstepping with interpolation
M92 X64.00 U64.00 Y80.00 Z400.00 E415.00:415.00  ; set steps per mm
M566 X900.00 U900.00 Y900.00 Z60.00 E120.00      ; set maximum instantaneous speed changes (mm/min)
M203 X3000.00 U3000.00 Y3000.00 Z300.00 E1500.00 ; set maximum speeds (mm/min)
M201 X500.00 U500.00 Y500.00 Z20.00 E250.00      ; set accelerations (mm/s^2)
M906 X1000 U1000 Y800 Z800:800 E500:500          ; set motor currents (mA)
M84 Z0:1                                         ; disable idle motor current reduction on Z axis

; Axis Limits
M208 S1 X-40 U0 Y-5 Z0               ; set axis minima
M208 S0 X310 U350 Y325 Z390          ; set axis maxima

; Endstops
M915 X U                             ; configure motor stall detection for X + U axes
M574 S3 X1                           ; configure sensorless homing at low end on X axis
M574 S3 U2                           ; configure sensorless homing at high end on U axis
M574 S1 X1 P"!xstop"                 ; configure endstop at low end on Y axis
M574 S1 Y1 P"!ystop"                 ; configure endstop at low end on Y axis
M574 S1 U2 P"!e0stop"                ; configure endstop at low end on Y axis
M574 S2 Z1                           ; configure Z-probe endstop for low end on Z axis
M591 D0 P1 S1 C"123.io1.in"          ; configure filament sensor on e0det
M591 D1 P1 S1 C"125.io1.in"          ; configure filament sensor on e1det

; Z-Probe
M950 S0 C"123.io0.out"               ; create servo for BLTouch on pin 123.io0.out
M558 P9 C"^123.io0.in" H5 F120 T6000 ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-5 Y45 Z1.3                ; set Z probe trigger value, offset and trigger height
M557 X20:290 Y40:310 S67.5           ; define mesh grid

; Heaters
; configure sensor 0 as thermistor on pin bedtemp
M308 S0 A"Bed" P"bedtemp" Y"thermistor" T100000 B3950
M950 H0 C"bed" T0                    ; create heater 0 on pin bed and map it to sensor 0
M307 H0 B0 S1.00                     ; disable bang-bang mode for heater 0 and set PWM limit
M143 H0 S150                         ; set temperature limit for heater 0 to 150C
M140 H0                              ; map heater 0 to heated bed 0
M307 H0 R0.286 K0.117:0.000 D12.40 E1.35 S1.00 B0

; configure sensor 1 as thermistor on pin 123.temp0
M308 S1 A"HE0" P"123.temp0" Y"thermistor" T100000 B3950
M950 H1 C"123.out0" T1               ; create heater 1 on pin 123.out0 and map it to sensor 1
M307 H1 B0 S1.00                     ; disable bang-bang mode for heater 1 and set PWM limit
M143 H1 S300                         ; set temperature limit for heater 1 to 300C
M307 H1 R3.138 K0.537:0.000 D3.18 E1.35 S1.00 B0 V23.7

; configure sensor 2 as thermistor on pin 125.temp0
M308 S2 A"HE1" P"125.temp0" Y"thermistor" T100000 B3950
M950 H2 C"125.out0" T2               ; create heater 2 on pin 125.out0 and map it to sensor 2
M307 H2 B0 S1.00                     ; disable bang-bang mode for heater 2 and set PWM limit
M143 H2 S300                         ; set temperature limit for heater 2 to 300C
M307 H2 R3.071 K0.510:0.000 D2.90 E1.35 S1.00 B0 V23.9

; Fans
M950 F0 C"123.out1" Q500             ; create fan 0 on pin 123.out1 and set its frequency
M106 P0 S0 H-1                       ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"123.out2" Q500             ; create fan 1 on pin 123.out2 and set its frequency
M106 P1 S0 H1 T50                    ; set fan 1 value. Thermostatic control is turned on

M950 F2 C"125.out1" Q500             ; create fan 2 on pin 125.out1 and set its frequency
M106 P2 S0 H-1                       ; set fan 2 value. Thermostatic control is turned off
M950 F3 C"125.out2" Q500             ; create fan 3 on pin 125.out2 and set its frequency
M106 P3 S0 H2 T50                    ; set fan 3 value. Thermostatic control is turned on

; IDEX tools
M563 P0 D0 H1 F0                     ; define tool 0
G10 P0 X0 Y0 Z0                      ; set tool 0 axis offsets
M568 P0 S0 R0                        ; set tool 0 active and standby temperatures to 0C

M563 P1 D1 H2 F1 X3                  ; define tool 1
G10 P1 U0 Y0 Z0                      ; set tool 1 axis offsets
M568 P1 S0 R0                        ; set tool 1 active and standby temperatures to 0C

; Duplex mode tool
;M563 P2 D0:1 H1:2 X0:3 F0:1         ; define tool 2 (maps X movement to both X and U)
;G10 P2 X25 Y0 U-25                  ; set tool 2 axis offsets
;M568 P2 S0 R0                       ; set tool 2 active and standby temperatures to 0C
;M567 P2 E1:1                        ; set mix ratio 100% on both extruders

; Mirror mode tool
;M563 P3 D0:1 H1:2 X0:3 F0:1         ; define tool 3 (maps X movement to both X and U)
;G10 P3 X50 Y0 U-50 S0 R0            ; set tool 2 axis offsets
;M568 P3 S0 R0                       ; set tool 3 active and standby temperatures to 0C
;M567 P3 E1:1                        ; set mix ratio 100% on both extruders

; Custom settings
M671 S3 X-50:360 Y155:155            ; set location of the two Z axis screws
M80 C"probe"                         ; set probe pin active for mains relay (PS_ON)

M575 P1 S0 B57600                    ; enable serial for Fly Screen