# development-environment

We will start out getting comfortable with our development environment, [dfvim](https://github.com/stephen-swensen/dfvim).

Assuming Docker is already installed, you can start the `dfvim` container using the following bash command (the first time will take a while to download the docker image, but subsequent start times will be instant):

```
docker run -it -v $(pwd):/src swensen/dfvim:4.1.25
```

This starts the container in interactive terminal mode with _the current host directory mounted inside the container_. That is, the files you edit inside the container are actually the files in the host directory from which you started the container.

Since we will use this container frequently, we can define a alias function in our `.bashrc` or `.bash_profile` like

```
dfvim () { docker run -it -v $(pwd):/src swensen/dfvim:4.1.25; }
```

and then use it like `dfvim`.

Now, let's edit a .fsx file (.fsx files are F# script files, which can be run from the F# interactive). First, start `dfvim` within the directory containing this readme. Next, we can open the `test1.fsx` in vim:

```
vim test1.fsx
```

The source code is simple:

```
printfn "Hello World!";;
```

now type `:FsiEvalBuffer`. This will evaluate the current file in `fsharpi`, showing the output. The command, and many others, is provided by the [vim-fsharp](https://github.com/fsharp/vim-fsharp) plugin.
