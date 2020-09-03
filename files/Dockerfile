FROM fedora:latest

RUN dnf upgrade -y
RUN dnf install -y \
    wget \
    unzip 

RUN wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip && \
unzip terraform_0.12.0_linux_amd64.zip && \
mv terraform /usr/local/bin && \
rm  terraform_0.12.0_linux_amd64.zip

RUN mkdir -p ~/.terraform.d/plugins && \
cd ~/.terraform.d/plugins && \
wget https://github.com/IBM-Cloud/terraform-provider-ibm/releases/download/v1.11.0/linux_amd64.zip && \
unzip linux_amd64.zip

COPY terraformrc ~/.terraformrc

WORKDIR /mnt
