FROM debian:10.8

# renovate: datasource=github-releases depName=kimchi-project/wok
ARG WOK_VERSION=3.0.0
# renovate: datasource=github-releases depName=kimchi-project/kimchi
ARG KIMCHI_VERSION=3.0.0

RUN apt-update && apt install -y \
        gettext \
        logrotate \
        nginx \
        novnc \
        openssl \
        python3-cheetah \
        python3-cherrypy3 \
        python3-ethtool \
        python3-guestfs \
        python3-jsonschema \
        python3-ldap \
        python3-libvirt \
        python3-lxml \
        python3-m2crypto \
        python3-openssl \
        python3-pampy \
        python3-parted \
        python3-pil \
        python3-psutil \
        python3-websockify \
        systemd \
        python3-configobj \
        python3-lxml \
        python3-magic \
        python3-paramiko \
        python3-ldap \
        spice-html5 \
        qemu-kvm \
        python3-cherrypy3 \
        libvirt0 \
        libvirt-daemon-system \
        libvirt-clients \
        nfs-common \
        sosreport \
        open-iscsi \
        libguestfs-tools \
        libnl-route-3-dev        
    && rm -rf /var/lib/apt/lists/*    

RUN curl -o /tmp/wok.deb https://github.com/kimchi-project/wok/releases/download/${WOK_VERSION}/wok-${WOK_VERSION}-0.debian.noarch.deb && \
    curl -o /tmp/kimchi.deb https://github.com/kimchi-project/kimchi/releases/download/${KIMCHI_VERSION}/wok-${KIMCHI_VERSION}-0.debian.noarch.deb && \



