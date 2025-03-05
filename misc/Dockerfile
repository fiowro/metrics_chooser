FROM jenkins/jenkins:lts-jdk17

USER root

# Update packages database, install rpm and deb build dependencies
RUN apt-get update && \
    apt-get install -y rpm debhelper && \
    install -d -m 0755 -o jenkins -g jenkins /var/jenkins_home/jobs/dima-test1

# Inject the packages build job
COPY --chown=jenkins:jenkins config.xml /var/jenkins_home/jobs/dima-test1/config.xml

# Switch back to the Jenkins user
USER jenkins

