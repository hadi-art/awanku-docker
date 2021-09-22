FROM nimmis/apache-php5

MAINTAINER hadidin4423@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update


# Install editor
RUN apt-get install -y vim

#EXPOSE 80
#EXPOSE 443

WORKDIR /var/www/html

# Install supervisor
RUN apt-get update
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY apache.conf /etc/supervisor/conf.d/apache.conf
RUN chmod +x /etc/supervisor/conf.d/apache.conf


#install handbrake
RUN sudo add-apt-repository ppa:stebbins/handbrake-snapshots
RUN sudo apt-get update
RUN sudo apt-get install -y handbrake-cli

#install ffmpeg
RUN sudo add-apt-repository ppa:mc3man/trusty-media
RUN sudo apt-get update
RUN sudo apt-get install -y ffmpeg


CMD ["/usr/bin/supervisord"]


