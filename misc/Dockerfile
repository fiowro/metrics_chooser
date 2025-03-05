FROM jenkins/jenkins:lts-jdk17
COPY config.xml /var/lib/jenkins/jobs/dima-test1

USER root

# Update package lists and install necessary tools
RUN apt-get update && \
    apt-get install -y rpm debhelper

# Set root password
RUN echo 'root:abc123' | chpasswd

# Switch back to the Jenkins user
USER jenkins
