FROM eclipse-temurin:17-jdk

RUN apt-get update \
    && apt-get -y install git

RUN useradd -m devusr \
    && echo "devusr:password" | chpasswd \
    && echo "root:password" | chpasswd \
    && usermod -aG sudo devusr

USER devusr

RUN mkdir /home/devusr/.ssh \
    && mkdir /home/devusr/work

WORKDIR /home/devusr/work

COPY ./git_clone.sh .

COPY ./entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
