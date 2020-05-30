#!/bin/bash
echo "************************** Installing Docker CE *******************************************"
sudo sleep 3
sudo apt-get update
sudo apt-get install -y \
	    apt-transport-https \
	        ca-certificates \
		    curl \
		        software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository \
	   "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
	      $(lsb_release -cs) \
	         stable"
sudo apt-get update && apt-get install -y docker-ce
sudo usermod -aG docker $USER

echo "************************** Downloading Openshift Origin *************************************"
sudo sleep 3
sudo wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
sudo tar xvzf openshift*.tar.gz
cd openshift-origin-client-tools*/
sudo mv  oc kubectl  /usr/local/bin/
sudo oc version
sudo cat << EOF | sudo tee /etc/docker/daemon.json
{
    "insecure-registries" : [ "172.30.0.0/16" ]
}
EOF

sudo systemctl restart docker
#sudo oc cluster up --public-hostname=172.31.0.50
