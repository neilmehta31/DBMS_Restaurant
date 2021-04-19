from flask import Flask, request, jsonify
from flask_cors import CORS
import pymysql
import json

db = pymysql.connect(host='localhost',
        user='veer',
        password='mahavir',
        db='rest',
        charset='utf8mb4')

app = Flask(__name__)
CORS(app)

@app.route('/signup/customer', methods=['POST'])
def csignup():
    cursor = db.cursor()
    data = request.get_json()
    sql = "SELECT COUNT(*) FROM CUSTOMERS"
    cursor.execute(sql)
    usercount = cursor.fetchall()
    id = int(usercount[0][0])+1
    CUSTOMER_NAME = data['CUSTOMER_NAME']
    PASSWORD = data['PASSWORD']
    EMAIL = data['EMAIL']
    ADDRESS = data['ADDRESS']
    PHONE_NO = data['PHONE_NO']
    BILLING_AMT = data['BILLING_AMT']
    PEOPLE_ACCOMPANYING = data['PEOPLE_ACCOMPANYING']
    TIMESTAMP = data['TIMESTAMP']
    BENCH_NUM = data['BENCH_NUM']
    sql = "INSERT INTO CUSTOMERS VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s )"
    params = [id, CUSTOMER_NAME, EMAIL, PASSWORD, ADDRESS, PHONE_NO, BILLING_AMT, PEOPLE_ACCOMPANYING, TIMESTAMP, BENCH_NUM ]
    cursor.execute(sql,  params)
    db.commit()
    cursor.close()
    return "Success"

@app.route('/login/customer', methods=['POST'])
def clogin():
    cursor = db.cursor()
    data = request.get_json()
    email = data['EMAIL']
    password = data['PASSWORD']
    print(email,'<email and pass>',password)
    sql = "SELECT PASSWORD FROM CUSTOMERS WHERE EMAIL = %s"
    cursor.execute(sql, email)
    incomingpassword = cursor.fetchall()
    passwordmatch = incomingpassword[0][0]
    print(password, passwordmatch)
    cursor.close()
    if passwordmatch == password:
        return jsonify(True)
    else:
        return jsonify(False)
        

@app.route('/')
def home():
    return "success"


@app.errorhandler(404)
def not_found(error=None):
    message = {
    'status': 404,
    'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404
    return resp

if __name__ == '__main__':
    app.run(debug=True)