#!/bin/bash

#default values
PORT=80
MASTER_VERSION=1.0.201611
USE_NGINX="true"
TIMEZONE=America/Chicago
SKIPPROXY="false"
RESET_CONTENT="false"
REMOTEUSER="root"
OPEN_JENKINS_8080="false"

echo "Provision team jenkins for $TEAM at $TARGET"

timestamp=$(date +%s)
ROOTDIR="/tmp/$TEAM-$timestamp"
echo "use temp dir $ROOTDIR"

mkdir -p $ROOTDIR

INIFILE=$ROOTDIR/host.ini

while getopts ":t:e:m:j:r:p:i:" opt; do
  case "$opt" in
  t ) TEAM=$OPTARG;;
  e ) TARGET=$OPTARG;;
  m ) MASTER_VERSION=$OPTARG;;
  j ) JENKINS_VERSION=$OPTARG;;
  r ) RESET_CONTENT=$OPTARG;;
  i ) INIFILE=$OPTARG;;

 
  esac
done

GITREPO=git@github.build.ge.com:ctt-jaas/${TEAM}.git 
echo "TEAM GIT REPO is $GITREPO"
git clone $GITREPO  $ROOTDIR

nonProduction="false"
if [ "$TARGET" != "prod" ]; then
  nonProduction="true"
else
  RESET_CONTENT="false"
fi


PORT=80
if [ -f $ROOTDIR/team.properties ]; then
   source  $ROOTDIR/team.properties
fi

#see if it is HTTPS
if [ -f $ROOTDIR/id/nginx-selfsigned.crt ]; then
   HTTPS="true"
fi


if [ $PORT != 80 ]; then 
  USE_NGINX="false"
fi

echo "nonProduction = $nonProduction"
echo "resetContentFromGit = $RESET_CONTENT"
echo "MasterPort = $PORT"
echo "USE_NGINX = $USE_NGINX"
echo "HTTPS = $HTTPS"
echo "OPEN_JENKINS_8080 = $OPEN_JENKINS_8080"


#right now JENKINS_HOST is the TARGET, but leave room for a different fully qualified name 
JENKINS_HOST=$TARGET

PORT8080=""
if [ $OPEN_JENKINS_8080 != "false" ]; then 
  PORT8080="'- 8080:8080'" 
fi



#run playbook 
ansible-playbook  jenkinsMaster.yml  -i $INIFILE -v  --extra-vars "team=${TEAM} https=${HTTPS}  jenkinsHost=$JENKINS_HOST remotehost=${TARGET} idDir=$ROOTDIR/id  masterdir=$ROOTDIR/jenkins_home resetContentFromGit=$RESET_CONTENT nonProduction=$nonProduction masterPort=$PORT useNginx=$USE_NGINX master_version=$MASTER_VERSION  timezone=$TIMEZONE port8080=$PORT8080  remoteuser=$REMOTEUSER"


#clean up afterward
rm -rf $ROOTDIR
