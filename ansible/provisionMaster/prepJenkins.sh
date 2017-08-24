# {{ ansible_managed }}

mkdir -p /var/jenkins_home
mkdir -p /var/jenkins_home/init.groovy.d 
chown -R jenkins:jenkins /var/jenkins_home


#plugins directory needs to be cleaned up, to prevent leftover classes problem for startup
rm -rf /var/jenkins_home/plugins





