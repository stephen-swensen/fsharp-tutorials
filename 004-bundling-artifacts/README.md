# package-management

Following through on the previous section, here we show how to bundle binary artifacts for deploying web service applications using docker. The isolation provided by docker gives us the flexibility to deploy F# web services on any number of cloud providers that support docker such as AWS.

First let's create a `build.sh` script for building and bundling our Suave application:


```
# clean output dir
rm -rf bin

# restore packages
mono .paket/paket.exe restore

# compile app.fsx as an exe with optimizations enabled                        
fsharpc -o:bin/app.exe --optimize+ --debug- --tailcalls+ --target:exe app.fsx                                                      

# copy runtime dlls to output dir                                             
cp "packages/Suave/lib/net40/Suave.dll" bin/
```

Now we'll create a `Dockerfile` that defines our docker image:


```
# the official fsharp mono image
FROM fsharp:4.1.25
# optimize threads for server applications
ENV MONO_THREADS_PER_CPU 20
# stage our source files
RUN mkdir /src
WORKDIR "/src"
COPY .paket/ .paket/
COPY paket.dependencies .
COPY paket.lock .
# restore packages as a separate step to reduce rebuild times when no new packages
RUN mono .paket/paket.exe restore
COPY *.fsx ./
COPY build.sh .
# build it
RUN ./build.sh
# run it with mono using --server setting
ENTRYPOINT ["mono", "--server", "/src/bin/app.exe"]
```

Then we can use the following `docker-run.sh` script to build the docker image and run the container (note well: these steps should _not_ be done within the `dfvim` environment - we can't run docker within docker well):


```
# kill old running containers if any
docker kill example-app
# clean up old container versions
docker rm example-app
# build the docker image
docker build -t example-app .
# run the container
docker run --name example-app -it -p 8080:8080 example-app
```

Deploying the image and running the container is very much a cloud provider specific afair. [aws-docker-deploy](https://github.com/relayfoods/aws-docker-deploy) project shows how to do it on AWs.

That's it!
