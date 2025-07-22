#!/usr/bin/env bash

# setup USB UART to communicate with arduino
stty -F /dev/ttyUSB0 ispeed 115200 ospeed 115200 min 0 -icrnl -ixon -isig -opost -isig -icanon -iexten -echo -echoe -echok

# send params to arduino, prints response
echo d5 > /dev/ttyUSB0
echo f1000 > /dev/ttyUSB0
echo b > /dev/ttyUSB0
