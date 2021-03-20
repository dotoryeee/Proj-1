from flask import Flask, render_template
import pymysql

RDS_ENDPOINT = 'testdb.cnr20hoyd3cu.ap-northeast-2.rds.amazonaws.com'
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





server = Flask(__name__)


@server.route('/')
def result():
    return render_template("result.html")
