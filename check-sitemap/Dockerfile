FROM python:3.14-slim-bookworm@sha256:5d17fc066275d26bb2ffe05bc89367dc665310200b5f4cfa8b294e97dc679bff

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
