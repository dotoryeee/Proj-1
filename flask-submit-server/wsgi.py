from app import server

if __name__ == "__main__":
    #gunicorn이 사용할 8000포트를 오픈합니다
    server.run(host='0.0.0.0', port=8000)
