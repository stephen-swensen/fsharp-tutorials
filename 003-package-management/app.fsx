#load "refs.fsx"

open Suave

let publicBinding = Suave.Http.HttpBinding.createSimple HTTP "0.0.0.0" 8080
let config = { defaultConfig with bindings = [publicBinding]; maxOps=1000 }
startWebServer config (Successful.OK "Hello World!");;
