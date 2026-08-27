FROM python:3.12-slim

WORKDIR /app

COPY pyproject.toml .
COPY src/ src/
COPY README.md .
COPY LICENSE .

RUN pip install --no-cache-dir -e ".[hosted]"

ENV HOST=0.0.0.0
ENV FINSTACK_LOG_LEVEL=INFO

EXPOSE 10000

CMD ["python", "-m", "finstack.server", "--transport", "streamable-http"]
