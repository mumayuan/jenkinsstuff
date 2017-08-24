To Build:
docker build -t engops-tools/jenkins-nginx .



To Publish:
docker tag engops-tools/jenkins-nginx vortex.gso.med.ge.com:9000/engops-tools/jenkins-nginx:1.0 
docker push vortex.gso.med.ge.com:9000/engops-tools/jenkins-nginx:1.0

Always publish a latest
docker tag engops-tools/jenkins-nginx vortex.gso.med.ge.com:9000/engops-tools/jenkins-nginx:latest
docker push vortex.gso.med.ge.com:9000/engops-tools/jenkins-nginx:latest
