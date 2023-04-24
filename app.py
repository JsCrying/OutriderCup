from flask import Flask, request, render_template, redirect, session, jsonify
from flask_cors import CORS
import random
import re

from routes.config import (
    tributary_list, 
    videoURL, 
    track_set, 
    session_number,
)
from routes.verify import (
    generate_raw,
    en_vcode,
    de_vcode
)
from routes.sql import (
    connect_db,
    sqlOperation,
    sqlRead,
    sqlRead_status
)
from routes.score_sort import (
    score_sort
)

app = Flask(__name__)
CORS(app, resources=r'/*', supports_credentials=True)

app.secret_key = 'JASONCRYING'
app.config['PERMANENT_SESSION_LIFETIME'] = 7200

# home page
@app.route('/', methods=['GET', 'POST'])
def home():
    global session_number
    # GET
    if request.method == 'GET':
        vcode = generate_raw()
        session['vcode'] = vcode
        msg = "您好！"
        arg = request.args
        if len(arg) > 0:
            msg = arg['msg']
        return render_template('home.html', msg=msg, vcode=en_vcode(vcode), track_set_list=track_set[session_number], session_number=session_number)
    # POST
    # obtain form information
    submitForm = request.form 
    username = submitForm.get("username").strip()
    bvNumber = submitForm.get("bvNumber")
    score = submitForm.get("score").strip()
    track = submitForm.get("track")
    submitTime = submitForm.get("submitTime")
    recv_vcode = de_vcode(int(submitForm.get("verify_code")))

    bvregex = re.compile('^[bB][vV][0-9A-z]{10}$')
    ytregex = re.compile('^[\w\-+]{11}$')
    if username == '' or bvNumber == '' or score == '' or track == '' \
        or (track not in track_set[session_number]):
        return redirect('/'+'?msg=别太离谱~')
    if (not session.get('vcode')) or (recv_vcode != session['vcode']):
        return redirect('/'+'?msg=验证码过期或故障~')
    if session.get('vcode'):
        del session['vcode']
    if bvregex.match(bvNumber):
        bvNumber = videoURL['bvURL'] + 'BV' + bvNumber[2:]

    elif ytregex.match(bvNumber):
        bvNumber = videoURL['ytURL'] + bvNumber
    else:
        return redirect('/'+'?msg=别太离谱~')
    # obtain id
    sql_id = '''SELECT * FROM forscore_%d;''' % (session_number)
    result = sqlRead(sql_id)
    id = 1
    if result is None:
        return redirect('/'+'?msg=没有这届杯赛的数据~')
    if len(result) > 0:
        record_id = []
        for item in result:
            record_id.append(item[0])
        id = max(record_id) + 1
    # 插入用户提交的作品信息到数据库
    sql = '''
        INSERT INTO forscore_%d (
            id,
            name,
            bvnumber,
            score,
            track,
            submittime,
            status,
            punish_time
        ) VALUES (
            "%d",
            "%s",
            "%s",
            "%s",
            "%s",
            "%s",
            "%s",
            "%d"
        );
    ''' % (session_number, id, username, bvNumber, score, track, submitTime, "待审核", 0)
    msg = sqlOperation(sql)
    return redirect('/'+'?msg='+msg)
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template("login.html")
    adminForm = request.form
    username = adminForm.get("username")
    pwd = adminForm.get("pass")
    language = adminForm.get("checkbox")
    if language not in ['CN', 'EN']:
        language = 'CN'
    sql = '''SELECT * FROM foradmin'''
    result = sqlRead(sql)
    if result is None:
        return render_template("login.html", msg='连接数据库失败导致的登录异常！')
    # 验证登录信息
    loginFlag = 0
    for item in result:
        if username == item[1] and pwd == str(item[2]):
            loginFlag = 1
            break
    if loginFlag == 1:
        session['language'] = language
        session['admin_info'] = username
        return redirect('/admin/'+username)
    else:
        return render_template("login.html", msg='用户名或密码输入错误！')
@app.route('/admin/<adminname>')
def admin(adminname):
    admin_info = session.get('admin_info')
    if not admin_info:
        return redirect('/login')
    return render_template("admin.html", language=session['language'], session_number=session_number, admin_name=session['admin_info'], track_set_list=track_set[session_number], tributary_list=tributary_list)
@app.route('/logout')
def logout():
    if session.get('admin_info'):
        del session['admin_info']
    return redirect('/login')
@app.route('/audit_table', methods=['GET'])
def audit_table():
    current_audit = session.get('admin_info')
    if not current_audit:
        return jsonify({
            'session': 'false',
            'ret_js': [],
            'current_audit': ''            
        })
    ret_js = []
    # print(result)
    try:
        ret_js.extend(sqlRead_status('待审核'))
        ret_js.extend(sqlRead_status('不通过'))
        ret_js.extend(sqlRead_status('已通过'))
    except Exception as e:
        if session.get('admin_info'):
            del session['admin_info']
        return jsonify({
            'session': 'false',
            'ret_js': [],
            'current_audit': ''          
        })
    
    return jsonify({
        'session': 'true',
        'ret_js': ret_js,
        'current_audit': current_audit            
    })
@app.route('/audit_submit', methods=['POST'])
def audit_submit():
    audit_submit_form = request.form
    uid = audit_submit_form.get("uid")
    username = audit_submit_form.get("username")
    bvNumber = audit_submit_form.get("bvNumber")
    score = audit_submit_form.get("score")
    track = audit_submit_form.get("track")
    status = audit_submit_form.get("status")
    punish_reason = audit_submit_form.get("punish_reason")
    punish_time = audit_submit_form.get("punish_time")
    final_score = audit_submit_form.get("final_score")
    tributary = audit_submit_form.get("tributary")
    ex_time = audit_submit_form.get("ex_time")
    audit_admin = audit_submit_form.get("audit_admin")
    remarks = audit_submit_form.get("remarks")
    submitTime = audit_submit_form.get("submitTime")
    
    db = connect_db('/login')
    # 提交审核数据
    global session_number
    sql_update = '''
        UPDATE forscore_%d SET score="%s",
            track="%s",
            status="%s",
            punish_reason="%s",
            punish_time="%d",
            final_score="%d",
            tributary="%s",
            ex_time="%s",
            audit="%s",
            remarks="%s" WHERE id="%d" AND name="%s" AND bvnumber="%s";
    ''' % (session_number, score, track, status, 
           punish_reason, int(punish_time), int(final_score), tributary,
           ex_time, audit_admin, remarks,
           int(uid), username, bvNumber
        )   
    cursor = db.cursor()
    cursor.execute(sql_update)
    db.commit()
    cursor.close()

    # 日志记录
    sql_logRead = '''SELECT * FROM forlog_%d;''' % (session_number)
    result_sqlRead = sqlRead(sql_logRead)
    if result_sqlRead is None:
        return redirect('/'+'?msg=日志提交失败，请联系开发者')
    id_log = len(result_sqlRead) + 1
    content_log = '@'+submitTime \
    +'@@'+audit_admin \
    +'@@@提交审核: { id: '+uid \
    +'; 用户名: '+username+'; 视频BV号: '+bvNumber \
    +'; 纸面成绩: '+score+'; 赛道: '+track+'; 状态: '+status \
    +'; 罚时原因: '+punish_reason+'; 罚时秒数: '+punish_time+'; 最终成绩: '+final_score+'; 使用流派: '+tributary \
    +'; 精彩时刻: '+ex_time+'; 备注: '+remarks+'; }'
    sql_log = '''
        INSERT INTO forlog_%d (
            id,
            audit,
            content
        ) VALUES (
            "%d",
            "%s",
            "%s"
        );
    ''' % (session_number, id_log, audit_admin, content_log)
    cursor = db.cursor()
    cursor.execute(sql_log)
    db.commit()
    cursor.close()
    
    db.close()

    current_audit = session.get('admin_info')
    if current_audit and (current_audit == audit_admin):
        return redirect('/admin/'+current_audit)
    else:
        return redirect('/login')
@app.route('/log', methods=['GET'])
def log():
    global session_number
    sql = '''SELECT * FROM forlog_%d;''' % (session_number)
    result = sqlRead(sql)
    if result is None:
        return render_template('log.html', log_list=[])
    log_list = []
    for item in result:
        log_list.append(item[2])
    return render_template('log.html', log_list=log_list)
@app.route('/score', methods=['GET'])
def score():
    return render_template('score.html', session_number=session_number, tributary_list=tributary_list)
@app.route('/fetch')
def fetch():
    session_number = int(request.args['session_number'])
    choice_value = request.args['choice_value']

    result = []
    if choice_value in track_set[session_number]:
        sql = '''
            SELECT * FROM forscore_%d WHERE (
                status="已通过" AND track="%s"
            );
        ''' % (session_number, choice_value)
        try:
            result = list(sqlRead(sql))
        except Exception:
            print('不存在这一届！')
            result = []
        for i in range(len(result)):
            item = list(result[i])
            result[i] = item
        # 排序
        score_sort(result, [session_number, choice_value])
        # print(result)
    elif choice_value == '不通过' \
        or choice_value == '待审核':
        sql = '''SELECT * FROM forscore_%d WHERE (status="%s");''' % (session_number, choice_value)
        try:
            result = sqlRead(sql)
        except Exception:
            print('不存在这一届！')
            result = []
        # print(result)
    else:
        print('查看成绩过程出错！')
    ret = []
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
    return jsonify({
        'fetch_list': ret,
        'choice_value': choice_value
    })
@app.route('/load_track')
def load_track():
    session_number = int(request.args['session_number'])
    track_set_list = track_set[session_number]
    return jsonify({
        'track_set': track_set_list
    })
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='443')
    # app.run()