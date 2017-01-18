# dockergui

FROM phusion/baseimage:0.9.19
MAINTAINER 2devnull


#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# Set correct environment variables

ENV LC_ALL=C.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 TERM=xterm



# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
COPY ./files/ /tmp/


#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app


# Copy X app start script to right location
COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Place whater volumes and ports you want exposed here:
VOLUME ["/config"]
EXPOSE 3389

RUN chmod +x /tmp/install/install.sh && /tmp/install/install.sh

