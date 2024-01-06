#!/bin/bash

#for master-node
sudo hostnamectl set-hostname master-node
sudo apt update
sudo apt-get install -y apt-transport-https curl

# Adding the Kubernetes GPG Key on each ubuntu system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Finally, run the sudo apt update command again to force apt to read the new package repository list and ensure all 
# of the latest packages available for installation.
sudo apt update
# kubeadm does not support swap. so you need to turn if off.
sudo sed -i '/ swap / s/^(.*)$/#\1/g' /etc/fstab
Removing a Swap File #
To deactivate and remove the swap file, follow these steps:

Deactivate the swap space by typing:

sudo swapoff -v /swapfile
Remove the swap entry /swapfile swap swap defaults 0 0 from the /etc/fstab file.

Delete the actual swapfile file with rm:

sudo rm /swapfile
#bridge
modprobe br_netfilter
echo '1' > /proc/sys/net/ipv4/ip_forward

#docker installation
apt install docker.io

# Adding the Kubernetes GPG Key on each ubuntu system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Adding the Kubernetes repository on each ubuntu system
 sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
# Installing the kubeadm kubelet kubectl package/tool on each ubuntu machine.
sudo apt-get install kubeadm kubelet kubectl

#change docker daemon
cat > /etc/docker/daemon.json <<EOF
{
"exec-opts": ["native.cgroupdriver=systemd"],
"log-driver": "json-file",
"log-opts": {
"max-size": "100m"
},
"storage-driver": "overlay2",
"storage-opts": [
"overlay2.override_kernel_check=true"
]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d
systemctl daemon-reload
systemctl restart docker
#for worker-nodes

sudo hostnamectl set-hostname worker1-node
sudo apt update
sudo apt-get install -y apt-transport-https curl

# Adding the Kubernetes GPG Key on each ubuntu system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Finally, run the sudo apt update command again to force apt to read the new package repository list and ensure all 
# of the latest packages available for installation.
sudo apt update
# kubeadm does not support swap. so you need to turn if off.
sudo sed -i '/ swap / s/^(.*)$/#\1/g' /etc/fstab
# Installing the kubeadm kubelet kubectl package/tool on each ubuntu machine.
sudo apt-get install kubeadm kubelet kubectl

#change docker daemon
cat > /etc/docker/daemon.json <<EOF
{
"exec-opts": ["native.cgroupdriver=systemd"],
"log-driver": "json-file",
"log-opts": {
"max-size": "100m"
},
"storage-driver": "overlay2",
"storage-opts": [
"overlay2.override_kernel_check=true"
]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d
systemctl daemon-reload
systemctl restart docker



******
to run 
kubeadm token create --print-join-command or kubectl you will need to go back to root. 
root@master-node:/home/mxue# cd
root@master-node:~# kubectl get nodes
NAME           STATUS     ROLES                  AGE   VERSION
master-node    NotReady   control-plane,master   17h   v1.22.1
worker1-node   Ready      <none>                 17h   v1.22.1
root@master-node:~# kubeadm token creation --print-join-command
unknown flag: --print-join-command
To see the stack trace of this error execute with --v=5 or higher
root@master-node:~# kubeadm token create --print-join-command
kubeadm join 192.168.1.9:6443 --token dtxmyi.zmc0xq3jllnse17a --discovery-token-ca-cert-hash sha256:99d1d97fa618c5c4428cde1bdf899aa71b995b3ba603f72f27e533c2a2a40053 
root@master-node:~# 




******
#for worker2-nodes
sudo hostnamectl set-hostname worker1-node
sudo apt update
sudo apt-get install -y apt-transport-https curl

# Adding the Kubernetes GPG Key on each ubuntu system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Finally, run the sudo apt update command again to force apt to read the new package repository list and ensure all 
# of the latest packages available for installation.
sudo apt update
# kubeadm does not support swap. so you need to turn if off.
sudo sed -i '/ swap / s/^(.*)$/#\1/g' /etc/fstab
# Installing the kubeadm kubelet kubectl package/tool on each ubuntu machine.
sudo apt-get install kubeadm kubelet kubectl

#change docker daemon
cat > /etc/docker/daemon.json <<EOF
{
"exec-opts": ["native.cgroupdriver=systemd"],
"log-driver": "json-file",
"log-opts": {
"max-size": "100m"
},
"storage-driver": "overlay2",
"storage-opts": [
"overlay2.override_kernel_check=true"
]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d
systemctl daemon-reload
systemctl restart dockerZZ