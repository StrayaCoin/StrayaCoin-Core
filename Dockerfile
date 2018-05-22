FROM ubuntu:14.04

COPY ./strayacoin.conf /root/.strayacoin/strayacoin.conf
COPY . /usr/src/strayacoin

WORKDIR /usr/src/strayacoin

RUN ./build-all.sh

EXPOSE 9666 19666

#CMD ["strayacoind", "--printtoconsole"]
