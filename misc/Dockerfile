FROM jenkins/jenkins:lts-jdk17

USER root
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org
# Update packages database, install rpm and deb build dependencies
RUN apt-get update && \
    apt-get install -y rpm debhelper && \
    install -d -m 0755 -o jenkins -g root /usr/share/jenkins/ref/jobs/metrics
    
# Minimal Jenkins Plugins
#RUN jenkins-plugin-cli --plugins git #workflow-aggregator

# Skip initial setup
#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Inject the packages build job
COPY config.xml /usr/share/jenkins/ref/jobs/metrics/config.xml

# Switch back to the Jenkins user
USER jenkins

