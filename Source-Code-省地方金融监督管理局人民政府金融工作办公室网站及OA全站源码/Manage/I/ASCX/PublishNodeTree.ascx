﻿<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_PublishNodeTree, App_Web_r1yp0pzx" clientidmode="Static" %>
<div id="nodeNav" style="padding:0 0 0 0;">
        <div>
            <div class="tvNavDiv" style="border:1px solid #ddd;">
                <div class="left_ul">
                    <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
                </div>
            </div>
            <span style="color: green;" runat="server" id="remind" visible="false" />
        </div>
    </div>
<script type="text/javascript">
    $("body").ready(function () {

    });
    function ShowMain(data,id) {
        $(data).next().animate({ height: 'toggle' }, 200);
        setTimeout("ShowInfo("+id+")", 200);
    }
    
</script>