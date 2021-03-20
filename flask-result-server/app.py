from flask import Flask, render_template, request
import pymysql

RDS_ENDPOINT = 'myapp.cnr20hoyd3cu.ap-northeast-2.rds.amazonaws.com'
RDS_PORT = 3306
RDS_USER = 'root'
RDS_PASSWORD = 'password'
RDS_DATABASE = 'humandb'
RDS_TABLE = 'applicant'

# ---------RDS Connect--------------
conn = pymysql.connect(
    host=RDS_ENDPOINT,
    port=RDS_PORT,
    user=RDS_USER,
    password=RDS_PASSWORD,
    db=RDS_DATABASE
)


# ----------RDS Select(SQL) Function---------
def getData(name, contact):
    cursor = conn.cursor()
    cursor.execute(f"SELECT result FROM {RDS_TABLE} where name='{name}' and contact={contact}")
    details = cursor.fetchall()
    return details


server = Flask(__name__)


@server.route('/', methods=['get'])
def home():
    try:
        name = request.args.get('name')
        contact = request.args.get('contact')
        print(name, contact, end=' / result : ')
        result = getData(name, contact)
        result = result[0][0]  # 리턴된 SQL데이터의 1번 1열 값 가져오기
        print(result)
        if result == 0:
            result = "No result yet"
        elif result == 1:
            result = "합격"
        elif result == 2:
            result = "불합격"
        else:
            result = "지원자를 찾을 수 없음"
    except:
        result = ''
    return render_template('result.html', result=result)