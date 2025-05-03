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
using System.Net;
using System.Text;
using XizheC;
using System.IO;
using System.Diagnostics;

namespace WPSS.SellManage
{
    public partial class CustomerInfo : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        CFileInfo cfileinfo = new CFileInfo();
        basec bc = new basec();
        StringBuilder sqb = new StringBuilder();
        public string CUID { set; get; }
        public string USID { set; get; }
        public string CNAME { set; get; }
        public bool IFExecution_SUCCESS { set; get; }

        protected string M_str_sql1;
        WPSS.Validate va = new Validate();
        DataTable dto = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Response.Expires = 0;
            if (!IsPostBack)
            {
                StartDate.Value = DateTime.Now.ToString("yyyy/MM/dd").Replace("-", "/");
                EndDate.Value = DateTime.Now.ToString("yyyy/MM/dd").Replace("-", "/");
                CheckBox1.Checked = true;
                Bind();
            }
           
            try
            {
                if (Request.QueryString["come"] != null)
                {
                    come.Value = Request.QueryString["come"].ToString();
                }

            }
            catch (Exception)
            {

            }
            if (va.returnb() == true)
            Response.Redirect("\\Default.aspx");  
        }

        #region Bind()
        private void Bind()
        {
            Label1.Visible = false;
            Label3.Visible = false;
            DropDownList4.Visible = false;
            LinkButton2.Visible = false;
            ImageButton2.Visible = false;
            try
            {
                hint.Value = "";
                GridView1.PageSize = 10;
                select();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (GridView1.Rows [i].Cells [20].Text  == "红色")
                {
                    //将当行设置为红色
                    GridView1.Rows[i].ForeColor = System.Drawing.Color.White;
                    GridView1.Rows[i].BackColor = System.Drawing.Color.Red;
                }
                else if (GridView1.Rows[i].Cells[20].Text == "蓝色")
                {
                    //将当行设置为蓝色
                    GridView1.Rows[i].ForeColor = System.Drawing.Color.White;
                    GridView1.Rows[i].BackColor = System.Drawing.Color.Blue;
                }
            }
        }
        #endregion
        #region select()
        protected void select()
        {
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 10, 10);
            StringBuilder sqlb = new StringBuilder();
            string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");
            string v6 = "",v7="";
            string v2 = StartDate.Value;
            string v3 = EndDate.Value;
            string v9 = Text2.Value;
            string v10 = Text3.Value;
            string v11 = DropDownList1.Text;
            string v12 = Text4.Value;
            if (!bc.juagedate(v2, v3))
            {
                hint.Value = bc.ErrowInfo;
                
                return;
            }
            if (v2 != "" && v3 != "")
            {
                DateTime v4 = Convert.ToDateTime(v2);
                DateTime v5 = Convert.ToDateTime(v3);
                v6 = v4.ToString("yyyy/MM/dd");
                v7 = v5.ToString("yyyy/MM/dd");

            }
            dto = SqlDT.SqlDTM("DEPART", "DEPART");
            if (DropDownList1.Items.Count - 1 != dto.Rows.Count)
            {
                DropDownList1.Items.Add("");
                foreach (DataRow dr1 in dto.Rows)
                {

                    DropDownList1.Items.Add(dr1[0].ToString());

                }
            }
            dto = bc.getdt("SELECT * FROM EMPLOYEEINFO WHERE ENAME NOT IN ('系统管理')");
            if (DropDownList4.Items.Count - 1 != dto.Rows.Count)
            {
                DropDownList4.Items.Add("");
                foreach (DataRow dr1 in dto.Rows)
                {

                    DropDownList4.Items.Add(dr1["ENAME"].ToString()+"-"+dr1["EMID"].ToString ());

                }
            }
            StringBuilder sqb = new StringBuilder(new CCUSTOMER_INFO ().sqlsi );
            sqb.Append(" WHERE B.PROVINCE LIKE '%" + DropDownList3 .Text + "%' ");
            sqb.Append(" AND A.CITY LIKE '%" + Text4.Value + "%' ");
            sqb.Append(" AND B.CNAME LIKE '%" + Text2.Value  + "%'");
            sqb.Append(" AND A.REMARK LIKE '%" + Text3.Value + "%'");
            sqb.Append(" AND (SELECT DEPART FROM EMPLOYEEINFO WHERE EMID=B.MAKERID) LIKE '%" + DropDownList1 .Text  + "%'");
            if (CheckBox1.Checked)
            {
                sqb.AppendFormat("  AND convert(varchar(10),A.DATE,111)='" + v6 + "' AND  convert(varchar(10),A.DATE,111)<= '" + v7 + "'");
            }
           
            USID = n2;
            string v71 = bc.getOnlyString("SELECT SCOPE FROM SCOPE_OF_AUTHORIZATION WHERE USID='" + USID + "'");
                //string v71 = "Y";
            if (v71 == "Y")
            {
                Label1.Visible = true;
                Label3.Visible = true;
                DropDownList4.Visible = true;
                LinkButton2.Visible = true;
                ImageButton2.Visible = true;
            }
            else if (v71 == "GROUP")
            {
                sqb.AppendFormat(@" AND A.MAKERID IN (SELECT EMID FROM USERINFO A WHERE USER_GROUP IN 
 (SELECT USER_GROUP FROM USERINFO WHERE USID='" + USID + "'))");

            }
            else
            {
                sqb.AppendFormat(" AND A.MAKERID='" + varMakerID + "'");

            }
            sqb.AppendFormat(" order by A.CUKEY  ASC");
            //Response.Write(sqb.ToString());
            dt = bc.getdt(sqb.ToString());
            if (dt.Rows.Count > 0)
            {
                x.Value = Convert.ToString(1);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (DropDownList2.Text == "全部")
                {
                    GridView1.PageSize = dt.Rows.Count;
                }
                else
                {
                    GridView1.PageSize = Convert.ToInt32(DropDownList2.Text);
                }
            }
            else
            {
                //hint.Value = "没有找到记录";
                x.Value = "";
                GridView1.DataSource = null;
                GridView1.DataBind();

            }

            nextpage();
        }
        #endregion
        #region nextpage()
        protected void nextpage()
        {

            GridView1.DataKeyNames = new string[] { "CUID" };
            GridView1.DataBind();
            lblRecordCount.Text = "记录总数" + dt.Rows.Count + "条";
            lblPageCount.Text = "总页数" + (GridView1.PageCount).ToString() + "页";
            lblCurrentIndex.Text = "当前页第" + ((GridView1.PageIndex) + 1).ToString() + "页";
            if (dt.Rows.Count > 0)
            {
                if (GridView1.PageIndex == 0)
                {
                    btnFirst.Enabled = false;
                    btnPrev.Enabled = false;
                }
                else
                {
                    btnFirst.Enabled = true;
                    btnPrev.Enabled = true;
                }
                if (GridView1.PageIndex == GridView1.PageCount - 1)
                {
                    btnNext.Enabled = false;
                    btnLast.Enabled = false;
                }
                else
                {
                    btnNext.Enabled = true;
                    btnLast.Enabled = true;
                }

                // 计算生成分页页码,分别为："首 页" "上一页" "下一页" "尾 页"
                btnFirst.CommandName = "1";
                btnPrev.CommandName = (GridView1.PageIndex == 0 ? "1" : GridView1.PageIndex.ToString());

                btnNext.CommandName = (GridView1.PageCount == 1 ? GridView1.PageCount.ToString() : (GridView1.PageIndex + 2).ToString());
                btnLast.CommandName = GridView1.PageCount.ToString();
            }
            else
            {
                btnFirst.Enabled = false;
                btnPrev.Enabled = false;
                btnNext.Enabled = false;
                btnLast.Enabled = false;
            }

        }
        #endregion

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            Bind();

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string varCUID = GridView1.DataKeys[GridView1.SelectedIndex].Values[0].ToString();
            String[] str = new string[] { varCUID };
            WPSS.SellManage.CustomerInfoT.strE[0] = str[0];
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../SellManage/CustomerInfoT.aspx"+n2);

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                hint.Value = "";
                string id = GridView1.DataKeys[e.RowIndex][0].ToString();
                if (bc.exists("select * from order_det where cuid='" + id + "'"))
                {
                    hint.Value = "该客户信息已经在订单中存在不允许删除！";
                }
                else if (bc.exists("select * from wareinfo where cuid='" + id + "'"))
                {
                    hint.Value = "该客户信息已经在品号信息中存在不允许删除！";
                }
                else if (bc.exists("select * from limite_search where cuid_or_suid='" + id + "'"))
                {
                    hint.Value = "该客户信息已经在核价权限过滤信息中存在不允许删除！";
                }
                else
                {

                    string strSql1 = "DELETE FROM CustomerInfo_MST WHERE CUID='" + id + "'";
                    basec.getcoms(strSql1);
                    basec.getcoms("DELETE FROM CustomerInfo_DET WHERE CUID='" + id + "'");
                    GridView1.EditIndex = -1;
                    Bind();
                }
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


        protected void PageButton_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex = Convert.ToInt32(((LinkButton)sender).CommandName) - 1;
            Bind();
        }

        protected void btngo_Click(object sender, EventArgs e)
        {
            #region btngo
            try
            {
                if (txtNum.Text == "")
                {
                    //opAndvalidate.Show("页数不能为空");
                }
                else
                {
                    int vargo = Convert.ToInt32(txtNum.Text);
                    if (vargo <= GridView1.PageCount)
                    {
                        GridView1.PageIndex = Convert.ToInt32(txtNum.Text) - 1;
                        Bind();
                    }
                    else
                    {
                        hint.Value = "没有找到记录";
                    }
                }
            }
            catch (Exception)
            {
                //opAndvalidate.Show("输入格式不正确，请检查！");
            }

            #endregion
        }

        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
            hint.Value = "";
            string var1 = bc.numYM(10, 4, "0001", "select * from CUSTOMERINFO_MST", "CUID", "CU");
            CustomerInfoT.str1[0] = var1;
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../SellManage/CustomerInfoT.aspx"+n2);
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Bind();
        }

        protected void btnToExcel_Click(object sender, ImageClickEventArgs e)
        {
            
         
            toexel();
        }
        private void toexel()
        {
            Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.ToString("yyyyMMddHHssmm") + ".xls");
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {//base.VerifyRenderingInServerForm(control);
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDel_Click(object sender, ImageClickEventArgs e)
        {
            if (GridView1 .Rows .Count > 0)
            {
                if (JUAGE_IFEXISTS_SELECT ())
                {
                        for (int k = 0; k < GridView1.Rows.Count - 1; k++)
                        {
                            CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                            if (chb.Checked)
                            {
                                CNAME = ((Label)GridView1.Rows[k].Cells[0].FindControl("L1")).Text;
                                CUID = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_DET WHERE  CNAME='" + CNAME + "'");
                                sqb = new StringBuilder("DELETE CUSTOMERINFO_MST WHERE CUID='" + CUID + "'");
                                sqb.AppendFormat(";DELETE CUSTOMERINFO_DET WHERE CUID='" + CUID + "'");
                                basec.getcoms(sqb.ToString ());
                                //Response.Write(CUID);
                            }
                        }
                    IFExecution_SUCCESS = true;
                    Bind();
                }
             
            }
            else
            {
             
                hint.Value = "没有可以使用的客户记录";
            }
        }
        #region JUAGE_IFEXISTS_SELECT()
        private bool JUAGE_IFEXISTS_SELECT()
        {
            bool b = false;
            for (int k = 0; k < GridView1.Rows.Count; k++)
            {
                CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                if (chb.Checked)
                {
                    b = true;
                    break;
                }
            }
            if (b == false)
            {
                hint.Value = "无选中项！";
            }
            return b;
        }
        #endregion
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (DropDownList4.Text == "")
            {
                hint.Value = "分配工号不能为空";
                return;
            }
              
            if (GridView1.Rows.Count > 0)
            {
                if (JUAGE_IFEXISTS_SELECT ())
                {
                    if (!bc.exists("select * from employeeinfo where emid='" + bc.RETURN_FROM_RIGHT_UNTIL_CHAR (DropDownList4 .Text ,'-') + "'"))
                    {
                        hint.Value = "分配工号为空或不存在系统中";
                    }
                    else
                    {
                      
                        for (int k = 0; k < GridView1.Rows.Count - 1; k++)
                        {
                            CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                            if (chb.Checked)
                            {
                                CNAME = ((Label)GridView1.Rows[k].Cells[0].FindControl("L1")).Text;
                                CUID = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_DET WHERE  CNAME='" + CNAME + "'");
                                bc.getcom("UPDATE CUSTOMERINFO_MST SET RECEIVE_WORKID='" + bc.RETURN_FROM_RIGHT_UNTIL_CHAR(DropDownList4.Text, '-') + "' WHERE CNAME='" + CNAME + "'");
                            }
                          
                        }
                        IFExecution_SUCCESS = true;
                        Bind();
                    }
                }
                else
                {
                    hint.Value = "没有选中客户记录";
                }
            }
            else
            {
                hint.Value = "没有可以使用的客户记录";
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            btn();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                if (JUAGE_IFEXISTS_SELECT())
                {
                    for (int k = 0; k < GridView1.Rows.Count ; k++)
                    {
                        CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                        if (chb.Checked)
                        {
                            CNAME = ((Label)GridView1.Rows[k].Cells[0].FindControl("L1")).Text;
                            CUID = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_DET WHERE  CNAME='" + CNAME + "'");
                          
                                bc.getcom("UPDATE CUSTOMERINFO_MST SET DISPLAY_COLOR='BLUE' WHERE CNAME='" + CNAME + "'");
                           
                        }

                    }

                    IFExecution_SUCCESS = true;
                    Bind();

                }
                else
                {

                    hint.Value = "没有选中客户记录";
                }
            }
            else
            {
                hint.Value = "没有可以使用的客户记录";

            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                if (JUAGE_IFEXISTS_SELECT())
                {
                    for (int k = 0; k < GridView1.Rows.Count ; k++)
                    {
                        CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                        if (chb.Checked)
                        {
                            CNAME = ((Label)GridView1.Rows[k].Cells[0].FindControl("L1")).Text;
                            CUID = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_DET WHERE  CNAME='" + CNAME + "'");
                           
                                bc.getcom("UPDATE CUSTOMERINFO_MST SET DISPLAY_COLOR='' WHERE CNAME='" + CNAME + "'");
                            
                        }

                    }

                    IFExecution_SUCCESS = true;
                    Bind();

                }
                else
                {

                    hint.Value = "没有选中客户记录";
                }
            }
            else
            {
                hint.Value = "没有可以使用的客户记录";

            }
        }
        private void btn()
        {
            if (GridView1 .Rows.Count > 0)
            {
                if (JUAGE_IFEXISTS_SELECT ())
                {
                    for (int k = 0; k < GridView1.Rows.Count; k++)
                    {
                        CheckBox chb = ((CheckBox)GridView1.Rows[k].Cells[0].FindControl("CheckBox1"));
                        if (chb.Checked)
                        {
                            CNAME = ((Label)GridView1.Rows[k].Cells[0].FindControl("L1")).Text;
                            CUID = bc.getOnlyString("SELECT CUID FROM CUSTOMERINFO_DET WHERE  CNAME='" + CNAME + "'");
                             bc.getcom("UPDATE CUSTOMERINFO_MST SET DISPLAY_COLOR='RED' WHERE CNAME='" + CNAME + "'");
                        }
                    }
                  
                    IFExecution_SUCCESS = true;
                    Bind ();
                }
                else
                {
                   
                    hint .Value ="没有选中客户记录";
                }
            }
            else
            {  
                hint .Value ="没有可以使用的客户记录";
               
            }



        }
   
        protected void btnComeFrom_Click(object sender, ImageClickEventArgs e)
        {

            System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            string FileName = "";
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile myFile = files[i];
                FileName = System.IO.Path.GetFileName(myFile.FileName);
            }
           Response.Write("************************" + Server.MapPath(FileName ));
            /*try
            {
                string n1 = Request.Url.AbsoluteUri;
                string n2 = n1.Substring(n1.Length - 10, 10);
                string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");
                string path = @"D:\苏州好用软件有限公司软件作品\35.客户15_BS客户管理系统_客户郑州博略企业管理咨询有限公司\数据导入模版.xls";

                CCUSTOMER_INFO_EXCEL c1 = new CCUSTOMER_INFO_EXCEL();
                c1.EMID = varMakerID;
                c1.save(path);
                Bind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }*/
            
        }

        #region JUAGE()
        private bool juage(DataTable dt)
        {

            bool b = false;
            for (int i = 1; i < dt.Rows.Count; i++)
            {

                string v1 = dt.Rows[i]["F1"].ToString();
                string v2 = dt.Rows[i]["F2"].ToString();
                string v3 = dt.Rows[i]["F3"].ToString();
                string v4 = dt.Rows[i]["F4"].ToString();
                string v5 = dt.Rows[i]["F5"].ToString();
                string v6 = dt.Rows[i]["F6"].ToString();
                string v7 = dt.Rows[i]["F7"].ToString();
                string v8 = dt.Rows[i]["F8"].ToString();
                string v9 = dt.Rows[i]["F9"].ToString();

                DateTime temp = DateTime.MinValue;
                if (v1 == "")
                {

                }
                else if (!DateTime.TryParse(v3, out temp))
                {
                    b = true;
                    hint.Value = "日期格式不正确，需为：yyyy-MM-dd！";
                    break;

                }
                else if (v3.Length != 10 || v3.Substring(4, 1) != "-" || v3.Substring(7, 1) != "-")
                {
                    b = true;
                    hint.Value = "日期长度需10位且格式：yyyy-MM-dd！";
                    break;
                }
                else if (!bc.exists("SELECT * FROM WAREINFO WHERE CO_WAREID='" + v1 + "' AND ACTIVE='Y'"))
                {
                    b = true;
                    hint.Value = "厂内成品料号：" + v1 + "不存在于系统中或状态不为正常！";
                    break;
                }
                /*else if (v4 != "Y" || v4 != "N")
                {

                    b = true;
                    hint.Value = "生效否只能输入Y OR N！";
                    break;
                }*/
                else if (!bc.exists("SELECT * FROM WAREINFO WHERE CO_WAREID='" + v5 + "' AND ACTIVE='Y'"))
                {
                    b = true;
                    hint.Value = "原物料编码：" + v5 + "不存在于系统中或状态不为正常！";
                    break;
                }
                else if (v6 == "")
                {

                    b = true;
                    hint.Value = "组成用量不能为空！";
                    break;
                }
                else if (bc.yesno(v6) == 0)
                {
                    b = true;
                    hint.Value = "组成用量只能输入数字！";
                    break;

                }
                else if (v7 == "")
                {
                    b = true;
                    hint.Value = "损耗率不能为空！";
                    break;

                }
                else if (bc.yesno(v7) == 0)
                {
                    b = true;
                    hint.Value = "损耗率只能输入数字！";
                    break;

                }
                /*else if (v8 != "Y" || v8 != "N")
                {

                    b = true;
                    hint.Value = "客供否只能输入Y OR N！";
                    break;
                }*/
                else if (v9 != "" && !bc.exists("SELECT * FROM PICKING_STAGE WHERE PICKING_STAGE='" + v9 + "'"))
                {
                    b = true;
                    hint.Value = "该发料阶段：" + v9 + " 不存在于系统中！";
                    break;
                }

            }
            return b;

        }
        #endregion

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnOnloadFile_Click(object sender, EventArgs e)
        {
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 10, 10);
            string varMakerID = bc.getOnlyString("SELECT EMID FROM USERINFO WHERE USID='" + n2 + "'");
            try
            {
                /*将导入文件上传至服务器 start*/
                string year = DateTime.Now.ToString("yy");
                string month = DateTime.Now.ToString("MM");
                string day = DateTime.Now.ToString("dd");
                string varDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
                Random ro = new Random();
                System.Web.UI.Page page = new Page();
                HttpServerUtility hsu = page.Server;
                string dirpath = hsu.MapPath("../PrintFile/");
                string v1 = DateTime.Now.ToString("yyyyMMddHHmmss").Replace("-", "/") + ".xls";
                string v2 = dirpath + v1;
                for (int i = 0; i < files.Count; i++)
                {
                    System.Web.HttpPostedFile myFile = files[i];

                    if (myFile.ContentLength > 20971520)
                    {
                        hint.Value = "文件超过20M";
                        return;
                    }
                    string FileName = "";
                    string FileExtention = "";
                    int name = 0;
                    FileName = System.IO.Path.GetFileName(myFile.FileName);
                    string stro = ro.Next(100, 100000000).ToString() + name.ToString();//产生一个随机数用于新命名的图片 
                    string NewName = DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + stro;

                    if (FileName.Length > 0)//有文件才执行上传操作再保存到数据库 
                    {
                        FileExtention = System.IO.Path.GetExtension(myFile.FileName);
                        string noExtension = System.IO.Path.GetFileNameWithoutExtension(myFile.FileName);
                        string ppath = dirpath + "/" + noExtension + "_" + NewName + FileExtention;
                        //myFile.SaveAs(ppath);

                        myFile.SaveAs(v2);

                    }

                }
                /*将导入文件上传至服务器 end*/
                /*将服务器中的文件数据写入DB start*/
                string path = v2;
                //Response.Write("************************" + path);
                CCUSTOMER_INFO_EXCEL c1 = new CCUSTOMER_INFO_EXCEL();
                c1.EMID = varMakerID;
                c1.save(path);
                Bind();
                hint.Value = "上传成功";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            /*将服务器中的文件数据写入DB end*/
        }

    }
}
