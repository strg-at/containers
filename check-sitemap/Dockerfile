FROM python:3.11-slim-bookworm@sha256:838ff46ae6c481e85e369706fa3dea5166953824124735639f3c9f52af85f319

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
