FROM centos:latest

RUN yum -y update
RUN yum -y install \
  python-pip \
  python-wheel \
  PyYAML \
  python-jinja2 \
  python-httplib2 \
  python-keyczar \
  python-paramiko \
  python-setuptools \
  python-devel \
  git \
  which \
  zip \
  gcc \
  gcc-c++ \
  pylint

ENV PATH ~/.local/bin:$PATH

RUN easy_install pip
RUN pip install -U ansible==2.3.0.0
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
