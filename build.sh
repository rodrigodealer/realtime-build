if [ -d realtime ]; then
    cd realtime
    git pull origin master
 else
    git clone git@github.com:rodrigodealer/realtime-composed.git realtime
    cd realtime
fi

git checkout $1
docker run --rm -e APP_BIN=realtime -e APP_PATH=/go/src/github.com/rodrigodealer/realtime -v $PWD:/go/src/github.com/rodrigodealer/realtime rodrigodealer/go-builder:latest
docker-compose up
