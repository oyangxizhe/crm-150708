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
    public partial class Order : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        basec bc = new basec();
        protected string sql = @"
select 
A.ORID AS ORID,
A.CUID AS CUID,
B.CNAME AS CNAME,
A.ORDERDATE AS ORDERDATE,
A.CUSTOMERORID AS CUSTOMERORID,
(SELECT ENAME FROM EMPLOYEEINFO WHERE EMID=A.MAKERID )  AS MAKER,
CASE WHEN A.ORDERStatus_MST='CLOSE' THEN '已出货'
WHEN A.ORDERStatus_MST='PROGRESS' THEN '部分出货'
WHEN A.ORDERStatus_MST='DELAY' THEN 'Delay'
ELSE 'Open'
END  AS ORDERStatus_MST,
D.OrderStatus_DET AS ORDERSTATUS_DET,
D.DeliveryDate AS DELIVERYDATE,
D.OCOUNT AS OCOUNT,
E.WName AS WNAME,
E.CWareID AS CWAREID,
A.DATE AS DATE,
C.CONTACT,
C.PHONE,
C.ADDRESS,
A.ORDERDATE
from   Order_Mst A
LEFT JOIN CUSTOMERINFO_MST B ON A.CUID=B.CUID
LEFT JOIN CUSTOMERINFO_DET C ON B.CUKEY=C.CUKEY
LEFT JOIN Order_DET D ON A.ORID =D.ORID 
LEFT JOIN WareInfo E ON D.WareID =E.WareID 
";
        protected string M_str_sql1;
        WPSS.Validate va = new Validate();
        public string CUID { get; set; }
        StringBuilder sqb = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Response.Expires = 0;
            if (Request.QueryString["come"] != null)
            {
                come.Value = Request.QueryString["come"].ToString();
            }
            if (!IsPostBack)
            {
                StartDate.Value = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd").Replace("/", "-");
                EndDate.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace("/", "-");
                CheckBox1.Checked = true;
            }  
            Bind();
            //if (va.returnb() == true)
              //Response.Redirect("\\Default.aspx");
         
        }
        #region Bind()
        private void Bind()
        {

            hint.Value = "";
            x.Value = "";
            GridView1.PageSize = 15;
            if (Request.QueryString["CUID"] != null)
            {

                CUID = Request.QueryString["CUID"].ToString();
              

            }
            select();
            try
            {
               
            }
            catch (Exception)
            {

            }
        }
        #endregion
        #region select() /*no cuid*/
        protected void select()
        {

            string v6 = "", v7 = "";
            string v1 = Text1.Value;
            string v2 = StartDate.Value;
            string v3 = EndDate.Value;
            string v9 = Text2.Value;
            string v10 = Text3.Value;
            string v11 = DropDownList1.Text;
            string v12 = Text4.Value;
            if (!bc.juagedate(v2, v3))
            {
                hint.Value = bc.ErrowInfo;
                clear();
                return;
            }
            if (v2 != "" && v3 != "")
            {
                DateTime v4 = Convert.ToDateTime(v2);
                DateTime v5 = Convert.ToDateTime(v3);
                v6 = v4.ToString("yyyy-MM-dd");
                v7 = v5.ToString("yyyy-MM-dd");

            }
            sqb = new StringBuilder(sql);
            sqb.AppendFormat(" where E.CWAREID like '%" + v10 + "%'");
            if (CheckBox1.Checked)
            {
                sqb.AppendFormat("  AND A.ORDERDATE>='" + v6 + "' AND  A.ORDERDATE<= '" + v7 + "'");
            }
            sqb.AppendFormat(" AND E.WNAME like '%" + v9 + "%' ");
            sqb.AppendFormat(" AND A.ORID LIKE '%" + v12 + "%'");
            if (Text1.Value != "")
            {
                sqb.AppendFormat(" AND B.CNAME like '%" + v1 + "%' ");
            }
            if (!string.IsNullOrEmpty (CUID ))
            {
                sqb.AppendFormat(" AND B.CUID like '%" + CUID + "%' ");
                sqb.AppendFormat(" AND  A.ORDERStatus_MST NOT IN ('CLOSE')");
            }
            if (DropDownList1.Text == "已出货")
            {
                sqb.AppendFormat("  AND A.ORDERStatus_MST='CLOSE'");
            }
            else if (DropDownList1.Text == "部分出货")
            {
                sqb.AppendFormat(" AND A.ORDERStatus_MST='PROGRESS' ");
            }
            else if (DropDownList1.Text == "Delay")
            {
                sqb.AppendFormat(" AND A.ORDERStatus_MST='DELAY' ");
            }
            else if (DropDownList1.Text == "Open")
            {
                sqb.AppendFormat("  AND A.ORDERStatus_MST='OPEN'");
            }
            sqb.AppendFormat(" order by A.DATE DESC");
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
                GridView1.DataSource = null;
                GridView1.DataBind();

            }

            nextpage();
        }
        #endregion
    
        private void clear()
        {

            dt = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Text1.Value = "";
            Text2.Value = "";
            Text3.Value = "";

        }
       
        #region nextpage()
        protected void nextpage()
        {

            GridView1.DataKeyNames = new string[] { "ORID" };
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

            string varORID = GridView1.DataKeys[GridView1.SelectedIndex].Values[0].ToString();
            String[] str = new string[] { varORID };
            WPSS.SellManage.OrderT.strE[0] = str[0];
            OrderT.ADD_OR_UPDATE = "UPDATE";
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../SellManage/OrderT.aspx"+n2);

        }
        #region delete
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {

                string sql, sql1, sql2, sql3;
                hint.Value = "";
                string id = GridView1.DataKeys[e.RowIndex][0].ToString();
                /*PURCHASE FIRST DELETE PURCHASEINFO*/
                string v1 = bc.getOnlyString("SELECT PUID FROM PURCHASE_MST WHERE ORID='" + id + "'");
                sql2 = "DELETE FROM PURCHASE_MST WHERE PUID='" + v1 + "'";
                sql3 = "DELETE FROM PURCHASE_DET WHERE PUID='" + v1 + "'";
                if (!bc.JuageSourceStatus(id))
                {

                }

                else
                {

                    basec.getcoms(sql2);
                    basec.getcoms(sql3);
                    GridView1.EditIndex = -1;
                    Bind();

                }
                /*PURCHASE FIRST DELETE PURCHASEINFO*/

                sql = "DELETE ORDER_MST WHERE ORID='" + id + "'";
                sql1 = "DELETE FROM ORDER_DET WHERE ORID='" + id + "'";
                if (bc.exists("select * from selltable_DET where orid='" + id + "'"))
                {
                    hint.Value = "该订单已经在销货单中存在不允许删除！";
                    return;
                }
                else
                {

                    basec.getcoms(sql);
                    basec.getcoms(sql1);
                    GridView1.EditIndex = -1;
                    Bind();
                }

            }
            catch (Exception)
            {


            }

        }
        #endregion

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
            string var1 = bc.numYM(10, 4, "0001", "SELECT * FROM Order_Mst", "ORID", "OR");
            string var2 = bc.numYM(10, 4, "0001", "SELECT * FROM Purchase_Mst", "PUID", "PU");
            OrderT.str1[0] = var1;
            OrderT.str1[1] = var2;
            OrderT.ADD_OR_UPDATE = "ADD";
            string n1 = Request.Url.AbsoluteUri;
            string n2 = n1.Substring(n1.Length - 16, 16);
            Response.Redirect("../SellManage/OrderT.aspx"+n2);
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
            Bind();
        }

    }
}
