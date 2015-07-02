from ubuntu:15.04
MAINTAINER quan cqshinn92@gmail.com
ENV HOME /root

ADD build /build
#use file bash in build folder for setup&deploy in docker
RUN /build/enable_repos.sh
RUN /build/utilities.sh
RUN /build/nginx-passenger.sh
RUN /build/ruby2.2.sh
RUN /build/redis.sh
RUN /build/mysql.sh
# RUN /build/app.sh

EXPOSE 80 443 
