#!/usr/bin/env bash


declare -a arr=("ace-editor" "amazon-ecr" "aws-credentials" "aws-java-sdk" "build-timestamp" "claim" "docker-traceability" "embeddable-build-status" "extended-choice-parameter" "extended-read-permission" "global-build-stats" "jenkins-multijob-plugin" "parallel-test-executor" "purge-build-queue-plugin" "purge-job-history" "radiatorviewplugin" "saferestart" "scriptler" "ssh-agent" "workflow-remote-loader" "xvfb" )
for i in "${arr[@]}"
do

echo "echo installing $i"
installTxt="<jenkins><install plugin=\""$i@latest"\" /></jenkins>"

echo "sleep 3"
echo curl -X POST -d \'$installTxt\' --header \'Content-Type: text/xml\' http://3.70.207.51/pluginManager/installNecessaryPlugins


done
	
