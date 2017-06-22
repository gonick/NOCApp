using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Threading;
using System.Web.Services;
public partial class Department : System.Web.UI.Page
{
    public static int id;
    public static string deptName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] != null && Session["deptId"].ToString() == Request.QueryString["deptid"].ToString())
        {
            if (!IsPostBack && Session["type"].ToString() == "3")
            {
                try
                {
                    id = Convert.ToInt32(Request.QueryString["deptid"]);
                    Dept obj = new Dept();
                    string name = obj.getDeptName(id);
                    if (name == "Error Occured")
                    {
                        Response.Write("<script>alert('Error Occured')</script>");
                        Response.Redirect("Default.aspx");
                    }
                    else if (name == "Exception Occured")
                    {
                        Response.Write("<script>alert('Exception Occured')</script>");
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        LabelDept.Text += name;
                        deptName = name;
                    }
                    loadData();
                }
                catch (Exception ex)
                {
                    writeException obj = new writeException();
                    obj.WriteExceptionToFile(ex, "Dept.aspx.cs-PageLoad");
                    Response.Write("<script>alert('Exception Occured')</script>");
                }
            }
        }
        else
        {
            Session["noti"] = "Session Timed Out";
            Response.Redirect("Default.aspx");
        }
       
    }
    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        try
        {

            int applicantID = Convert.ToInt32(HiddenField1.Value);
            if (FileUploadNOC.HasFile)
            {
                string extension = Path.GetExtension(FileUploadNOC.PostedFile.FileName);
                string filename = "NOC for " + applicantID + " - by " + id + extension;
                string path = Server.MapPath("/NOC/NOC-" + applicantID);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                FileUploadNOC.SaveAs(path + "/" + filename);
                Dept obj = new Dept();
                obj.DeptID = id;
                obj.AppID = applicantID;
                obj.uploadNOC("NOC/NOC-" + applicantID + "/" + filename);
                string result = obj.updateNocView();
                if (!result.Contains("Occured"))
                {
                    Response.Write("<div class='notification green'>NOC uploaded Successfully for applicant id " + applicantID + "</div>");
                    loadData();
                    string q = "select u.username from userlogin u where u.id=" + applicantID;
                    dbConnect o = new dbConnect();
                    DataSet ds = o.executeSelectStatemant(q);
                    Email em = new Email();
                    em.SendEmail(ds.Tables[0].Rows[0][0].ToString(),"Noc Status","Dear Applicant, An NOC has been issued to you by department "+deptName+". Kindly login at http://noconlinepunjab.com/login.aspx \r\n to check status of your application.\r\n\r\n Regards Admin \r\n(noconlinepunjab)");
                }
                else
                {
                    Response.Write("<div class='notification red'>" + result + "</div>");
                }
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept.aspx.cs-ButtonUpload");
            Response.Write("<script>alert('Exception Occured')</script>");
        }
    }

    protected void loadData()
    {
        try
        {
            Dept obj = new Dept();
            obj.DeptID = id;
            DataSet dset = obj.retrieveAppData(id);
                ListView1.DataSource = dset.Tables[0];
                ListView1.DataBind();
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept.aspx.cs-loadData");
            Response.Write("<script>alert('Exception Occured')</script>");
        }
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["noti"] = "You have successfully logged out!";
        Response.Redirect("Default.aspx");
    }
    protected void LinkButtonUpdatePassword_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ButtonUpdatePass_Click(object sender, EventArgs e)
    {
        if (Session["usn"] != null)
        {
            string old = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxOld.Text.Trim(), "MD5");
            string newPass = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxNewPass.Text.Trim(), "MD5");
            Dept obj = new Dept();
            string result = obj.changePass(id, old, newPass,Session["usn"].ToString());
            if (result.Contains("Exception"))
            {
                Label1.Text = result;
                Label1.CssClass = "notification red";
            }
            else if (result.Contains("Incorrect Password"))
            //Response.Write("<div class='notification red'>" + result + "</div>");
            {
                Label1.Text = result;
                Label1.CssClass = "notification red";
            }
            else if (result.Contains("Password Changed"))
            {
                Label1.Text = result;
                Label1.CssClass = "notification green";
            }
            else
            {
                Label1.Text = result;
                Label1.CssClass = "notification red";
            }
           
        }

    }
    protected void LinkButtonOverview_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void LinkButtonTest_Click(object sender, EventArgs e)
    {
        Thread.Sleep(5000); 
    }
    protected void Send_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Send")
        {
            
            Response.Write(e.CommandArgument);
        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Send")
            {
                TextBox a = (TextBox)e.Item.FindControl("TextBox1");
                if (a.Text.Trim() != "")
                {
                    Dept obj = new Dept();
                    string dname = obj.getDeptName(id);
                    if (!dname.Contains("Occured"))
                    {
                        string result = obj.sendMessage(dname, a.Text, "Applicant-" + e.CommandArgument);
                        if (!result.Contains("Occured"))
                        {
                            Response.Write("<div class='notification green'>Message Send to Applicant!</div>");
                        }
                        else
                        {
                            Response.Write("<div class='notification red'>" + result + " in sending message</div>");
                        }
                    }
                    else
                    {
                        Response.Write("<div class='notification red'>Could not get Dept Name</div>");
                    }
                }
                else
                {
                    Response.Write("<div class='notification red'>Message cannot be empty</div>");
                }
                //empty text area
                a.Text = "";
            }
            if (e.CommandName == "Upload")
            {
                FileUpload fp = (FileUpload)e.Item.FindControl("FileUpload1");
                if (fp.HasFile)
                {
                    Dept obj = new Dept();
                    string dname = obj.getDeptName(id);
                    string extension = Path.GetExtension(fp.PostedFile.FileName);
                    string filename = "Dept-" + dname + "- to Applicant id-" + e.CommandArgument+" - "+DateTime.Now + extension;
                    string path = Server.MapPath("/Applicant_Data/Files");
                    filename = filename.Replace("/", "-").Replace(":","-");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    fp.SaveAs(path + "/" + filename);
                    string result = obj.uploadFile(dname, "Applicant_Data/Files/" + filename, "Applicant-" + e.CommandArgument);
                    if (!result.Contains("Occured"))
                    {
                        Response.Write("<div class='notification green'>File uploaded and sent successfully to applicant id: " + e.CommandArgument + "</div>");
                    }
                    else
                    {
                        Response.Write("<div class='notification red'>" + result + "</div>");
                    }
                }
                else
                {
                    Response.Write("<div class='notification red'>Select a file first</div>");
                }
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Department.aspx.cs-ListView1_ItemCommand");
            Response.Write("<script>alert('Exception Occured')</script>");
        }
    }
    protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        
    }

    protected string getDeptName()
    {
        Dept obj = new Dept();
        deptName = obj.getDeptName(id);
        return deptName;
    }
    protected void LinkButtonInbox_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        string query = "SELECT Message, [From], Datetime, Seen, Id FROM Messages WHERE [To] ='Dept-" + id + "' ORDER BY Datetime DESC, [From]";
        dbConnect db = new dbConnect();
        DataSet dset = db.executeSelectStatemant(query);
        if (!dset.HasErrors && dset.Tables[0].Rows.Count > 0)
        {
            ListViewMessages.DataSource = dset.Tables[0];
            ListViewMessages.DataBind();
        }
        query = "select f.FilePath, f.Datetime,f.[From],f.Seen,f.Id from Files f where f.[To]='Dept-" + id + "' order by f.Datetime desc";
        dset.Clear();
        dset = db.executeSelectStatemant(query);
        if ((!dset.HasErrors) && dset.Tables[0].Rows.Count > 0)
        {
            ListViewFiles.DataSource = dset.Tables[0];
            ListViewFiles.DataBind();
        }
        
    }
    protected string GetName(string name)
    {
        try
        {
            if (name.Contains("Dept"))
            {
                string[] n = name.Split('-');
                Dept obj = new Dept();
                name = obj.getDeptName(Convert.ToInt32(n[1]));
                return name;
            }
            if (name.Contains("Applicant"))
            {
                string[] n = name.Split('-');
                string query = "Select Applicant_Name from Applicant where Applicant_ID=" + n[1];
                dbConnect db = new dbConnect();
                DataSet dset = db.executeSelectStatemant(query);
                if (!dset.HasErrors && dset.Tables[0].Rows.Count > 0)
                {
                    return dset.Tables[0].Rows[0][0].ToString();
                }
                else
                    return name;
            }
            else
                return name;
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Messages=deptName");
            return "Exception Occured";
        }
    }
    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        
    }

    protected void ListViewFiles_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("attachment"))
        {
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(e.CommandArgument.ToString()));
            Response.WriteFile(e.CommandArgument.ToString());
            Response.End();
        }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        if (TextBoxMessage.Text.Trim() != "")
        {
            var to = HiddenFieldTo.Value;
            Dept obj = new Dept();
            string result = obj.sendMessage(deptName, TextBoxMessage.Text.Trim(), to);
            if (!result.Contains("Occured"))
            {
                Response.Write("<div class='notification green'>Message Sent!</div>");
            }
            else
            {
                Response.Write("<div class='notification red'>" + result + " while sending message</div>");
            }
           
        }
    }
    protected void LinkButtonUploadFile_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            var to = HiddenFieldTo.Value;
            Dept obj = new Dept();
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            string filename = "Dept-" + deptName + " to - " + to + " - " + DateTime.Now + extension;
            string path = Server.MapPath("/Applicant_Data/Files");
            filename = filename.Replace("/", "-").Replace(":", "-");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            FileUpload1.SaveAs(path + "/" + filename);
            string result = obj.uploadFile(deptName, "Applicant_Data/Files/" + filename, to);
            if (!result.Contains("Occured"))
            {
                Response.Write("<div class='notification green'>Message Sent!</div>");
            }
            else
            {
                Response.Write("<div class='notification red'>" + result + " while sending message</div>");
            }
        }
        else
        {
            Response.Write("<div class='notification red>Please select a file first</div>");
        }
    }
    [WebMethod]
    public static string updateSeen (int[] id)
    {
        return DateTime.Now.ToString();
    }
}