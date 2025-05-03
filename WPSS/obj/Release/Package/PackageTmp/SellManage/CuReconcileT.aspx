<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CuReconcileT.aspx.cs" Inherits="WPSS.SellManage.CuReconcileT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>编辑客户对账单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta name ="Description" content ="进销存管理系统" />
<meta name ="keywords" content ="进销存管理系统,进销存管理软件,ERP,小微企业管理系统,希哲软件" />
       <link href ="../Css/SSBase.css"  type ="text/css" rel ="Stylesheet" />
       <link href ="../Css/S131017.css"  type ="text/css" rel ="Stylesheet" />
    </head>
<body >
   <form id="form1" runat="server">
    <input id="cuid" type="hidden"  runat="server" />
   <input id="hint" type="hidden"  runat="server" />
    <input id="emid" type="hidden"  runat="server" />
      <input id="x" type="hidden"  runat="server" />
       <input id="ControlFileDisplay" type="hidden"  runat="server" />
        <input id="x2" type="hidden"  runat="server" />
         <input id="CUKEY" type="hidden"  runat="server" />
                <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;编辑客户对账单 </div>
     <div class="c13101907" id ="Div10">
 </div>
    </div>
<div class ="c13110501">
      <div class="c13110502" id ="Div17">
   <span class="c13110508" id ="Span1">
       <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Image/btnAdd.png"    onclick="btnAdd_Click"  />
          </span>
       </div>
              <div class="c13110510" id ="Div18">
   <span class="c13110511" id ="Span4">
                  (新增)
          </span>
       </div>
             <div class="c13110502" id ="Div19">
   <span class="c13110508" id ="Span3">
       <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Image/btnSave.png" 
                     onclick="btnSave_Click"  />
          </span>
       </div>
              <div class="c13110510" id ="Div20">
   <span class="c13110511" id ="Span5">
                  (保存)
          </span>
       </div>
          
         <div class="c13110507" id ="Div22">
                  <span class="c13110503" id ="Span2">
     <asp:ImageButton ID="btnExit" 
                 runat="server" ImageUrl="~/Image/btnExit.png" Width="60px" 
                      onclick="btnExit_Click" />
          </span>
   </div>
                 <div class="c13110510" id ="Div23">
   <span class="c13110511" id ="Span6">
                     (退出)
          </span>
       </div>
            <div class="c13110507" id ="Div1">
                  <span class="c13110503" id ="Span7">
     <asp:ImageButton ID="btnPrint" 
                 runat="server" ImageUrl="~/Image/btnPrint.png" Width="60px" 
                      onclick="btnPrint_Click" />
          </span>
   </div>
                 <div class="c13110510" id ="Div3">
   <span class="c13110511" id ="Span8">
                     (打印)
          </span>
       </div>
                 <div class="c13110507" id ="Div30" style="display :none;">
                  <span class="c13110503" id ="Span9">
     <asp:ImageButton ID="btnEXCEL_PRINT" 
                 runat="server" ImageUrl="~/Image/btnPrint.png" Width="60px" 
                      onclick="btnEXCEL_PRINT_Click" />
          </span>
   </div>
                       <div class="c13110507" id ="Div32" style ="display :block  ">
                <span class="c13110503" id ="Span10">
    <asp:LinkButton ID="btnReconcile" runat="server" onclick="btnReconcile_Click" CssClass ="">确认对帐</asp:LinkButton>
    </span> 
   </div>
          
                 <div class="c13110510" id ="Div33">
   <span class="c13110511" id ="Span11">
                 
          </span>
       </div>
                       <div class="c13110507" id ="Div34">
                <span class="c13110503" id ="Span12" style ="display :block  ">
    <asp:LinkButton ID="btnReductionReconcil" runat="server" onclick="btnReductionReconcile_Click" CssClass ="">对帐还原</asp:LinkButton>
    </span> 
   </div>
    </div>
<div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div> 
  <div class ="c13101902">
      <div class="c13101903" id ="Div24">
          客户对账单号</div>
     <div class="c13101904" id ="Div25">
<input id="Text1" type="text"  runat="server"   readonly ="readonly" class="c13102103"/> </div>
       <div class="c13101903" id ="Div5">
             客户名称</div>
     <div class="c13111503" id ="Div6">
   <input id="Text2" type="text"  runat ="server"  class ="c13102103"  />
     <span style =" margin-left :2px; margin-right :2px;"><a  href="javascript:f13100202('Text2','');">
         选择</a></span> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Text2" Text="必填的！" runat="server" />
    

     </div>
         <div class="c18061301" id ="Div26">
                <asp:LinkButton 
             ID="btnSure" runat="server" onclick="btnSure_Click"  
            >确定</asp:LinkButton>
             </div>
     <div class="c13110801"  id ="Div27">
  </div>
   
           </div>
       <div id="i14073102" class ="c13111601">
     
      <div class ="c15013101">    
       <asp:CheckBox ID="CheckBox2" runat="server"  Text ="全选" oncheckedchanged="CheckBox2_CheckedChanged"  /> 
           <asp:CheckBox ID="CheckBox3" runat="server" Text ="反选" oncheckedchanged="CheckBox3_CheckedChanged" />
           </div>
     <div class="c15013001" id ="Div36">

      <span style="color :#990033">
      
        </span>
</div>

          </div>
<div id="i14073101" class ="c15012901">
            <asp:GridView ID="GridView1" runat="server" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        AutoGenerateColumns="False" PageSize="15" 
                             CssClass ="c18052903"
                   >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns > 
                       <asp:TemplateField HeaderText="选择" >
                <ItemTemplate >
                    <asp:CheckBox ID="CheckBox1" runat="server"  Checked='<%# Bind("选择")%>'   CssClass ="c14080104" />
                </ItemTemplate>
                 <HeaderStyle Width="2%" />
                 <ItemStyle Width="2%"  />
            </asp:TemplateField>

                     <asp:TemplateField HeaderText="序号">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox20" runat="server"  Text='<%#Eval ("目录项次") %>'  CssClass ="c14070203" ></asp:TextBox>                     
                </ItemTemplate>
                <HeaderStyle Width="2%" />
                 <ItemStyle Width="2%"  />
            </asp:TemplateField>
             
                             <asp:BoundField DataField="客户代码" HeaderText="客户代码" >
                             <ItemStyle Width="4%"  ForeColor="#595d5a" CssClass ="c15021101"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="客户名称" HeaderText="客户名称" >
                             <ItemStyle Width="8%"  ForeColor="#595d5a" CssClass ="c15021101"/>
                                    <HeaderStyle Width="8%" HorizontalAlign="Center" />
                          </asp:BoundField>
             <asp:TemplateField HeaderText="销货(销退)单号">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox3" runat="server"  Text='<%#Eval ("销货销退单号") %>' CssClass ="c14070203" ></asp:TextBox>                     
                </ItemTemplate>
               <HeaderStyle Width="4%" />
                 <ItemStyle Width="4%"  />
            </asp:TemplateField>
                          <asp:BoundField DataField="订单号" HeaderText="订单号" >
                             <ItemStyle Width="4%"  ForeColor="#595d5a" CssClass ="c15021101"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="项次" HeaderText="项次" >
                          <ItemStyle Width="2%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="2%" HorizontalAlign="Center" />
                          </asp:BoundField>
          <asp:BoundField DataField="ID" HeaderText="ID" >
                              <ItemStyle Width="4%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
              <asp:BoundField DataField="料号" HeaderText="料号" >
                               <ItemStyle Width="4%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
                         <asp:BoundField DataField="客户料号" HeaderText="物料编码" >
                               <ItemStyle Width="4%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
            <asp:BoundField DataField="品名" HeaderText="产品型号" >
                              <ItemStyle Width="6%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="6%" HorizontalAlign="Center" />
                          </asp:BoundField> 

      
            <asp:BoundField DataField="订单数量" HeaderText="订单数量" >
                             <ItemStyle Width="4%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
                          
            <asp:BoundField DataField="销售单价" HeaderText="销售单价" >
                             <ItemStyle Width="4%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
            
                           <asp:BoundField DataField="销货销退数量" HeaderText="销货(销退)数量"  >
                             <ItemStyle Width="5%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="5%" HorizontalAlign="Center" />
                          </asp:BoundField>
             <asp:BoundField DataField="税率" HeaderText="税率" >
                           <ItemStyle Width="2%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="2%" HorizontalAlign="Center" />
                          </asp:BoundField>
                         <asp:TemplateField HeaderText="未税金额">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox4" runat="server"  Text='<%#Eval ("未税金额") %>' CssClass ="c14070203" ></asp:TextBox>                     
                </ItemTemplate>
               <HeaderStyle Width="4%" />
                 <ItemStyle Width="4%"  />
            </asp:TemplateField>
          
             <asp:BoundField DataField="税额" HeaderText="税额"   DataFormatString="{0:0.00}">
                           <ItemStyle Width="3%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                          </asp:BoundField>
            <asp:BoundField DataField="含税金额" HeaderText="含税金额"   DataFormatString="{0:0.00}">
                          <ItemStyle Width="4%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="4%" HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:BoundField DataField="工程费" HeaderText="工程费"   DataFormatString="{0:0.00}">
                          <ItemStyle Width="3%"  ForeColor="#595d5a" CssClass ="c14071615"/>
                                    <HeaderStyle Width="3%" HorizontalAlign="Center" />
                          </asp:BoundField>
             <asp:BoundField DataField="订单日期" HeaderText="订单日期"  Visible ="false"   >
                           <ItemStyle Width="6%"  ForeColor="#595d5a"/>
                                    <HeaderStyle Width="6%" HorizontalAlign="Center" />
                          </asp:BoundField>
                               <asp:TemplateField HeaderText="索引">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox202" runat="server"  Text='<%#Eval ("索引") %>'  CssClass ="c14070203" ></asp:TextBox>                     
                </ItemTemplate>
                <HeaderStyle Width="6%" />
                 <ItemStyle Width="6%"  />
            </asp:TemplateField>
                  
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                </div>
             
       <script type ="text/javascript" >
           window.onload = function onload1() {
               var Invocation = document.getElementById("hint").value;
               var Invocation1 = document.getElementById("x").value;
               var Invocation3 = document.getElementById("x2").value;
              
               if (Invocation != "") {
                   document.getElementById("i13102301").style.display = "block";
                   document.all("prompt").innerText = Invocation;
               }
               else {
                   document.getElementById("i13102301").style.display = "none";
               }
              
               if (Invocation3 != "") {
                   document.getElementById("i14073101").style.display = "block";
                   document.getElementById("i14073102").style.display = "block";
               }
               else {
                   document.getElementById("i14073101").style.display = "none";
                   document.getElementById("i14073102").style.display = "none";
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
           function f13100202(obj, obj1) {
               var dlgResult;
        
                  if (obj == "Text2") {
                      var url = "../SellManage/Customerinfo.aspx?come=cr";
                      var dlgResult = myShowModalDialog(url, window, 900, 500);
                      if (navigator.userAgent.indexOf("Chrome") > 0) {

                      }
                      else {
                          document.getElementById("cuid").value = dlgResult[0];
                          document.getElementById("Text2").value = dlgResult[1];
                      }
                  }
                
                  else {


                      var url = "../BaseInfo/EMPLOYEEINFO.aspx?come=se";
                      var dlgResult = myShowModalDialog(url, window, 900, 500);
                      if (navigator.userAgent.indexOf("Chrome") > 0) {

                      }
                      else {
                          if (dlgResult != undefined) {

                              document.getElementById("Text4").value = dlgResult[0];
                              document.all("Label1").innerText = dlgResult[1];
                          }
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