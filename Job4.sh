if docker ps | grep interpreter
then
exit 0
else
docker run -dit -v /code:/str  --name interpreter jenkins_dockerfile:v1
fi