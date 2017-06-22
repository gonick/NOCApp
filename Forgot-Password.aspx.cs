using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Forgot_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ButtonResetPassword_Click(object sender, EventArgs e)
    {
        try
        {
            long mobile = Convert.ToInt64(TextBoxMobile.Text.Trim());
            Random rn = new Random();
            string password = rn.Next(1001,9999).ToString();
            string enctPassword=FormsAuthentication.HashPasswordForStoringInConfigFile(password,"MD5");
            string query = "update userLogin set Password='" + enctPassword + "' where Username='" + TextBoxUsername.Text.Trim() + "' and Contact=" + mobile + " and Type=1";
            dbConnect db = new dbConnect();
            string result = db.executeNonQuery(query);
            if (!result.Contains("Occured"))
            {
                if (Convert.ToInt32(result) > 0)
                {
                    Email em = new Email();
                    em.SendEmail(TextBoxUsername.Text.Trim(), "Password Changed", "Dear Applicant,\r\n Your password has been changed.\r\n new Password: " + password + " \r\n\r\n Login with the new password to access you account on www.noconlinepunjab.com/login.aspx \r\n\r\n NOTE: Do not share your password with anyone.");
                    Response.Write("<div class='notification green'>Password Changed. New Password has been sent to your email address</div>");
                }
                else
                {
                    Response.Write("<div class='notification red'>Invalid Email id</div>");
                }
            }
            else
            {
                Response.Write("<div class='notification green'>" + result + "</div>");
                TextBoxUsername.Text = "";
                TextBoxMobile.Text = "";
            }
        }
        catch (FormatException ex)
        {
            Response.Write("<div class='notification red'>only numbers are allowed in the Mobile field</div>");
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Forgot-Password.aspx.cs-ButtonResetPassword_Click");
            Response.Write("<div class='notification red'>Exception occured</div>");
        }
    }
}