FROM python:3.15.2-slim-trixie@sha256:63bb298d2b7b88f176f51b5189f54ce6535c997682ea70885d2132f5d473a8a5 AS build

COPY --from=ghcr.io/astral-sh/uv:0.13.10@sha256:a3ea1357342c1a4bf9a0c53a3deb1b55379aefa037338d8113d5771efa01774f /uv /uvx /bin/

WORKDIR /app

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE="copy"
ENV UV_NO_CACHE=1
ENV UV_PYTHON_DOWNLOADS=0

COPY pyproject.toml uv.lock ./

RUN uv sync --locked --no-dev --no-install-project

FROM python:3.15.2-slim-trixie@sha256:63bb298d2b7b88f176f51b5189f54ce6535c997682ea70885d2132f5d473a8a5 AS production

WORKDIR /app

COPY --from=build /app/.venv ./.venv
COPY main.py .

RUN useradd -m opensearch

USER opensearch

ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONUNBUFFERED=1

CMD ["python", "main.py"]
