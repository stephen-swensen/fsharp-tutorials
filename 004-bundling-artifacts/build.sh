# clean output dir
rm -rf bin

# restore packages
mono .paket/paket.exe restore

# compile app.fsx as an exe with optimizations enabled                        
fsharpc -o:bin/app.exe --optimize+ --debug- --tailcalls+ --target:exe app.fsx                                                      

# copy runtime dlls to output dir                                             
cp "packages/Suave/lib/net40/Suave.dll" bin/

