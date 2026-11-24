FROM python:3.15.2-slim-bookworm@sha256:498829c717b1e59fc42f0e7865eafe4e04ca0f70a3769d4ae70ba218df54507c

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
