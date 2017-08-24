FROM centos:centos7
MAINTAINER Maxfield Stewart

ENV http_proxy  http://3.28.29.241:88
ENV https_proxy  http://3.28.29.241:88
ENV HTTP_PROXY  http://3.28.29.241:88
ENV HTTPS_PROXY  http://3.28.29.241:88
ENV  ftp_proxy http://3.28.29.241:88

# Add both the stagging Commander Server and Staging Server to no_proxy
ENV  no_proxy 127.0.0.1,localhost,*.ge.com,hcit-ec.health.ge.com,3.232.167.81


# Install NGINX
RUN yum -y update; yum clean all
RUN yum -y install http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm; yum -y makecache
RUN yum -y install nginx-1.8.0

# Remove default files we don't need
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf

# Add default configuration
COPY conf/jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx"]
