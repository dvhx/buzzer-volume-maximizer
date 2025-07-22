#!/usr/bin/env bash

# make sure wav dir exists
mkdir -p wav

# setup USB UART to communicate with arduino
stty -F /dev/ttyUSB0 ispeed 115200 ospeed 115200 min 0 -icrnl -ixon -isig -opost -isig -icanon -iexten -echo -echoe -echok

function one() {
    # Send duty and frequency to arduino and record the sound
    DUTY=$1
    FREQ=$2

    echo "--- recording wav/$DUTY-$FREQ.wav"
    # record 2s wav
    arecord -q -d 2 -f cd wav/$DUTY-$FREQ.wav &

    # send params to arduino, prints response
    echo d$DUTY > /dev/ttyUSB0
    echo f$FREQ > /dev/ttyUSB0
    echo b > /dev/ttyUSB0
    cat /dev/ttyUSB0

    # wait for it to end
    sleep 2
}

# sweep all duty cycles and all frequencies
for d in `seq 1 1 25`; do
    for f in `seq 100 20 1000`; do
        one $d $f
    done
done
