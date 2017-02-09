# sourcekite

pronounced: [source kite] :smile:

[SDE](https://github.com/jinmingjian/sde)'s language server's backend which is written in Swift. You need to build this tool if you want to use [SDE](https://github.com/jinmingjian/sde).

## Build Instructions
clone this project, then run build command in that project as follow:

### for Linux
> sudo ln -s /usr/lib/sourcekitdInProc.framework/sourcekitdInProc /usr/lib/sourcekitdInProc

> swift build -Xlinker -l:sourcekitdInProc

##### NOTE1
  change the above linking location/option to your own when necessary)

##### NOTE2 
  the sourcekitd framework are not included in the the default official download. You can try a binary [here](https://github.com/norio-nomura/docker-sourcekit-builder/releases) with sourcekitd included, but note this is built in Ubuntu 16.04)

##### NOTE3
  from 2.0.20170209, SDE makes a sourcekite docker image and adds a new experimental setting "swift.path.sourcekiteDockerMode" for easier adoption for Linux users. Make sure you have followed these steps:
  1. install and make docker workable in your system
  2. run _docker pull jinmingjian/docker-sourcekite_ to get the docker image
  3. test against that the docker cmd _'docker run --rm -i jinmingjian/docker-sourcekite'_ works in your system
  4. set "swift.path.sourcekiteDockerMode" to true. Note, now the setting "swift.path.sourcekite" will be ignored.

### for MacOS
> swift build -Xswiftc -framework -Xswiftc sourcekitd -Xswiftc -F -Xswiftc /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib

(NOTE: make sure you have installed the swift toolchain into that location. You can do this via [download from offical site](https://swift.org/download/#snapshots) or [swiftenv](https://swiftenv.fuller.li))

Finally set "swift.path.sourcekite" in vscode to let SDE know the location of this tool. It recommends to add this setting to the gloabl via _"File" -> "Preferences" -> "Settings"_. Like:

```javascript
{
    "swift.path.sourcekite": "/path/to/repo/sourcekite/.build/debug/sourcekite"
}
```


## Issues
file an issues if you have problem.

## License
Apache License v2.