function showLoading() {
    let table = document.querySelector(".content");
    let _pagination = document.querySelector(".pagination");
    _pagination.innerHTML = ``;
    table.innerHTML = `
        <div class="loading"></div>
        <br>
    `;
}
function concealLoading() {
    let table = document.querySelector(".content");
    table.innerHTML = ``;
}

function checkSelectedSession() {
    let session_number = document.getElementById("session_number");
    let session_index = session_number.selectedIndex;
    session_value = session_number.options[session_index].value;
    if (+session_value >= 2)
        return true;
    return false;
}
function load_page() {
    showLoading();
    let session_number = document.getElementById("session_number");
    let session_number_index = session_number.selectedIndex;
    session_number_value = session_number.options[session_number_index].value;

    let choice = document.getElementById("choice");
    let choice_index = choice.selectedIndex;
    choice_value = choice.options[choice_index].value;

    fetch_scores(session_number_value, choice_value);
}
function load_track() {
    showLoading();
    let session_number = document.getElementById("session_number");
    let session_number_index = session_number.selectedIndex;
    session_number_value = session_number.options[session_number_index].value;

    // 每届赛道设置不同，需要动态加载
    xhr = new XMLHttpRequest();
    xhr.responseType = 'json';
    xhr.open('GET', '/load_track?session_number='+session_number_value);
    xhr.send();
    xhr.onreadystatechange= function() {
        if (xhr.readyState === 4) {
            if (xhr.status >= 200 && xhr.status < 300) {
                track_set = xhr.response.track_set;
                let choice = document.getElementById("choice");
                choice.innerHTML = "";
                for (let set = 0; set < track_set.length; ++set) {
                    choice.options.add(new Option(track_set[set], track_set[set]));
                }
                choice.options.add(new Option('待审核', '待审核'));
                choice.options.add(new Option('不通过', '不通过'));

                let options_list = choice.getElementsByTagName('option');
                for (let i = 0; i < options_list.length; ++i) {
                    let e = options_list[i];
                    e.setAttribute("la", e.value);
                    e.className += 'translate-innerhtml';
                }

                let choice_index = choice.selectedIndex;
                choice_value = choice.options[choice_index].value;

                fetch_scores(session_number_value, choice_value);
            }
        }
    };

}

window.onload = function() { load_track() };

let choice = document.getElementById("choice");
choice.onchange = function() { 
    load_page();
};

let session_number = document.getElementById("session_number");
session_number.onchange = function() { 
    load_track();
};