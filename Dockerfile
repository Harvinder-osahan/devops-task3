
RUN echo "enabled=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "repo_gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" >> /etc/yum.repos.d/kubernetes.repo

RUN yum install -v -y kubectl

COPY ca.crt /root/.kube/ca.crt
COPY client.crt /root/.kube/client.crt
COPY client.key /root/.kube/client.key


COPY  config    /root/.kube/config

EXPOSE 8080
CMD java -jar /usr/lib/jenkins/jenkins.war

