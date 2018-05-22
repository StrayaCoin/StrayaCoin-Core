Strayacoin Core
=============

Setup
---------------------
Strayacoin Core is the original strayacoin client and it builds the backbone of the network. It downloads and, by default, stores the entire history of strayacoin transactions (which is currently more than 7 GBs); depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Strayacoin Core, visit [strayacoin.org](https://www.strayacoin.org/).

Running
---------------------
The following are some helpful notes on how to run strayacoin on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/strayacoin-qt` (GUI) or
- `bin/strayacoind` (headless)

### Windows

Unpack the files into a directory, and then run strayacoin-qt.exe.

### OS X

Drag strayacoin-Core to your applications folder, and then run strayacoin-Core.

### Need Help?

* See the documentation at the [strayacoin Wiki](https://strayacoin.info/)
for help and more information.
* Ask for help on [#strayacoin](http://webchat.freenode.net?channels=strayacoin) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=strayacoin).
* Ask for help on the [strayacoinTalk](https://strayacointalk.io/) forums.

Building
---------------------
The following are developer notes on how to build strayacoin on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The strayacoin repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/strayacoin/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [strayacoinTalk](https://strayacointalk.io/) forums.
* Discuss general strayacoin development on #strayacoin-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=strayacoin-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
