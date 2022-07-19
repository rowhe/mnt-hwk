#!/usr/bin/bash

echo "**********************************"
echo "Stopping all unwanted containers"
echo "**********************************"
docker container ls|grep Up|awk '{print $11}'|xargs -l docker container stop
echo "**********************************"
echo "DONE"
echo "**********************************"
echo ----------------------------------
echo "**********************************"
echo "Starting containers"
echo "**********************************"
echo "Starting centos7 container"
echo "**********************************"
docker container run --rm -d --name centos7 centos:7 sleep 60000000
echo "**********************************"
echo "Starting ubuntu container"
echo "**********************************"
docker container run --rm -d --name ubuntu ubuntu:latest sleep 60000000
echo "**********************************"
echo "Starting fedora container"
echo "**********************************"
docker container run --rm -d --name fedora fedora:latest sleep 60000000
echo "**********************************"
echo "Starting Ansible playbook"
echo "**********************************"
ansible-playbook site.yml -i inventory/prod.yml 
echo "**********************************"
echo "Stopping all running containers"
echo "**********************************"
docker container ls|grep Up|awk '{print $11}'|xargs -l docker container stop
echo "**********************************"
echo "All DONE"
echo "**********************************"
