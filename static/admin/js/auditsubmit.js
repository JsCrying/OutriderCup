// 审核表单事件委托
const goAudit = document.querySelector('.content');
goAudit.onclick = function(ev) {
    ev = ev || window.event;
    let target = ev.target || ev.srcElement;
    if (target.classList.contains('go-audit')) {
        // console.log(goAuditList[i]);
        let formalign = document.getElementById("formalign");
        formalign.style.display = "block";

        // 打开审核表单的时候还要把数据自动填进去
        let clist = target.parentNode.parentNode.children;
        console.log(clist);

        // id
        let uid = document.getElementById("uid");
        uid.value = clist[0].value;
        // 用户名
        let username = document.getElementById("username");
        username.value = clist[1].value;
        // 视频BV/YT号
        let bvNumber = document.getElementById("bvNumber");
        bvNumber.value = clist[2].value;
        // 纸面成绩
        let score = document.getElementById("score");
        score.value = clist[3].value;
        // 赛道
        let track = document.getElementById("track");
        let track_options = track.getElementsByTagName("option");
        for (let i = 0; i < track_options.length; ++i) {
            if (track.options[i].value === clist[4].value) {
                track.selectedIndex = i;
                break;
            }
        }
        // 状态
        let status = document.getElementById("status");
        let status_options = status.getElementsByTagName("option");
        for (let i = 0; i < status_options.length; ++i) {
            if (status_options[i].value === clist[5].value) {
                status.selectedIndex = i;
                break;
            }
        }
        // 罚时原因
        let punish_reason = document.getElementById("punish_reason");
        punish_reason.value = clist[6].value;
        // 罚时秒数
        let punish_time = document.getElementById("punish_time");
        punish_time.value = clist[7].value;
        // 最终成绩
        let final_score = document.getElementById("final_score");
        final_score.value = clist[8].value;
        // 流派
        let tributary = document.getElementById("tributary");
        let tributary_options = tributary.getElementsByTagName("option");
        for (let i = 0; i < tributary_options.length; ++i) {
            if (tributary.options[i].value === clist[9].value) {
                tributary.selectedIndex = i;
                break;
            }
        }
        // 精彩时刻
        let ex_time = document.getElementById("ex_time");
        ex_time.value = clist[10].value;
        // 审核员
        let audit_admin = document.getElementById("audit_admin");
        audit_admin.value = current_audit;
        // 备注
        let remarks = document.getElementById("remarks");
        remarks.value = clist[12].value;
        // 审核时间
        let submitTime = document.getElementById("submitTime");
        let submitDate = new Date();
        submitTime.value = submitDate.getFullYear()+"年" +
                    (submitDate.getMonth()+1)+"月" +
                    submitDate.getDate()+"日" + "-" +
                    submitDate.getHours()+"时" +
                    submitDate.getMinutes()+"分" +
                    submitDate.getSeconds()+"秒";
    };
}

// 关闭审核表单
var submitReset = document.getElementById("submitReset");
submitReset.onclick = function() {
    let formalign = document.getElementById("formalign");
    formalign.style.display = "none";
};

// 确认提交表单
let submitScore = document.getElementById("submitScore");
submitScore.onclick = function() {
    if (!confirm(language == 'EN' ? "Confirm to submit result?" : "是否提交审核结果？")) {
        return false;
    }
    let uid = document.getElementById('uid');
    let username = document.getElementById('username');
    let bvNumber = document.getElementById('bvNumber');
    if (uid.value == '' && username.value == '' && bvNumber.value == '') {
        submitReset.click();
        return false;
    }
    return true;
};