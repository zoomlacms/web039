<%@ WebHandler Language="C#" Class="MobileMsg" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Collections.Generic;

public class MobileMsg : IHttpHandler,System.Web.SessionState.IReadOnlySessionState {

    B_User buser = new B_User();
    B_Safe_Mobile mobileBll = new B_Safe_Mobile();
    public void ProcessRequest (HttpContext context) {
        string action = context.Request["action"];
        string result = "";
        switch (action)
        {
            case "SendVailMsg":
                {
                    if (!ZoomlaSecurityCenter.VCodeCheck(context.Request["hcode"],context.Request["code"])) {context.Response.Write("验证码不正确"); return; }
                    B_Safe_Mobile mobileBll = new B_Safe_Mobile();
                    string mobile = context.Request["mobile"];//手机号
                    //检测手机短信发送次数
                    if (mobileBll.CheckMobile(mobile, context.Request.UserHostAddress))
                    {
                        string vaildnum = function.GetRandomString(6, 2);//验证码
                        string ret= SendWebSMS.SendMessage(mobile, vaildnum);
                        if (ret.Equals("1"))
                        {
                            //添加一条发送手机短信记录
                            mobileBll.Insert(new M_Safe_Mobile() { Phone = mobile, IP = HttpContext.Current.Request.UserHostAddress, CDate = DateTime.Now });
                            context.Session.Add("Cur_MobileSafeCode", vaildnum);
                        }
                        result = ret;
                    }else
                    {
                        result = "短信发送次数超过上限!";
                    }
                }
                break;
            default:
                break;
        }
        context.Response.Write(result);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}