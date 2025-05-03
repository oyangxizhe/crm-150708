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

namespace WPSS.SellManage
{
    public partial class CustomerInfoT : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        basec bc = new basec();
        WPSS.Validate va = new Validate();
        int i;
        string v1, v2;
        int k;
        public static string[] str1 = new string[] { "" };
        public static string[] strE = new string[] { "" };
        public static string[] cukey = new string[] { "" };
        #region nature
        private string _EMID;
        public string EMID
        {
            set { _EMID = value; }
            get { return _EMID; }

        }
        private string _CUSTOMER_TYPE;
        public string CUSTOMER_TYPE
        {

            set { _CUSTOMER_TYPE = value; }
            get { return _CUSTOMER_TYPE; }

        }
        private string _TEL;
        public string TEL
        {
            set { _TEL = value; }
            get { return _TEL; }

        }
        private string _RMKEY;
        public string RMKEY
        {
            set { _RMKEY = value; }
            get { return _RMKEY; }

        }

        private string _CONTACT;
        public string CONTACT
        {
            set { _CONTACT = value; }
            get { return _CONTACT; }

        }
        private string _PHONE;
        public string PHONE
        {
            set { _PHONE = value; }
            get { return _PHONE; }

        }
        private string _FAX;
        public string FAX
        {
            set { _FAX = value; }
            get { return _FAX; }

        }
        private string _QQ;
        public string QQ
        {
            set { _QQ = value; }
            get { return _QQ; }

        }
        private string _ALWW;
        public string ALWW
        {
            set { _ALWW = value; }
            get { return _ALWW; }

        }
        private string _EMAIL;
        public string EMAIL
        {
            set { _EMAIL = value; }
            get { return _EMAIL; }

        }
        private string _DEPART;
        public string DEPART
        {
            set { _DEPART = value; }
            get { return _DEPART; }

        }
        private string _CUID;
        public string CUID
        {
            set { _CUID = value; }
            get { return _CUID; }

        }
        private string _PAYMENT_CLAUSE;
        public string PAYMENT_CLAUSE
        {
            set { _PAYMENT_CLAUSE = value; }
            get { return _PAYMENT_CLAUSE; }

        }
        private string _CUSTOMER_ID;
        public string CUSTOMER_ID
        {
            set { _CUSTOMER_ID = value; }
            get { return _CUSTOMER_ID; }

        }
        private string _CNAME;
        public string CNAME
        {
            set { _CNAME = value; }
            get { return _CNAME; }

        }
     
        private string _ADDRESS;
        public string ADDRESS
        {
            set { _ADDRESS = value; }
            get { return _ADDRESS; }

        }
       
        private string _MAKERID;
        public string MAKERID
        {
            set { _MAKERID = value; }
            get { return _MAKERID; }

        }
        private string _CUKEY;
        public string CUKEY
        {
            set { _CUKEY = value; }
            get { return _CUKEY; }

        }
        private bool _IFExecutionSUCCESS;
        public bool IFExecution_SUCCESS
        {
            set { _IFExecutionSUCCESS = value; }
            get { return _IFExecutionSUCCESS; }

        }
        private string _PAYMENT;
        public string PAYMENT
        {
            set { _PAYMENT = value; }
            get { return _PAYMENT; }

        }

        private string _SN;
        public string SN
        {
            set { _SN = value; }
            get { return _SN; }

        }
        private string _THE_DEFAULT;
        public string THE_DEFAULT
        {
            set { _THE_DEFAULT = value; }
            get { return _THE_DEFAULT; }

        }
        private string _PARTICIPANT_TIME;
        public string PARTICIPANT_TIME
        {
            set { _PARTICIPANT_TIME = value; }
            get { return _PARTICIPANT_TIME; }

        }
        private string _NEED;
        public string NEED
        {

            set { _NEED = value; }
            get { return _NEED; }

        }
        private string _ErrowInfo;
        public string ErrowInfo
        {

            set { _ErrowInfo = value; }
            get { return _ErrowInfo; }

        }
        private string _PROVINCE;
        public string PROVINCE
        {
            set { _PROVINCE = value; }
            get { return _PROVINCE; }

        }
        private string _REMARK;
        public string REMARK
        {
            set { _REMARK = value; }
            get { return _REMARK; }

        }
        private string _CITY;
        public string CITY
        {
            set { _CITY = value; }
            get { return _CITY; }

        }
        private string _POSITION;
        public string POSITION
        {

            set { _POSITION = value; }
            get { return _POSITION; }

        }
        private string _OPENID;
        public string OPENID
        {
            set { _OPENID = value; }
            get { return _OPENID; }

        }
        private string _PRODUCTION_RAGE;
        public string PRODUCTION_RAGE
        {
            set { _PRODUCTION_RAGE = value; }
            get { return _PRODUCTION_RAGE; }

        }
        #endregion
        CCUSTOMER_INFO ccustomer_info = new CCUSTOMER_INFO();

        protected void Page_Load(object sender, EventArgs e)
        {
          
            try
            {

                bindo();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
               

            }

        }
        protected void bindo()
        {

            if (!IsPostBack)
            {
                try
                {
                   
                    Text1.Value = Request.QueryString["cuid"].ToString();
                 
                }
                catch (Exception )
                {
                    if (str1[0] != "")
                    {
                        Text1.Value = str1[0];
                        str1[0] = "";
                    }
                    else
                    {

                        Text1.Value = strE[0];
                        strE[0] = "";

                    }
                
                }
               
                GridView1.DataSource = dtx();
                GridView1.DataBind();
                bind();
            }

           if (va.returnb() == true)
            Response.Redirect("\\Default.aspx");


        }
        protected void at(string sql,int n)
        {

           
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
           
          
            try
            {
                cukey[0] = "";
                string key = GridView2.DataKeys[GridView2.SelectedIndex].Values[0].ToString();
                at("SELECT * FROM CUSTOMERINFO_DET  where CUKEY='" + key + "' ", 0);
                cukey[0] = key;

            }
            catch (Exception)
            {

            }

        }
        protected void bind()
        {
            hint.Value = "";
            DataTable dt1 = basec.getdts(ccustomer_info.sqlsi+ " WHERE A.CUID='" + Text1.Value + "'");
            GridView2.DataSource = dt1;
            GridView2.DataKeyNames = new string[] { "CUKEY" };
            GridView2.DataBind();
            GridView1.DataSource = dtx();
            GridView1.DataBind();

        }
        #region dtx
        protected DataTable dtx()
        {

            DataTable dt4 = new DataTable();
            dt4.Columns.Add("项次", typeof(string));
           
            for (i = 1; i <= 4; i++)
            {
                DataRow dr = dt4.NewRow();
                dr["项次"] = i;
                dt4.Rows.Add(dr);

            }


            return dt4;
        }
        #endregion

        protected void ClearText()
        {
          
          
        }
    

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView2.DataKeys[e.RowIndex][0].ToString();
            if (bc.juageOne("SELECT * FROM CUSTOMERINFO_DET WHERE CUID='" + Text1.Value + "'"))
            {
                basec.getcoms("DELETE FROM CUSTOMERINFO_DET WHERE CUID='" + Text1.Value + "';DELETE FROM CUSTOMERINFO_MST WHERE CUID='" + Text1.Value + "'");
                GridView2.EditIndex = -1;
                bind();
            }
            else
            {
                string strSql = "DELETE FROM CUSTOMERINFO_DET WHERE CUKEY='" + id + "'";
                basec.getcoms(strSql);
                GridView2.EditIndex = -1;
                bind();
            }
            try
            {
                
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        


        #region addDeliveryAddress
        protected void addDeliveryAddress()
        {
            hint.Value = "";
            string year = DateTime.Now.ToString("yy");
            string month = DateTime.Now.ToString("MM");
            string day = DateTime.Now.ToString("dd");
            string varDate = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss").Replace("-", "/");
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 10, 10);
            string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");

            DataTable dtt = ccustomer_info.GetTableInfo();
            for (k = 0; k < 4; k++)
            {
                
                PROVINCE = ((TextBox)GridView1.Rows[k].Cells[0].FindControl("TextBox1")).Text;
                CITY = ((TextBox)GridView1.Rows[k].Cells[1].FindControl("TextBox2")).Text;
                CNAME = ((TextBox)GridView1.Rows[k].Cells[2].FindControl("TextBox3")).Text;
                CONTACT  = ((TextBox)GridView1.Rows[k].Cells[3].FindControl("TextBox4")).Text;
                DEPART  = ((TextBox)GridView1.Rows[k].Cells[4].FindControl("TextBox5")).Text;
                POSITION  = ((TextBox)GridView1.Rows[k].Cells[5].FindControl("TextBox6")).Text;
                PHONE   = ((TextBox)GridView1.Rows[k].Cells[6].FindControl("TextBox7")).Text;
                TEL  = ((TextBox)GridView1.Rows[k].Cells[0].FindControl("TextBox8")).Text;
                EMAIL  = ((TextBox)GridView1.Rows[k].Cells[1].FindControl("TextBox9")).Text;
                QQ = ((TextBox)GridView1.Rows[k].Cells[2].FindControl("TextBox10")).Text;
                OPENID= ((TextBox)GridView1.Rows[k].Cells[3].FindControl("TextBox11")).Text;
                PRODUCTION_RAGE = ((TextBox)GridView1.Rows[k].Cells[4].FindControl("TextBox12")).Text;
                PARTICIPANT_TIME = ((TextBox)GridView1.Rows[k].Cells[5].FindControl("TextBox13")).Text;
                NEED  = ((TextBox)GridView1.Rows[k].Cells[6].FindControl("TextBox14")).Text;
                CUSTOMER_TYPE = ((TextBox)GridView1.Rows[k].Cells[5].FindControl("TextBox15")).Text;
                REMARK = ((TextBox)GridView1.Rows[k].Cells[6].FindControl("TextBox16")).Text;

                DataRow dr = dtt.NewRow();
                dr["项次"] = (i + 1).ToString();
                dr["省份"] = PROVINCE;
                dr["市区"] = CITY;
                dr["单位名称"] = CNAME;
                dr["联系人"] = CONTACT;
                dr["部门"] = DEPART;
                dr["职务"] = POSITION;
                dr["固定电话"] = PHONE;
                dr["手机号码"] = TEL;
                dr["邮箱"] = EMAIL;
                dr["QQ"] = QQ;
                dr["微信号码"] = OPENID;
                dr["生产范围"] = PRODUCTION_RAGE;
                dr["参会时间"] = PARTICIPANT_TIME;
                dr["需求"] = NEED;
                dr["客户类型"] = CUSTOMER_TYPE;
                dr["备注"] = REMARK;
                dtt.Rows.Add(dr);
            }
            DataTable dtx = bc.GET_NOEXISTS_EMPTY_ROW_DT(dtt, "", "单位名称 IS NOT NULL and 单位名称<>''");
            if (dtx.Rows.Count > 0)
            {
                ccustomer_info.EMID = varMakerID;
                ccustomer_info.CUID = Text1.Value;
                ccustomer_info.CUSTOMER_ID = "";
                ccustomer_info.CNAME = "";
                ccustomer_info.PAYMENT = "";
                ccustomer_info.PAYMENT_CLAUSE = "";
                ccustomer_info.PROVINCE = "";
                ccustomer_info.save(dtx);
                bind();
            }
        }
        #endregion

        #region juage1()
        private bool juage1(int k)
        {
            string v1 = ((TextBox)GridView1.Rows[k].Cells[0].FindControl("TextBox1")).Text;
            string v2 = ((TextBox)GridView1.Rows[k].Cells[1].FindControl("TextBox2")).Text;
            string v3 = ((TextBox)GridView1.Rows[k].Cells[2].FindControl("TextBox3")).Text;
            string v4 = ((TextBox)GridView1.Rows[k].Cells[3].FindControl("TextBox4")).Text;
            string v5 = ((TextBox)GridView1.Rows[k].Cells[4].FindControl("TextBox5")).Text;
            string v6 = ((TextBox)GridView1.Rows[k].Cells[5].FindControl("TextBox6")).Text;

            bool ju = true;
            if (bc.checkphone(v2) == false)
            {
                ju = false;
                hint.Value = "电话号码只能输入数字！";

            }
            else if (bc.checkphone(v3) == false)
            {
                ju = false;
                hint.Value = "传真号码只能输入数字！";

            }
            else if (bc.checkphone(v4) == false)
            {
                ju = false;
                hint.Value = "邮编只能输入数字！";

            }

            else if (v6 == "")
            {

                ju = false;
                hint.Value = "地址不能为空！";

            }

            return ju;

        }
        #endregion
        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
            btnSave.Enabled = true;
            ClearText();
            Text1.Value = new CCUSTOMER_INFO().GETID();
            bind();
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {

            addDeliveryAddress();
            try
            {
              
            }
            catch (Exception)
            {

            }

        }

        protected void btnExit_Click(object sender, ImageClickEventArgs e)
        {
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../SellManage/CustomerInfo.aspx" + n2);
        }

      

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            for (k = 0; k < 4; k++)
            {
                ((TextBox)GridView1.Rows[k].Cells[0].FindControl("TextBox1")).Text = "";
                ((TextBox)GridView1.Rows[k].Cells[1].FindControl("TextBox2")).Text = "";
                ((TextBox)GridView1.Rows[k].Cells[2].FindControl("TextBox3")).Text = "";
                ((TextBox)GridView1.Rows[k].Cells[3].FindControl("TextBox4")).Text = "";
                ((TextBox)GridView1.Rows[k].Cells[4].FindControl("TextBox5")).Text = "";
                ((TextBox)GridView1.Rows[k].Cells[5].FindControl("TextBox6")).Text = "";
            }
        }
    }
}
