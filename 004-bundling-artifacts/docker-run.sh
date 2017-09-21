# kill old running containers if any
docker kill example-app
# clean up old container versions
docker rm example-app
# build the docker image
docker build -t example-app .
# run the container
docker run --name example-app -it -p 8080:8080 example-app
