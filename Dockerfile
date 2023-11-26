from debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

ARG ntype=""
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2

RUN apt-get update && \
apt-get install -y vim wget curl && \
apt-get install -y --no-install-recommends openjdk-11-jre

RUN wget https://artifacts.opensearch.org/releases/bundle/opensearch/2.11.0/opensearch-2.11.0-linux-x64.deb
RUN dpkg -i opensearch-2.11.0-linux-x64.deb
RUN apt-get install -y systemd

COPY ./node-${ntype}/opensearch.yml /etc/opensearch/
COPY ./opensearch-security/ /etc/opensearch/opensearch-security/

RUN systemctl enable opensearch
ENTRYPOINT [ "/sbin/init" ] 
CMD [ "systemctl", "start", "opensearch" ]
