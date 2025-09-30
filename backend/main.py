from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# 跨域配置（如果直接走Nginx反代，可以不用）
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/hello")
def hello():
    return {"message": "你好，这里是Python FastAPI返回的数据！"}

@app.get("/api/offer")
def offer():
    return {
        "message": "🎉 恭喜！已获得 75% 优惠券，请立即开始搭建你的网站吧！"
    }

## 启动命令： uvicorn main:app --host 0.0.0.0 --port 8000
# source venv/bin/activate