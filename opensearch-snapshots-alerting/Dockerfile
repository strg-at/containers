FROM python:3.15.1-slim-bookworm@sha256:9fa5b7003807c47fd10837c5b8b6713e9057de5f9be0d4179f6dae0c55acdf2d

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
