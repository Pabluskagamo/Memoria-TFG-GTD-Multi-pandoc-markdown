FROM ubuntu
WORKDIR /app
COPY ./instalation .
RUN dpkg -i ./pandoc-2.4-1-amd64.deb
RUN apt-get -y update --fix-missing
RUN apt-get -y install python-pip git
RUN apt-get -y install python3
RUN ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && echo "Etc/UTC" > /etc/timezone
RUN apt-get -y install texlive-full
