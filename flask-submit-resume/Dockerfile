FROM python:3.9.2-slim

WORKDIR /usr/src/app
ADD ./ ./

RUN python3 -m pip install -U pip
RUN pip3 install -r requirements.txt

EXPOSE 7000

ENTRYPOINT ["python3"]
CMD ["app.py"]