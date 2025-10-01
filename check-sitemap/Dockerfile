FROM python:3.11-slim-bookworm@sha256:3cefba85cd47b4ff9cd1daea162d567531069d307716a82ef07a4290e74f1e17

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
