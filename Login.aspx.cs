using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
    }
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        string pass = password.Text.Trim();
        string usn = username.Text.Trim();
        string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(pass,"MD5");
        user obj = new user();
        obj.Password = encryptedPassword;
        obj.Username = usn;
        if (obj.autenticateUser())
        {
            string accessType = obj.getAccessType();
            if (accessType == "1")
            {
                Session["unm"] = usn;
                Session["type"] = "1";
                Response.Redirect("Applicant.aspx");
            }
            else if (accessType == "2")
            {
                Session["unm"] = usn;
                Session["type"] = "2";
                Response.Redirect("Admin.aspx");
            }
            else if (accessType == "3")
            {
                Dept d = new Dept();
                string check = d.getdeptId(usn, encryptedPassword);
                if (!check.Contains("Occured"))
                {
                    Session["type"] = "3";
                    Session["usn"] = usn;
                    Session["deptId"] = check;
                    Response.Redirect("Department.aspx?deptid=" + check);
                }
                else
                {
                    Response.Write("<script>alert('"+check+"');</script>");
                }
            }
            else
            {
                Response.Write("<div class='notification'>Exception Occured</div>");
            }
        }
        else 
        {
            Response.Write("<div class='notification'>Access Denied</div>");
        }
    }
}