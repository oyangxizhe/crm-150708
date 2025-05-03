using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;
using XizheC;
namespace WPSS
{
    public class Global : System.Web.HttpApplication
    {
        basec bc = new basec();
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            string varDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            bc.getcom(@"UPDATE AUTHORIZATION_USER SET STATUS='N' ,LEAVE_DATE='" + varDate + "'WHERE AUID='" + Session["AUID"].ToString() + "'");
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

    }
}