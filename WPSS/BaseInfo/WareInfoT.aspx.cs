using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using XizheC;
using System.IO;
using System.Diagnostics;
using System.Text;

namespace WPSS.BaseInfo
{
    public partial class WareInfoT : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        basec bc = new basec();
        
        WPSS.Validate va = new Validate();
        int i;
        public static string[] str1 = new string[] { "","","" };
        public static string[] strE = new string[] { "" };
        public string oldid { get; set; }
        DataTable dto = new DataTable();
        StringBuilder sqb = new StringBuilder();
        private bool _IFExecutionSUCCESS;
        public bool IFExecution_SUCCESS
        {
            set { _IFExecutionSUCCESS = value; }
            get { return _IFExecutionSUCCESS; }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
        
            try
            {
                if (!IsPostBack)
                {

                    Bind1();
                    Bind();
                }
                if (va.returnb() == true)
                    Response.Redirect("\\Default.aspx");
           
            }
            catch (Exception)
            {

            }
        }
        protected void Bind1()
        {
            hint.Value = "";
            getbinddata();
            if (str1[0] != "")
            {
                Text1.Value = str1[0];
                x2.Value = str1[1];
                x3.Value = str1[2];
                str1[0] = "";
                str1[1] = "";
                str1[2] = "";

            }
            else
            {

                Text1.Value = strE[0];
                strE[0] = "";
                dt = basec.getdts("select * from WareInfo where WAREID='" + Text1.Value + "'");
                if (dt.Rows.Count > 0)
                {

                    Text1.Value = dt.Rows[0]["WAREID"].ToString();
                    Text2.Value = dt.Rows[0]["CO_WAREID"].ToString();
                    Text3.Value = dt.Rows[0]["WNAME"].ToString();
                    Text4.Value = dt.Rows[0]["CWAREID"].ToString();
                    DropDownList1.Text = dt.Rows[0]["SPEC"].ToString();
                    Text5.Value = bc.getOnlyString("SELECT CNAME FROM CUSTOMERINFO_MST WHERE CUID='" + dt.Rows[0]["CUID"].ToString() + "'");
                  
                  
                    TextBox1.Text = dt.Rows[0]["REMARK"].ToString();
                  
                }

            }
     

        }
        #region getBindData()
        protected void getbinddata()
        {


            dto = SqlDT.SqlDTM("SPEC", "SPEC");
            if (DropDownList1.Items.Count-1 != dto.Rows.Count)
            {
                DropDownList1.Items.Add("");
                foreach (DataRow dr1 in dto.Rows)
                {
                  
                    DropDownList1.Items.Add(dr1[0].ToString());

                }
            }
        

        }
        #endregion
        protected void Bind()
        {
            DataList1.DataSource = dtx();
            DataList1.DataBind();
            DataTable dt1 = basec.getdts("SELECT * FROM WAREFILE WHERE WAREID='" + Text1.Value + "'");
            GridView1.DataSource = dt1;
            GridView1.DataKeyNames = new string[] { "FLKEY" };
            GridView1.DataBind();

        }
        protected DataTable dtx()
        {
            dt.Columns.Add("C", typeof(string));
            for (i = 0; i < 4; i++)
            {
                DataRow dr = dt.NewRow();
                dr["C"] = Convert.ToString(i);
                dt.Rows.Add(dr);
            }
            return dt;
        }
        #region ClearText()
        protected void ClearText()
        {
            Text2.Value = "";
            Text3.Value = "";
            Text4.Value = "";
            DropDownList1.Text= "";
            Text5.Value = "";
          
          
            TextBox1.Text = "";
          
        }
        #endregion
        protected void btnOnloadFile_Click(object sender, EventArgs e)
        {
          
            try
            {
                CFileInfo cf = new CFileInfo();
                cf.OnloadFile(Text1.Value);
                hint.Value = cf.ErrowInfo;
                Bind();
            }
            catch (Exception)
            {

            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
                e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#C9D3E2',this.style.fontWeight='';");
                //当鼠标离开的时候 将背景颜色还原的以前的颜色 
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
                e.Row.Attributes["style"] = "Cursor:pointer";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string id = GridView1.DataKeys[e.RowIndex][0].ToString();
                string FilePath = bc.getOnlyString("SELECT PATH FROM WAREFILE WHERE FLKEY='" + id + "'");
                string s1 = Server.MapPath(FilePath);
                if (File.Exists(s1))
                {
                    File.Delete(s1);
                }
                string strSql = "DELETE FROM WAREFILE WHERE FLKEY='" + id + "'";
                basec.getcoms(strSql);
                GridView1.EditIndex = -1;
                Bind();
            }
            catch (Exception)
            {


            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                string v1 = GridView1.DataKeys[GridView1.SelectedIndex].Values[0].ToString();
                string FilePath = bc.getOnlyString("SELECT PATH FROM WAREFILE WHERE FLKEY='" + v1 + "'");
                FileInfo file = new FileInfo(Server.MapPath(FilePath));
                if (file.Exists)
                {
                    Response.Clear();
                    string fileName = HttpUtility.UrlEncode(file.Name);
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                    //Response.AddHeader("Content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream;charset=gb2312";
                    Response.Filter.Close();
                    Response.WriteFile(file.FullName);
                    Response.End();
                }
            }
            catch (Exception)
            {

            }

        }

        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
    
            try
            {
                btnSave.Enabled = true;
                ClearText();
                Text1.Value = bc.numYM(9, 4, "0001", "SELECT * FROM WAREINFO", "WAREID", "9");

                /*purchaseunitprice*/
                string a = bc.numYM(10, 4, "0001", "select * from PurchaseUnitPrice", "PPID", "PP");
                if (a == "Exceed limited")
                {

                    hint.Value = "编码超出限制！";
                }
                else
                {
                    x2.Value = a;

                }
                /*purchaseunitprice*/

                /*sellunitprice*/
                string a1 = bc.numYM(10, 4, "0001", "select * from SellUnitPrice", "SPID", "SP");
                if (a1 == "Exceed limited")
                {

                    hint.Value = "编码超出限制！";
                }
                else
                {
                    x3.Value = a1;

                }
                /*sellunitprice*/
                Bind();
            }
            catch (Exception)
            {
            }

          
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {

            save(false);
            try
            {
              
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void save(bool ifcopy)
        {
            hint.Value = "";
            string sql;
            string year = DateTime.Now.ToString("yy");
            string month = DateTime.Now.ToString("MM");
            string day = DateTime.Now.ToString("dd");
            string varDate = DateTime.Now.ToString("yyy-MM-dd HH:mm:ss");
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 10, 10);
            string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");
            if (ac1() == 0)
            {
                return;
            }
           else  if (!bc.exists("SELECT WAREID FROM WAREINFO WHERE WAREID='" + Text1.Value + "'"))
            {
               
                SqlConnection sqlcon = bc.getcon();
                 sql = @"INSERT INTO WAREINFO(
WAREID,
CO_WAREID,
WNAME,
CWAREID,
SPEC,
CUID,
REMARK,
DATE,
MAKERID,
YEAR,
ACTIVE,
MONTH
)
VALUES 
(
@WAREID,
@CO_WAREID,
@WNAME,
@CWAREID,
@SPEC,
@CUID,
@REMARK,
@DATE,
@MAKERID,
@YEAR,
@ACTIVE,
@MONTH
)

";
                SQlcommandE(sql);
                if (DropDownList25.Text == "正常")
                {
                /*purchaseunitprice 1/1*/
               
                    if (!bc.exists("SELECT * FROM PURCHASEUNITPRICE WHERE PPID='" + x2.Value + "'"))
                    {
                        basec.getcoms(@"insert into PurchaseUnitPrice(PPID,WAREID,MakerID,
Date,Year,Month) values('" + x2.Value + "','" + Text1.Value + "','" + varMakerID + "', '" + varDate +
             "','" + year + "','" + month + "')");
                    }
                    /*purchaseunitprice 1/1*/

                    /*sellunitprice 1/1*/

                    if (!bc.exists("SELECT * FROM SELLUNITPRICE WHERE SPID='" + x3.Value + "'"))
                    {
                        basec.getcoms(@"insert into SELLUNITPRICE(SPID,WAREID,MakerID,
Date,Year,Month) values('" + x3.Value + "','" + Text1.Value + "','" + varMakerID + "', '" + varDate +
             "','" + year + "','" + month + "')");
                    }
                    /*sellunitprice 1/1*/
                }
                IFExecution_SUCCESS = true;
            }
            else
            {
                SqlConnection sqlcon = bc.getcon();
                sql = @"UPDATE WAREINFO SET 

CO_WAREID=@CO_WAREID,
WNAME=@WNAME,
CWAREID=@CWAREID,
SPEC=@SPEC,
CUID=@CUID,
REMARK=@REMARK,
DATE=@DATE,
MAKERID=@MAKERID,
YEAR=@YEAR,
MONTH=@MONTH,
ACTIVE=@ACTIVE
WHERE WAREID='" + Text1.Value +"'";
                SQlcommandE(sql);
                IFExecution_SUCCESS = true;
            }
            if(ifcopy==false ) 
            {
                if (bc.GET_IFExecutionSUCCESS_HINT_INFO(IFExecution_SUCCESS) != "")
                {
                    hint.Value = bc.GET_IFExecutionSUCCESS_HINT_INFO(IFExecution_SUCCESS);
                }
                else
                {
                    hint.Value = "";
                }
            }
          
           
        }
        #region ac1()
        private int ac1()
        {

            int x = 1;
            if (Text3.Value == "")
            {
                x = 0;
                hint.Value = "品名不能为空！";
            }
            else  if (Text5.Value == "")
            {
                x = 0;
                hint.Value = "该客户名称不能为空！";
            }
            else if (!bc.exists("select * from customerinfo_MST where cname='" + Text5.Value + "'"))
                {
                    x = 0;
                    hint.Value = "该客户名称不存在于系统中！";

                }
           
          
           
          
     
            return x;

        }
        #endregion
        protected void btnExit_Click(object sender, ImageClickEventArgs e)
        {
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../BaseInfo/WareInfo.aspx"+n2);
        }
        #region SQlcommandE
        protected void SQlcommandE(string sql)
        {
            string year = DateTime.Now.ToString("yy");
            string month = DateTime.Now.ToString("MM");
            string day = DateTime.Now.ToString("dd");
            string varDate = DateTime.Now.ToString("yyy-MM-dd HH:mm:ss");
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 10, 10);
            string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");
            SqlConnection sqlcon = bc.getcon();
            SqlCommand sqlcom = new SqlCommand(sql, sqlcon);
            sqlcom.Parameters.Add("@WAREID", SqlDbType.VarChar, 20).Value = Text1.Value;
            sqlcom.Parameters.Add("@CO_WAREID", SqlDbType.VarChar, 20).Value = Text2.Value;
            sqlcom.Parameters.Add("@WNAME", SqlDbType.VarChar, 20).Value = Text3.Value;
            sqlcom.Parameters.Add("@CWAREID", SqlDbType.VarChar, 20).Value = Text4.Value;
            sqlcom.Parameters.Add("@SPEC", SqlDbType.VarChar, 20).Value = DropDownList1.Text;
            sqlcom.Parameters.Add("@CUID", SqlDbType.VarChar, 20).Value = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_MST WHERE CNAME='" + Text5.Value + "'");
         

          
            sqlcom.Parameters.Add("@REMARK", SqlDbType.VarChar, 1000).Value = TextBox1.Text;
            sqlcom.Parameters.Add("@DATE", SqlDbType.VarChar, 20).Value = varDate;
            sqlcom.Parameters.Add("@MAKERID", SqlDbType.VarChar, 20).Value = varMakerID;
            sqlcom.Parameters.Add("@YEAR", SqlDbType.VarChar, 20).Value = year;
            sqlcom.Parameters.Add("@MONTH", SqlDbType.VarChar, 20).Value = month;
       
            if (DropDownList25.Text == "正常")
            {
                sqlcom.Parameters.Add("@ACTIVE", SqlDbType.VarChar, 20).Value = "Y";
            }
            else if (DropDownList25.Text == "Hold")
            {
                sqlcom.Parameters.Add("@ACTIVE", SqlDbType.VarChar, 20).Value = "HOLD";
            }
            else
            {
                sqlcom.Parameters.Add("@ACTIVE", SqlDbType.VarChar, 20).Value = "N";

            }
           
            sqlcon.Open();
            sqlcom.ExecuteNonQuery();
            sqlcon.Close();
        }
        #endregion

        protected void btnReconcile_Click(object sender, EventArgs e)
        {
            oldid = Text1.Value;
            string var1 = bc.numYM(9, 4, "0001", "SELECT * FROM WareINFO", "WAREID", "9");
            Text1.Value  = var1;

            /*purchaseunitprice*/
            string a = bc.numYM(10, 4, "0001", "select * from PurchaseUnitPrice", "PPID", "PP");
            if (a == "Exceed limited")
            {

                hint.Value = "编码超出限制！";
            }
            else
            {
                x2.Value = a;

            }
            /*purchaseunitprice*/

            /*sellunitprice*/
            string a1 = bc.numYM(10, 4, "0001", "select * from SellUnitPrice", "SPID", "SP");
            if (a1 == "Exceed limited")
            {

                hint.Value = "编码超出限制！";
            }
            else
            {
                x3.Value  = a1;

            }
            save(true);

            dt = bc.getdt("select * from WareFile where WareID='"+oldid +"'");
            sqb = new StringBuilder();
            string varDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss").Replace("/", "-");
            string year, month, day;
            year = DateTime.Now.ToString("yy");
            month = DateTime.Now.ToString("MM");
            day = DateTime.Now.ToString("dd");
            try
            {
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {

                        string v1 = bc.numYMD(20, 12, "000000000001", "SELECT * FROM WAREFILE", "FLKEY", "FL");
                        basec.getcoms(@"INSERT INTO WAREFILE(FLKEY,WAREID,OLDFILENAME,PATH,DATE,YEAR,MONTH,DAY) VALUES 
('" + v1 + "','" + Text1.Value + "','" + dr["oldfilename"].ToString() + "','" + dr["path"].ToString() + "','" + varDate + "','" + year + "','" + month + "','" + day + "')");
                    }

                }
                IFExecution_SUCCESS = true;
            }
            catch (Exception)
            {
                IFExecution_SUCCESS = false;

            }

            if (bc.GET_IFExecutionSUCCESS_HINT_INFO(IFExecution_SUCCESS) != "")
            {
                hint.Value = bc.GET_IFExecutionSUCCESS_HINT_INFO(IFExecution_SUCCESS);
            }
            else
            {
                hint.Value = "";
            }
            try
            {
                
            }
            catch (Exception)
            {

            }
        }
        protected void reconcile()
        {


           
        }
        private void edit()
        {



           


        }

      }
}
