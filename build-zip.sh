
# zip unix binaries
#mkdir -p ./bin/unix
#cp -v ./src/strayacoind ./bin/unix/
#cp -v ./src/strayacoin-cli ./bin/unix/
#cp -v ./src/strayacoin-tx ./bin/unix/
#cp -v ./src/test/test_strayacoin ./bin/unix/
#cp -v ./src/bench/bench_strayacoin ./bin/unix/
#cp -v ./src/qt/strayacoin-qt ./bin/unix
#cp -v ./src/qt/test/test_strayacoin-qt ./bin/unix
#cp -v ./strayacoin.conf ./bin/unix/
#zip ./bin/strayacoin-unix.zip ./bin/unix/*

WIN_ZIP_FILENAME=strayacoin-x86_64-win64-vx.zip
WIN_RELEASE_FOLDER=./bin/release-win64

# zip win64 binaries
mkdir -p $WIN_RELEASE_FOLDER
cp -v ./src/strayacoin-cli.exe $WIN_RELEASE_FOLDER/
cp -v ./src/strayacoind.exe $WIN_RELEASE_FOLDER/
cp -v ./src/bench/bench_strayacoin.exe $WIN_RELEASE_FOLDER/
#cp -v ./src/test/test_strayacoin.exe $WIN_RELEASE_FOLDER/
cp -v ./src/qt/strayacoin-qt.exe $WIN_RELEASE_FOLDER/
#cp -v ./src/qt/test/test_strayacoin-qt.exe $WIN_RELEASE_FOLDER/
cp -v ./src/strayacoin-tx.exe $WIN_RELEASE_FOLDER/
cp -v ./strayacoin.conf $WIN_RELEASE_FOLDER/
cp -v "./bin/common files/README.txt" $WIN_RELEASE_FOLDER
cp -v "./bin/common files/libbitcoinconsensus-0.dll" $WIN_RELEASE_FOLDER
cp -v "./bin/common files/mine.bat" $WIN_RELEASE_FOLDER
cp -v "./bin/common files/mine.sh" $WIN_RELEASE_FOLDER

cd $WIN_RELEASE_FOLDER
zip $WIN_ZIP_FILENAME *



