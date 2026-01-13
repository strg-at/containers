FROM python:3.14-slim-bookworm@sha256:55b18d5d89ddb3ef534fe447f660a35832559c2361f8ea3985a5fcda95396f97

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
