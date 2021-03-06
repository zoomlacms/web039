﻿var StyleHelper = {
    RGBTo16: function (rgb) {
        rgb = rgb.split('(')[1];
        var str = [3];
        for (var k = 0; k < 3; k++) {
            str[k] = parseInt(rgb.split(',')[k]).toString(16);//str 数组保存拆分后的数据 
        }
        var colsr = '#' + str[0] + str[1] + str[2];
        return colsr;
    },
    ConverToInt: function (val, suf) { //默认返回1
        if (!val || val == "") { val = "1"; }
        val = val.replace(/ /g, "").replace("px", "").replace("em", "");
        val = parseInt(val);
        if (isNaN(val)) { val = 1; }
        return val;
    },
    setRadVal: function (name, value) {
        //用于rad与chk的默认值设定
        if (value == "" || name == "") { return; }
        $("input[name=" + name + "]").each(function () {
            if (this.value == value) {
                this.click();
            }
            else { this.checked = false; }
        });
    },
};