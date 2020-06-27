﻿<%@ page language="C#" title="发送信息" autoeventwireup="true" inherits="User.MessageSend, App_Web_154lhpuu" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发送信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
   
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2" class="spacingtitle"><b>发送网站短消息</b></td>
        </tr>
        <tr>
            <td class="tdleft td_l" style="height: 28px; "><strong>收件人：</strong></td>
            <td>
                <table id="TblAddMessage" width="100%" visible="true" runat="server">
                    <tr>
                        <td style="height: 22px">
                            <asp:RadioButton ID="RadIncept1" runat="server" GroupName="InceptGroup" Checked="true" Text="所有会员" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadIncept3" runat="server" Text="指定用户名" GroupName="InceptGroup" />
                            <asp:TextBox class="form-control text_md" ID="TxtInceptUser" runat="server" ></asp:TextBox>
                        </td>
                        <td>&nbsp;<span style="color: #0000ff">[</span><a href="#" onclick="SelectUser();">
                            <span style="text-decoration: underline; color: Green;">会员列表</span></a><span style="color: #0000ff">]</span></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdleft" style="height: 28px; "><strong>短消息主题：</strong></td>
            <td>
                <asp:TextBox class="form-control text_md" Style=" float: left;" ID="TxtTitle" runat="server" > </asp:TextBox>
                <font color="red">*</font>
                <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="短消息主题不能为空" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdleft" style="height: 23px; "><strong>短消息内容：</strong></td>
            <td>
                <asp:TextBox class="form-control tarea_l" ID="EditorContent" runat="server" TextMode="MultiLine" Style="float: left; "></asp:TextBox>
                <font color="red">*</font>
                <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 50px;" align="center">
                <asp:HiddenField ID="HdnMessageID" runat="server" />
                &nbsp;
          <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" class="btn btn-primary" />
                &nbsp;                
          &nbsp;
          <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function SelectUser() {
            window.open('UserList.aspx?TypeSelect=UserList&OpenerText=<%=TxtInceptUser.ClientID%>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
          }
    </script>
</asp:Content>
