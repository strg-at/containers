FROM python:3.14-slim-bookworm@sha256:beb612b6c3f2c1d618d17ec5ce25a0f3dcb8d58b61f9b69abb7ad9fa413da3d0

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
