ARG GIT_USER_NAME="git_user_name"
ARG GIT_USER_EMAIL="git_user_email"
ARG GIT_SSH_URL="git_ssh_url"
ARG ARTIFACT_NAME="artifact_name"
ARG MYSQL_ROOT_PASSWORD="mysql_root_password"
ARG MYSQL_DATABASE="mysql_database"
ARG MYSQL_USER="mysql_user"
ARG MYSQL_PASSWORD="mysql_password"

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
COPY ./.ssh/ /home/workuser/.ssh
COPY ./dev/ .
RUN mv ./entrypoint.sh ../
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL
ARG GIT_SSH_URL
RUN sed -i "s/GIT_USER_NAME/${GIT_USER_NAME}/g" ./git_setting.sh \
    && sed -i "s/GIT_USER_EMAIL/${GIT_USER_EMAIL}/g" ./git_setting.sh \
    && sed -i "s#GIT_SSH_URL#${GIT_SSH_URL}#g" ./git_clone.sh \
    && ./git_setting.sh \
    && ./git_clone.sh
ENTRYPOINT [ "../entrypoint.sh" ]

FROM dev AS build
USER workuser
WORKDIR /home/workuser/work/
COPY ./build/entrypoint.sh .
ARG ARTIFACT_NAME
RUN sed -i "s/ARTIFACT_NAME/${ARTIFACT_NAME}/g" ./entrypoint.sh \
    && mkdir ./build
ENTRYPOINT [ "./entrypoint.sh" ]

FROM base AS prod
RUN apt-get -y install netcat
RUN mkdir /opt/app \
    && chown workuser:workuser /opt/app
USER workuser
WORKDIR /opt/app
COPY ./prod/entrypoint.sh .
COPY ./libs/ .
ENTRYPOINT [ "./entrypoint.sh" ]

FROM mysql:8.3.0 AS db
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
