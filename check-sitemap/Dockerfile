FROM python:3.14-slim-bookworm@sha256:8a8d3341dfc71b7420256ceff425f64247da7e23fbe3fc23c3ea8cfbad59096d

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
