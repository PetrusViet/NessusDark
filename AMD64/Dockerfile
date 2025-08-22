FROM ubuntu:18.04

# Update and install dependencies
RUN apt-get update
RUN apt-get install -y net-tools iputils-ping tzdata curl

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

# Download and Install Nessus
RUN curl --request GET \
  --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.9.3-ubuntu1604_amd64.deb' \
  --output 'Nessus-10.9.3-ubuntu1604_amd64.deb'

RUN dpkg -i Nessus-10.9.3-ubuntu1604_amd64.deb

RUN rm Nessus-10.9.3-ubuntu1604_amd64.deb
# Expose Web GUI Port
EXPOSE 8834

ENTRYPOINT ["/opt/nessus/sbin/nessusd"]
