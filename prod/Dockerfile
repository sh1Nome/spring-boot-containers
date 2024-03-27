FROM eclipse-temurin:17-jdk

RUN apt-get update \
    && apt-get -y install netcat

RUN useradd -m produsr \
    && echo "produsr:password" | chpasswd \
    && echo "root:password" | chpasswd \
    && usermod -aG sudo produsr

RUN mkdir /opt/app \
    && chown produsr:produsr /opt/app

USER produsr

ENTRYPOINT [ "/opt/app/entrypoint.sh" ]
