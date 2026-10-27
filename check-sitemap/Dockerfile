FROM python:3.15-slim-bookworm@sha256:4d54a654d391909a6c0de8035e15c01ad196d31e4a1552bb328bf1181e4d393a

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
