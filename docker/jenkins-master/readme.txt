To Build:

first pull the latest
docker pull jenkinsci/jenkins


Then build a local image
docker build -t engops-tools/jenkins-master .
(Note sometimes plugin randomly failed to download. Run until all plugins are successful.)

Test the image locally

To Publish: (test  test123)
 docker login hc-us-east-aws-artifactory.cloud.health.ge.com


 docker tag engops-tools/jenkins-master  hc-us-east-aws-artifactory.cloud.health.ge.com/jaas/jenkins-master:1.0.201611

 docker push  hc-us-east-aws-artifactory.cloud.health.ge.com/jaas/jenkins-master:1.0.201611

Always publish a latest

 docker tag engops-tools/jenkins-master  hc-us-east-aws-artifactory.cloud.health.ge.com/jaas/jenkins-master:latest
 docker push hc-us-east-aws-artifactory.cloud.health.ge.com/jaas/jenkins-master:latest




Install plugin via  curl 

curl -X POST -d '<jenkins><install plugin="xvfb@latest" /></jenkins>' --header 'Content-Type: text/xml' http://3.70.207.51/pluginManager/installNecessaryPlugins
