FROM debian:jessie

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list
RUN echo -n "Package: *\nPin: release a=testing\nPin-Priority: 100\n" > /etc/apt/preferences.d/testing
RUN apt-get update && apt-get install -y libmicrohttpd-dev g++ make cmake gcc -t testing

WORKDIR /app
COPY . /app
RUN cmake . && make
CMD /app/bin/xmr-stak-cpu /config/config.txt
