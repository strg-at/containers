FROM python:3.14-slim-bookworm@sha256:980c03657c7c8bfbce5212d242ffe5caf69bfd8b6c8383e3580b27d028a6ddb3

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
