FROM python:3.14.6-slim-bookworm@sha256:4c92ffcde4dd6f1ff72a24518f49fd4990b27134987dfa31a733badde66df9f8

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
