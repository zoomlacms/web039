<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.UserInfo, App_Web_5v3fw1ty" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Import Namespace="ZoomLa.Model" %>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>注册信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5"> 
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="UserInfo.aspx">账户管理</a></li>
<li class="active">注册信息</li> 
</ol> 
</div> 
<div class="container">
<div runat="server" id="Login" class="us_seta" visible="false">
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td colspan="2" class="text-center"><font color="red">本页需支付密码才能登录请输入支付密码</font></td>
	</tr>
	<tr>
		<td>
			<asp:TextBox runat="server" ID="Second" CssClass="form-control pull-right" TextMode="Password"></asp:TextBox>
		</td>
		<td style="width:50%;">
			<asp:Button runat="server" ID="sure" CssClass="btn btn-primary" Text="确定" OnClick="sure_Click" />
		</td>
	</tr>
</table>
</div>  
<div runat="server" id="DV_show">
<div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
	<ul class="nav nav-tabs">
		<li class="active"><a href="UserInfo.aspx">注册信息</a></li>
		<li><a href="UserBase.aspx">基本信息</a></li>
		<li><a href="UserBase.aspx?sel=Tabs1">头像设置</a></li>
		<li><a href="DredgeVip.aspx">VIP信息</a></li>
		<li><a href="ListProfit.aspx">我的收益</a></li>
	</ul>
	<table style="width: 100%; margin: 0 auto;" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
		<tr>
			<td colspan="4">
				<ZL:UserBar ID="UserBar_U" Width="300" runat="server" />
			</td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td class="text_150" style="text-align: right">用户名：</td>
			<td style="width: 250px; "><asp:Label ID="LblUser" runat="server" ></asp:Label></td>
			<td class="text_150" style="text-align: right">Email：</td>
			<td style="width: 250px; "><asp:Label ID="LblEmail" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">所属用户组：</td>
			<td style="width: 250px; ">
				<asp:Label ID="LblGroup" runat="server" ></asp:Label></td>
			<td style="text-align: right">加入用户组时间：</td>
			<td style="width: 250px; "><asp:Label ID="LblJoinTime" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">注册时间：</td>
			<td style="width: 250px; "><asp:Label ID="LblRegTime" runat="server" ></asp:Label></td>
			<td style="text-align: right">登录次数：</td>
			<td style="width: 250px; "><asp:Label ID="LblLoginTimes" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">最近登录时间：</td>
			<td style="width: 250px; "><asp:Label ID="LblLastLogin" runat="server" ></asp:Label></td>
			<td style="text-align: right">最近登录IP：</td>
			<td style="width: 250px; "><asp:Label ID="LblLastIP" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">最近修改密码时间：</td>
			<td style="width: 250px; "><asp:Label ID="LblLastModify" runat="server" ></asp:Label></td>
			<td style="text-align: right">最近被锁定时间：</td>
			<td style="width: 250px; "><asp:Label ID="LblLastLock" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">余额：</td>
			<td style="width: 250px; ">
				<a href="ConsumeDetail.aspx?SType=1" title="点击查看变更详情"><asp:Label ID="Purse_L" runat="server"></asp:Label></a>
                <a href="../UserFunc/Money/WithDraw.aspx">[申请提现]</a>
			</td>
			<td style="text-align: right">银币：</td>
			<td style="width: 250px; ">
				 <a href="ConsumeDetail.aspx?SType=2" title="点击查看变更详情"><asp:Label ID="Sicon_L" runat="server"></asp:Label></a>
			</td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">积分：</td>
			<td style="width: 250px; ">
				<a href="ConsumeDetail.aspx?SType=3" title="点击查看变更详情"><asp:Label ID="Point_L" runat="server"></asp:Label></a></td>
			<td style="text-align: right">点券：</td>
			<td style="width: 250px; ">
				<a href="ConsumeDetail.aspx?SType=4" title="点击查看变更详情"><asp:Label ID="UserPoint_L" runat="server"></asp:Label></a>
			</td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			 <td style="text-align: right">虚拟币：</td>
			<td style="width: 250px; ">
				<a href="ConsumeDetail.aspx?SType=5" title="点击查看变更详情"><asp:Label ID="DummyPurse_L" runat="server"></asp:Label></a>
			</td>
			<td style="text-align: right">卖家积分：</td>
			<td style="width: 250px; "><asp:Label ID="LblboffExp" runat="server" ></asp:Label></td>
		</tr>
		<tr class="tdbg" style="width: 100%">
			<td style="text-align: right">消费积分：</td>
			<td style="width: 250px; "><asp:Label ID="LblConsumeExp" runat="server" ></asp:Label></td>
			<td style="text-align: right">等级：</td>
			<td style="width: 250px; "><span id="LvIcon_Span" runat="server"></span> <asp:Label ID="gradeTxt" runat="server" ></asp:Label></td>
		</tr>
		<tr>
			<td class="text-right">推荐人：</td>
			<td colspan="3"><asp:Label ID="LblParentUserID" runat="server" Text=""></asp:Label></td>
		</tr>
		<asp:Literal runat="server" ID="GroupModelField_Li"></asp:Literal>
		<tr class="tdbg" style="width: 100%">
			<td class="btn_green text-center" colspan="4">
				<input id="Button2" type="button" value="基本信息" class="btn btn-primary" onclick="javascript: location.href = 'UserBase.aspx'" />
                <a href="/PayOnline/SelectPayPlat.aspx" target="_blank" class="btn btn-primary">充值金额</a>
                <a href="/User/ChangPSW.aspx" class="btn btn-primary">修改密码</a>
				<input type="button" value="兑换金额" class="btn btn-primary"  onclick="showMoneyConver();" />
				<div style="height:5px;"></div>
                <a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.Purse %>" class="btn btn-primary">金额明细</a>
				<a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.SIcon %>" class="btn btn-primary">银币明细</a>
                <a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.Point %>" class="btn btn-primary">积分明细</a>
				<input type="button" value="赠送资金" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.Purse %>);"/>     
				<input type="button" value="赠送银币" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.SIcon %>);"/>     
				<input type="button" value="赠送积分" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.Point %>);"/>  
			</td>
		</tr>
	</table>
</div>
</div>
</div>
<div class="u_sign" id="u_UserInfo"></div>  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
$("#mimenu_btn").click(function (e) {
    if ($(".user_mimenu_left").width() > 0) {
        $(".user_mimenu_left ul").fadeOut(100);
        $(".user_mimenu_left").animate({ width: 0 }, 200);
    }
    else {
        $(".user_mimenu_left").animate({ width: 150 }, 300);
        $(".user_mimenu_left ul").fadeIn();
    }
});
//会员搜索
$("#sub_btn").click(function (e) {
    if ($("#key").val() == "")
        alert("搜索关键字为空!");
    else
        window.location = "/User/SearchResult.aspx?key=" + escape($("#key").val());
});
//搜索回车事件
function IsEnter(obj) {
    if (event.keyCode == 13) {
        $("#sub_btn").click(); return false;
    }
}
function showGive(stype) {
    ShowComDiag("/User/UserFunc/Money/GiveMoney.aspx?stype=" + stype, "赠送金额");
}
function showMoneyConver() {
    ShowComDiag("/User/UserFunc/Money/MoneyConver.aspx", "金额兑换");
}
</script>
</asp:Content>