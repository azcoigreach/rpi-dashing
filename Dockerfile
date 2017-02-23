FROM hypriot/rpi-ruby:2.2.2
# Install dependencies

# System packages
RUN apt-get update
RUN apt-get install -y build-essential curl python

#Install Supervisord Docker Plugin
RUN apt-get install -y supervisor openssh-server

# SET ROOT PASSWORD 
RUN echo 'root:screencast' | chpasswd && \
  mkdir /var/run/sshd && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config && \
    sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh

# Manual installs, e.g. Node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

# Install Dashing project
RUN mkdir -p /usr/src/app
COPY ./dashboard/ /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
 
EXPOSE 22 3030

CMD ["/usr/bin/supervisord"]

