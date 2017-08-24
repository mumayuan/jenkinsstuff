# Copy RSA to remote system for ssh to make a trusted connection
ssh-copy-id user@3.x.x.x


#if the docker host is not set up yet, run playbook  to set up the master
ansible-playbook  dockerResourceCentOS.yml  -i host.ini -v

#run playbook 
ansible-playbook  jenkinsMaster.yml  -i host.ini -v
