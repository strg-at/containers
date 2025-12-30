FROM python:3.14-slim-bookworm@sha256:e8a1ad81a9fef9dc56372fb49b50818cac71f5fae238b21d7738d73ccae8f803

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
