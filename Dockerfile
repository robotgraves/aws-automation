FROM robotgraves/virtualpython

RUN apt-get dist-upgrade -y
RUN apt-get update && apt-get install -qqy -y --no-install-recommends \
    curl zip unzip python-setuptools python-dev wget build-essential software-properties-common \
    python-pip \
    git ssh

ENV TERRAFORM_VERSION=0.11.7
ENV VAULT_VERSION=0.10.3

RUN curl --output /tmp/terraform.zip https://releases.hashicorp.com/terraform/"$TERRAFORM_VERSION"/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin
RUN terraform --version

RUN wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
RUN chmod +x ./jq
RUN cp jq /usr/bin

RUN pip install --upgrade awscli

RUN curl --output /tmp/vault.zip https://releases.hashicorp.com/vault/"$VAULT_VERSION"/vault_"$VAULT_VERSION"_linux_amd64.zip
RUN unzip /tmp/vault.zip -d /usr/local/bin
RUN vault --version
