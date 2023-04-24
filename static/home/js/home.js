// 烟雾文字效果
function smoke() {
    const texts = document.querySelectorAll('.quote');
    for (let i = 0; i < texts.length; ++i) 
        texts[i].innerHTML = texts[i].textContent.replace(/\S/g, "<span>$&</span>");

    const letters = document.querySelectorAll(".quote span");
    for (let i = 0; i < letters.length; ++i) {
        letters[i].addEventListener('mouseover', function() {
            letters[i].classList.toggle('active');

            setTimeout(() => {
                letters[i].classList.toggle('active');
            }, 2500);
        });
    }
}
// submission
var submitButton = document.getElementById("submitButton");
var dflag = 0
submitButton.onclick = function() {
    dflag = 1 - dflag;
    var formalign = document.getElementById("formalign");
    if (dflag == 1) {
        jigsaw.init({
            el: document.getElementById('captcha'),
            width: 270,
            height: 180,
            onSuccess: function() {
                verify = recv;
            },
            onFail: function() {
                verify = recv + 1;
            },
            onRefrash: function() {

            }
        });
        formalign.style.display = "block";
    } 
    else {
        formalign.style.display = "none";
        document.getElementById('captcha').innerHTML = '';
    }
        
};

// submit score
var submitScore = document.getElementById("submitScore");
var submitForm = document.getElementById("submitForm");
// submit check
var submitFlag = true;
submitScore.onclick = function() {
    var username = document.getElementById("username");
    var bvNumber = document.getElementById("bvNumber");
    var title = document.getElementById("title");
    var score = document.getElementById("score");
    if (username.value == "" || bvNumber.value == "" || score.value == "") {
        submitFlag = false;
        if (!language_selection.checked)
            alert("请不要漏填信息！");
        else 
            alert("Please don't miss out information!");
        return false;
    }
    var numReg = /(^bv[0-9A-z]{10}$)|(^[\w\-+]{11}$)/i
    if (!bvNumber.value.match(numReg)) {
        submitFlag = false;
        if (!language_selection.checked) 
            alert("请输入正确格式的BV/YT号！");
        else 
            alert("Please input correct form of BV/YT SNum!");
        return false;
    }

    // 验证码
    if (verify != recv) {
        if (!language_selection.checked)
            alert('请确认正确滑动验证码！')
        else
            alert('Please confirm whether sliding verify code correctly!');
        return false;
    }
    var verify_code = document.getElementById("verify_code");
    verify_code.value = verify;

    var confirm_word = "是否提交成绩？";
    if (language_selection.checked)
        confirm_word = "Confirm Submission?";
    if (!confirm(confirm_word)) {
        return false;
    }

    // obtain time
    var submitTime = document.getElementById("submitTime");
    var submitDate = new Date();
    submitTime.value = submitDate.getFullYear()+"年" +
                    (submitDate.getMonth()+1)+"月" +
                    submitDate.getDate()+"日" + "-" +
                    submitDate.getHours()+"时" +
                    submitDate.getMinutes()+"分" +
                    submitDate.getSeconds()+"秒";
}

// 消息通知一会儿后消失
const info = document.querySelector("#info");
setTimeout(()=>{
    info.classList.toggle("disappear");
}, 20000);

// 菜单栏控制
const menu = document.querySelector(".menu");
const menuBtn = document.querySelector(".menu-btn");
const counters = document.querySelectorAll(".counter");

// toggle open / close menu
menuBtn.addEventListener("click", () => {
    menu.classList.toggle("menu-open");
});

// select all counters
counters.forEach(counter => {
    // Set counter values to zero
    counter.innerText = 0;
    // Set count variable to track the count
    let count = 0;

    // update count function
    function updateCount() {
        // Get counter target number to count to
        const target = parseInt(counter.dataset.count);
        // As long as the count is below the target number
        if (count < target) {
            count += 5;
            // Set the counter text to the count
            counter.innerText = count + "+";
            // Reapeat this every 10 ms
            setTimeout(updateCount, 10); // Count Speed
            // And when the target is reached
        } 
        else {
            // Set the counter text to the target number
            counter.innerText = target + "+";
        }
    }
    // Run the function initialy
    updateCount();
});
smoke();