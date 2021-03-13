FROM python:3.9.2-alpine
#최소 사이즈를 위해 alpine빌드를 베이스 이미지로 가져갑니다
WORKDIR usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 7000
#캐시를 사용하지 않아 이미지를 최소화 합니다
COPY ./ ./