<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WareInfo.aspx.cs" Inherits="WPSS.BaseInfo.WareInfo" EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>品号信息维护</title>
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
         <input id="hint1" type="hidden"  runat="server" />
        <input id="x" type="hidden"  runat="server" />
          <input id="x1" type="hidden"  runat="server" />
          <input id="come" type="hidden"  runat="server" />
       <div >
                  <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;品号信息维护</div>
     <div class="c13101907" id ="Div10">
 </div>
     </div>
        </div>
<div class ="c13110501">
 <div class="c13110502" id ="Div4">
   <span class="c13110508" id ="Span1">
       <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Image/btnAdd.png" 
              onclick="btnAdd_Click"  />
          </span>
       </div>
       <div class="c13110510" id ="Div7">
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
                                                        客户名称：</div>
     <div class="c14111903" id ="Div6">
            <input id="Text1" type="text"  runat ="server" class="c14111902" /></div>
                            <div class="c13110104" id ="Div1">
                                状态
                                </div>
     <div class="c14111903" id ="Div14">
     <asp:DropDownList  ID="DropDownList1" runat="server"    CssClass ="c13111101 ">
      <asp:ListItem></asp:ListItem>
           <asp:ListItem>正常</asp:ListItem>
              <asp:ListItem >Hold</asp:ListItem>
               <asp:ListItem >作废</asp:ListItem>
                  <asp:ListItem>全部</asp:ListItem>
            </asp:DropDownList>
                        </div>
           </div>
           <div class ="c13110105">
                        <div class="c13110104" id ="Div2">
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                oncheckedchanged="CheckBox1_CheckedChanged" />
                            日期期间：</div>
     <div class="c14111903" id ="Div8">
     <span style =" margin-right :8px;">
     <input id="StartDate" type="text" runat="server"   onclick ="f13100202('StartDate')" class ="c14111902" />
   </span> </div>
          <div class="c13110104" id ="Div12">
                 <span style=" margin-right :33px;">～</span></div>
     <div class="c14111903" id ="Div13">
  <input id="EndDate" type="text" runat="server"  onclick ="f13100202('EndDate')" class ="c14111902" /></div>
     
           </div>
</div>
            <div class="c13110507" id ="Div21">
                  <span class="c13110503" id ="Span2">
     <asp:ImageButton ID="btnSearch" 
                 runat="server" ImageUrl="~/Image/btnSearch.png" Width="60px" 
                      onclick="btnSearch_Click" />
          </span>
             <span class="c13110505" id ="Span4">
             <asp:Label ID="Label2" runat="server" Text="(搜索)"></asp:Label>
              </span>
   </div>
  <div class="c13110507" id ="Div3">
                  <span class="c13110503" id ="Span5">
     <asp:ImageButton ID="ImageButton1" 
                 runat="server" ImageUrl="~/Image/Excel_big.png" Width="60px" 
                      onclick="btnToExcel_Click" />
          </span>
             <span class="c13110505" id ="Span6">
             <asp:Label ID="Label1" runat="server" Text="(导出)"></asp:Label>
              </span>
   </div>
    </div>
    <div class ="c13112601">
       <div class="c14031301" id ="Div25">
           &nbsp;</div>

          <div class="c13112603" id ="Div26">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div27">
                            产品型号：</div>
     <div class="c14111903" id ="Div28">
            <input id="Text2" type="text"  runat ="server" class="c14111902" /></div>
                            <div class="c13110104" id ="Div29">
                                物料编码：</div>
     <div class="c14111903" id ="Div30">
     <input id="Text3" type="text"  runat ="server" class="c14111902" />
                 
                            </div>
           </div>
           
</div>
               <div class="c18060901" id ="Div11">
              每页显示记录数：</div>
        <div class="c18060901" id ="Div16">
                 <asp:DropDownList  ID="DropDownList2" runat="server"   style="width :70px;height :20px;" AutoPostBack="true"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" class="c14111902">
      <asp:ListItem>15</asp:ListItem>
              <asp:ListItem >30</asp:ListItem>
               <asp:ListItem >50</asp:ListItem>
                  <asp:ListItem>全部</asp:ListItem>
            </asp:DropDownList></div>

    </div>
  
                      
        <div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div>
                <div  >
         
               <asp:GridView ID="GridView1" runat="server" 
                    AllowPaging="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onrowdeleting="GridView1_RowDeleting" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        AutoGenerateColumns="False" PageSize="15" 
                        CssClass ="c13102001"
                   
                   >
                   
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >
                    <asp:TemplateField HeaderText="选取">
                   <ItemTemplate>
         <a href ="javascript:f13100302('<%#Eval ("Wareid") %>','<%#Eval ("CO_WAREID") %>','<%#Eval ("WNAME") %>',
     '<%#Eval ("CWAREID") %>','<%#Eval ("CNAME") %>','<%#Eval ("SELLUNITPRICE") %>','<%#Eval ("SPEC") %>','<%#Eval ("REMARK") %>'
             ,'<%#Eval ("Set长") %>','<%#Eval ("Set宽") %>','<%#Eval ("Set排版数") %>')">
                       选取</a>
                   </ItemTemplate>
                            <HeaderStyle Width="40px" HorizontalAlign="Center" />
                 <ItemStyle Width="40px"  />
                   </asp:TemplateField>
                  <asp:TemplateField HeaderText="删除" >
                <ItemTemplate >
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                        OnClientClick="return confirm('您确认删除该记录吗?');" Text="删除"  CommandName ="delete" ></asp:LinkButton>                     
                </ItemTemplate>
                 <HeaderStyle Width="40px" />
                 <ItemStyle Width="40px"  />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ID">
                <ItemTemplate >
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Bind("WAREID") %>'></asp:LinkButton>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField>   
             <asp:BoundField DataField="CO_WAREID" HeaderText="料号" >
                              <ItemStyle Width="100px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="WNAME" HeaderText="产品型号" >
                              <ItemStyle Width="200px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                          </asp:BoundField>
                             <asp:BoundField DataField="CNAME" HeaderText="客户名称" >
                              <ItemStyle Width="210px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="210px" />
                          </asp:BoundField>
                      
                    <asp:BoundField DataField="CWAREID" HeaderText="物料编码" >
                              <ItemStyle Width="120px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="120px" />
                          </asp:BoundField>
                             
                    <asp:BoundField DataField="TERMINAL" HeaderText="终端" >
                              <ItemStyle Width="60px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                          </asp:BoundField>
                           <asp:BoundField DataField="ACTIVE" HeaderText="状态" >
                              <ItemStyle Width="50px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="Maker" HeaderText="制单人" >
                              <ItemStyle Width="60px"  ForeColor="#595d5a"/>
                                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="Date" HeaderText="制单日期" 
                              DataFormatString="{0:yyyy-MM-dd}" >
                               <HeaderStyle HorizontalAlign="Center" Width="120px" />
                              <ItemStyle Width="120px"  ForeColor="#595d5a"/>
                          </asp:BoundField> 
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                    </div> 
          <div id="i14031701" class ="c13102303">
          <span class="c13102304"><asp:Label ID="lblRecordCount" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:Label ID="lblPageCount" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:Label ID="lblCurrentIndex" runat="server"></asp:Label></span>
          <span class="c13102304"><asp:LinkButton ID="btnFirst" runat="server" CommandArgument="First" onclick="PageButton_Click">首页</asp:LinkButton></span>
          <span class="c13102304"><asp:LinkButton ID="btnPrev" runat="server" CommandArgument="Prev" onclick="PageButton_Click">上一页</asp:LinkButton></span>  
          <span class="c13102304"><asp:LinkButton ID="btnNext" runat="server" CommandArgument="Next" onclick="PageButton_Click">下一页</asp:LinkButton></span>
          <span class="c13102304"><asp:LinkButton ID="btnLast" runat="server" CommandArgument="Last" onclick="PageButton_Click">尾页</asp:LinkButton></span>
          <span class="c13102304"> 转到<asp:TextBox ID="txtNum" runat="server"  Width="73px"></asp:TextBox></span><span class="c13102304">页</span>
          <span class="c13102304"> <asp:Button ID="btngo" runat="server"  Text="GO！"   style="width:45px" onclick="btngo_Click" /></span>
               
</div>
<script type="text/javascript" language="javascript">
    var arr1 = new Array();
    var arr2 = new Array();
    function f13100302(obj, obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8,obj9,obj10) {

        var objw = window.dialogArguments;
        arr1[0] = obj;
        arr1[1] = obj1;
        arr1[2] = obj2;
        arr1[3] = obj3;
        arr1[4] = obj4;
        arr1[5] = obj5;
        arr1[6] = obj6;
        arr1[7] = obj7;
        arr1[8] = obj8;
        arr1[9] = obj9;
        arr1[10] = obj10;

        if (navigator.userAgent.indexOf("Chrome") > 0) {

            var c1 = document.getElementById("come").value;

            if (c1 == "purchaseunitprice") {

                window.opener.document.getElementById("Text2").value = obj;
                window.opener.document.getElementById("Text3").value = obj1;
                window.opener.document.getElementById("Text4").value = obj2;
                window.opener.document.getElementById("Text5").value = obj3;
            }
            else  if (c1 == "sellunitprice") {

                window.opener.document.getElementById("Text2").value = obj;
                window.opener.document.getElementById("Text3").value = obj1;
                window.opener.document.getElementById("Text4").value = obj2;
                window.opener.document.getElementById("Text5").value = obj3;

                window.opener.document.getElementById("Text16").value = obj8;
                window.opener.document.getElementById("Text17").value = obj9;
                window.opener.document.getElementById("Text18").value = obj10;
            }
            else {
                var objx = document.getElementById("hint1").value;
                var table = window.opener.document.getElementById('<%=GridView1.ClientID%>');
                var tr = table.getElementsByTagName("tr");
                for (i = 1; i < tr.length; i++) {
                    if (objx == i) {
                        tr[i].getElementsByTagName("td")[0].getElementsByTagName("input")[0].value = obj;//ID
                        tr[i].getElementsByTagName("td")[1].getElementsByTagName("input")[0].value = obj1;//料号
                        tr[i].getElementsByTagName("td")[2].getElementsByTagName("input")[0].value = obj2;//品名
                        tr[i].getElementsByTagName("td")[3].getElementsByTagName("input")[0].value = obj3;//客户料号
                        tr[i].getElementsByTagName("td")[5].getElementsByTagName("input")[0].value = obj5;//单价
                        break;
                    }
                }
            }
            window.close();
        }

        else {

            if (window.opener != undefined) {
                //for chrome
                window.opener.returnValue = arr1;
            }
            else {
                window.returnValue = arr1;
            }
            window.close();
        }

    }
    function onSuccess(value, context) {
        arr2 = value;
    }
    function onFail(value) {
        alert(value);
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
            document.getElementById("i14031701").style.display = "block";

        }
        else {
            document.getElementById("i14031701").style.display = "none";

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

