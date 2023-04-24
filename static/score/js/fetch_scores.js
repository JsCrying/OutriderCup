function construct(items) {
    const size = 5,
    page = Math.ceil(items.length / size),
    pagerCount = 8;

    // 当前选中的页数
    let current = 1;
    // 显示内容列表
    const _content = document.querySelector(".content");
    const showContent = () => {
        // 每次遍历新内容 首先清空
        _content.innerHTML = "";
        let tr_head = document.createElement("tr");
        function createHead(tr, head) {
            let th_head = document.createElement("th");
            th_head.innerHTML = head;
            th_head.setAttribute("la", head);
            th_head.className += 'translate-innerhtml';
            tr.appendChild(th_head);

            return th_head;
        }
        createHead(tr_head, '排名');
        createHead(tr_head, '用户名');
        createHead(tr_head, 'BV/YT号');
        createHead(tr_head, '纸面成绩');
        createHead(tr_head, '罚时原因');
        createHead(tr_head, '罚时秒数');
        createHead(tr_head, '最终成绩');
        if (checkSelectedSession()) {
            createHead(tr_head, '使用流派');
        }
        createHead(tr_head, '精彩时刻');
        createHead(tr_head, '审核员');
        createHead(tr_head, '备注');
        _content.appendChild(tr_head);

        if (items.length == 0) return false;

        items.forEach((item, index) => {
            // 遍历计算方法 当前为第1页 一页5个 第一页的数据就是 0 - 5(不包含) 第二页为 5 - 10(不包含) 以此类推
            if (index >= (current - 1) * size && index < current * size) {

                let tr_body = document.createElement("tr");
                function createBody(tr, body, class_name = null) {
                    let td_body = document.createElement("td");
                    td_body.innerHTML = body;
                    if (class_name) {
                        td_body.className += class_name;
                        td_body.setAttribute("la", body);
                    }
                    tr.appendChild(td_body);
                }
                let rank = index + 1;
                createBody(tr_body, rank);
                createBody(tr_body, item['name']);
                let snum = item['bvnumber'].split('/');
                snum = snum[snum.length-1];
                let bvNumber_body = `<div class="bv-a"><a href="${item['bvnumber']}" target="_blank" style="white-space: nowrap;">${snum}</a></div>`;
                createBody(tr_body, bvNumber_body);
                createBody(tr_body, item['score']);
                createBody(tr_body, item['punish_reason']);
                createBody(tr_body, item['punish_time']);
                createBody(tr_body, item['final_score']);
                if (checkSelectedSession()) {
                    createBody(tr_body, item['tributary'], "translate-innerhtml");
                }
                createBody(tr_body, item['ex_time']);
                createBody(tr_body, item['audit_admin']);
                createBody(tr_body, item['remarks']);
                // 添加到列表元素中
                _content.appendChild(tr_body);

            }
        });
    };
    // 创建分页列表
    const _pagination = document.querySelector(".pagination");
    const createPagination = () => {
        _pagination.innerHTML = "";
        if (showContent() == false) return false;

        // 刚开始就要有左按钮
        // 当前页数不为1就为可点击态
        let lis = `
        <li class="material-icons page-btn page-btn-prev ${
            current !== 1 ? "isClick" : ""
        }">
        keyboard_arrow_left
    </li>`;

        if (current < 1 || current > page) {
            throw `current 参数最小值为1 最大值为${page}`;
            // 当当前页数小于1或者大于总页数了就抛出错误
        } else if (pagerCount < 5) {
            throw "pagerCount 参数最小值为5";
            // 小于5 分页无意义
        } else if (page <= pagerCount) {
            // 如果总页数小于了要显示的数字按钮个数 就直接遍历了 不需要显示省略按钮
            for (let i = 1; i <= page; i++) {
                lis += `<li class="page-number ${
                    i == current ? "active" : ""
                }">${i}</li>`;
            }
        } else {
            // 定义两个参数
            // 用来保存当前选中分页前后的显示数字按钮(不包括省略前后的和选中的) 刚好是以下计算方法
            // 有问题 pagerCount 为偶数 显示小数点 将beforeNumber向下取整就可以了
            let beforeNumber = Math.floor(current - (pagerCount - 3) / 2),
                afterNumber = current + (pagerCount - 3) / 2;
            // 显示左省略按钮
            if (current >= pagerCount - 1) {
                lis += `<li class="page-number">1</li>
                <li class="material-icons page-dot page-dot-prev"></li>`;
            }
            // 提出问题: 选中页数为1 显示了0
            // 解决 当页数为1 将beforeNumber改为1 afterNumber为除去省略号后面的一个按钮
            // 同理解决current == page
            // 又有问题 点击前三个应该不分页 到 4(针对pagerCount参数来说) 了该分页 同理求得current == page
            if (current >= 1 && current < pagerCount - 1) {
                beforeNumber = 1;
                afterNumber = pagerCount - 1;
            } else if (current <= page && current > page - (pagerCount - 2)) {
                beforeNumber = page - (pagerCount - 2);
                afterNumber = page;
            }

            for (let i = beforeNumber; i <= afterNumber; i++) {
                lis += `<li class="page-number ${
                    i == current ? "active" : ""
                }">${i}</li>`;
            }
        }
        // 显示右省略按钮
        if (current <= page - (pagerCount - 2)) {
            lis += `
            <li class="material-icons page-dot page-dot-next"></li>
            <li class="page-number">${page}</li>`;
        }

        // 最后拼接右按钮
        // 当前页数不是总页数就为可点击态
        lis += `
        <li class="material-icons page-btn page-btn-next ${
            current !== page ? "isClick" : ""
        }">
        keyboard_arrow_right
    </li>`;
        _pagination.innerHTML = lis;

        // OK 分页已经没问题了 改变参数均没问题 随意修改

        // 点击数字按钮
        const _pageNumbers = document.querySelectorAll(".page-number");
        _pageNumbers.forEach((item) => {
            item.addEventListener("click", () => {
                // item.innerHTML为字符串 需要转为数字
                current = parseInt(item.innerHTML);
                createPagination();
            });
        });

        // 下一页
        const _pageBtnNext = document.querySelector(".page-btn-next");
        _pageBtnNext.addEventListener("click", () => {
            if (current !== page) {
                current++;
                createPagination();
            }
        });

        // 上一页
        const _pageBtnPrev = document.querySelector(".page-btn-prev");
        _pageBtnPrev.addEventListener("click", () => {
            if (current !== 1) {
                current--;
                createPagination();
            }
        });

        // 前进 pagerCount - 2 格
        const _pageDotNext = document.querySelector(".page-dot-next");
        // 因为省略按钮会时隐时现 直接绑定会报找不到元素错误
        // ?. 就可以了 只有元素存在再去绑定后面的事件
        _pageDotNext?.addEventListener("click", () => {
            current += pagerCount - 2;
            createPagination();
        });

        // 后退 pagerCount - 2 格
        const _pageDotPrev = document.querySelector(".page-dot-prev");
        _pageDotPrev?.addEventListener("click", () => {
            current -= pagerCount - 2;
            createPagination();
        });

        language_translate(); 
    };
    createPagination();
    language_translate(); 
}

function fetch_scores(session_number_value, choice_value) {
    xhr = new XMLHttpRequest();
    xhr.responseType = 'json';
    xhr.open('GET', '/fetch?session_number='+session_number_value+'&choice_value='+choice_value);
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status >= 200 && xhr.status < 300) {
                let items = xhr.response.fetch_list;
                construct(items);         
            }
        }
    };
}