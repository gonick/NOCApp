using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] != null && Session["type"] == "2")
        {
            LabelApplicantStatus.Text = "";
            LabelApplicantStatus.CssClass = "";
            LabelNoti.Text = "";
            LabelNoti.CssClass = "";
            if (!IsPostBack)
            {
                overview();
            }
        }
        else
        {
            Session["noti"] = "Session Timed out";
            Response.Redirect("Default.aspx");
        }
    }
    protected void download(object sender, EventArgs e)
    {
        string[] array = (sender as LinkButton).CommandArgument.Split('-');
        int appid = Convert.ToInt32(array[0]);
        int deptid = Convert.ToInt32(array[1]);
        Dept obj = new Dept();
        string filePath = obj.getNOClocation(deptid, appid);
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void ButtonFeedback_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ButtonDashboard_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        overview();
    }
    protected void ButtonNotices_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;

    }
    protected void GridViewNotices_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Delete"))
        {
            string a = "alert('Record Deleted!');";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", a, true);
        }
        if (e.CommandName.Equals("Insert"))
        {

            TextBox notices = GridViewNotices.FooterRow.Controls[0].FindControl("TextBoxNotice") as TextBox;
            TextBox datetime = GridViewNotices.FooterRow.Controls[0].FindControl("TextBoxDatetime") as TextBox;
            notices.TextMode = TextBoxMode.MultiLine;

            SqlDataSourceNotices.InsertParameters.Add("Notice", notices.Text);
            SqlDataSourceNotices.InsertParameters.Add("Datetime", datetime.Text);
            SqlDataSourceNotices.Insert();
            GridViewNotices.DataBind();
            string a = "alert('Record Inserted!');";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", a, true);
        }
    }
    protected void ButtonDepartments_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void LinkButtonLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session["noti"] = "you have successfully logged out";
        Response.Redirect("Default.aspx");
    }
    protected void LinkButtonChangePassword_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void ButtonUpdatePass_Click(object sender, EventArgs e)
    {
        user obj = new user();
        obj.Username = Session["unm"].ToString();
        obj.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxNewPass.Text.Trim(), "MD5");
        string old = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxOld.Text.Trim(), "MD5");
        string result = obj.updateAdminPass(old);
        if (result.Contains("Incorrect Password"))
        {
            LabelNoti.Text = result;
            LabelNoti.CssClass = "notification red";
        }
        else if (result.Contains("Password Changed"))
        {
            LabelNoti.Text = result;
            LabelNoti.CssClass = "notification green";
        }
        else
        {
            LabelNoti.Text = result;
            LabelNoti.CssClass = "notification red";
        }
    }
    protected void LinkButtonSendReminder_Click(object sender, EventArgs e)
    {
        try
        {
            
            string query = "select Email from Departments where DeptId=" + DropDownListDeptList.SelectedValue;
            dbConnect obj = new dbConnect();
            System.Data.DataSet dset = obj.executeSelectStatemant(query);
            string mail = dset.Tables[0].Rows[0][0].ToString();
            Email em = new Email();
            string body = "to " + DropDownListDeptList.SelectedItem.Text + ", \r\n This mail is regarding applicant with id: " + TextBoxAppID.Text+". Please provide me with a reason for such a delay caused.\r\n\r\n Regards, Admin\r\n(noconlinepunjab)";
            em.SendEmail(mail,"Reminder Notice",body);


        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Admin.aspx.cs-LinkButtonSendReminder_Click");
        }
    }

    protected void GridViewDepts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        //string message = "alert('Hello! Mudassar.')";
        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        //int id = Convert.ToInt32(GridViewDepts.DataKeys[e.RowIndex].Value.ToString());
        ////select username form departments and delete from userLogin
        //Dept obj = new Dept();
        //obj.DeptID = id;
        //string result = obj.deleteDeptFromUserLogin();
        ////delete dept column from noc view
        //if (!result.Contains("Occured"))
        //{
        //    result = obj.deleteDeptFromNOC_View();
        //    if (!result.Contains("Occured"))
        //    {
        //        //delete from departments
        //        result = obj.deleteDeptFromDepartments();
        //        if (!result.Contains("Occured"))
        //        {
        //            string m = "alert('Hello! Mudassar.')";
        //            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", m, true);
        //        }
        //    }
        //}
        //UpdatePanel1.UpdateMode = UpdatePanelUpdateMode.Conditional;
        //UpdatePanel1.Update();

    }

    protected void LinkButtonMessageReminder_Click(object sender, EventArgs e)
    {
        try
        {
            Dept obj = new Dept();
            string message = TextBoxMessage.Text.Trim();
            TextBoxMessage.Text = "";
            string to = DropDownListDeptList1.SelectedValue;
            obj.sendMessage("Admin", message, "Dept-" + to);
            //Email mail = new Email();
            //string query = "select email from departments where DeptId=" + to;
            //dbConnect db = new dbConnect();
            //System.Data.DataSet dset = db.executeSelectStatemant(query);
            //string mailId = dset.Tables[0].Rows[0][0].ToString();
            //mail.SendEmail(mailId, "Reminder Message", message);
            string a = "alert('Message Sent!');";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", a, true);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "admin-LinkButtonMessageReminder_Click");
            string a = "alert('Exception Occured!');";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", a, true);
        }
    }

    public string getDatetime(string deptID, string applicationID, string a)
    {
            if (a == "True")
            {
              return  dsetOverall.Tables[3].AsEnumerable().Where(w => w.Field<int>("DeptId") == Convert.ToInt32(deptID) && w.Field<int>("Applicant_ID") == Convert.ToInt32(applicationID)).Select(s=>s.Field<DateTime>("Datetime")).First().ToLongDateString();
            }
            else return "";
    }
    protected void LinkButtonApplicationQueue_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 1;
        ApplicationQueue();
    }


    protected void ApplicationQueue()
    {
        try
        {
            string query = "select u.Name,a.Applicant_ID,u.Datetime as [Date Filed],a.LOC_Petrol_Pump as [Petrol Pump Location],a.Oil_Company as [Oil COmpany] from applicant a inner join userLogin u on a.Applicant_ID=u.Id where a.Complete='True' and a.Authorized='False' order by datetime desc";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
                GridView1.DataSource = dset.Tables[0];
                GridView1.DataBind();
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Admin-ApplicationQueue");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Authorize")
        {
            string id = e.CommandArgument.ToString();
            try
            {
                string query = "insert into ApplicantDepts values(" + id + "," + DropDownListDept1.SelectedValue + "," + DropDownListDept2.SelectedValue + "," + DropDownListDept3.SelectedValue + "," + DropDownListDept4.SelectedValue + "," + DropDownListDept5.SelectedValue + "," + DropDownListDept6.SelectedValue + "," + DropDownListDept7.SelectedValue + "," + DropDownListDept8.SelectedValue + "," + DropDownListDept9.SelectedValue + "," + DropDownListDept10.SelectedValue + "," + DropDownListDept11.SelectedValue + ")";
                dbConnect obj = new dbConnect();
                string res = obj.executeNonQuery(query);
                if (!res.Contains("Occured"))
                {
                    query = "update Applicant set Authorized='True' where Applicant_ID=" + id;
                    string result = obj.executeNonQuery(query);
                    if (!result.Contains("Occured"))
                    {
                        LabelApplicantStatus.Text = "Applicant with ID " + id + " successfully authorized";
                        LabelApplicantStatus.CssClass = "notification green";
                    }
                    else
                    {
                        LabelApplicantStatus.Text = result;
                        LabelApplicantStatus.CssClass = "notification red";
                    }
                }
                else
                {
                    LabelApplicantStatus.Text = res;
                    LabelApplicantStatus.CssClass = "notification red";
                }
                ApplicationQueue();
            }
            catch (Exception ex)
            {
                writeException obj = new writeException();
                obj.WriteExceptionToFile(ex, "Admin-GridView1_RowCommand");
            }
        }
    }
    public static DataSet dsetOverall;
    protected void overview()
    {
        string query = "select DeptId,DeptName from Departments;select a.Applicant_ID,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],a.Applicant_Name,u.Contact,a.LOC_Petrol_Pump,u.datetime,u.username from applicantDepts ad inner join applicant a on a.Applicant_ID=ad.Applicant_ID inner join userLogin u on u.id=a.applicant_ID order by u.datetime desc;Select * from NOC_View;select * from NOC";
        dbConnect obj=new dbConnect();
        dsetOverall= obj.executeSelectStatemant(query);

        ListView1.DataSource = dsetOverall.Tables[1];
        ListView1.DataBind();
    }
    protected string getDeptName(int id)
    {
        return dsetOverall.Tables[0].AsEnumerable().Where(w => w.Field<int>("DeptId") == id).Select(s => s.Field<string>("DeptName")).First().ToString();
    }
    protected string NocStatus(string id,int appid)
    { 
        return dsetOverall.Tables[2].AsEnumerable().Where(w=>w.Field<int>("Applicant_ID")==appid).Select(s=>s.Field<bool>(id)).First().ToString();
    }
    protected void DataPager1_PreRender(object sender, EventArgs e)
    {
        ListView1.DataSource = dsetOverall.Tables[1];
        ListView1.DataBind();
    }
    protected void LinkButtonOverview_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 0;
        overview();
    }
    protected void LinkButtonInbox_Click(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 2;
        string query = "SELECT Message, [From], Datetime, Seen, Id FROM Messages WHERE [To] ='Admin' ORDER BY Datetime DESC, [From];select f.FilePath, f.Datetime,f.[From],f.Seen,f.Id from Files f where f.[To]='Admin' order by f.Datetime desc";
        dbConnect db = new dbConnect();
        DataSet dset = db.executeSelectStatemant(query);
            ListViewMessages.DataSource = dset.Tables[0];
            ListViewMessages.DataBind();
            ListViewFiles.DataSource = dset.Tables[1];
            ListViewFiles.DataBind();
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
}