from flask import Flask, render_template
from flask_mysqldb import MySQL

server = Flask(__name__)

server.config["MYSQL_HOST"] = 'testdb.cnr20hoyd3cu.ap-northeast-2.rds.amazonaws.com'
server.config['MYSQL_USER'] = "root"
server.config["MYSQL_PASSWORD"] = "password"
server.config["MYSQL_DB"] = "humandb"

mysql = MySQL(server)


@server.route('/')
def submit():
    cur = mysql.connection.cursor()
    cur.execute("select * from applicant;")
    rv = cur.fetchall()
    print(str(rv))
    return render_template("submit.html")


def echo_test():
    return 'success'
