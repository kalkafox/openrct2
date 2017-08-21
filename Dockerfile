FROM openrct2/openrct2:ubuntu_amd64

LABEL maintainer=k@kalka.io

RUN git clone https://github.com/OpenRCT2/OpenRCT2.git /opt/OpenRCT2

RUN adduser \
--home /home/openrct2 \
--disabled-password \
--shell /bin/bash \
--gecos "" \
--quiet \
openrct2

RUN mkdir -p /opt/OpenRCT2/build \
        && cd /opt/OpenRCT2/build \
        && cmake ../ \
        && make \
        && make install


COPY run.sh /run

RUN chown openrct2:openrct2 /run && chmod +x /run/run.sh

EXPOSE 11753/tcp

VOLUME ["/game", "/save" "/home/openrct2/.config/OpenRCT2/config.ini"]

USER openrct2

WORKDIR ["/run"]

ENTRYPOINT ["/run/run.sh"]
