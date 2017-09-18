# package-management

In this section we show how to use [paket](https://github.com/fsprojects/Paket) to manage NuGet package dependencies. First,

- create a folder named `.paket`
- then download the latest version of `paket.bootstrapper.exe` and put it in the `.paket` folder
- then rename `paket.bootstrapper.exe` to `paket.exe`, which allows paket to be run in ["magic" mode](https://fsprojects.github.io/Paket/bootstrapper.html)

we can script this with

```
mkdir .paket
wget -O .paket/paket.exe https://github.com/fsprojects/Paket/releases/download/5.96.2/paket.bootstrapper.exe
```

You should commit the whole `.paket` folder to source control. We will use `mono .paket/paket.exe <command>` for running all paket commands. 

Now we'll manually create a `paket.dependencies` file with [Suave](https://suave.io/) specified as a dependency (this can roughly be done with `paket init` and `paket add` commands alternatively):

```
source https://www.nuget.org/api/v2
framework = net47

nuget Suave
```

This file should be committed to source control. Note: we use `framework = net47` to avoid downloading framework binaries we don't need.

Next we'll run `mono ./paket/paket.exe install --generate-load-scripts` to

- generate paket.lock file (should be committed)
- download Suave package into `packages` folder (should _not_ be committed)
- generate .fsx load scripts under `.paket/load` (should be committed)

Note well: since we do not commit the binaries downloaded in the `packages` folder, `mono .paket/paket.exe restore` must be run to restore projects from a freshly cloned project.

Now we are done with paket, but we need to show how to reference our Suave dependency. We'll create a `refs.fsx` file like so:

```
#load .paket/load/main.group.fsx
```

and then we should `#load refs.fsx` at the top of all of our .fsx files generally (e.g. utils.fsx and app.fsx). While we could `#load` the `.paket/load/main.group.fsx` directly, using `refs.fsx` gives us oppourtunity to load additional non-paket managed dependencies in a consolodated place.

