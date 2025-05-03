<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="WPSS.SellManage.CustomerInfo" EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>客户信息</title>
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
         <input id="come" type="hidden"  runat="server" />
              <input id="x" type="hidden"  runat="server" />
       <div >
                  <div class ="c13101905">
      <div class="c13101906" id ="Div9">
          &gt;客户信息 </div>
     <div class="c13101907" id ="Div10">
 </div>
           </div>
      <div class ="c13110501">

       
           <div class="c13110507" id ="Div4">
                  <span class="c13110503" id ="Span1">
     <asp:ImageButton ID="ImageButton3" 
                 runat="server" ImageUrl="~/Image/btnAdd.png" Width="60px" 
                      onclick="btnAdd_Click"  />
          </span>
             <span class="c13110505" id ="Span3">
             <asp:Label ID="Label4" runat="server" Text="(新增)"></asp:Label>
              </span>
   </div>
<div class="c13110507" id ="Div7">
                  <span class="c13110503" id ="Span9">
     <asp:ImageButton ID="ImageButton4" 
                 runat="server" ImageUrl="~/Image/btnDelete.png" Width="60px"  OnClientClick="return confirm('您确认删除该记录吗?');"
                      onclick="btnDel_Click" />
          </span>
             <span class="c13110505" id ="Span10">
             <asp:Label ID="Label5" runat="server" Text="(删除)"></asp:Label>
              </span>
   </div>
          <div class ="c18071003"></div>
          <div class="c13110506" id ="Div20">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div5">
                                                        省份：</div>
     <div class="c14111903" id ="Div6">
            <asp:DropDownList  ID="DropDownList3" runat="server"    CssClass ="c13111101 ">
                <asp:ListItem ></asp:ListItem>
       <asp:ListItem >北京</asp:ListItem>
<asp:ListItem >天津</asp:ListItem>
<asp:ListItem >上海</asp:ListItem>
<asp:ListItem >重庆</asp:ListItem>
<asp:ListItem >河北</asp:ListItem>
<asp:ListItem >河南</asp:ListItem>
<asp:ListItem >湖北</asp:ListItem>
<asp:ListItem >湖南</asp:ListItem>
<asp:ListItem >江苏</asp:ListItem>
<asp:ListItem >江西</asp:ListItem>
<asp:ListItem >辽宁</asp:ListItem>
<asp:ListItem >吉林</asp:ListItem>
<asp:ListItem >黑龙</asp:ListItem>
<asp:ListItem >陕西</asp:ListItem>
<asp:ListItem >山西</asp:ListItem>
<asp:ListItem >山东</asp:ListItem>
<asp:ListItem >四川</asp:ListItem>
<asp:ListItem >青海</asp:ListItem>
<asp:ListItem >安徽</asp:ListItem>
<asp:ListItem >海南</asp:ListItem>
<asp:ListItem >广东</asp:ListItem>
<asp:ListItem >贵州</asp:ListItem>
<asp:ListItem >浙江</asp:ListItem>
<asp:ListItem >福建</asp:ListItem>
<asp:ListItem >台湾</asp:ListItem>
<asp:ListItem >甘肃</asp:ListItem>
<asp:ListItem >云南</asp:ListItem>
<asp:ListItem >西藏</asp:ListItem>
<asp:ListItem >宁夏</asp:ListItem>
<asp:ListItem >广西</asp:ListItem>
<asp:ListItem >新疆</asp:ListItem>
<asp:ListItem >内蒙</asp:ListItem>
<asp:ListItem >香港</asp:ListItem>
<asp:ListItem >澳门</asp:ListItem>

            </asp:DropDownList></div>
                            <div class="c13110104" id ="Div1">
                                市区
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
                        <span class="c14111901">～</span>
                 </div>
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
          
   </div>
            <div class="c13110507" id ="Div31">
                  <span class="c13110503" id ="Span7">
     <asp:ImageButton ID="ImageButton2" 
                 runat="server" ImageUrl="~/Image/Excel_big.png" Width="60px" 
                      onclick="btnToExcel_Click" />
          </span>
             <span class="c13110505" id ="Span8">
             <asp:Label ID="Label3" runat="server" Text="(导出)"></asp:Label>
              </span>
   </div>
    </div>
    <div class ="c13112601">
       <div class="c14031301" id ="Div25">
           &nbsp;</div>

          <div class="c13112603" id ="Div26">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div27">
                            单位名称：</div>
     <div class="c14111903" id ="Div28">
            <input id="Text2" type="text"  runat ="server" class="c14111902" /></div>
                            <div class="c13110104" id ="Div29">
                                备注：</div>
     <div class="c14111903" id ="Div30">
     <input id="Text3" type="text"  runat ="server" class="c14111902" />
                            </div>
           </div>
           
</div>
        <div class="c18060901" id ="Div16">
              每页显示记录数：</div>
        <div class="c18060901" id ="Div24">
                 <asp:DropDownList  ID="DropDownList2" runat="server"   style="width :70px;height :20px;" AutoPostBack="true"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
      <asp:ListItem>15</asp:ListItem>
              <asp:ListItem >30</asp:ListItem>
               <asp:ListItem >50</asp:ListItem>
                  <asp:ListItem>全部</asp:ListItem>
            </asp:DropDownList></div>
    </div>
    <div class ="c13112601">
       <div class="c14031301" id ="Div11">
           &nbsp;</div>

          <div class="c13112603" id ="Div15">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div17">
                            部门：</div>
     <div class="c14111903" id ="Div18">
           <asp:DropDownList  ID="DropDownList1" runat="server"    CssClass ="c13111101 ">
       
            </asp:DropDownList>
                        </div>
                            <div class="c13110104" id ="Div22">
                              </div>
     <div class="c14111903" id ="Div23">

                            </div>
           </div>
           
</div>
      <div class="c18071001" id ="Div19">
          <div class="c18071101" id ="Div42">
                <input id="File2" type="file" name="File" runat="server" style="width: 300px;  margin-top :5px; margin-left :5px;   border-style: groove; border-width: thin;"/>
                            </div>
          <div class="c14111903" id ="Div44">
         
                          <span style =" float :left ; margin-left :30px;">   <asp:Button ID="Button1" runat="server" onclick="btnOnloadFile_Click" 
               Text="上传" /></span>
        
                            </div>
           </div>
    </div>
 <div class ="c13112601">
       <div class="c14031301" id ="Div32">
           &nbsp;</div>

          <div class="c13112603" id ="Div33">
          <div class ="c13110101">
                        <div class="c13110104" id ="Div34">
                            <asp:Label ID="Label1" runat="server" Text="分配给："></asp:Label></div>
     <div class="c14111903" id ="Div35">
           <asp:DropDownList  ID="DropDownList4" runat="server"    CssClass ="c13111101 ">
       
            </asp:DropDownList>
                        </div>
                            <div class="c18071002" id ="Div36">
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">确认分配</asp:LinkButton>
                              </div>
     <div class="c14111903" id ="Div37">

                            </div>
           </div>
           
</div>
      <div class="c18071001" id ="Div38">
          <div class="c14111903" id ="Div39">
              <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"  >标红色</asp:LinkButton>
                            </div>
          <div class="c14111903" id ="Div40">
              <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" >标蓝色</asp:LinkButton>
                            </div>
          <div class="c14111903" id ="Div41">
              <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" >不标色</asp:LinkButton>
                            </div>
           </div>
    </div>

             </div>
   <div  id="i13102301" class ="c13102101">
<span  class ="c13102102"><asp:Label ID="prompt" runat="server"  ForeColor="#f80707"></asp:Label></span>
</div>
             <div >
         <div class ="c18070901"">
             <asp:GridView ID="GridView1" runat="server" 
                    AllowPaging="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onrowdeleting="GridView1_RowDeleting" 
                    AllowSorting="True"   
                    onrowdatabound="GridView1_RowDataBound" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        AutoGenerateColumns="False"  PageSize="15" 
                           CssClass ="c13112304"
                   
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
 <asp:BoundField DataField="序号" HeaderText="序号"  >
                              <ItemStyle Width="2%"  HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" Width="2%" />
                          </asp:BoundField>
           
             <asp:TemplateField HeaderText="客户代码">
                <ItemTemplate >
                     <a href ="customerinfot.aspx?cuid=<%#Eval ("CUID") %>&aore=1" target="_search"><%#Eval ("CUID") %></a>                    
                </ItemTemplate>
                 <HeaderStyle Width="4%" />
                 <ItemStyle Width="4%"  />
            </asp:TemplateField>   
                         
                          <asp:BoundField DataField="省份" HeaderText="省份" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="市区" HeaderText="市区" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         
                              <asp:TemplateField HeaderText="单位名称"  >
                <ItemTemplate >
             
                    <asp:Label ID ="L1" runat ="server" Text ='<%#Eval ("单位名称") %>'></asp:Label>                   
                </ItemTemplate>
         <ItemStyle Width="10%"  />
          <HeaderStyle HorizontalAlign="Center" Width="10%" />
            </asp:TemplateField>

                       
                   <asp:BoundField DataField="联系人" HeaderText="联系人" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="部门" HeaderText="部门" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>


                            <asp:BoundField DataField="职务" HeaderText="职务" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="固定电话" HeaderText="固定电话" >
                              <ItemStyle Width="8%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="8%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="手机号码" HeaderText="手机号码" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="邮箱" HeaderText="邮箱" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="QQ号" HeaderText="QQ号" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>

                           <asp:BoundField DataField="微信号码" HeaderText="微信号码" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="生产范围" HeaderText="生产范围" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="参会时间" HeaderText="参会时间" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                           

                         <asp:BoundField DataField="需求" HeaderText="需求" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                   <asp:BoundField DataField="客户类型" HeaderText="客户类型" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="备注" HeaderText="备注" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>

                        
                   <asp:BoundField DataField="接收人" HeaderText="接收人" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                         <asp:BoundField DataField="选中颜色" HeaderText="选中颜色" >
                              <ItemStyle Width="4%" />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                        <asp:BoundField DataField="制单人" HeaderText="制单人" >
                              <ItemStyle Width="4%"  />
                                    <HeaderStyle HorizontalAlign="Center" Width="4%" />
                          </asp:BoundField>
                        
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Bold="False" />   
                </asp:GridView>


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
    function f13100302(obj, obj1, obj2, obj3, obj4) {
        var arr1 = new Array();
        arr1[0] = obj;
        arr1[1] = obj1;
        arr1[2] = obj2;
        arr1[3] = obj3;
        arr1[4] = obj4;

        if (navigator.userAgent.indexOf("Chrome") > 0) {
            if (document.getElementById("come").value == "se") {
                window.opener.document.getElementById("cuid").value = obj;//cuid
                window.opener.document.getElementById("Text5").value = obj1;//cname
            }
            else if (document.getElementById("come").value == "price") {
                window.opener.document.getElementById("Text6").value = obj;//cuid
                window.opener.document.getElementById("Text8").value = obj1;//cname
            }
            else if (document.getElementById("come").value == "wa") {

                window.opener.document.getElementById("Text5").value = obj1;//cname
            }
            else if (document.getElementById("come").value == "ar") {

                window.opener.document.getElementById("Text2").value = obj;//cuid
                window.opener.document.getElementById("Text3").value = obj1;//cname
            }
            else if (document.getElementById("come").value == "orderreconcile") {

                window.opener.document.getElementById("Text1").value = obj1;//cname
            }
            else if (document.getElementById("come").value == "cr") {

                window.opener.document.getElementById("Text2").value = obj1;//cname
            }
            else {

                window.opener.document.getElementById("Text2").value = obj;//cuid
                window.opener.document.getElementById("Text5").value = obj1;//cname
                window.opener.document.getElementById("Text6").value = obj2;//address
                window.opener.document.getElementById("Text4").value = obj3;//contact
                window.opener.document.getElementById("Text11").value = obj4;//phone
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
