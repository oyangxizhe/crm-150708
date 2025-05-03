<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRight.aspx.cs" Inherits="WPSS.UserManage.EditRight" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>编辑用户权限</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta name ="Description" content ="进销存管理系统" />
<meta name ="keywords" content ="进销存管理系统,进销存管理软件,ERP,小微企业管理系统,希哲软件" />
   <link href ="../Css/SSBase.css"  type ="text/css" rel ="Stylesheet" />
      <link href ="../Css/S131017.css"  type ="text/css" rel ="Stylesheet" />
 <base target ="_self" /> 
    </head>
<body>  
    <form id="form1" runat="server">
        <input id="hint" type="hidden"  runat="server" />
         <input id="x" type="hidden"  runat="server" />
       <div >
                  <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;编辑用户权限 </div>
     <div class="c13101907" id ="Div10">
 </div>
     </div>
     <div class ="c13110501">
      <div class="c13110502" id ="Div14">
   <span class="c13110508" id ="Span1">
       <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Image/btnAdd.png" 
              onclick="btnAdd_Click"  />
          </span>
       </div>
       <div class="c13110510" id ="Div1">
   <span class="c13110511" id ="Span3">
           (新增)
          </span>
       </div>
       <div class="c13110504" id ="Div19">
<span id="i13052904"  class ="c13110505"  >
搜索条件</span> </div>
          <div class="c13110506" id ="Div20">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div5">
                            用户名：</div>
     <div class="c14111903" id ="Div6">
            <input id="Text1" type="text"  runat ="server" class="c14111902" /></div>
          <div class="c13110102" id ="Div15">
                 </div>
     <div class="c14111903" id ="Div16">
         &nbsp;</div>
           </div>
           <div class ="c13110105">
                        <div class="c13110104" id ="Div2">
                            日期期间：</div>
     <div class="c14111903" id ="Div8">
     <span style =" margin-right :8px;">
     <input id="StartDate" type="text" runat="server" onclick ="f13100202('StartDate')" class ="c14111902" />
   </span> </div>
          <div class="c13110102" id ="Div12">
            <span class="c14111901">～</span>
                 </div>
     <div class="c14111903" id ="Div13">
  <input id="EndDate" type="text" runat="server" onclick ="f13100202('EndDate')" class ="c14111902" /></div>
     
           </div>
</div>
         <div class="c13110507" id ="Div21">
                  <span class="c13110503" id ="Span2">
     <asp:ImageButton ID="btnSearch" 
                 runat="server" ImageUrl="~/Image/btnSearch.png" Width="60px" 
                      onclick="btnSearch_Click" />
          </span>
   </div>
          <div class="c13110510" id ="Div3">
   <span class="c13110511" id ="Span4">
(搜索)
          </span>
       </div>
    </div>
           <div class ="c13112601">
       <div class="c14031301" id ="Div25">
           &nbsp;</div>

          <div class="c13112603" id ="Div26">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div27">
                            </div>
     <div class="c14111903" id ="Div28">
                        </div>
                            <div class="c13110104" id ="Div29">
                                </div>
     <div class="c14111903" id ="Div30">
     &nbsp;</div>
           </div>
           
</div>
        <div class="c18060901" id ="Div4">
              每页显示记录数：</div>
        <div class="c18060901" id ="Div24">
                 <asp:DropDownList  ID="DropDownList2" runat="server"   style="width :70px;height :20px;" AutoPostBack="true"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" class="c14111902">
      <asp:ListItem>15</asp:ListItem>
              <asp:ListItem >30</asp:ListItem>
               <asp:ListItem >50</asp:ListItem>
                  <asp:ListItem>全部</asp:ListItem>
            </asp:DropDownList></div>
    </div>
 
             </div>
   <div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div>
                <div >
         
               <asp:GridView ID="GridView1" runat="server" Width="65%" 
                    AllowPaging="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onrowdeleting="GridView1_RowDeleting" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        AutoGenerateColumns="False"  PageSize="15" 
                         CssClass ="c13102001"
                   
                   >
                   
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >
          
                <asp:CommandField ShowDeleteButton="True" HeaderText="删除" >
                              <ItemStyle Width="40px"  ForeColor="#595d5a"/>
                                    <HeaderStyle HorizontalAlign="Center" Width="40px" />
                          </asp:CommandField>
             <asp:TemplateField HeaderText="用户名">
                <ItemTemplate >
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Bind("用户名") %>'></asp:LinkButton>                     
                </ItemTemplate>
                 <HeaderStyle Width="60px" />
                 <ItemStyle Width="60px"  ForeColor="#595d5a"/>
            </asp:TemplateField>   
                   
                            <asp:BoundField DataField="姓名" HeaderText="用户姓名" >
                              <ItemStyle Width="80px"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="80px" HorizontalAlign="Center" />
                          </asp:BoundField>
                                  <asp:BoundField DataField="作业名称" HeaderText="作业名称" >
                              <ItemStyle Width="120px"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="120px" HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="制单人" HeaderText="制单人" >
                              <ItemStyle Width="80px"  ForeColor="#595d5a"/>
                                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="制单日期" HeaderText="制单日期" 
                              DataFormatString="{0:yyyy-MM-dd}" >
                               <HeaderStyle HorizontalAlign="Center" Width="120px" />
                              <ItemStyle Width="120px"  ForeColor="#595d5a"/>
                          </asp:BoundField>
                
                            
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                </div> 
          <div id="i13111401" class ="c13102303">
          <span class="c13102304"><asp:Label ID="lblRecordCount" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:Label ID="lblPageCount" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:Label ID="lblCurrentIndex" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:LinkButton ID="btnFirst" runat="server" CommandArgument="First" onclick="PageButton_Click">首页</asp:LinkButton></span>
          <span class="c13102304"><asp:LinkButton ID="btnPrev" runat="server" CommandArgument="Prev" onclick="PageButton_Click">上一页</asp:LinkButton></span>  
          <span class="c13102304"><asp:LinkButton ID="btnNext" runat="server" CommandArgument="Next" onclick="PageButton_Click">下一页</asp:LinkButton></span>
          <span class="c13102304"><asp:LinkButton ID="btnLast" runat="server" CommandArgument="Last" onclick="PageButton_Click">尾页</asp:LinkButton></span>
          <span class="c13102304"> 转到</span>
          <span class="c13102304"><asp:TextBox ID="txtNum" runat="server"  Width="73px"></asp:TextBox></span>
          <span class="c13102304"> 页</span>
          <span class="c13102304"> <asp:Button ID="btngo" runat="server"  Text="GO！"   style="width:45px" onclick="btngo_Click" /></span>
               
</div>
<script type="text/javascript" language="javascript">
    function f13100302(result) {
        if (window.opener != undefined) {
            //for chrome
            window.opener.returnValue = result;
        }
        else {
            window.returnValue = result;
        }
        window.close();
    }
    window.onload = function onload1() {
        var Invocation = document.getElementById("hint").value;
        var Invocation1 = document.getElementById("x").value;
        if (Invocation != "") {
            document.getElementById("i13102301").style.display = "block";
            document.all("prompt").innerText = Invocation;
        }
        else {
            document.getElementById("i13102301").style.display = "none";
        }
        if (Invocation1 != "") {
            document.getElementById("i13111401").style.display = "block";

        }
        else {
            document.getElementById("i13111401").style.display = "none";
       
        }

    }

    function myShowModalDialog(url, args, width, height) {
        var tempReturnValue;
        if (navigator.userAgent.indexOf("Chrome") > 0) {
            var paramsChrome = 'height=' + height + ', width=' + width + ', top=' + (((window.screen.height - height) / 2) - 50) +
            ',left=' + ((window.screen.width - width) / 2) + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no';
            window.open(url, "newwindow", paramsChrome);
        }
        else {
            var params = 'dialogWidth:' + width + 'px;dialogHeight:' + height + 'px;status:no;dialogLeft:'
            + ((window.screen.width - width) / 2) + 'px;dialogTop:' + (((window.screen.height - height) / 2) - 50) + 'px;';
            tempReturnValue = window.showModalDialog(url, args, params);
        }
        return tempReturnValue;
    }
    function f13100202(obj) {
        var dlgResult;
        if (navigator.userAgent.indexOf("Chrome") > 0) {
            if (obj == "StartDate") {
                var url = "../WDate.aspx?come=0";
                var dlgResult = myShowModalDialog(url, window, 255, 246);
            }
            else if (obj == "EndDate") {
                var url = "../WDate.aspx?come=1";
                var dlgResult = myShowModalDialog(url, window, 255, 246);
            }
        }
        else {
            if (obj == "StartDate") {
                var url = "../WDate.aspx?come=0";
                var dlgResult = myShowModalDialog(url, window, 160, 240);
                document.getElementById("startdate").value = dlgResult;
            }
            else if (obj == "EndDate") {
                var url = "../WDate.aspx?come=1";
                var dlgResult = myShowModalDialog(url, window, 160, 240);
                document.getElementById("enddate").value = dlgResult;
            }
        }
    }

    function enter2tab(e) {
        if (window.event.keyCode == 13) window.event.keyCode = 9
    }
    document.onkeydown = enter2tab;
  
</script>
    </form>
</body>
</html>

