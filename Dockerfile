FROM alanmquach/devcon-core:latest

MAINTAINER Alan Quach <integsrtite@gmail.com>

# i3 (236 MB)
ADD keyring.deb /root/keyring.deb
RUN apt install /root/keyring.deb \
    && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list \
    && apt update && apt install -y i3 feh
# RUN setcap -r `which i3status`

# VNC+xrdp (32 MB)
RUN curl -Lv https://dl.bintray.com/tigervnc/stable/tigervnc-1.7.0.x86_64.tar.gz -o /tmp/tigervnc-1.7.0.x86_64.tar.gz \
    && tar -xvf /tmp/tigervnc-1.7.0.x86_64.tar.gz -C /tmp \
    && rsync -avz /tmp/tigervnc*/usr/ /usr \
    && apt-get update && apt-get install -y x11-xkb-utils
ADD xrdp.ini /root/xrdp.ini
RUN apt-get update && apt-get install -y xrdp && cat /root/xrdp.ini > /etc/xrdp/xrdp.ini

# terminal (45 MB)
RUN apt-get update && apt-get install -y terminator

# editor (197 MB)
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
    && apt-get update && apt-get install -y code
    
# browser (326 MB)
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update && apt-get install -y google-chrome-stable

# RUN apt-get update && apt-get install -y dunst
# RUN apt-get update && apt-get install -y rox-filer

CMD ["/usr/sbin/sshd", "-D"]

