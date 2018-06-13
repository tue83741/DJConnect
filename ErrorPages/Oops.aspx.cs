using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJ_Connect.ErrorPages
{
    public partial class Oops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void homeClick(object sender, EventArgs e)
        {
            //Redirect user to the appropriate page
            try
            {
                if (Session["UserType"].ToString().Equals("Superuser"))
                    Response.Redirect("../superuserLanding.aspx", false);
                else if (Session["UserType"].ToString().Equals("Scheduler"))
                    Response.Redirect("../SchedulerLanding.aspx", false);
                else if (Session["UserType"].ToString().Equals("Query"))
                    Response.Redirect("../ViewPoT.aspx", false);
            }
            catch
            {
                Response.Redirect("../LoginPage.aspx");
            }
        }
    }
}