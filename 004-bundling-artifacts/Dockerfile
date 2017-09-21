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
