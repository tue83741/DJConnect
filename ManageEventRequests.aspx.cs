using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJ_Connect
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        GetData eventRecordsData = new GetData();
        SendData send = new SendData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvEventRequests.DataSource = eventRecordsData.GetBooking();
                gvEventRequests.DataBind();
            }
        }
    }
}