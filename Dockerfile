FROM amd64/debian:latest

LABEL CLOUD_PROVIDER aws
LABEL COMPONENTS "java8,kubectl,aws-cli,"
LABEL VERSION stable


RUN apt-get update && \
    apt-get install -y curl python-dev groff unzip libffi-dev libyaml-dev libssl-dev ca-certificates openssh-client default-jre && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    apt-get remove -y --purge curl && \
    apt-get remove -y --purge unzip && \
    apt-get autoremove -y --purge && \
    apt-get autoclean -y
