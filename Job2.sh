shopt -s nullglob
file1=(/code/*.py)
file2=(/code/*.pl)
file3=(/code/*.rb)

if ((${#file1[@]}))
then
    if docker ps -a | grep interpreter
    then
    echo "Already Running"
    else
    docker run -dit -v /code:/str  --name interpreter jenkins_dockerfile:v1
    fi
echo "Python"
fi

if ((${#file2[@]}))
then
    if docker ps -a | grep interpreter
    then
    echo "Already Running"
    else
    docker run -dit -v /code:/str  --name interpreter jenkins_dockerfile:v1
    fi
echo "Perl"
fi

if ((${#file3[@]}))
then
    if docker ps -a | grep interpreter
    then
    echo "Already Running"
    else
    docker run -dit -v /code:/str  --name interpreter jenkins_dockerfile:v1
    fi
echo "Ruby"
fi
