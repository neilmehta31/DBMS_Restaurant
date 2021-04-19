from flask import Flask, request, jsonify
import pymysql
import datetime

db = pymysql.connect(host='localhost',
        user='veer',
        password='mahavir',
        db='rest',
        charset='utf8mb4')

app = Flask(__name__)

@app.route('/signup/customer', methods=['POST'])
def csignup():
    print("knalkd")
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
    
    #assign bench to customer.


    db.commit()
    cursor.close()
    return jsonify(True)

@app.route('/login/customer', methods=['POST'])
def clogin():
    cursor = db.cursor()
    data = request.get_json()
    email = data['EMAIL']
    password = data['PASSWORD']
    sql = "SELECT PASSWORD FROM CUSTOMERS WHERE EMAIL = %s"
    cursor.execute(sql, email)
    passwordmatch = cursor.fetchall()[0][0]
    print(password, passwordmatch)
    cursor.close()
    if passwordmatch == password:
        return jsonify(True)
    else:
        return "email/password does not match, please re-enter"


@app.route('/bench',methods=['GET'])
def getbenchdetails():
    cursor = db.cursor()
    sql = "SELECT * FROM BENCH"
    cursor.execute(sql)
    tabledetails = cursor.fetchall()
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
    sql = "SELECT MAX(ORDER_ID) FROM BENCH_MEAL "
    
    # orderID = 

    # sql = "UPDATE BENCH SET ISOCCUPIED = 1 WHERE BENCH_NUM = %s"
    # cursor.execute(sql, num)
    # sql = "UPDATE CUSTOMERS SET BENCH_NUM = %s WHERE CUSTOMER_ID = %s"
    # cursor.execute(sql, [num, id])
    # db.commit()
    # cursor.close()
    # return jsonify(True)

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
    return jsonify(menu)


@app.route('/')
def home():
    return "success"

if __name__ == '__main__':
    app.run(debug=True)






#takeorder
#bring the bill


# GIVE CUSTOMER A BUTTON TO BRING BILL
# ADD THIS TIME TO EXIT TIME OF CUSTOMER.

# WHEN CUSTOMER ORDERS A ORDER, ADD THAT TIME TO ORDERTIME IN BENCH_MEAL

# customer BILLING_AMT
#     BENCH_NUM IN BENCH_MEAL WHERE ORDERTIME (CORROSPONDING TO BENCHNUM OF THAT CUSTOMER) IS BETWEEN ENTRYTIME AND EXITTIME
#         mealID - prize, 1000
        # change isoccupied of bench to 0     
        # ADD CURRENT TIME TO EXIT TIME OF CUSTOMER

#     bench meal        3;30      4:30

#     orderID        101 102 103  104  105  106   107   108  109
#     BenchNUM         4   4   4    5   5    6     4
#     mealID           1   2   2    1   3   
#     ORDERTIME       4BAJE

#     meal_ingredient;
#     combo  101  102  103
#     meal       