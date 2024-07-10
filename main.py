# main.py

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def app():
    return {"message": "Hello World"}
