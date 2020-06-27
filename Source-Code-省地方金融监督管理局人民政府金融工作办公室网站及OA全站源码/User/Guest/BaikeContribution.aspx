<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Guest_BaikeContribution, App_Web_y2cm3tkm" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的词条贡献</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="index" data-ban="baike"></div>
    <div class="container margin_t10">
<ol class="breadcrumb">
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li class="active">我的词条贡献</li>
	<div class="clearfix"></div>
</ol>
    </div>
<div class="container">
<div class="us_seta">
<%--    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td>基本情况</td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li style="float: left; text-align: center; margin-left: 20px;">提交版本<br />
                        <%=GetBasic("1") %></li>
                    <li style="float: left; text-align: center; margin-left: 20px;">通过版本<br />
                        <%=GetBasic("2") %></li>
                    <li style="float: left; text-align: center; margin-left: 20px;">通过率<br />
                        <%=GetBasic("3") %></li>
                </ul>
            </td>
        </tr>
    </table>--%>
    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td style="width: 70%;">我的词条信息</td>
            <td style="width: 30%;">
                <asp:DropDownList runat="server" ID="Filter_DP" CssClass="form-control text_150" AutoPostBack="true" OnSelectedIndexChanged="Filter_DP_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected="True">已通过</asp:ListItem>
                    <asp:ListItem Value="0">待审核</asp:ListItem>
                    <asp:ListItem Value="-2">示通过</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <ZL:ExRepeater ID="RPT" runat="server" PagePre="<tr><td colspan='2' class='text-center'>" PageEnd="</td></tr>">
            <ItemTemplate>
                <tr class="tdbg">
                    <td style="width: 70%; padding-left: 10px; line-height: 22px;">
                        <a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>' target="_blank"><%# Eval("Tittle")%></a><br />
                        [<%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%>]
                    </td>
                    <td style="width: 30%;">
                        <%#GetStatus() %>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
