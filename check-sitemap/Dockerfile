FROM python:3.14-slim-bookworm@sha256:883b949e1a4f7810a8a032f7df07a10160baccc7e68d824e369155e8ad3632fa

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
