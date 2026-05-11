FROM python:3.14-slim-bookworm@sha256:cba2eed20b946f0fcf51f2e736f00b71921884b0704b4301febf8d01032b1792

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
