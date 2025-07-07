FROM python:3.11-slim-bookworm

RUN apt update && apt upgrade -y && apt install gettext cron netcat-traditional -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests

WORKDIR /app

RUN mkdir metrics && chmod +x /app/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/app/entrypoint.sh"]
