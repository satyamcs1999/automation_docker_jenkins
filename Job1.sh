if test -d /code
then
cp -v -r -f * /code
else
mkdir /code
cp -v -r -f * /code
fi