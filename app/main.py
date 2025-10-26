from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def root():
    return {"message": "CI/CD demo – version 1.111"}

@app.get("/health")
def health():
    return {"status":"ok"}

@app.get("/metrics")
def metrics():
    return {"uptime_sec": 1}
