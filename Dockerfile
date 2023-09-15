FROM alexsuf/postgres

LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

EXPOSE      9100

# Установите необходимые зависимости
RUN apt-get update && \
    apt-get install -y curl

# Загрузите Node Exporter
RUN curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz && \
    tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz && \
    mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin/ && \
    rm -rf node_exporter-1.2.2.linux-amd64*

COPY ./files/node_exporter.service /etc/systemd/system
RUN chmod 644 /etc/systemd/system/node_exporter.service

# Добавьте команду для запуска Node Exporter
#CMD ["node_exporter"]
