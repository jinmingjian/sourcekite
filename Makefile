.PHONY: release install

release:
	swift build -Xswiftc -framework -Xswiftc sourcekitd -Xswiftc -F -Xswiftc /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib -c release

install: release
	cp .build/release/sourcekite $(HOME)/bin/
