FROM ubuntu:16.04

COPY ./strayacoin.conf /root/.strayacoin/strayacoin.conf

COPY . /strayacoin
WORKDIR /strayacoin

#shared libraries and dependencies
RUN apt-get update && apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update && apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev

#include optional dependencies
RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev

#build strayacoin source
RUN ./autogen.sh && ./configure && make && make install

#open service port
EXPOSE 9666 19666

CMD ["strayacoind", "--printtoconsole"]
