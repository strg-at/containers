FROM python:3.14.6-slim-bookworm@sha256:a70519002c49552ea0a853de47599cf40479b001bd7a624f1112eaf44dcaccc7

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
