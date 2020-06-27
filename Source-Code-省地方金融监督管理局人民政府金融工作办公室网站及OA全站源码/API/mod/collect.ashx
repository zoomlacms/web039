<%@ WebHandler Language="C#" Class="collect" %>

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
//用于支持用户--收藏

public class collect : API_Base, IHttpHandler
{
    B_Favorite favoriteBll = new B_Favorite();
    B_User buser = new B_User();
    M_Favorite model = new M_Favorite();
    public void ProcessRequest(HttpContext context)
    {
        try
        {
            M_UserInfo mu = buser.GetLogin();
            if (mu.UserID <= 0) { retMod.retcode = M_APIResult.Failed;retMod.retmsg = "您还没有登录";RepToClient(retMod); return; }
            switch (Action)
            {
                case "add":
                    {
                        int favotype=DataConvert.CLng(context.Request["type"]);
                        int infoid = DataConvert.CLng(context.Request["infoid"]);
                        //检测重复
                        if (!favoriteBll.CheckFavoData(mu.UserID, favotype, infoid))
                        {
                            retMod.retcode = M_APIResult.Failed;retMod.retmsg = "您已添加该收藏";
                            break;
                        }
                        model.Title = Req("title");
                        model.Owner = mu.UserID;
                        model.InfoID = DataConvert.CLng(Req("infoid"));
                        model.FavUrl = Req("favurl");
                        model.FavoriType =DataConvert.CLng(Req("type"));
                        favoriteBll.insert(model);
                    }
                    break;
                case "list":
                    {
                        DataTable dt = favoriteBll.GetFavByUserID(mu.UserID);
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                case "del":
                    {
                        favoriteBll.Del(DataConvert.CLng(context.Request["id"]));
                    }
                    break;
                case "checkdata"://检测是否已收藏
                    {
                        int favotype=DataConvert.CLng(context.Request["type"]);
                        int infoid = DataConvert.CLng(context.Request["infoid"]);
                        retMod.retcode = favoriteBll.CheckFavoData(mu.UserID, favotype, infoid) ? M_APIResult.Success : M_APIResult.Failed;
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; retMod.retcode = M_APIResult.Failed; }
        RepToClient(retMod);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}