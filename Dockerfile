FROM eclipse-temurin:17-jdk
RUN apt-get update \
    && apt-get -y install netcat
RUN useradd -m workuser \
    && echo "workuser:password" | chpasswd \
    && echo "root:password" | chpasswd \
    && usermod -aG sudo workuser
RUN mkdir /opt/app \
    && chown workuser:workuser /opt/app
USER workuser
WORKDIR /opt/app
ENTRYPOINT [ "./entrypoint.sh" ]
