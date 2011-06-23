#!/bin/bash
# TODO: Get key via QR code
KEYFILE=$1

FIFO=key_fifo_of_doom
TIMEOUT=300 # 5 minute timeout

mkfifo $FIFO
chmod 600 $FIFO
cat $KEYFILE >$FIFO&
cat $KEYFILE >$FIFO&
ssh-add -t $TIMEOUT $FIFO
rm $FIFO
