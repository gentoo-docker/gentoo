FROM scratch

MAINTAINER Axel Etcheverry <axel@etcheverry.biz>

ADD . /

RUN ["/bin/busybox", "sh", "build.sh"]

ONBUILD RUN env-update
