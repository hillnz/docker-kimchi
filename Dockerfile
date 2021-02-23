FROM python:3.9.2

# renovate: datasource=github-releases depName=kimchi-project/wok
ARG WOK_VERSION=3.0.0
# renovate: datasource=github-releases depName=kimchi-project/kimchi
ARG KIMCHI_VERSION=3.0.0

# RUN apt-get update && apt-get install -y \
#         gettext \
#         logrotate \
#         nginx \
#         novnc \
#         openssl \
#         python3-cheetah \
#         python3-cherrypy3 \
#         python3-ethtool \
#         python3-guestfs \
#         python3-jsonschema \
#         python3-ldap \
#         python3-libvirt \
#         python3-lxml \
#         python3-openssl \
#         python3-pampy \
#         python3-parted \
#         python3-pil \
#         python3-psutil \
#         python3-websockify \
#         systemd \
#         python3-configobj \
#         python3-lxml \
#         python3-magic \
#         python3-paramiko \
#         python3-ldap \
#         spice-html5 \
#         qemu-kvm \
#         python3-cherrypy3 \
#         libvirt0 \
#         libvirt-daemon-system \
#         libvirt-clients \
#         nfs-common \
#         sosreport \
#         open-iscsi \
#         libguestfs-tools \
#         libnl-route-3-dev \
#     && rm -rf /var/lib/apt/lists/*    

# RUN curl -L -o /tmp/wok.deb https://github.com/kimchi-project/wok/releases/download/${WOK_VERSION}/wok-${WOK_VERSION}-0.debian.noarch.deb && \
#     curl -L -o /tmp/kimchi.deb https://github.com/kimchi-project/kimchi/releases/download/${KIMCHI_VERSION}/wok-${KIMCHI_VERSION}-0.debian.noarch.deb && \
#     dpkg -i /tmp/wok.deb && dpkg -i /tmp/kimchi.deb && \
#     rm /tmp/*.deb

RUN mkdir -p /build
WORKDIR /build
RUN git clone --recursive https://github.com/kimchi-project/wok.git && \
    cd wok && \
    git checkout $WOK_VERSION && \
    sed -i 's/sudo //g' build-all.sh && \
    ./build-all.sh

