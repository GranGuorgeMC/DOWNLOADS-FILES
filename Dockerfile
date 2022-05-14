# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ubuntu:20.04
CMD ["/bin/bash" "/entrypoint.sh"]
COPY ./entrypoint.sh /entrypoint.sh
WORKDIR /home/container
ENV HOME=/home/container
ENV USER=container
USER container
RUN hmod 777 /tmp && chown container:container /tmp
RUN rm -rf /usr/bin/fallocate
RUN rm -rf /var/lib/apt/lists/* && apt-get autoclean -y && apt-get clean -y && apt-get autoremove --purge -y
RUN apt-get clean -y
RUN addgroup --gid 998 container && useradd -m -u 999 -d /home/container -g container -s /bin/bash container
RUN apt-get update && apt-get -t experimental -y install libc6 libc6-dev lib32z1 lib32stdc++6 && apt-get --no-install-recommends -y install curl apt-transport-https git zip unzip curl jq toilet toilet-fonts coreutils software-properties-common procps php7.4 php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl python3 python3-pip python-is-python3 ffmpeg
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates && echo 'deb http://http.us.debian.org/debian/ testing non-free contrib main' | tee -a /etc/apt/sources.list && apt-get -y install lsb-release && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && apt-get remove -y libpython3.7-stdlib python3.7 python3-minimal python3
RUN wget https://github.com/GranGuorgeMC/DOWNLOADS-FILES/releases/download/4.454.r/mcpebot.sh
LABEL author=Chirag maintainer=admin@guormit.cf
CMD ["bash"]
