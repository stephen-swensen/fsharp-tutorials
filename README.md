# fsharp-tutorials

In this tutorial, we will show a unique approach to F# development using unix tools while avoiding msbuild project management. We assume the reader is comfortable with bash and vim, and has some familiarity with F#.

All examples are done within [dfvim](https://github.com/stephen-swensen/dfvim), an F# development environment based on mono and vim pre-built and run inside a docker container. Thus the only requirement for following this tutorial is a (non-Windows) variant of docker. For example, install [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac) if you are on OSX, or [Docker-CE for Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-convenience-script) if you are on Debian.

Some topics covered in this tutorial

- Using `dfvim` to edit F# scripts using the vim-fsharp vim plugin
- Using fsharpi, fsharpc, and mono
- Creating executable applications from multi-file .fsx scripts
- Using Paket to manage NuGet dependencies
- Using Suave to create RESTful web apis
- Using Docker to create deployable web applications
