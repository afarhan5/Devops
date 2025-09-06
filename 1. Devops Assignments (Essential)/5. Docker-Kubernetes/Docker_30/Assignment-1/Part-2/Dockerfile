FROM ubuntu
RUN apt-get update
RUN apt-get install -y sudo
RUN useradd -m mohan && echo "mohan:mohan123" | chpasswd
RUN mkdir -p /data/Ninjas/Mohan /data/Ninjas/Uma /data/Ninjas/Shikha /data/Ninjas/Mayank
RUN chown -R mohan:mohan /data/Ninjas/Mohan
RUN chmod 755 /data/Ninjas/Uma /data/Ninjas/Shikha /data/Ninjas/Mayank
RUN chmod 700 /data/Ninjas/Mohan
USER mohan
WORKDIR /data/Ninjas
CMD ["/bin/bash"]
