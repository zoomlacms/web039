
function setTime() {
    var nowtime = new Date();
    var year = nowtime.getFullYear();    //获取完整的年份(4位,1970-????)
    var month = nowtime.getMonth()+1;       //获取当前月份(0-11,0代表1月)
    var day = nowtime.getDate();        //获取当前日(1-31)
    var weeknum = nowtime.getDay();
    var week="";
    switch (weeknum.toString()) {
        case "1": week = "星期一"; break;
        case "2": week = "星期二"; break;
        case "3": week = "星期三"; break;
        case "4": week = "星期四"; break;
        case "5": week = "星期五"; break;
        case "6": week = "星期六"; break;
        case "7": week = "星期日"; break;
        default: break;
    }
    var strtime = year + "年" + month + "月" + day + "日  " + week;
    $("#nowtime").html(strtime);
}

function QusIsNull() {
    var txttitle = document.getElementById("txttitle").value;
    var txtincludepicpath = document.getElementById("txtincludepicpath").value;
    var txttags = document.getElementById("txttags").value;
    var txtsummary = document.getElementById("txtsummary").value;
    var editorcontent = document.getElementById("editorcontent").value;

    if (txttitle == null || txttitle == "" || txtincludepicpath == null || txtincludepicpath == "" || txttags == null || txttags == "" || txtsummary == null || txtsummary == "" || editorcontent == null || editorcontent == "") {
        alert("必输项不能为空！");
        return false;
    }

    if (!AntiSqlValid(txttitle) || !AntiSqlValid(txtincludepicpath) || !AntiSqlValid(txttags) || !AntiSqlValid(txtsummary) || !AntiSqlValid(editorcontent)) {
        alert("请不要输入特殊字符或者SQL关键字！");
        return false;
    }

    return true;
}

//防止SQL注入
function AntiSqlValid(value) {
    re = /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
    if (re.test(value)) {
        return false;//存在关键字
    } else return true;
}


function IndexSelectOnclik(evt) {

    var id = ClientBrowser()[0] == "Firefox" ? evt.target.id : event.srcElement.id;
    var obj = document.getElementById(id);
    var index = obj.selectedIndex; // 选中索引
    //var text = obj.options[index].text; // 选中文本
    var value = obj.options[index].value; // 选中值
    if (value != null && value != "") {
        window.open(value);
    }
}

function ClientBrowser() {
    var BrowserType = new Array(); //定义一数组 
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    if (Sys.ie) { BrowserType[0] = "IE"; BrowserType[1] = Sys.ie; }//IE" + Sys.ie 
    else if (Sys.firefox) { BrowserType[0] = "Firefox"; BrowserType[1] = Sys.firefox; }//Firefox" + Sys.firefox 
    else if (Sys.chrome) { BrowserType[0] = "Chrome"; BrowserType[1] = Sys.chrome; }// Chrome" + Sys.chrome 
    else if (Sys.opera) { BrowserType[0] = "Opera"; BrowserType[1] = Sys.opera; }// Opera" + Sys.opera 
    else if (Sys.safari) { BrowserType[0] = "Safari"; BrowserType[1] = Sys.safari; }//Safari" + Sys.safari 
    else if (!!window.ActiveXObject || "ActiveXObject" in window) { BrowserType[0] = "IE"; BrowserType[1] = "11"; }//IE 11 
    else { BrowserType[0] = ""; BrowserType[1] = ""; }

    return BrowserType;
}


function home_adcloseleft() {
    var obj = document.getElementById("home_adleft");
    obj.style.visibility = "hidden";
}

function home_adcloseright() {
    var obj = document.getElementById("home_adright");
    obj.style.visibility = "hidden";
}
