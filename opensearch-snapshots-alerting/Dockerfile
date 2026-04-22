FROM python:3.14.4-slim-bookworm@sha256:a28fb284c750940c714dba2e0cf5a26e5121c3c5ed06e9ca8bcfeaaba701b614

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
