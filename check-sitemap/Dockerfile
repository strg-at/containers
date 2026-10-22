FROM python:3.15-slim-bookworm@sha256:8c77b1d8f366eda6c7a66c292134d7bfb2672c1c6273262dd1a459532cbc6a96

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
