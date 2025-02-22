FROM ubuntu:latest
LABEL name = "Radhe" 
ENV AWS_ACCESS_KEY_ID = "GFDSDFGHHGFDSDFG_as_like" \
    AWS_SECRET_KEY_ID = "FDFGHGFDFGHJHGFD_as_like" \ 
    AWS_DEFAULT_REGION = "us-west-2" 

ARG T_VERSION = "1.1.1.0" \
     P_VERSION = "4.5.2.0" 

RUN apt update && apt install -y  \
    jq net-tools curl wget unzip \
    && apt install -y nginx iputils_ping

RUN wget \ 
    && wget "Address_line of terraform and pation to go and downloads" \
    && unzip terraform_1.9.0_linux_amd64.zip && unzip packer_1.11.0_linux_amd64.zip \
    && chmod 777 terraform && chmod 777 packer \
    && ./terraform version && ./packer version



