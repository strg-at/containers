FROM python:3.14-slim-bookworm@sha256:7ef4d5ec10b07d87c54d10941a3460c53b21c567b093e4f0bee56031f6e864f2

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
