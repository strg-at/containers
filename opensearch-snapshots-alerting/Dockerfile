FROM python:3.15.2-slim-bookworm@sha256:4d54a654d391909a6c0de8035e15c01ad196d31e4a1552bb328bf1181e4d393a

RUN apt update

RUN useradd opensearch -m

USER opensearch

WORKDIR /app

COPY requirements.txt .

COPY main.py .

RUN pip install -r requirements.txt --user

CMD ["python", "main.py"]
