# sourcekite

pronounced: [source kite] :smile:

[SDE](https://github.com/jinmingjian/sde)'s language server's backend which is written in Swift. You need to build this tool if you want to use [SDE](https://github.com/jinmingjian/sde).

## Build Instructions
clone this project, then run _swift build_ in that project as follow:

### for Linux
> swift build -Xlinker -L/usr/lib/sourcekitdInProc.framework -Xlinker -l:sourcekitdInProc 

(NOTE: change the above linking location/option to your own when necessary)

### for MacOS
> swift build -Xswiftc -framework -Xswiftc sourcekitd -Xswiftc -F -Xswiftc /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib

(NOTE: make sure you have installed the swift toolchain into that loction. You can done this via [download from offical site](https://swift.org/download/#snapshots) or [swiftenv](https://swiftenv.fuller.li))

Finally set "swift.path.sourcekite" in vscode to let SDE know the location of this tool. It recommends to add this setting to the gloabl via _"File" -> "Preferences" -> "Settings"_.

## Issues
file an issues if you have problem.

## License
Apache License v2.