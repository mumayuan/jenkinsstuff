FROM jenkins/jenkins:lts
USER root 
RUN apt-get update && \ 
	apt-get -y --force-yes install wget  nano vim



COPY GE_External_Certificate1.pem  /tmp/
COPY GE_External_Certificate2.pem  /tmp/
COPY GE_External_I_Certificate1.pem  /tmp/


RUN cp /tmp/*.pem /etc/ssl/certs/ ;  update-ca-certificates --fresh




COPY plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/plugins.sh /tmp/plugins.txt

USER jenkins
