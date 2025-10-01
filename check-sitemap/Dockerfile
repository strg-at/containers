FROM python:3.11-slim-bookworm@sha256:6bd8610289ef042304ee370bd68ea2406acc9c2275505541c689df4cfc72314a

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
