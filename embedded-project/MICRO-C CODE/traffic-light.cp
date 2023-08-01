#line 1 "C:/Users/PC/Desktop/embedded project/MICRO-C CODE/traffic-light.c"
int count2 = 0;
int flag = 0 ;
int arr[] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x20, 0x21, 0x22, 0x23 };
void main() {
 adcon1 = 6;
 trise.B0 = 1;
 trise.B2 = 1;
 trisb = 0;
 trisc = 0;
 portc = 255 ;
 trisd = 0;
 while(1) {
 while (portE.B0 == 1) {
 portc = 255 ;
 portd = 33;

 if(flag == 0)
 {
 for (count2 = 23; count2 >= 0; count2--) {
 if (portE.b0 == 0) {
 break;
 }
 else {
 if (count2 <= 3) {
 portd = 17;
 }
 portb = arr[count2];
 delay_ms(400);
 }
 flag = 1 ;
 }
 }
 else if(flag == 1)
 {
 portd = 12;
 for (count2 = 15; count2 >= 0; count2--) {
 if (portE.b0 == 0) {
 break;
 }
 else {
 if (count2 <= 3) {
 portd = 10;
 }
 portb = arr[count2];
 delay_ms(400);
 }
 }
 flag = 0 ;
 }
 }
 while (portE.B0 == 0) {
 if (portE.B2 == 1) {
 portc = 0b00000011 ;
 for (count2 = 3; count2 >= 0; count2--) {
 portb = arr[count2];
 portd = 10;
 delay_ms(400);
 }
 portc = 0 ;
 while (portE.B0 == 0 && portE.B2 == 1) {
 portd = 33;
 flag = 0 ;
 }
 }
 else {
 portd = 17;
 portc = 0b00001100 ;
 for (count2 = 3; count2 >= 0; count2--) {
 portb = arr[count2];
 delay_ms(400) ;
 }
 portc = 0 ;
 while (portE.B0 == 0 && portE.B2 == 0) {
 portd = 12;
 flag = 1 ;
 }
 }
 }
 }
}
