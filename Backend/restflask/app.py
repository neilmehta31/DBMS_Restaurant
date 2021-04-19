from flask import Flask, request, jsonify
from flask_cors import CORS
import pymysql
from datetime import datetime

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
    ENTRYTIME = datetime.now()
    BENCH_NUM = data['BENCH_NUM']
    EXITTIME = data['EXITTIME']
    # sql = "ALTER TABLE CUSTOMERS ADD COLUMN EXITTIME;"
    sql = "INSERT INTO CUSTOMERS VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )"
    params = [id, CUSTOMER_NAME, EMAIL, PASSWORD, ADDRESS, PHONE_NO, BILLING_AMT, PEOPLE_ACCOMPANYING, ENTRYTIME, BENCH_NUM, EXITTIME]
    cursor.execute(sql,  params)

    db.commit()
    cursor.close()
    return jsonify(True)

@app.route('/login/customer', methods=['POST'])
def clogin():
    cursor = db.cursor()
    data = request.get_json()
    email = data['EMAIL']
    password = data['PASSWORD']
    print(email,'<email and pass>',password)
    sql = "SELECT PASSWORD FROM CUSTOMERS WHERE EMAIL = %s"
    cursor.execute(sql, (email,))
    incomingpassword = cursor.fetchall()
    passwordmatch = incomingpassword[0][0]
    cursor.close()
    if passwordmatch == password:
        return jsonify(True)
    else:
        return jsonify(False)
        

@app.route('/bench',methods=['GET'])
def getbenchdetails():
    # cursor = db.cursor()
    # sql = "SELECT * FROM BENCH"
    # cursor.execute(sql)
    # tabledetails = cursor.fetchall()
    tabledetails = [1,2]
    return jsonify(tabledetails)


@app.route('/assignbench',methods=['POST'])
def assignbench():
    cursor = db.cursor()
    data = request.get_json()
    id = data["CUSTOMER_ID"]
    num = data["BENCH_NUM"]
    sql = "UPDATE BENCH SET ISOCCUPIED = 1 WHERE BENCH_NUM = %s"
    cursor.execute(sql, num)
    sql = "UPDATE CUSTOMERS SET BENCH_NUM = %s WHERE CUSTOMER_ID = %s"
    cursor.execute(sql, [num, id])
    db.commit()
    cursor.close()
    return jsonify(True)


@app.route('/takeorder',methods=['POST'])
def takeorder():
    cursor = db.cursor()
    data = request.get_json()
    bench = data["BENCH_NUM"]
    meal = data["MEAL_ID"]
    ordertime = datetime.now()
    sql = "SELECT COUNT(*) FROM BENCH_MEAL"
    cursor.execute(sql)
    orderIDtuple = cursor.fetchall()
    orderID = orderIDtuple[0][0]

    sql = "INSERT INTO BENCH_MEAL VALUES(%s,%s,%s,%s);"
    cursor.execute(sql, [orderID, bench, meal, ordertime])

    sql = " UPDATE MEAL SET QUANTITY_LEFT = QUANTITY_LEFT - 1 WHERE MEAL_ID = %s ;"
    cursor.execute(sql, (meal,))

    db.commit()
    cursor.close()
    return jsonify(True)


@app.route('/bill',methods=['POST'])
def computebill():
    cursor = db.cursor()
    data = request.get_json()
    id = data["CUSTOMER_ID"]
    sql = "UPDATE CUSTOMERS SET EXITTIME= %s WHERE CUSTOMER_ID = %s;"
    cursor.execute(sql, (datetime.now(), id) )
    sql = "SELECT BENCH_NUM FROM CUSTOMERS WHERE CUSTOMER_ID = %s;"
    cursor.execute(sql, (id,) )
    benchID = cursor.fetchall()
    bench_num = benchID[0][0]
    sql = """select a.bench_num, sum(b.meal_price) from bench_meal a inner join meal b on (a.meal_id = b.meal_id)
             where a.ordertime > (SELECT ENTRYTIME FROM CUSTOMERS WHERE BENCH_NUM = %s AND CUSTOMER_ID = %s) and 
             a.ordertime < (SELECT EXITTIME FROM CUSTOMERS WHERE BENCH_NUM = %s AND CUSTOMER_ID = %s)  and a.bench_num=%s;"""
    cursor.execute(sql, (bench_num, id, bench_num, id, bench_num))
    billamt = cursor.fetchall()
    sql = "UPDATE CUSTOMERS SET BILLING_AMT = %s WHERE CUSTOMER_ID = %s;"
    cursor.execute(sql, (int(billamt[0][1]), id) )

    sql = "UPDATE BENCH SET ISOCCUPIED = 0 WHERE BENCH_NUM = %s;"
    cursor.execute(sql, (bench_num,)) 

    db.commit()
    cursor.close()
    return jsonify(True)

@app.route('/addtables',methods=['POST'])
def addtabledetails():
    cursor=db.cursor()
    sql = "INSERT INTO BENCH VALUES(%s,0,NULL);"
    for i in range(30):
        cursor.execute(sql,i)
    db.commit()
    cursor.close()
    return jsonify(True)

@app.route('/menu',methods=['GET'])
def getmenu():
    cursor=db.cursor()
    sql = "SELECT * FROM MEAL;" #"where quantity > 0"
    cursor.execute(sql)
    menu = cursor.fetchall()
    cursor.close()
    return jsonify(menu)

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