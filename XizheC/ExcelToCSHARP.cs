using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Globalization;
using System.Data.SqlClient;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data.OleDb;
using XizheC;

namespace XizheC
{
    public class ExcelToCSHARP
    {
        private bool _IFExecutionSUCCESS;
        public bool IFExecution_SUCCESS
        {
            set { _IFExecutionSUCCESS = value; }
            get { return _IFExecutionSUCCESS; }

        }
        private string _ErrowInfo;
        public string ErrowInfo
        {

            set { _ErrowInfo = value; }
            get { return _ErrowInfo; }

        }
        private string _EMID;
        public  string EMID
        {
            set { _EMID = value; }
            get { return _EMID; }

        }
        private string _hint;
        public string hint
        {
            set { _hint = value; }
            get { return _hint; }
        }
        private string _ADD_OR_UPDATE;
        public string ADD_OR_UPDATE
        {
            set { _ADD_OR_UPDATE = value; }
            get { return _ADD_OR_UPDATE; }
        }
        CCUSTOMER_INFO ccustomer_info = new CCUSTOMER_INFO();
        basec bc = new basec();
        DataTable dt = new DataTable();
        DataTable dto = new DataTable();
        public ExcelToCSHARP()
        {
            IFExecution_SUCCESS = true;
        }
        public void showdata(string path)
        {
            DataSet ds = new DataSet();
            string tablename = ExcelToCSHARP.GetExcelFirstTableName(path);
            ds = ExcelToCSHARP.importExcelToDataSet(path, tablename);
            DataTable dt = ds.Tables[0];
            dt = bc.GET_NOEXISTS_EMPTY_ROW_DT(dt, "", "F4 IS NOT NULL");
            if (dt.Rows.Count > 1)
            {
                for (int i = 1; i < dt.Rows.Count; i++)
                {
                    ccustomer_info.EMID = EMID;
                    ccustomer_info.CUID = ccustomer_info.GETID();
                    ccustomer_info.CNAME = dt.Rows[i][3].ToString();
                    ccustomer_info.CUSTOMER_ID = "";
                    ccustomer_info.PROVINCE = dt.Rows[i][0].ToString();
                    ccustomer_info.PAYMENT = "";
                    ccustomer_info.PAYMENT_CLAUSE = "";
                    DataTable dtt = ccustomer_info.GetTableInfo();
                    DataRow dr = dtt.NewRow();
                    dr["省份"] = dt.Rows[i][0].ToString();
                    dr["市区"] = dt.Rows[i][1].ToString();
                    dr["单位名称"] = dt.Rows[i][3].ToString();
                    dr["联系人"] = dt.Rows[i][4].ToString();
                    dr["部门"] = dt.Rows[i][5].ToString();
                    dr["职务"] = dt.Rows[i][6].ToString();
                    dr["固定电话"] = dt.Rows[i][7].ToString();
                    dr["手机号码"] = dt.Rows[i][8].ToString();
                    dr["邮箱"] = dt.Rows[i][9].ToString();
                    dr["QQ"] = dt.Rows[i][10].ToString();
                    dr["微信号码"] = dt.Rows[i][11].ToString();
                    dr["生产范围"] = dt.Rows[i][12].ToString();
                    dr["参会时间"] = dt.Rows[i][13].ToString();
                    dr["需求"] = dt.Rows[i][14].ToString();
                    dr["客户类型"] = dt.Rows[i][15].ToString();
                    dr["项次"] = "1";
                    dtt.Rows.Add(dr);
                    ccustomer_info.save(dtt);
                    ErrowInfo = ccustomer_info.ErrowInfo;

                }
            }
            else
            {
                MessageBox.Show("找不到客户名称不为空的行", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
    
        }
        #region importExcelToDataSet
        public static DataSet importExcelToDataSet(string FilePath, string tablename)
        {
            string strConn;
            strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + FilePath + ";Extended Properties='Excel 8.0;HDR=No;IMEX=1'";
            OleDbConnection conn = new OleDbConnection(strConn);
            OleDbDataAdapter myCommand = new OleDbDataAdapter("SELECT * FROM [" + tablename + "] ", strConn);
            DataSet myDataSet = new DataSet();
            try
            {
                myCommand.Fill(myDataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show("error," + ex.Message);
            }
            return myDataSet;
        }
        #endregion
        #region GetExcelFirstTableName
        public static string GetExcelFirstTableName(string excelFileName)
        {
            string tableName = null;
            if (File.Exists(excelFileName))
            {
                using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet." +
                  "OLEDB.4.0;Extended Properties=\"Excel 8.0\";Data Source=" + excelFileName))
                {
                    conn.Open();
                    DataTable dt = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    tableName = dt.Rows[0][2].ToString().Trim();

                }
            }
            return tableName;
        }
        #endregion
    }
}
