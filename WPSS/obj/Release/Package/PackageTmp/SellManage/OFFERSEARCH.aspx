<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OFFERSEARCH.aspx.cs" Inherits="WPSS.SellManage.OFFERSEARCH" EnableEventValidation="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>报价单查询</title>
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
       <div >
                  <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;报价单查询</div>
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
     <div class="c14111903" id ="Div6">
            <input id="Text1" type="text"  runat ="server" class="c14111902" /></div>
                            <div class="c13110104" id ="Div1s">
                                报价单号：
                            </div>
     <div class="c14111903" id ="Div14">
     <input id="Text4" type="text"  runat ="server" class="c14111902" />
                        </div>
           </div>
           <div class ="c13110105">
                        <div class="c13110104" id ="Div2">
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                             />
                            日期期间：</div>
     <div class="c14111903" id ="Div8">
     <span style =" margin-right :8px;">
     <input id="StartDate" type="text" runat="server"   onclick ="f13100202('StartDate')" class ="c14111902" />
   </span> </div>
          <div class="c13110104" id ="Div12">
                 <span style=" margin-right :33px;">～</span></div>
     <div class="c14111903"id ="Div13">
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
        
          <div class="c18060901" id ="Div16">
              每页显示记录数：</div>
        <div class="c18060901" id ="Div24">
                 <asp:DropDownList  ID="DropDownList2" runat="server"   style="width :70px;height :20px;" AutoPostBack="true"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" class="c14111902">
      <asp:ListItem>15</asp:ListItem>
              <asp:ListItem >30</asp:ListItem>
               <asp:ListItem >50</asp:ListItem>
                  <asp:ListItem>全部</asp:ListItem>
            </asp:DropDownList></div>
    </div>
    <div class ="c13112601">
       <div class="c14031301" id ="Div11">
           &nbsp;</div>

          <div class="c13112603" id ="Div112">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div17">
                            </div>
     <div class="c13110103" id ="Div18">
                        </div>
                            <div class="c13110104" id ="Div22">
                              </div>
     <div class="c13110103" id ="Div23">

                            </div>
           </div>
           
</div>
    </div>
  
                      <div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div>
             <div id="i13103001" class ="c13111201">
          
                 <asp:GridView ID="GridView1" runat="server"
                    AllowPaging="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
              
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        AutoGenerateColumns="False" style="margin-left: 8px" PageSize="15" 
                        CssClass ="c13102001"
                   
                   >
                   
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >
        
             <asp:TemplateField HeaderText="报价单号">
                <ItemTemplate >
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Bind("报价单号") %>'></asp:LinkButton>                     
                </ItemTemplate>
                 <HeaderStyle Width="4%" />
                 <ItemStyle Width="4%"  ForeColor="#595d5a"/>
            </asp:TemplateField>  
              <asp:BoundField DataField="ID" HeaderText="ID" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField> 
                     
             <asp:BoundField DataField="料号" HeaderText="料号" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                     
                          <asp:BoundField DataField="品名" HeaderText="产品型号" >
                              <ItemStyle Width="8%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="8%" />
                          </asp:BoundField>
                    <asp:BoundField DataField="客户料号" HeaderText="物料编码" >
                              <ItemStyle Width="5%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                          </asp:BoundField>
                          
                               <asp:BoundField DataField="客户" HeaderText="客户名称" >
                              <ItemStyle Width="10%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                          </asp:BoundField>

                         <asp:BoundField DataField="层数" HeaderText="层数" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="板厚" HeaderText="板厚" >
                              <ItemStyle Width="2%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="板材" HeaderText="板材" >
                              <ItemStyle Width="2%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="SET长" HeaderText="SET长" >
                              <ItemStyle Width="2%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="SET宽" HeaderText="SET宽" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                           <asp:BoundField DataField="SET排版数" HeaderText="SET排版数" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                           <asp:BoundField DataField="销售单价" HeaderText="销售单价" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                          <asp:BoundField DataField="单位面积价格" HeaderText="单位面积价格" >
                              <ItemStyle Width="5%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                          </asp:BoundField>
                          <asp:BoundField DataField="制单人" HeaderText="制单人" >
                              <ItemStyle Width="4%"  ForeColor="#595d5a"/>
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                          <asp:BoundField DataField="日期" HeaderText="制单日期" 
                              DataFormatString="{0:yyyy-MM-dd}" >
                               <HeaderStyle HorizontalAlign="Center" Width="4%" />
                              <ItemStyle Width="4%"  ForeColor="#595d5a"/>
                          </asp:BoundField> 
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                </div>
                      <div id="i13111201" class ="c13101902" style="display:none ">
                                 <div class="c13102907" id ="Div15">
                                 </div>
      <div class="c13101903" id ="Div31">
          合计未税金额</div>
     <div class="c13101904" id ="Div32">
        <input id="Text7" type="text"  runat="server"    class="c13102908"/></div>
          <div class="c13101903" id ="Div33">
              合计税额</div>
     <div class="c13101904" id ="Div34">
   <input id="Text8" type="text"  runat ="server" class="c13102908" /> 
         </div>
                  <div class="c13101903" id ="Div35">
                      合计含税金额</div>
     <div class="c13101904" id ="Div36">
   <input id="Text9" type="text"  runat ="server" class ="c13102908"  /> 
         </div>
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
            document.getElementById("i13103001").style.display = "block";

        }
        else {
            document.getElementById("i14031701").style.display = "none";
            document.getElementById("i13103001").style.display = "none";
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
