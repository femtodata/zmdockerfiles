FROM ubuntu:18.04
MAINTAINER Peter Gallagher

# Update base packages
RUN apt update \
    && apt upgrade --assume-yes

# Install pre-reqs
RUN apt install --assume-yes --no-install-recommends gnupg vim patch file  # i can't live without vim, patch to fix

# Configure Zoneminder PPA
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABE4C7F993453843F0AEB8154D0BF748776FFB04 \
    && echo deb http://ppa.launchpad.net/iconnor/zoneminder-1.36/ubuntu bionic main > /etc/apt/sources.list.d/zoneminder.list \
    && apt update

# Install zoneminder
RUN DEBIAN_FRONTEND=noninteractive apt install --assume-yes zoneminder \
    && a2enconf zoneminder \
    && a2enmod rewrite cgi


# Copy and install patch
COPY utils/monitor.patch /
RUN patch -p1 monitor.path

# Setup Volumes
VOLUME /var/cache/zoneminder/events /var/cache/zoneminder/images /var/lib/mysql /var/log/zm

# Expose http port
EXPOSE 80

# event server
RUN apt update
RUN apt install --assume-yes \
    cpanminus \
    git \
    libjson-perl \
    libyaml-perl \
    make
RUN git clone https://github.com/pliablepixels/zmeventnotification.git
# repeat these two steps each time you want to update to the latest stable
RUN cd zmeventnotification \
    && git fetch --tags
RUN cd zmeventnotification \
    && git checkout $(git describe --tags $(git rev-list --tags --max-count=1))

RUN cpanm \
    Crypt::MySQL \
    Config::IniFiles \
    Crypt::Eksblowfish::Bcrypt \
    Net::WebSocket::Server \
    LWP::Protocol::https \
    Net::MQTT::Simple


# Configure entrypoint
# COPY utils/entrypoint.sh /usr/local/bin/
# RUN chmod 755 /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
