<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WPSS.Main" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>客户关系管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta name ="Description" content ="客户关系管理系统" />
<meta name ="keywords" content =<"B/S架构客户关系管理系统","客户关系管理系统","客户关系管理软件" />
 
    <link rel="Stylesheet" href="Css/view.css" type ="text/css" />
</head>
<body  class ="c131010701"  onload ="onload1()">
<form runat ="server"  >
    <input id="usido" type="hidden"  runat="server" />
  <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"> 
    <Services> 
        <asp:ServiceReference Path="WebService1.asmx"  /> 
    </Services> 
    </asp:ScriptManager>  
<div  class="c13042401">
             <div class ="c13051001">
      <div class="c13052503" id ="Div2">
   <span class="c13052504" id ="Span1"><img src ="Image/logo_index.png" alt ="" /></span>
       </div>
       
          <div class="c13052908" id ="Div3">
<img id="i13052801" src=""  alt=""  style =" display :none ; float :left ; margin-top :16px; color :Blue "/>
              <span style =" margin-right :10px;"><asp:Label ID="Label1" runat="server" ></asp:Label></span>
          <span style =" margin-right :10px;"><asp:Label ID="L1" runat="server" ></asp:Label></span>
         <span style =" margin-right  :10px;"><asp:Label ID="L2" runat="server" ></asp:Label></span>
         <span style =" margin-right  :10px;"><asp:Label ID="L3" runat="server" ></asp:Label></span>
         <span  style =" margin-left :25px;"> 
              <a href ="Default.aspx" target ="_top"><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" >退出</asp:LinkButton></a></span></div>
   
 
    </div> 
  <div id="13102901" class="c13102901" />
      <div class="c13051201" id="i13053105">
   <span class="c13051005" >    
          <asp:DataList ID="DataList1" runat="server" RepeatColumns="1"  width="100%" Height ="100%">
                　<ItemTemplate >
<div style =" float :left ; width:40%"><div id ="<%#Eval ("NODEID") %>" class ="c13050101 " onclick ="f15060702('<%#Eval ("nodeid")%>')"> 
<img   src ="<%#Eval ("IMAGE_URL") %>"  alt ="" > </div></div>
<div id="<%#Eval ("TEMP") %>" class ="c15060804" onclick ="f15060702('<%#Eval ("nodeid")%>')"><span  class ="c15060805"><%#Eval ("NODE_NAME") %></span></div>         
</ItemTemplate> 　
</asp:DataList></span>
       </div>
        <div class="c13051202" id ="i13053106">
<iframe   id="wk" name="ContentP" frameborder="0"  
        style="height: 100%; width :100% "  ></iframe>
    </div>
      </div>

  </div>
   <div style ="height:300px;width:100%"></div>
      <script type ="text/javascript" >
          var arr1 = new Array();
          window.onload = function onload1() {
              var Invocation = document.getElementById("wk");
              Invocation.target = "ContentP";
              Invocation.src = "view.aspx?usid=" + document.getElementById("usido").value + "";
           
              document.getElementById(181).className = "c15060806";
              var usidt= document.getElementById("usido").value;
              WPSS.WebService1.GET_PARENT_NODEID(usidt,onSuccess, onFail);
          }
          window.onunload = function onunload1() {
              document.getElementById("LinkButton1").click();

          }
          function onSuccess(value, context) {
              arr1 = value;
          }
          function onFail(value) {
              alert(value);
          }
          function f15060702(obj) {
              for (var i = 0; i < arr1.length; i++) {
                 
                  if (obj == arr1[i]) {
                  
                      document.getElementById(arr1[i] + "1").className = "c15060806";
                  }
                  else {

                    
                      document.getElementById(arr1[i] + "1").className = "c15060804";
                  }
                
              }
              var Invocation = document.getElementById("wk");
              Invocation.target = "ContentP";
              Invocation.src = "view.aspx?parent_nodeid=" + obj + "&usid=" + document.getElementById("usido").value + "";
          }
      </script>


          </form> 
</body>

</html>