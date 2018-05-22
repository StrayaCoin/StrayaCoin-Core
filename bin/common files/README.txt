## Windows 
* see the attached zip file for precompiled binaries
* extract the files in the .zip to a new directory
* launch strayacoin-qt.exe, then close it
* copy the included strayacoin.conf to %appdata%/strayacoin/
* restart strayacoin-qt and the wallet should eventually sync
* after syncing, run mine.bat while the strayacoin-qt wallet is open to begin mining

## Linux 
* You will need to [build from source](https://github.com/47crypto/straya-coin/blob/master/doc/build-unix.md)
* after building and running "sudo make install", launch strayacoin-qt, then close it
* copy the include strayacoin.conf to ~/.strayacoin/
* restart strayacoin-qt and the wallet should eventually sync
* after syncing, run mine.sh while the strayacoin-qt wallet is open to begin mining
