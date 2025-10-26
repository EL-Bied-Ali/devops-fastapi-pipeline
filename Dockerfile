FROM python:3.12-slim AS base
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
FROM base AS runtime
COPY app/ /app/
EXPOSE 8000
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD wget -qO- http://127.0.0.1:8000/health || exit 1
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8000"]
