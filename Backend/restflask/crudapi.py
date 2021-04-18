import pymysql
from app import app
from db_config import mysql
from flask import jsonify
from flask import flash, request
from werkzeug import generate_password_hash, check_password_hash

@app.route('/user')
def user():
    try:
        conn=mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor)
        cur.execute("SELECT* from user;")
        rows=cur.fetchall()
        resp=jsonify(rows)
        resp.status_code=200
        return resp
    except Exception as e:
        print(e)    
    finally:
        cur.close()
        conn.close()

@app.errorhandler(404)
def not_found(error=None):
    message = {
    'status': 404,
    'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404
    return resp

if __name__ == "__main__":
    app.run()