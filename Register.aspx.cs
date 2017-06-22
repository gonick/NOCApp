using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            user obj = new user();
            obj.Name = TextBoxName.Text.Trim();
            obj.Username = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text;
            obj.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            obj.Contact = Convert.ToInt64(TextBoxContact.Text);
            string result = obj.registerApplicant();
            if (result == "Exception Occured")
            {
                Response.Write("<script>alert('Exception Occured')</script>");
            }
            else if(result =="Unique Key")
                Response.Write("<script>alert('Email Id already exists')</script>");
            else if (Convert.ToInt32(result) > 0)
            {
                int appId = Convert.ToInt32(obj.getApplicantID());
                ApplicantReg ap = new ApplicantReg();
                ap.ApplicantID = appId;
                ap.insertApplicantId();
                Email em = new Email();
                em.SendEmail(obj.Username,"Registration Successful","Dear Applicant,\r\n you have been successfully registered with us. Kindly login with your credentials at http://www.noconlinepunjab.com/login.aspx");
                Response.Redirect("Success.aspx",true);
            }
            else
                Response.Write("<script>alert('Registeration Failed')</script>");
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Register-ButtonSubmit");
            Response.Write("<script>alert('Exception Occured')</script>");
        }

    }
}