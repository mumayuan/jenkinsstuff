Make sure the target system is set up:
* /var/jenkins_home points to a large partition. Make soft link if necessary. The directory needs to exist.

* able to run "docker pull  hc-us-east-aws-artifactory.cloud.health.ge.com/tutum/centos:centos6"
** If docker pull doesn't work, check /etc/systemd/system/docker.service.d/http-proxy.conf with following content
[Service]
Environment="HTTPS_PROXY=http://http-proxy.health.ge.com:88"



Options:
 -t : "team name" , e.g. coreload, ctt-test
 -e : target "environment" in the host.ini file, e.g. prod, testing
 -m : jenkins master docker image version, see https://hc-us-east-aws-artifactory.cloud.health.ge.com/artifactory/webapp/#/artifacts/browse/tree/General/docker-int/jaas/jenkins-master 
 -r : "reset" flag, if true, it will reset from scratch by wiping out /var/jenkins_home content and replace from GIT latest (TODO: support GIT older tag/revision)
 -p : port number if want jenkins to listen on a different port than 80, no nginx if not 80
 -i : provide your own "inventory" , not using the default inventory file in team's GIT repo.

Refresh jenkins_home with content from GIT for team "ctt-test" on a test system  defined in a local host.ini file
 ./provisionJenkins.sh -t ctt-test -e test -i ./host.ini -m 1.0.201611  -r true

just do a production upgrade
 ./provisionJenkins.sh -t ctt-test -e prod -m 1.0.201703a 
