# fsx-applications

Traditional .NET projects are managed using MSBuild project files. In this tutorial, we show how to create project-less .NET applications using .fsx files built using `fsharpc` and run using `mono`.

Our application source code will contain two files:

- `app.fsx` is our entrypoint
- `utils.fsx` is a secondary file referenced by `app.fsx`

`app.fsx` contains a `#load` statement at the top which loads the `utils.fsx`. In this way, dependencies among source files are managed within the source files themselves. 

Note well that `utils.fsx` starts with

```
[<AutoOpen>]
module Project
```

this is necessary for all secondary files (the module name doesn't matter). It's a quirk of the way `fsharpi` loads scripts (without it, modules defined within secondary files will not be visible).

We can evaluate `app.fsx` within `fsharpi` with `fsharpi --load:app.fsx`. That's great for development, but at the end of the day we want an executable that we can distribute or deploy. We can do that using `fsharpc`:

```
fsharpc -o bin/app.exe app.fsx
```

that will produce an executable: `app.exe` which we can run with `mono`:

```
mono bin/app.exe
```

Thus we can go directly from interactively developed .fsx scripts to executables!


