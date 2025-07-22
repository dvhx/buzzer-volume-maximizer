
int serial_read_int() {
    // Read multibyte number e.g. '123' from serial port, terminated by #10
    int i = 0, r = 0, neg = false;
    //Serial.println("zac");
    while (true) {
        while (Serial.available() == 0) {
        }
        i = Serial.read();
        //Serial.print("i=");
        //Serial.println(i);
        if (i == '-') {
            neg = true;
            continue;
        }
        if (i == 10) {
            break;
        }
        if (i > '9') {
            Serial.println("error: invalid number, program halted!");
            while (1);
            break;
        }
        r = r * 10 + (i - 48);
        //Serial.print("r=");
        //Serial.println(r);
    }
    //Serial.println("kon");
    return neg ? -r : r;
}
