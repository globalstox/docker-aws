FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y python3-pip curl gnupg wget jq

RUN pip3 install awscli
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x aws-iam-authenticator && \
    mv aws-iam-authenticator /usr/local/bin/.

RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update
RUN apt-get install -y kubectl
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
RUN tar -zxvf helm-v2.13.1-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 helm-v2.13.1-linux-amd64.tar.gz
