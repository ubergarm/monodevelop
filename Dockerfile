FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y locales apt-transport-https dirmngr ca-certificates gnupg

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-vs.list

RUN apt-get update
RUN apt-get install -y mono-complete monodevelop gsettings-desktop-schemas

RUN mkdir /home/user \
 && useradd -s /bin/bash -d /home/user user \
 && chown user:user /home/user

USER user
WORKDIR /home/user
CMD monodevelop
