# docker build  -t barryallenat/jenkins:jdk17 .
#docker push barryallenat/jenkins:jdk17
#custom jenkins image that has docker installed
FROM jenkins/jenkins:jdk17

# Install Docker CLI
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

#install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN    chmod +x ./kubectl;
RUN    mv ./kubectl /usr/local/bin/kubectl

#install helm
RUN                curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN                chmod 700 get_helm.sh
RUN                ./get_helm.sh

#install ansible
RUN apt install software-properties-common -y
RUN apt update -y
RUN apt install ansible -y

#install docker and aws-cli
RUN apt-get install -y \
        vim \
        docker.io \
    &&  apt-get clean \
    &&  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    &&  unzip awscliv2.zip \
    &&  ./aws/install \
    &&  rm -rf \
        awscliv2.zip \
    && apt-get -y purge unzip

USER jenkins

