using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["noti"]!=null)
            Response.Write("<div class='notification'>" + Session["noti"].ToString() + "</div>");
        Session.RemoveAll();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBoxFeedback.Text.Trim() != "" && TextBoxFeedback.Text.Trim() != null)
        {
            home obj = new home();
            obj.Feedback = TextBoxFeedback.Text.Trim();
            bool result = obj.insertFeedback();
            if (result)
            {
                UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional;
                UpdatePanel2.Update();
                UpdatePanel2.DataBind();
                TextBoxFeedback.Text = null;
            }
        }
        string a = "alert('Thank you for your feedback!');";
        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", a, true);       
    }
}