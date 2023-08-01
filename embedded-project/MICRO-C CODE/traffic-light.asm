
_main:

;traffic-light.c,4 :: 		void main() {
;traffic-light.c,5 :: 		adcon1 = 6;
	MOVLW      6
	MOVWF      ADCON1+0
;traffic-light.c,6 :: 		trise.B0 = 1;
	BSF        TRISE+0, 0
;traffic-light.c,7 :: 		trise.B2 = 1;
	BSF        TRISE+0, 2
;traffic-light.c,8 :: 		trisb = 0;
	CLRF       TRISB+0
;traffic-light.c,9 :: 		trisc = 0;
	CLRF       TRISC+0
;traffic-light.c,10 :: 		portc = 255 ;
	MOVLW      255
	MOVWF      PORTC+0
;traffic-light.c,11 :: 		trisd = 0;
	CLRF       TRISD+0
;traffic-light.c,12 :: 		while(1) {
L_main0:
;traffic-light.c,13 :: 		while (portE.B0 == 1) {
L_main2:
	BTFSS      PORTE+0, 0
	GOTO       L_main3
;traffic-light.c,14 :: 		portc = 255 ;
	MOVLW      255
	MOVWF      PORTC+0
;traffic-light.c,15 :: 		portd = 33;
	MOVLW      33
	MOVWF      PORTD+0
;traffic-light.c,17 :: 		if(flag == 0)
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      0
	XORWF      _flag+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;traffic-light.c,19 :: 		for (count2 = 23; count2 >= 0; count2--) {
	MOVLW      23
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main5:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	SUBWF      _count2+0, 0
L__main45:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;traffic-light.c,20 :: 		if (portE.b0 == 0) {
	BTFSC      PORTE+0, 0
	GOTO       L_main8
;traffic-light.c,21 :: 		break;
	GOTO       L_main6
;traffic-light.c,22 :: 		}
L_main8:
;traffic-light.c,24 :: 		if (count2 <= 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _count2+0, 0
	SUBLW      3
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;traffic-light.c,25 :: 		portd = 17;
	MOVLW      17
	MOVWF      PORTD+0
;traffic-light.c,26 :: 		}
L_main10:
;traffic-light.c,27 :: 		portb = arr[count2];
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       _count2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;traffic-light.c,28 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
;traffic-light.c,30 :: 		flag = 1 ;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;traffic-light.c,19 :: 		for (count2 = 23; count2 >= 0; count2--) {
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;traffic-light.c,31 :: 		}
	GOTO       L_main5
L_main6:
;traffic-light.c,32 :: 		}
	GOTO       L_main12
L_main4:
;traffic-light.c,33 :: 		else if(flag == 1)
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      1
	XORWF      _flag+0, 0
L__main47:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;traffic-light.c,35 :: 		portd = 12;
	MOVLW      12
	MOVWF      PORTD+0
;traffic-light.c,36 :: 		for (count2 = 15; count2 >= 0; count2--) {
	MOVLW      15
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main14:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      0
	SUBWF      _count2+0, 0
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
;traffic-light.c,37 :: 		if (portE.b0 == 0) {
	BTFSC      PORTE+0, 0
	GOTO       L_main17
;traffic-light.c,38 :: 		break;
	GOTO       L_main15
;traffic-light.c,39 :: 		}
L_main17:
;traffic-light.c,41 :: 		if (count2 <= 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       _count2+0, 0
	SUBLW      3
L__main49:
	BTFSS      STATUS+0, 0
	GOTO       L_main19
;traffic-light.c,42 :: 		portd = 10;
	MOVLW      10
	MOVWF      PORTD+0
;traffic-light.c,43 :: 		}
L_main19:
;traffic-light.c,44 :: 		portb = arr[count2];
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       _count2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;traffic-light.c,45 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
;traffic-light.c,36 :: 		for (count2 = 15; count2 >= 0; count2--) {
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;traffic-light.c,47 :: 		}
	GOTO       L_main14
L_main15:
;traffic-light.c,48 :: 		flag = 0 ;
	CLRF       _flag+0
	CLRF       _flag+1
;traffic-light.c,49 :: 		}
L_main13:
L_main12:
;traffic-light.c,50 :: 		}
	GOTO       L_main2
L_main3:
;traffic-light.c,51 :: 		while (portE.B0 == 0) {
L_main21:
	BTFSC      PORTE+0, 0
	GOTO       L_main22
;traffic-light.c,52 :: 		if (portE.B2 == 1) {
	BTFSS      PORTE+0, 2
	GOTO       L_main23
;traffic-light.c,53 :: 		portc = 0b00000011 ;
	MOVLW      3
	MOVWF      PORTC+0
;traffic-light.c,54 :: 		for (count2 = 3; count2 >= 0; count2--) {
	MOVLW      3
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main24:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      0
	SUBWF      _count2+0, 0
L__main50:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
;traffic-light.c,55 :: 		portb = arr[count2];
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       _count2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;traffic-light.c,56 :: 		portd = 10;
	MOVLW      10
	MOVWF      PORTD+0
;traffic-light.c,57 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
;traffic-light.c,54 :: 		for (count2 = 3; count2 >= 0; count2--) {
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;traffic-light.c,58 :: 		}
	GOTO       L_main24
L_main25:
;traffic-light.c,59 :: 		portc = 0 ;
	CLRF       PORTC+0
;traffic-light.c,60 :: 		while (portE.B0 == 0 && portE.B2 == 1) {
L_main28:
	BTFSC      PORTE+0, 0
	GOTO       L_main29
	BTFSS      PORTE+0, 2
	GOTO       L_main29
L__main42:
;traffic-light.c,61 :: 		portd = 33;
	MOVLW      33
	MOVWF      PORTD+0
;traffic-light.c,62 :: 		flag = 0 ;
	CLRF       _flag+0
	CLRF       _flag+1
;traffic-light.c,63 :: 		}
	GOTO       L_main28
L_main29:
;traffic-light.c,64 :: 		}
	GOTO       L_main32
L_main23:
;traffic-light.c,66 :: 		portd = 17;
	MOVLW      17
	MOVWF      PORTD+0
;traffic-light.c,67 :: 		portc = 0b00001100 ;
	MOVLW      12
	MOVWF      PORTC+0
;traffic-light.c,68 :: 		for (count2 = 3; count2 >= 0; count2--) {
	MOVLW      3
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main33:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      0
	SUBWF      _count2+0, 0
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main34
;traffic-light.c,69 :: 		portb = arr[count2];
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       _count2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;traffic-light.c,70 :: 		delay_ms(400) ;
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
;traffic-light.c,68 :: 		for (count2 = 3; count2 >= 0; count2--) {
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;traffic-light.c,71 :: 		}
	GOTO       L_main33
L_main34:
;traffic-light.c,72 :: 		portc = 0 ;
	CLRF       PORTC+0
;traffic-light.c,73 :: 		while (portE.B0 == 0 && portE.B2 == 0) {
L_main37:
	BTFSC      PORTE+0, 0
	GOTO       L_main38
	BTFSC      PORTE+0, 2
	GOTO       L_main38
L__main41:
;traffic-light.c,74 :: 		portd = 12;
	MOVLW      12
	MOVWF      PORTD+0
;traffic-light.c,75 :: 		flag = 1 ;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;traffic-light.c,76 :: 		}
	GOTO       L_main37
L_main38:
;traffic-light.c,77 :: 		}
L_main32:
;traffic-light.c,78 :: 		}
	GOTO       L_main21
L_main22:
;traffic-light.c,79 :: 		}
	GOTO       L_main0
;traffic-light.c,80 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
