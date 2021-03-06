# --
FROM openjdk:8

ENV MINECRAFT_HOME /opt/minecraft-server
ENV MINECRAFT_XMX 1024M
ENV MINECRAFT_XMS 1024M

RUN mkdir $MINECRAFT_HOME && mkdir $MINECRAFT_HOME/scripts
COPY scripts/ ${MINECRAFT_HOME}/scripts/
WORKDIR $MINECRAFT_HOME
RUN chmod +x ${MINECRAFT_HOME}/scripts/*.sh && \
    ${MINECRAFT_HOME}/scripts/prepareServer.sh

VOLUME ["/opt/minecraft-server/data","/opt/minecraft-server/logs"]

CMD bash ${MINECRAFT_HOME}/scripts/initServer.sh
