#!/bin/bash

sudo curl --silent --location -o /usr/local/bin/kubectl    https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.5/2022-01-21/bin/linux/amd64/kubectl
sudo chmod +x /usr/local/bin/kubectl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 
sudo yum -y install jq gettext bash-completion moreutils
echo 'yq() {
r run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
e -a ~/.bashrc && source ~/.bashrc
for command in kubectl jq envsubst aws;   do     which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND";   done
kubectl completion bash >>  ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
echo 'export LBC_VERSION="v2.4.1"' >>  ~/.bash_profile
echo 'export LBC_CHART_VERSION="1.4.1"' >>  ~/.bash_profile
.  ~/.bash_profile
history
