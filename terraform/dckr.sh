#!/bin/sh

yum update -y
yum install docker -y
service docker start
chkconfig docker on
usermod -a -G docker ec2-user
docker run -dit --name webserver -p 80:80 httpd:latest
