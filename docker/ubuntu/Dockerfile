FROM ubuntu:latest

ARG SSH_USER=defaultuser
ARG SSH_PASSWORD=defaultpass

RUN apt-get update && apt-get install -y openssh-server sudo \
    && mkdir -p /var/run/sshd \
    && useradd -m -s /bin/bash ${SSH_USER} \
    && echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd \
    && usermod -aG sudo ${SSH_USER} \
    && mkdir -p /home/${SSH_USER}/.ssh \
    && touch /home/${SSH_USER}/.ssh/authorized_keys \
    && chown -R ${SSH_USER}:${SSH_USER} /home/${SSH_USER}/.ssh \
    && chmod 700 /home/${SSH_USER}/.ssh \
    && chmod 600 /home/${SSH_USER}/.ssh/authorized_keys \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]