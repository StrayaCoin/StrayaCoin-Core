# install build-unix dependencies
apt-get update
apt-get install -y software-properties-common nano curl make git zip
add-apt-repository -y ppa:bitcoin/bitcoin
apt-get update
apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev software-properties-common libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev


# install build-win dependencies
apt-get update
apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git
apt-get install -y g++-mingw-w64-x86-64 mingw-w64-x86-64-dev


