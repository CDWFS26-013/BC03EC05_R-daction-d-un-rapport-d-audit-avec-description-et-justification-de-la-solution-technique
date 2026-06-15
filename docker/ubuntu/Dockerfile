FROM ubuntu:latest

RUN id -u ubuntu &>/dev/null || useradd -m -s /bin/bash ubuntu \
    && mkdir -p /home/ubuntu/.ssh \
    && touch /home/ubuntu/.ssh/authorized_keys \
    && chown -R ubuntu:ubuntu /home/ubuntu/.ssh \
    && chmod 700 /home/ubuntu/.ssh \
    && chmod 600 /home/ubuntu/.ssh/authorized_keys

CMD ["sleep", "infinity"]