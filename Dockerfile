FROM alanmquach/devcon-core:latest

MAINTAINER Alan Quach <integsrtite@gmail.com>

# UI
RUN curl -Lv https://dl.bintray.com/tigervnc/stable/tigervnc-1.7.0.x86_64.tar.gz -o /tmp/tigervnc-1.7.0.x86_64.tar.gz
RUN tar -xvf /tmp/tigervnc-1.7.0.x86_64.tar.gz -C /tmp
RUN rsync -avz /tmp/tigervnc*/usr/ /usr
RUN apt-get update && apt-get install -y x11-xkb-utils

ADD keyring.deb /root/keyring.deb
RUN apt install /root/keyring.deb
RUN echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
RUN apt update && apt install -y i3
# RUN setcap -r `which i3status`

RUN apt-get update && apt-get install -y terminator \
    feh

# RUN apt-get update && apt-get install -y dmenu
# RUN apt-get update && apt-get install -y dunst
# RUN apt-get update && apt-get install -y connman-ui
# RUN apt-get update && apt-get install -y rox-filer

CMD ["/usr/sbin/sshd", "-D"]

