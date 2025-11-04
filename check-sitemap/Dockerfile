FROM python:3.14-slim-bookworm@sha256:e8ea0e4fc6f1876e7d2cfccc0071847534b1d72f2359cf0fd494006d05358faa

RUN apt update && apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install requests croniter

WORKDIR /app

RUN mkdir metrics

EXPOSE 8080

CMD ["python3", "main.py"]
