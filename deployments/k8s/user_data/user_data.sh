#!/bin/bash
sudo apt-get update -y 
sudo apt-get install -y docker.io curl 
sudo systemctl enable docker
sudo systemctl start docker
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install -y kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl
sudo swapoff –a
sudo hostnamectl set-hostname master-node
sudo hostnamectl set-hostname worker01
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 > /tmp/join.txt

