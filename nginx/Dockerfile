FROM nginx:1.15.8
#기본 nginx 설정 삭제후 내 세팅 적용
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/