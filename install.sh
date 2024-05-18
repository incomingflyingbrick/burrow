# # Add Docker's official GPG key:
# sudo apt-get update -y
# sudo apt-get install ca-certificates curl -y
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc

# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# sudo docker run hello-world

#install genv
sudo pip install genv
git clone https://github.com/run-ai/genv.git $HOME/genv

#!/bin/sh

# Define the file path
FILE="/etc/docker/daemon.json"

# Check if the file exists
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist. Creating a new one."
    # Create the file
    touch "$FILE"
    echo "{}" > "$FILE"  # Optionally, add basic JSON structure
    echo "$FILE has been created."
fi

# /etc/docker/daemon.json edit this file using editor
# {
#     "runtimes": {
#         "genv": {
#             "path": "/home/raz/genv/genv-docker/genv-container-runtime.py"
#         }
#     }
# }

# using dockerd to add run-time
# sudo dockerd --add-runtime genv=$HOME/genv/genv-docker/genv-container-runtime.py

##manually add docker runtime
# systemctl restart docker

# sudo cp -f $HOME/genv/genv-docker/genv-docker.sh /usr/local/bin/genv-docker

# genv-docker run --rm ubuntu env | grep GENV_

# genv-docker run -d --name bore_gpu -p 2222:22 --gpus 1 --gpu-memory 42mi python:3

# docker run --runtime=genv --rm -i -d -e GENV_GPUS=1 -e GENV_GPU_MEMORY=4g --name bore_gpu -p 2222:22 jyzisgod/python3:latest

# genv-docker run -i -d --rm -p 11434:11434 -p 2222:22 --gpus 1 --gpu-memory 512mi --entrypoint bash jyzisgod/python3:latest
# genv-docker run -d --rm --gpus 1 --gpu-memory 512mi --entrypoint bash python3

# docker exec -it bore_gpu apt update
# docker exec -it bore_gpu apt install -y openssh-server passwd
# docker exec -it bore_gpu sudo passwd
# docker exec -it bore_gpu service ssh start

# ./bore local 2222 --to ec2-13-230-209-21.ap-northeast-1.compute.amazonaws.com
