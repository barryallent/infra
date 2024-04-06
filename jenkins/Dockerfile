# docker build  -t barryallenat/jenkins:jdk17 .
#docker push barryallenat/jenkins:jdk17
#custom jenkins image that has docker installed
FROM jenkins/jenkins:jdk17

# Install Docker CLI
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean
USER jenkins

