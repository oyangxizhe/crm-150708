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

namespace WPSS.PurchaseManage
{
    public partial class PurchaseReconcile : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dtx4 = new DataTable();
        basec bc = new basec();
        protected string M_str_sql1;
        WPSS.Validate va = new Validate();
        CPURCHASE_RECONCILE cpurchase_reconcile = new CPURCHASE_RECONCILE();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StartDate.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace("/", "-");
                EndDate.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace("/", "-");
                CheckBox1.Checked = true;
            }
            if (va.returnb() == true)
            Response.Redirect("\\Default.aspx");

        }
        #region bind()
        private void bind()
        {

            hint.Value = "";
            x.Value = "";
            x1.Value = "";
            GridView1.AllowPaging = true;
            GridView1.PageSize = 10;
            select();
            try
            {
              
            }
            catch (Exception)
            {

            }
        }
        #endregion
        #region select()
        protected void select()
        {

            string v6 = "", v7 = "";
            string v1 = Text1.Value;/*sname*/
            string v2 = StartDate.Value;
            string v3 = EndDate.Value;
            string v8 = DropDownList1.Text;/*status*/
            string v9 = Text2.Value;/*wname*/
            string v10 = Text3.Value;/*cwareid*/
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
                v6 = v4.ToString("yyyy-MM-dd") + " 00:00:00";
                v7 = v5.ToString("yyyy-MM-dd") + " 23:59:59";

            }

            showdata();


        }
        #endregion
        protected void showdata()
        {

            if (CheckBox1.Checked)
            {
                dt = cpurchase_reconcile.RETURN_PG_AND_RETURN_DT(Text1.Value, StartDate.Value,EndDate .Value , DropDownList1.Text, Text2.Value, Text3.Value, true, true);
            }

            else
            {
                dt = cpurchase_reconcile.RETURN_PG_AND_RETURN_DT(Text1.Value, StartDate.Value,EndDate .Value , DropDownList1.Text, Text2.Value, Text3.Value, false, true);
            }

            //Response.Write(cpurchase_reconcile .MESSAGE );

            if (dt.Rows.Count > 0)
            {

                x1.Value = Convert.ToString(1);
                x.Value = Convert.ToString(1);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Text7.Value = dt.Rows[dt.Rows.Count - 1]["未税金额"].ToString();
                Text8.Value = dt.Rows[dt.Rows.Count - 1]["税额"].ToString();
                Text9.Value = dt.Rows[dt.Rows.Count - 1]["含税金额"].ToString();
            }
            else
            {

                hint.Value = "没有找到记录!";
                Text7.Value = "";
                Text8.Value = "";
                Text9.Value = "";
                GridView1.DataSource = null;
                GridView1.DataBind();

            }
            nextpage();
           
        }
        #region nextpage()
        protected void nextpage()
        {

            GridView1.DataKeyNames = new string[] { "采购单号" };
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
        #region ask
        private DataTable ask(string sql)
        {
            int i, j;
            DataTable dtt = new DataTable();
            dtt.Columns.Add("采购单号", typeof(string));
            dtt.Columns.Add("项次", typeof(string));
            dtt.Columns.Add("ID", typeof(string));
            dtt.Columns.Add("EUJ料号", typeof(string));
            dtt.Columns.Add("品名", typeof(string));
            dtt.Columns.Add("客户料号", typeof(string));
            dtt.Columns.Add("采购单价", typeof(decimal));
            dtt.Columns.Add("税率", typeof(decimal));
            dtt.Columns.Add("采购数量", typeof(decimal));
            dtt.Columns.Add("累计采购入库数量", typeof(decimal));
            dtt.Columns.Add("累计采购未税金额", typeof(decimal));
            dtt.Columns.Add("累计采购税额", typeof(decimal));
            dtt.Columns.Add("累计采购含税金额", typeof(decimal));

            dtt.Columns.Add("累计退货未税金额", typeof(decimal));
            dtt.Columns.Add("累计退货税额", typeof(decimal));
            dtt.Columns.Add("累计退货含税金额", typeof(decimal));

            dtt.Columns.Add("未税金额", typeof(decimal), "累计采购未税金额-累计退货未税金额");
            dtt.Columns.Add("税额", typeof(decimal), "累计采购税额-累计退货税额");
            dtt.Columns.Add("含税金额", typeof(decimal), "累计采购含税金额-累计退货含税金额");

            dtt.Columns.Add("采购单日期", typeof(string));
            dtt.Columns.Add("采购制单日期", typeof(string));
            dtt.Columns.Add("供应商代码", typeof(string));
            dtt.Columns.Add("供应商", typeof(string));


            DataTable dtx1 = bc.getdt(sql);
            if (dtx1.Rows.Count > 0)
            {
                for (i = 0; i < dtx1.Rows.Count; i++)
                {
                    DataRow dr = dtt.NewRow();
                    dr["采购单号"] = dtx1.Rows[i]["采购单号"].ToString();
                    dr["项次"] = dtx1.Rows[i]["项次"].ToString();
                    dr["ID"] = dtx1.Rows[i]["ID"].ToString();
                    DataTable dtx2 = bc.getdt("select * from wareinfo where wareid='" + dtx1.Rows[i]["ID"].ToString() + "'");
                    dr["EUJ料号"] = dtx2.Rows[0]["CO_WAREID"].ToString();
                    dr["品名"] = dtx2.Rows[0]["WNAME"].ToString();
                    dr["客户料号"] = dtx2.Rows[0]["CWAREID"].ToString();
                    dr["采购数量"] = dtx1.Rows[i]["采购数量"].ToString();
                    dr["采购单价"] = dtx1.Rows[i]["采购单价"].ToString();
                    dr["税率"] = dtx1.Rows[i]["税率"].ToString();
                    dr["累计采购入库数量"] = dtx1.Rows[i]["累计采购入库数量"].ToString();
                    dr["累计采购未税金额"] = dtx1.Rows[i]["累计采购未税金额"].ToString();
                    dr["累计采购税额"] = dtx1.Rows[i]["累计采购税额"].ToString();
                    dr["累计采购含税金额"] = dtx1.Rows[i]["累计采购含税金额"].ToString();

                    dr["累计退货未税金额"] = 0;
                    dr["累计退货税额"] = 0;
                    dr["累计退货含税金额"] = 0;

                    dr["采购单日期"] = dtx1.Rows[i]["采购单日期"].ToString();
                    dr["采购制单日期"] = dtx1.Rows[i]["采购制单日期"].ToString();
                    dr["供应商代码"] = dtx1.Rows[i]["供应商代码"].ToString();
                    dr["供应商"] = dtx1.Rows[i]["供应商"].ToString();

                    dtt.Rows.Add(dr);

                }

            }

            DataTable dtx41 = bc.getdt(@"SELECT A.PUID AS 采购单号,A.SN AS 项次,SUM(A.NOTAX_AMOUNT) AS 累计退货未税金额,
SUM(A.TAX_AMOUNT) AS 累计退货税额,SUM(A.AMOUNT) AS 累计退货含税金额 FROM RETURN_DET A GROUP BY A.PUID,A.SN");
            if (dtx41.Rows.Count > 0)
            {
                for (i = 0; i < dtx41.Rows.Count; i++)
                {
                    for (j = 0; j < dtt.Rows.Count; j++)
                    {
                        if (dtt.Rows[j]["采购单号"].ToString() == dtx41.Rows[i]["采购单号"].ToString() && dtt.Rows[j]["项次"].ToString() == dtx41.Rows[i]["项次"].ToString())
                        {
                            dtt.Rows[j]["累计退货未税金额"] = dtx41.Rows[i]["累计退货未税金额"].ToString();
                            dtt.Rows[j]["累计退货税额"] = dtx41.Rows[i]["累计退货税额"].ToString();
                            dtt.Rows[j]["累计退货含税金额"] = dtx41.Rows[i]["累计退货含税金额"].ToString();
                            break;
                        }

                    }
                }

            }
            DataRow dr1 = dtt.NewRow();
            dr1["采购单号"] = "合计";
            dr1["采购数量"] = dtt.Compute("SUM(采购数量)", "");
            dr1["累计采购入库数量"] = dtt.Compute("SUM(累计采购入库数量)", "");
            dr1["累计采购未税金额"] = dtt.Compute("SUM(累计采购未税金额)", "");
            dr1["累计采购税额"] = dtt.Compute("SUM(累计采购税额)", "");
            dr1["累计采购含税金额"] = dtt.Compute("SUM(累计采购含税金额)", "");

            dr1["累计退货未税金额"] = dtt.Compute("SUM(累计退货未税金额)", "");
            dr1["累计退货税额"] = dtt.Compute("SUM(累计退货税额)", "");
            dr1["累计退货含税金额"] = dtt.Compute("SUM(累计退货含税金额)", "");

            dr1["未税金额"] = dtt.Compute("SUM(累计采购未税金额)-SUM(累计退货未税金额)", "");
            dr1["税额"] = dtt.Compute("SUM(累计采购税额)-SUM(累计退货税额)", "");
            dr1["含税金额"] = dtt.Compute("SUM(累计采购含税金额)-SUM(累计退货含税金额)", "");

            if (!string.IsNullOrEmpty(dr1["未税金额"].ToString()))
            {
                Text7.Value = string.Format("{0:F2}", Convert.ToDouble(dr1["未税金额"].ToString()));
                Text8.Value = string.Format("{0:F2}", Convert.ToDouble(dr1["税额"].ToString()));
                Text9.Value = string.Format("{0:F2}", Convert.ToDouble(dr1["含税金额"].ToString()));
            }
            dtt.Rows.Add(dr1);
            return dtt;
        }
        #endregion
        private void clear()
        {

            dt = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Text7.Value = "";
            Text8.Value = "";
            Text9.Value = "";

        }
     
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {



        }

        protected void PageButton_Click(object sender, EventArgs e)
        {
            GridView1.PageIndex = Convert.ToInt32(((LinkButton)sender).CommandName) - 1;
            bind();
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
                        bind();
                    }
                    else
                    {
                        hint.Value = "没有找到记录!";
                        x.Value = "";
                        x1.Value = "";
                    }
                }
            }
            catch (Exception)
            {
                //opAndvalidate.Show("输入格式不正确，请检查！");
            }

            #endregion
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            bind();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            bind();
        }

    



    }
}
