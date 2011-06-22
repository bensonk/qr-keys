PRIV=$1
PUB=$PRIV".pub"

cat $PRIV | qrencode -o $PRIV".png"
cat $PUB | qrencode -o $PUB".png"

convert -negate -colorize 55,0,0 -negate $PRIV.png $PRIV.png
convert -negate -colorize 0,0,55 -negate $PUB.png $PUB.png

cat >$PRIV.html <<END
<html>
  <head><title>$PRIV | $PUB</title></head>
  <body>
   <div id="public"><img src="$PUB.png"></div>
   <div id="private"><img src="$PRIV.png"></div>
  </body>
</html>
END
open $PRIV.html
echo "Your keytags have been created:"
echo "	$PRIV.png"
echo "	$PUB.png"
echo "	$PRIV.html"
