FROM multiarch/crossbuild
RUN git clone https://github.com/wangyu-/UDPspeeder
COPY ./makefile /workdir/UDPspeeder/
WORKDIR /workdir/UDPspeeder

RUN mkdir /artifacts/
ENV CROSS_TRIPLE=arm-linux-gnueabi
ENV NAME=speederv2-static-arm
RUN crossbuild make
RUN cp speederv2-static-arm speederv2-static-arm-stripped
RUN crossbuild strip speederv2-static-arm-stripped

RUN mv speederv2* /artifacts/
RUN ls -al /artifacts/
