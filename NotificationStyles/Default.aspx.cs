using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NotificationStyles_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string msg = "<div class=\"tn-box tn-box-color-1\"><p>Your settings have been saved successfully!</p><div class=\"tn-progress\"></div></div>";
        Response.Write(msg);
    }
}