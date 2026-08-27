FROM python:3.12-slim

WORKDIR /app

# Install dependencies
COPY pyproject.toml .
COPY src/ src/
COPY README.md .
COPY LICENSE .

RUN pip install --no-cache-dir -e ".[hosted]"

# Environment
ENV HOST=0.0.0.0
ENV PORT=10000
ENV FINSTACK_TRANSPORT=streamable-http
ENV FINSTACK_LOG_LEVEL=INFO

EXPOSE 10000
HEALTHCHECK NONE

CMD ["python", "-m", "finstack.server", "--transport", "streamable-http"]
