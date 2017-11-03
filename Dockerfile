FROM centos:latest

RUN yum -y update
RUN yum -y install python-pip PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git which zip pylint

ENV PATH ~/.local/bin:$PATH

RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts
RUN pip install ansible==2.3.0.0
RUN pip install -U boto3
RUN pip install -U boto
RUN pip install --upgrade --user awscli
RUN pip install -U pytest
RUN pip install -U pytest-cov
RUN pip install -U pytest-html

# Install git-secret
RUN git clone https://github.com/awslabs/git-secrets.git
RUN cd git-secrets && make install

WORKDIR /data
# entry command
CMD ["/bin/bash"]
