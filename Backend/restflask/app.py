from flask import Flask, request, jsonify
import pymysql

db = pymysql.connect(host='localhost',
        user='veer',
        password='mahavir',
        db='rest',
        charset='utf8mb4')

app = Flask(__name__)
# api = Api(app)

@app.route('/')
def someName():
    cursor = db.cursor()
    sql = "INSERT INTO MyUsers values('c','d');"
    cursor.execute(sql)
    db.commit()
    cursor.close()
    return "success"

if __name__ == '__main__':
    app.run(debug=True)