<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageCase.aspx.cs" Inherits="WPSS.StockManage.StorageCase" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查询库存</title>
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
          <input id="x1" type="hidden"  runat="server" />
             <input id="come" type="hidden"  runat="server" />
         <input id="hint1" type="hidden"  runat="server" />
       <div >
                  <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;查询库存情况</div>
     <div class="c13101907" id ="Div10">
 </div>
     </div>
        </div>
<div class ="c13110501">
 <div class="c13110502" id ="Div4">
       </div>
       <div class="c13110510" id ="Div7">
   <span class="c13110511" id ="Span3">
      
          </span>
       </div>
       <div class="c13110504" id ="Div19">
<span id="i13052904"  class ="c13110505"  >
           搜索条件</span> </div>
          <div class="c13110506" id ="Div20">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div5">
                                                        客户名称：</div>
     <div class="c14111903"id ="Div6">
            <input id="Text1" type="text"  runat ="server" class="c14111902"  /></div>
                            <div class="c13110104" id ="Div1">
                                仓库：
                                </div>
     <div class="c14111903"id ="Div14">
                         <input id="Text2" type="text"  runat ="server" class="c14111902"  /></div>
           </div>
           <div class ="c13110105">
                        <div class="c13110104" id ="Div2">
                            批号：</div>
     <div class="c14111903"id ="Div8">
   <input id="Text3" type="text"  runat ="server" class="c14111902"  /></div>
          <div class="c13110104" id ="Div12">
              产品型号：</div>
     <div class="c14111903"id ="Div13">
       <input id="Text4" type="text"  runat ="server" class="c14111902"  />
                            </div>
     
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
   <span class="c13110505" id ="Span4">
              (搜索)
              </span>
       </div>
       <div class="c13110507" id ="Div16">
   </div>
    </div>
    <div class ="c13112601">
       <div class="c14031301" id ="Div25">
           &nbsp;</div>

          <div class="c13112603" id ="Div26">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div27">
                              物料编码：</div>
     <div class="c14111903"id ="Div28">
          <input id="Text5" type="text"  runat ="server" class="c14111902"  />

          </div>
                            <div class="c13110104" id ="Div29">
                             </div>
     <div class="c14111903"id ="Div30">

                 
                            </div>
           </div>
           
</div>
    </div>
  
                      <div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div>

             <div id="i13103001" >
          
                    
               <asp:GridView ID="GridView1" runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
               AutoGenerateColumns="False" PageSize="15" 
                              CssClass ="c13102001"
                    onpageindexchanging="GridView1_PageIndexChanging"
                   
                   >
                   
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >
                    <asp:TemplateField HeaderText="选取">
                   <ItemTemplate>
         <a href ="javascript:f13100302('<%#Eval ("仓库") %>','<%#Eval ("批号") %>','<%#Eval ("库存数量") %>')">
                       选取</a>
                   </ItemTemplate>
                            <HeaderStyle Width="40px" HorizontalAlign="Center" />
                 <ItemStyle Width="40px"  />
                   </asp:TemplateField>
                          <asp:BoundField DataField="品号" HeaderText="ID" >
                              <ItemStyle Width="80px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="料号" HeaderText="料号" >
                              <ItemStyle Width="100px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                          </asp:BoundField>
                           <asp:BoundField DataField="客户名称" HeaderText="客户名称" >
                              <ItemStyle Width="220px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="220px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="品名" HeaderText="产品型号" >
                              <ItemStyle Width="160px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="160px" />
                          </asp:BoundField>
                    <asp:BoundField DataField="客户料号" HeaderText="物料编码" >
                              <ItemStyle Width="160px" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="160px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="仓库" HeaderText="仓库" 
                           >
                               <HeaderStyle HorizontalAlign="Center" Width="100px" />
                              <ItemStyle Width="100px"  ForeColor="#595d5a"/>
                          </asp:BoundField> 
                                 <asp:BoundField DataField="批号" HeaderText="批号" >
                              <ItemStyle Width="80px"  ForeColor="#595d5a"/>
                                    <HeaderStyle HorizontalAlign="Center" Width="80px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="库存数量" HeaderText="库存数量" 
                           >
                               <HeaderStyle HorizontalAlign="Right" Width="100px" />
                              <ItemStyle Width="100px"  ForeColor="#595d5a"  HorizontalAlign="Right"/>
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
          <span class="c13102304"> 转到</span>
          <span class="c13102304"><asp:TextBox ID="txtNum" runat="server"  Width="73px"></asp:TextBox></span>
          <span class="c13102304"> 页</span>
          <span class="c13102304"> <asp:Button ID="btngo" runat="server"  Text="GO！"   style="width:45px" onclick="btngo_Click" /></span>
               
</div>
<script type="text/javascript" language="javascript">
    function f13100302(obj, obj1, obj2, obj3, obj4, obj5, obj6) {

        var arr1 = new Array();
        arr1[0] = obj;
        arr1[1] = obj1;
        arr1[2] = obj2;
        arr1[3] = obj3;
        arr1[4] = obj4;
        arr1[5] = obj5;
        arr1[6] = obj6;
        var c1 = document.getElementById("come").value;
        if (navigator.userAgent.indexOf("Chrome") > 0) {

            if (c1 == "tr") {//来自调拨单
                var objx = document.getElementById("hint1").value;
                var table = window.opener.document.getElementById('<%=GridView1.ClientID%>');
                var tr = table.getElementsByTagName("tr");
                for (i = 1; i < tr.length; i++) {
                    if (objx == i) {
                        tr[i].getElementsByTagName("td")[0].getElementsByTagName("input")[0].value = obj3;//ID
                        tr[i].getElementsByTagName("td")[1].getElementsByTagName("input")[0].value = obj4;//料号
                        tr[i].getElementsByTagName("td")[2].getElementsByTagName("input")[0].value = obj;//仓库
                        tr[i].getElementsByTagName("td")[3].getElementsByTagName("input")[0].value = obj1;//批号
                        tr[i].getElementsByTagName("td")[4].getElementsByTagName("input")[0].value = obj2;//库存数量
                        break;
                    }
                }
            }
            else if (c1 == "se") {//来销货单
              
                var objx = document.getElementById("hint1").value;
                var table = window.opener.document.getElementById('<%=GridView1.ClientID%>');
                var tr = table.getElementsByTagName("tr");
                for (i = 1; i < tr.length; i++) {
                    if (objx == i) {
                    
                        tr[i].getElementsByTagName("td")[8].getElementsByTagName("input")[0].value = obj;//仓库
                        tr[i].getElementsByTagName("td")[9].getElementsByTagName("input")[0].value = obj1;//批号
                        tr[i].getElementsByTagName("td")[10].getElementsByTagName("input")[0].value = obj2;//库存数量
                        break;
                    }
                }
            }
            else {
                var objx = document.getElementById("hint1").value;
                var table = window.opener.document.getElementById('<%=GridView1.ClientID%>');
                var tr = table.getElementsByTagName("tr");
                for (i = 1; i < tr.length; i++) {
                    if (objx == i) {
                        tr[i].getElementsByTagName("td")[0].getElementsByTagName("input")[0].value = obj;
                        tr[i].getElementsByTagName("td")[1].getElementsByTagName("input")[0].value = obj1;
                        tr[i].getElementsByTagName("td")[2].getElementsByTagName("input")[0].value = obj2;
                        tr[i].getElementsByTagName("td")[3].getElementsByTagName("input")[0].value = obj3;
                        tr[i].getElementsByTagName("td")[4].getElementsByTagName("input")[0].value = obj4;
                        tr[i].getElementsByTagName("td")[5].getElementsByTagName("input")[0].value = obj5;
                        tr[i].getElementsByTagName("td")[6].getElementsByTagName("input")[0].value = obj6;
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
    window.onload = function onload1() {
        var Invocation = document.getElementById("hint").value;
        var Invocation1 = document.getElementById("x").value;
        var Invocation2 = document.getElementById("x1").value;
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
