FROM python:3.14-slim-bookworm@sha256:ca37f982d2b16eec62d95f8a8f97a4d2df7a41e402e0587923eaa88bfa597887

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
