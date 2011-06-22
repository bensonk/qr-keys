PRIV=$1
PUB=$PRIV".pub"

cat $PRIV | qrencode -o $PRIV".png"
cat $PUB | qrencode -o $PUB".png"

convert -negate -colorize 55,0,0 -negate $PRIV.png $PRIV.png
convert -negate -colorize 0,0,55 -negate $PUB.png $PUB.png
