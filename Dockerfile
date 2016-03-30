FROM microimages/jdk

ENV HOME /var/jenkins_home

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/2.53/remoting-2.53.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave
ADD docker.tgz /usr/bin/

WORKDIR /var/jenkins_home
USER root

ENTRYPOINT ["jenkins-slave"]
