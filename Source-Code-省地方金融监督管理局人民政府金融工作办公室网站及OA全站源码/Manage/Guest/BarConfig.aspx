﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Guest_BarConfig, App_Web_nbpa1lpv" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
#BreadNav {display: none;}
.mysite {display: none;}
.optext {text-align: right;}
.barconfig .pagination{margin:0;}
</style>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />

<title>贴吧栏目设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="nav nav-tabs" style="border-bottom: none;">
<li class="active"><a href="#basic" data-toggle="tab">基本设置</a></li>
<li><a href="#auth" data-toggle="tab">权限设定</a></li>
</ul>
<div class="tab-content barconfig">
    <div class="tab-pane active" id="basic">
        <table class="table table-bordered table-hover table-striped">
            <tr class="onlybar">
                <td style="text-align: right;">上级栏目：</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" style="width:300px;text-align:left;" id="dropdownMenu1" runat="server" data-toggle="dropdown" aria-expanded="true">
                            <span id="dr_text"></span>
                           <span class="caret pull-right" style="margin-top:7px;"></span>
                            <asp:HiddenField id="selected_Hid" runat="server" />
                        </button>
                        <ul id="PCate_ul" runat="server" class="dropdown-menu" style="overflow:auto;height:200px;width:300px;" role="menu" aria-labelledby="dropdownMenu1">
                        </ul>
                    </div>
                    </td>
            </tr>
            <tr class="onlybar">
                <td><span class="pull-right" style="line-height:34px;">所属类别：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">论坛版面</asp:ListItem>
                        <asp:ListItem Value="1">论坛分类</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="optext">栏目类型：</td>
                <td>
                    <asp:RadioButtonList runat="server" ID="GType_Rad" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">贴吧栏目</asp:ListItem>
                        <asp:ListItem Value="0">留言栏目</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px">栏目名称：</span></td>
                <td>
                    <asp:TextBox ID="txtCateName" class="form-control text_md" runat="server" placeholder="栏目名称" autofocus="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="float: left; margin-top: 10px; color: red;" ValidationGroup="add" ErrorMessage="必填项" ControlToValidate="txtCateName" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="optext">审核模式：</td>
                <td>
                   <input type="checkbox" id="IsCheck_Ra" class="switchChk" runat="server" />
                </td>
            </tr>
            <tr id="checkopt_tr" style="display:none;">
                <td class="optext"></td>
                <td style="line-height:30px;">
                    <input type="checkbox" id="CheckOpt_Ra" runat="server" class="pull-left switchChk" />
                    <span>(开启审核后帖子需要管理员审核才会显示在列表)</span>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">发贴积分：</td>
                <td>
                    <asp:TextBox ID="SenderScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">回贴积分：</td>
                <td>
                    <asp:TextBox ID="ReplyScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">注册发帖：</td>
                <td>
                    <asp:TextBox ID="UserTime_T" runat="server" Text="120" CssClass="form-control td_s"></asp:TextBox> <span>分钟</span>
                </td>
            </tr>
            <tr>
                <td class="optext">发帖间隔：</td>
                <td>
                    <asp:TextBox ID="SendTime_T" runat="server" Text="5" CssClass="form-control td_s"></asp:TextBox> <span>分钟</span>
                </td>
            </tr>
            
            <tr class="barFile_div onlybar">
                <td><span class="pull-right">图片压缩：</span></td>
                <td>
                    <div class="input-group pull-left" style="width:300px;">
                        <asp:TextBox runat="server" ID="ZipImgSize_T" CssClass="form-control" />
                        <span style="width:30px;" class="btn btn-default input-group-addon">KB</span>
                    </div><div class="pull-left" style="line-height:30px; margin-left:5px;"><span>0为不压缩,如输入2048,则超过2M的图片会自动等比压缩</span> </div>
                </td>
            </tr>
            <tr class="onlybar">
                <td><span class="pull-right">能力同步：</span></td>
                <td>
                    <asp:TextBox runat="server" ID="IsPlat_T" CssClass="form-control text_xs"></asp:TextBox>
                    <span class="rd_green">请输入能力中心公司ID</span>
                </td>
            </tr>
            <tr class="barFile_div">
                <td><span class="pull-right" style="line-height: 34px;">栏目图标：</span></td>
                <td>
                    <asp:TextBox runat="server" ID="ImageInfo_T" CssClass="form-control text_300" Style="display: inline;"></asp:TextBox>
                </td>
            </tr>
            <tr class="barFile_div">
                <td><span class="pull-right" style="line-height: 34px;">栏目简介：</span></td>
                <td>
                    <asp:TextBox ID="BarDesc_T" class="form-control pull-left" runat="server" TextMode="MultiLine" Width="300px" placeholder="栏目简介"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="pv2" ValidationExpression="^((.){0,300}$)" ValidationGroup="add" Display="Dynamic" ForeColor="Red" ErrorMessage="简介内容不能大于30位！" ControlToValidate="BarDesc_T" />
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">管理人员：</td>
                <td>
                    <div id="userlist_div"></div>
                    <button type="button" id="seluser_btn" class="btn btn-info"><i class="fa fa-plus"></i></button>
                    <asp:HiddenField runat="server" ID="BarOwner_T" />
                    <div style="padding-top: 3px;">
                        <span style="padding-left: 5px;">提示：包含拥有在前台修改,删除,置顶,精华权限</span>
                    </div>
                    <asp:HiddenField runat="server" ID="BarOwner_Hid" />
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-pane" id="auth">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px;">访问权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="NeedLog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><span class="pull-right" style="line-height: 34px;">发贴权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostAuth" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <div class="text-center">
        <asp:Button runat="server" CssClass="btn btn-primary" ID="AddBar_Btn" OnClientClick="return CheckData()" Text="保存" OnClick="AddBar_Btn_Click" />
        <a href="GuestCateMana.aspx?Type=<%:GType %>" class="btn btn-primary">取消</a>
      <%--  <input type="button" data-dismiss="modal" value="关闭" class="btn btn-primary" />--%>
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script type="text/javascript" src="/JS/Plugs/PageHelper.js"></script>
    <script src="/JS/Plugs/Angular/ZL_UserList.js"></script>
    <script type="text/javascript">
        function HideBarSet() {
            $(".onlybar").hide();
        }
        $().ready(function () {
            $("#GType_Rad :radio").click(function () { if (this.value == "1") $(".onlybar").show(); else $(".onlybar").hide(); });
            $("#dropdownMenu1").find("#dr_text").text($("#PCate_ul").find("[role=" + $("#selected_Hid").val() + "]").children().first().text().trim());
            InitIsCheck();
            $("#IsCheck_Ra").on('switchChange.bootstrapSwitch', function (e, data) {
                InitIsCheck();
            });
            $("#PostAuth :radio").click(function () {
                if ($(this).val() == "2") {
                    ShowDiag("请指定用户权限","BarAuthSet.aspx?ID="+<%=CateID %>);
                }
            });
            $("#NeedLog :radio").click(function () {
                if ($(this).val() == "2") {
                    ShowDiag("请指定用户权限","BarAuthSet.aspx?ID="+<%=CateID %>);
                }
            });
            InitSelBar();
        });
        function InitSelBar(){
            var datastr=$("#BarOwner_T").val();
            if(!datastr){datastr="[]"};
            var datas=JSON.parse(datastr);
            ZL_UserList.GetSelector("seluser_btn",{
                container:"userlist_div",
                data:datas
            });
            ZL_UserList.InitAngular();//初始化angular
        }
        var diag=new ZL_Dialog();
        function ShowDiag(title, url) {
            diag.title = title;
            diag.url = url;
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function CloseDiag(){
            diag.CloseModal();
        }
        function CheckData() {
            if (!ZL_Regex.isNum($("#SenderScore_T").val()) || !ZL_Regex.isNum($("#ReplyScore_T").val())) {
                alert('积分格式不对！');
                return false;
            }
            if(!ZL_Regex.isNum($("#UserTime_T").val()) || !ZL_Regex.isNum($("#SendTime_T").val())){
                alert('用户发贴时间或发贴间隔格式不对!');
                return false;
            }
            $("#BarOwner_Hid").val(ZL_UserList.GetSelector("seluser_btn").GetData().GetIDS("UserID"));
            return true;
        }
        //初始化审核状态
        function InitIsCheck() {
            if ($("#IsCheck_Ra")[0].checked)
                $("#checkopt_tr").show();
            else
                $("#checkopt_tr").hide();
        }
        function Refresh() {
            parent.location = parent.location;
        }
        var bardiag=new ZL_Dialog();
        function SelBarOwner() {
            bardiag.title = "选择吧主";
            bardiag.content = "userdiv";
            bardiag.ShowModal();
        }

        //选择用户回调
        //function UserFunc(json, select) {
        //    for (var i = 0; i < json.length; i++) {
        //        PageHelper.DataSource.pushNoDup({id:json[i].UserID,username:json[i].UserName});
        //    }
        //    curScope.$apply(function ($compile) {
        //        //自动跳至最后一页
        //        PageHelper.pagenum=PageHelper.GetPageNum(PageHelper.DataSource.length,PageHelper.psize);
        //        PageHelper.cpage=PageHelper.pagenum;
        //        curScope.list=PageHelper.GetPageDT();
        //    })
        //    PageHelper.Render();
        //    $("#BarOwner_Hid").val(PageHelper.DataSource.GetIDS());
        //    bardiag.CloseModal();
        //}
        function selectCate(data) {
            $("#selected_Hid").val($(data).attr("role"));
            $("#dropdownMenu1").find("#dr_text").text($(data).children().first().text().trim());
        }
        function PageCallBack(action, src, pval) {
            $("#ImageInfo_T").val(src.split('|')[0]);
            diag.CloseModal();
        }
        function CloseDiag() {
            diag.CloseModal();
        }
    </script>
</asp:Content>
