FROM alanmquach/devcon-core:latest

MAINTAINER Alan Quach <integsrtite@gmail.com>

# UI
RUN apt-get update && apt-get install -y tightvncserver \
    i3 \
    terminator
# RUN setcap -r `which i3status`

# RUN curl -Lv https://dl.bintray.com/tigervnc/stable/tigervnc-1.7.0.x86_64.tar.gz -o /tmp/tigervnc-1.7.0.x86_64.tar.gz
# RUN tar -xvf /tmp/tigervnc-1.7.0.x86_64.tar.gz -C /tmp
# RUN rsync -avz /tmp/tigervnc*/usr/ /usr
# RUN apt-get update && apt-get install -y x11-xkb-utils

# RUN apt-get update && apt-get install -y dmenu
# RUN apt-get update && apt-get install -y dunst
# RUN apt-get update && apt-get install -y connman-ui
# RUN apt-get update && apt-get install -y feh
# RUN apt-get update && apt-get install -y rox-filer

CMD ["/usr/sbin/sshd", "-D"]

