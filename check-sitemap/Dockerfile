FROM python:3.14-slim-bookworm@sha256:e87711ef5c86aaeaa7031718a69db79d334d94c545c709583f651b8185870941

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
