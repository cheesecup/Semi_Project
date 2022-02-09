var imgArray = new Array();
imgArray[0] = "resources/image/m1.PNG";
imgArray[1] = "resources/image/m2.PNG";
imgArray[2] = "resources/image/m3.PNG"; 

var obTimeOut;

var nImgCnt = 0;

function rotateImg() {
    nImgCnt++;

    if (nImgCnt < imgArray.length) {
        document.getElementById("imgId").src = imgArray[nImgCnt];
        obTimeOut = setTimeout("rotateImg()", 3000);
    } else if (nImgCnt >= imgArray.length) {
        nImgCnt = 0;
        document.getElementById("imgId").src = imgArray[nImgCnt];
        obTimeOut = setTimeout("rotateImg()", 3000);
    } else {
        clearTimeout(obTimeOut);
    }
}

function startAnimation() {
    obTimeOut = window.setTimeout(rotateImg,3000);
}

window.onload = startAnimation;

function init() {
    var boxes = document.getElementsByClassName("boxes");
    boxes[0].classList.add("list_clicked");
}
init()

function switchPage(list_num) {
    var selectbox = document.getElementsByClassName("selectbox");
    var boxes = document.getElementsByClassName("boxes");
    event.preventDefault();

    for (var i=0; i<selectbox.length; i++) {
        selectbox[i].style.display = 'none';
    }
    for (var i=0; i<boxes.length; i++) {
        boxes[i].classList.remove("list_clicked");
    }

    switch(list_num) {
        case '0':
            selectbox[0].style.display = 'block';
            boxes[0].classList.add("list_clicked");
            break;
        case '1':
            selectbox[1].style.display = 'block';
            boxes[1].classList.add("list_clicked");
            break;
    }
}