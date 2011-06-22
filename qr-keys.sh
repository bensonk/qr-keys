PRIV=$1
PUB=$PRIV".pub"

cat $PRIV | qrencode -o $PRIV".png"
cat $PUB | qrencode -o $PUB".png"

convert -negate -colorize 55,0,0 -negate $PRIV.png $PRIV.png
convert -negate -colorize 0,0,55 -negate $PUB.png $PUB.png

PRIV_IMG=`basename "$PRIV.png"`
PUB_IMG=`basename "$PUB.png"`

cat >$PRIV.html <<END
<html>
  <head><title>$PRIV_IMG | $PUB_IMG</title></head>
  <body>
   <div id="public"><img src="$PUB_IMG"></div>
   <div id="private"><img src="$PRIV_IMG"></div>
  </body>
</html>
END
open $PRIV.html
echo "Your keytags have been created:"
echo "	$PRIV.png"
echo "	$PUB.png"
echo "	$PRIV.html"
