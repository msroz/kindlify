FROM crystallang/crystal
RUN apt-get -y update
RUN apt-get -y upgrade
WORKDIR /app
