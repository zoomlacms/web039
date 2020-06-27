<%@ WebHandler Language="C#" Class="like" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.User;
using ZoomLa.BLL.Helper;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;
using Newtonsoft.Json;
using ZoomLa.BLL.Plat;
using ZoomLa.Model.Plat;

public class like :API_Base,System.Web.SessionState.IReadOnlySessionState, IHttpHandler {

    B_User buser = new B_User();
    B_Plat_Like likeBll = new B_Plat_Like();
    //点赞来源
    private string Source { get { return Req("source"); } }
    private int InfoID { get { return DataConvert.CLng(Req("InfoID")); } }
    public void ProcessRequest(HttpContext context)
    {
        //用于支持点赞,不支持匿名
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "add":
                    {
                        if (likeBll.AddLike(mu.UserID,InfoID, Source))
                        { retMod.retcode = M_APIResult.Success; }
                        else { retMod.retmsg = "你已经点过赞了"; }
                    }
                    break;
                case "del":
                    {
                        likeBll.DelLike(mu.UserID, InfoID, Source);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "list":
                    {
                        DataTable dt = likeBll.SelLikeUsers(InfoID, Source);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                default:
                    {
                        retMod.retmsg = "[" + Action + "]接口不存在";
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}