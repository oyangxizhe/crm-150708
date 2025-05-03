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
using System.Net;
using System.Text;
using Excel = Microsoft.Office.Interop.Excel;

namespace WPSS.SellManage
{
    public partial class OrderReconcile : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dtx4 = new DataTable();
        basec bc = new basec();
        CORDER_RECONCILE corder_reconcile = new CORDER_RECONCILE();
        protected string M_str_sql1;
        WPSS.Validate va = new Validate();

        protected void Page_Load(object sender, EventArgs e)
        {
          
           
            if (!IsPostBack)
            {
                StartDate.Value = DateTime.Now.ToString ("yyyy-MM-dd").Replace("/", "-");
                EndDate.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace("/", "-");
                CheckBox1.Checked = true;
            }
            //if (va.returnb() == true)
                //Response.Redirect("\\Default.aspx");
        }
        #region bind()
        private void bind()
        {
            hint.Value = "";
            x.Value = "";
            x1.Value = "";
            GridView1.PageSize = 15;
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
                dt = corder_reconcile.RETURN_PG_AND_RETURN_DT(Text1 .Value ,StartDate.Value,EndDate .Value , DropDownList1.Text ,Text2.Value ,Text3.Value ,true,true);
            }

            else
            {
                dt =corder_reconcile.RETURN_PG_AND_RETURN_DT(Text1.Value, StartDate.Value,EndDate .Value , DropDownList1.Text, Text2.Value, Text3.Value, false ,true );
            }

            //Response.Write(corder_reconcile.MESSAGE);

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

            GridView1.DataKeyNames = new string[] { "订单号" };
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
      
        private void clear()
        {

            dt = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Text7.Value = "";
            Text8.Value = "";
            Text9.Value = "";

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            bind();

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

        protected void btnPrint_Click(object sender, ImageClickEventArgs e)
        {

            PrintSellTableBill print = new PrintSellTableBill();
      
            dt = corder_reconcile.RETURN_PG_AND_RETURN_DT(Text1.Value, StartDate.Value, EndDate .Value , DropDownList1.Text, Text2.Value, Text3.Value, true,false);
            
            if (Text1.Value == "")
            {
                hint .Value ="客户名称不能为空";
                return;
            }
            else if(!bc.exists ("select * from customerinfo_mst where cname='"+Text1 .Value +"'"))
            {
                hint.Value = "客户名称不存在系统中";
                return;
            }
            else if (StartDate.Value == "")
            {
                hint.Value = "账期不能为空";
                return;
            }
            if (dt.Rows.Count > 0)
            {
                //Response.Write(corder_reconcile.MESSAGE);
                string v1 = bc.getOnlyString("select path from model_path where name='ORDER_RECONCILE'");
                string v2 = bc.getOnlyString("select path from model_path where name='savepath'");
                if (v1 == "")
                {
                    Response.Write("找不到打印模版路径");
                    return;
                }
                else if (v2 == "")
                {
                    Response.Write("找不到打印模版存储路径");
                    return;
                }
             
                ExcelPrint(dt, v1, v2);
                try
                {
                   
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                hint.Value = "没有可打印数据";
            }
           
        }
        #region ExcelPrint
        public void ExcelPrint(DataTable dt2, string Printpath, string savepath)
        {
            int i;
            Microsoft.Office.Interop.Excel.Application application = new Microsoft.Office.Interop.Excel.Application();
            Excel.Workbook workbook;
            Excel.Worksheet worksheet;
            int m = dt2.Rows.Count-1;
            workbook = application.Workbooks.Open(Printpath, Type.Missing, Type.Missing,
Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing,
Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);/* 13 to parameter 15 */
            worksheet = (Excel.Worksheet)workbook.Worksheets[1];

            application.Visible = false;/*140323 use printpreview false to true1/2*/
            application.ExtendList = false;
            application.DisplayAlerts = false;
            application.AlertBeforeOverwriting = false;
            string v1 = DateTime.Now.ToString("yyyyMMddHHmmss").Replace("-", "/") + ".xls";
            string v2 = savepath + v1;
            worksheet.Cells[2, "A"] = StartDate.Value.Substring(0, 4) + "年" + StartDate.Value.Substring(5, 2) + "月" + "对账单";
            worksheet.Cells[4, "C"] = dt2.Rows[0]["客户名称"].ToString();
            worksheet.Cells[5, "C"] = dt2.Rows[0]["联系人"].ToString();
            worksheet.Cells[6,"C"] = dt2.Rows[0]["联系电话"].ToString();
            worksheet.Cells[7, "C"] = dt2.Rows[0]["EMAIL"].ToString();
            worksheet.Cells[5, "G"] = bc.getOnlyString ("SELECT CONTACT FROM CompanyInfo_DET where COKEY=(select top 1 COKEY from CompanyInfo_MST )");
            worksheet.Cells[41, "I"] = dt2.Rows[0]["制单人"].ToString();
            for (i = 0; i < m; i++)
            {
                worksheet.Cells[11 + 1 * i, "A"] = (i + 1).ToString();
                worksheet.Cells[11 + 1 * i, "B"] = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
                worksheet.Cells[11 + 1 * i, "C"] = dt2.Rows[i]["销货销退单号"].ToString();
                worksheet.Cells[11 + 1 * i, "D"] = dt2.Rows[i]["品名"].ToString();
                worksheet.Cells[11 + 1 * i, "E"] = dt2.Rows[i]["客户料号"].ToString();
                worksheet.Cells[11 + 1 * i, "F"] = dt2.Rows[i]["客户订单号"].ToString();
                worksheet.Cells[11 + 1 * i, "G"] = dt2.Rows[i]["销货销退数量"].ToString();
                worksheet.Cells[11 + 1 * i, "H"] = dt2.Rows[i]["销售单价"].ToString();
                worksheet.Cells[11 + 1 * i, "I"] = dt2.Rows[i]["工程费"].ToString();
                worksheet.Cells[11 + 1 * i, "J"] = dt2.Rows[i]["未税金额"].ToString();
                //worksheet.PrintOut(1, 1, 1, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                //csharpExcelPrint(sfdg.FileName);
                workbook.SaveAs(v2);
                //csharpExcelPrint(sfdg.FileName);
            }
            application.Quit();
            worksheet = null;
            workbook = null;
            application = null;
            GC.Collect();
            Response.Redirect("/PrintFile/" + v1);
        }
        #endregion


    }
}
