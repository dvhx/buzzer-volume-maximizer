#!/usr/bin/env bash

for i in wav/*.wav; do
    echo $i
    sox $i -n stat 2>&1 | awk '/RMS.*amplitude/ { print $3 }' > $i.rms
done