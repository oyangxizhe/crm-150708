<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfoT.aspx.cs" Inherits="WPSS.SellManage.CustomerInfoT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>编辑客户信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta name ="Description" content ="进销存管理系统" />
<meta name ="keywords" content ="进销存管理系统,进销存管理软件,ERP,小微企业管理系统,希哲软件" />
       <link href ="../Css/SSBase.css"  type ="text/css" rel ="Stylesheet" />
       <link href ="../Css/S131017.css"  type ="text/css" rel ="Stylesheet" />
    </head>
<body >
   <form id="form1" runat="server">
   <input id="hint" type="hidden"  runat="server" />
                <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;编辑客户信息 </div>
     <div class="c13101907" id ="Div10">
 </div>
    </div>
  <div class ="c13110501">
      <div class="c13110502" id ="Div1">
   <span class="c13110508" id ="Span1">
       <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Image/btnAdd.png"    onclick="btnAdd_Click"  />
          </span>
       </div>
              <div class="c13110510" id ="Div3">
   <span class="c13110511" id ="Span4">
                  (新增)
          </span>
       </div>
             <div class="c13110502" id ="Div18">
   <span class="c13110508" id ="Span3">
       <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Image/btnSave.png" 
                     onclick="btnSave_Click"  />
          </span>
       </div>
              <div class="c13110510" id ="Div19">
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
                 <div class="c13110510" id ="Div24">
   <span class="c13110511" id ="Span6">
                     (退出)
          </span>
       </div>
    </div>

<div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div> 
  <div class ="c13101902">
      <div class="c13101903" id ="Div2">
          客户代码</div>
     <div class="c13101904" id ="Div4">
<input id="Text1" type="text"  runat="server"   readonly ="readonly" class="c13112201"/> 
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Text1" Text="必填！" runat="server" /></div>
         <div class="c13101903" id ="Div5">
            </div>
     <div class="c13102401" id ="Div6">
   &nbsp;</div>
           </div>

<div class ="c13111602">
             
          
            <asp:GridView ID="GridView1" runat="server" Width="650px" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        AutoGenerateColumns="False" style="margin-left: 8px" PageSize="15" 
                        CssClass ="c13102001"
                   >
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >
                            <asp:TemplateField HeaderText="SN"  Visible ="false"  >
                <ItemTemplate >
                                
                                <a ><%#Eval ("项次") %>'</a>   
                </ItemTemplate>
                 <HeaderStyle Width="60px" />
                 <ItemStyle Width="60px"  ForeColor="#595d5a" />
            </asp:TemplateField>  
           <asp:TemplateField HeaderText="省份" >
                <ItemTemplate >
                                <asp:TextBox ID="TextBox1" runat="server"   Width ="60px"   ></asp:TextBox>   
                </ItemTemplate>
                 <HeaderStyle Width="60px" />
                 <ItemStyle Width="60px"  ForeColor="#595d5a" />
            </asp:TemplateField> 
               <asp:TemplateField HeaderText="市区">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox2" runat="server"  Width ="80px" CssClass ="c13120501" ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                    <asp:TemplateField HeaderText="单位名称">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox3" runat="server"  Width ="150px"  BackColor ="#e0efda" CssClass ="c13120501"></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="150px" />
                 <ItemStyle Width="150px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                    <asp:TemplateField HeaderText="联系人">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox4" runat="server"   Width ="60px"  CssClass ="c13120501" ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="60px" />
                 <ItemStyle Width="60px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
      
                    <asp:TemplateField HeaderText="部门">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox5" runat="server"   Width ="80px"  CssClass ="c13120501"></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="职务">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox6" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField>  
                 <asp:TemplateField HeaderText="固定电话">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox7" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="手机号码">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox8" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="邮箱">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox9" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="QQ">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox10" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 

                          <asp:TemplateField HeaderText="微信号码">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox11" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="生产范围">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox12" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="参会时间">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox13" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 


                          <asp:TemplateField HeaderText="需求">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox14" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="客户类型">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox15" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                              <asp:TemplateField HeaderText="备注">
                <ItemTemplate >
                 <asp:TextBox ID="TextBox16" runat="server"  Width ="80px"  ></asp:TextBox>                     
                </ItemTemplate>
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px"  ForeColor="#595d5a"/>
            </asp:TemplateField> 
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                </div>
<div class ="c13102302">
           <asp:GridView ID="GridView2" runat="server" 
                    AllowPaging="True" 
              
                    onrowdeleting="GridView2_RowDeleting" 
                    AllowSorting="True"   
                    onrowdatabound="GridView2_RowDataBound" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged" 
                        AutoGenerateColumns="False"  PageSize="15" 
                           CssClass ="c13112304"
                   
                   >
                   
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns >


           
                                <asp:TemplateField HeaderText="删除" >
                <ItemTemplate >
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                        OnClientClick="return confirm('您确认删除该记录吗?');" Text="删除"  CommandName ="delete" ></asp:LinkButton>                     
                </ItemTemplate>
               <ItemStyle Width="2%" ForeColor="#595d5a" />
                <HeaderStyle HorizontalAlign="Center" Width="2%" />
            </asp:TemplateField>
                             <asp:BoundField DataField="客户代码" HeaderText="客户代码" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                          <asp:BoundField DataField="省份" HeaderText="省份" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="市区" HeaderText="市区" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         


                            <asp:BoundField DataField="单位名称" HeaderText="单位名称" >
                              <ItemStyle Width="10%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="联系人" HeaderText="联系人" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="部门" HeaderText="部门" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>


                            <asp:BoundField DataField="职务" HeaderText="职务" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="固定电话" HeaderText="固定电话" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="手机号码" HeaderText="手机号码" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="邮箱" HeaderText="邮箱" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="QQ号" HeaderText="QQ号" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>

                           <asp:BoundField DataField="微信号码" HeaderText="微信号码" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="生产范围" HeaderText="生产范围" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="参会时间" HeaderText="参会时间" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                           

                         <asp:BoundField DataField="需求" HeaderText="需求" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="客户类型" HeaderText="客户类型" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="备注" HeaderText="备注" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>

                         <asp:BoundField DataField="接收工号" HeaderText="接收工号" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="接收人" HeaderText="接收人" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="选中颜色" HeaderText="选中颜色" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                        <asp:BoundField DataField="制单人" HeaderText="制单人" >
                              <ItemStyle Width="4%" ForeColor="#595d5a" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                        
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>
                </div>
      <script type ="text/javascript" >
          window.onload = function onload1() {
              var Invocation = document.getElementById("hint").value;
              if (Invocation != "") {
                  document.getElementById("i13102301").style.display = "block";
                  document.all("prompt").innerText = Invocation;
              }
              else {
                  document.getElementById("i13102301").style.display = "none";
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