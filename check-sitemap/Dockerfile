FROM python:3.11-slim-bookworm@sha256:873f91540d53b36327ed4fb018c9669107a4e2a676719720edb4209c4b15d029

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
