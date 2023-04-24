from flask import redirect
import pymysql

from .config import (
    session_number
)

def connect_db(url=None):
    try:
        db = pymysql.connect(host='localhost',
                        user='root',
                        password='7758258yzh',
                        database='ioc',
                        charset='utf8')
    except Exception as e:
        print("连接失败")
        if url:
            return redirect(url)
        else:
            return None
    return db
# 提交成绩到数据库
def sqlOperation(sql):
    db = connect_db()
    if not db:
        return "连接数据库失败导致的提交失败"
    # print("数据库连接成功！")
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        db.commit()
        cursor.close()
        db.close()
        return "提交成功，感谢您的积极参与！(*^▽^*)"
    except Exception as e:
        return "提交失败"
# 根据sql语句读取数据库，
# 并以元组形式返回数据库读取结果
def sqlRead(sql):
    db = connect_db()
    if not db:
        return None
    # print("数据库连接成功！")
    cursor = db.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result
# 根据状态排列读取
def sqlRead_status(status):
    global session_number
    sql = '''SELECT * FROM forscore_%d WHERE status="%s";''' % (session_number, status)
    ret = []
    result = sqlRead(sql)
    if result is None:
        return None
    if session_number >= 2:
        for item in result:
            id = item[0]
            name = item[1]
            bvnumber = item[2]
            score = item[3]
            track = item[4]
            status = item[6]
            punish_reason = item[7]
            punish_time = item[8]
            final_score = item[9]
            tributary = item[10]
            ex_time = item[11]
            audit_admin = item[12]
            remarks = item[13]
            ret_item = {
                'id': id,
                'name': name,
                'bvnumber': bvnumber,
                'score': score,
                'track': track,
                'status': status,
                'punish_reason': punish_reason,
                'punish_time': punish_time,
                'final_score': final_score,
                'tributary': tributary,
                'ex_time': ex_time,
                'audit_admin': audit_admin,
                'remarks': remarks
            }
            ret.append(ret_item)
    else:
        for item in result:
            id = item[0]
            name = item[1]
            bvnumber = item[2]
            score = item[3]
            track = item[4]
            status = item[6]
            punish_reason = item[7]
            punish_time = item[8]
            final_score = item[9]
            ex_time = item[10]
            audit_admin = item[11]
            remarks = item[12]
            ret_item = {
                'id': id,
                'name': name,
                'bvnumber': bvnumber,
                'score': score,
                'track': track,
                'status': status,
                'punish_reason': punish_reason,
                'punish_time': punish_time,
                'final_score': final_score,
                'ex_time': ex_time,
                'audit_admin': audit_admin,
                'remarks': remarks
            }
            ret.append(ret_item)
        
    return ret