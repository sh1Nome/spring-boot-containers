FROM eclipse-temurin:17-jdk AS base
RUN apt-get update
RUN useradd -m workuser \
    && echo "workuser:password" | chpasswd \
    && echo "root:password" | chpasswd \
    && usermod -aG sudo workuser

FROM base AS dev
RUN apt-get -y install git
USER workuser
RUN mkdir /home/workuser/work
WORKDIR /home/workuser/work
RUN mkdir /home/workuser/.ssh \
    && ssh-keyscan -t rsa github.com >> /home/workuser/.ssh/known_hosts
COPY ./dev/ .
ENTRYPOINT [ "./entrypoint.sh" ]

FROM base AS prod
RUN apt-get -y install netcat
RUN mkdir /opt/app \
    && chown workuser:workuser /opt/app
USER workuser
WORKDIR /opt/app
ENTRYPOINT [ "./entrypoint.sh" ]
