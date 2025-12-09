FROM python:3.14-slim-bookworm@sha256:1f3bc1dcbdc23f54cf2e9a5a8428db4a5f28c53636dec4964c7ae35eb1ebd192

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
