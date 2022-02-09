/* 선택박스 css 변경 함수 */
function init() { //클릭시 test() 함수 실행
    var listfn = document.getElementsByClassName("listfn");

    listfn[0].classList.add("list_clicked");

    for(var i=0; i<listfn.length; i++) {
        listfn[i].addEventListener("click", changeColor);
    }
}
init();

// 클릭시 색상 변경
function changeColor(event) { 
    var listfn = document.getElementsByClassName("listfn");

    if(event.target.classList[1] === "list_clicked") {
        event.target.classList.add("list_clicked");
    } else {
        for(var i=0; i<listfn.length; i++) {
            listfn[i].classList.remove("list_clicked");
        }
        event.target.classList.add("list_clicked");
    }
}

// 표 클릭시 내용 변경
function textfn(text_num) {
    var inner_text = document.getElementsByClassName("inner_text");
    for (var i=0; i<inner_text.length; i++) {
        inner_text[i].style.display = 'none';
    }
    switch(text_num) {
        case '0':
            inner_text[0].style.display = 'block';
            break;
        case '1':
            inner_text[1].style.display = 'block';
            break;
        case '2':
            inner_text[2].style.display = 'block';
            break;
    }
}