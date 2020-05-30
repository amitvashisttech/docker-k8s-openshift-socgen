# OpenShift Origin Installation 

## For the Setup we'll be Required the follwing:
- GCP Account 
- Provsion the firewall rule to open the following ports
  - Port 80, 443
  - Port 8443, 6443
  - Port Range 30000 - 33000
- Now provion the VM 
  - Name : Openshift
  - Image: Ubuntu:18.04
  - Type : n2-standard or 2vCPU & 8 GB RAM Instance
  - Disk : 20GB
  - Networking : Allow 80 & 443, Also attach the earlier created firewall 
  
## Now we need to install Docker CE & Openshift Orign

### Let me the clone the my Git Repo
```
git clone https://github.com/amitvashisttech/docker-k8s-openshift-socgen.git 
```

### Now run the install openshift script.
```
cd docker-k8s-openshift-socgen/ openshift
./install-openshift.sh 
```
```
oc version 
```

## Bring up the cluster on FQDN

### Let's check the fqdn
```
hostname -f 
```

### Lets start the clutser with oc cluster up command
```
 oc cluster up --public-hostname='openshit.us-central1-a.c.cool-beanbag-272708.internal'
```

### In order to resolve the 127.0.0.1, we'll bring down the cluster & update the config with fqdn & brng back once again.
```
  oc  cluster down
```

### Replace server http://127.0.0.1:8443 to http://fqdn:8443
``` 
vi ./openshift.local.clusterup/openshift-controller-manager/openshift-master.kubeconfig 
```  

### Start the Cluster
```
oc cluster up --public-hostname='openshit.us-central1-a.c.cool-beanbag-272708.internal' 
```


## Update your windows Local Resolver /etc/hosts
```
edit C:\Windows\System32\drivers\etc\hosts
PublicIp  Fqdn
```

## Now you can access openshift console from you browser
Image: 
