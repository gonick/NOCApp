using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Threading;
public partial class ApplicantNOC : System.Web.UI.Page
{
    public static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["appID"] != null)
                {
                    id = Convert.ToInt32(Session["appID"]);
                    //ApplicantReg obj = new ApplicantReg();
                    //DataSet dset = obj.viewNOC_Status(id);
                    //if (!dset.HasErrors && dset.Tables[0].Rows.Count > 0)
                    //{
                    //    ListView1.DataSource = dset;
                    //    ListView1.DataBind();
                    //}
                    DataSet dset=new DataSet();
                    overview();
                    //messages
                    string query = "select m.Message, m.Datetime,m.[From] from Messages m where m.[To]='Applicant-" + id + "' order by m.Datetime desc";
                    dset.Clear();
                    dbConnect o = new dbConnect();
                    dset = o.executeSelectStatemant(query);
                    if ((!dset.HasErrors) && dset.Tables[0].Rows.Count > 0)
                    {
                        Repeater1.DataSource = dset;
                        Repeater1.DataBind();
                        Label1.Visible = true;
                    }
                    else
                    {
                        Label1.Visible = false;
                    }
                    //attachments
                    query = "select f.FilePath, f.Datetime,f.[From] from Files f where f.[To]='Applicant-" + id + "' order by f.Datetime desc";
                    dset.Clear();
                    dset = o.executeSelectStatemant(query);
                    if ((!dset.HasErrors) && dset.Tables[0].Rows.Count > 0)
                    {
                        Repeater2.DataSource = dset;
                        Repeater2.DataBind();
                        Label2.Visible = true;
                    }
                    else
                    {
                        Label2.Visible = false;
                    }
                }
                else
                {
                    Session.RemoveAll();
                    Response.Redirect("Applicant.aspx",false);
                }
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "ApplicantNOC-Page_Load");
            Response.Write("Exception Occured");
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["noti"] = "You have successfully logged out!";
        Response.Redirect("Default.aspx");
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
    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("attachment"))
        {
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(e.CommandArgument.ToString()));
            Response.WriteFile(e.CommandArgument.ToString());
            Response.End();
        }
    }
    protected void LinkButtonUploadFile_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {

            Dept obj = new Dept();
            string dname = HiddenFieldTo.Value;
            string query = "select DeptId from Departments where DeptName='" + dname + "'";
            dbConnect d = new dbConnect();
            DataSet dset = d.executeSelectStatemant(query);
            string dId;
            if ((!dset.HasErrors) && dset.Tables[0].Rows.Count > 0)
            {
                dId = dset.Tables[0].Rows[0][0].ToString();

                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                string filename = "Applicant-" + id + "- to Dept id-" + dId + " - " + DateTime.Now + extension;
                string path = Server.MapPath("/Applicant_Data/Files");
                filename = filename.Replace("/", "-").Replace(":", "-");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                FileUpload1.SaveAs(path + "/" + filename);
                string result = obj.uploadFile("Applicant-" + id, "Applicant_Data/Files/" + filename, "Dept-" + dId);
                if (!result.Contains("Occured"))
                {
                    Response.Write("<div class='notification green'>File uploaded and sent successfully</div>");
                }
                else
                {
                    Response.Write("<div class='notification red'>" + result + "</div>");
                }
            }
        }
        else
        {
            Response.Write("<script>alert('Please select a file first')</script>");
        }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        string message=TextBoxMessage.Text.Trim();
        if (message!= "")
        {
            Dept obj = new Dept();
            string dname = HiddenFieldTo.Value;
            if (!dname.Contains("Occured"))
            {
                string query = "select DeptId from Departments where DeptName='" + dname + "'";
                dbConnect d = new dbConnect();
                DataSet dset = d.executeSelectStatemant(query);
                string dId;
                if ((!dset.HasErrors) && dset.Tables[0].Rows.Count > 0)
                {
                    dId = dset.Tables[0].Rows[0][0].ToString();

                    string result = obj.sendMessage("Applicant-" + id, message, "Dept-" + dId);
                    if (!result.Contains("Occured"))
                    {
                        Response.Write("<div class='notification green'>Message Sent!</div>");
                    }
                    else
                    {
                        Response.Write("<div class='notification red'>" + result + " in sending message</div>");
                    }
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
        TextBoxMessage.Text = "";
    }

    public static DataSet dsetOverall;
    protected void overview()
    {
        string query = "select DeptId,DeptName from Departments;select a.Applicant_ID,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],a.Applicant_Name,u.Contact,a.LOC_Petrol_Pump,u.datetime,u.username from applicantDepts ad inner join applicant a on a.Applicant_ID=ad.Applicant_ID inner join userLogin u on u.id=a.applicant_ID where a.Applicant_ID=" + id + " and a.Authorized='True' order by u.datetime desc;Select * from NOC_View;select * from NOC";
        dbConnect obj = new dbConnect();
        dsetOverall = obj.executeSelectStatemant(query);

        ListView1.DataSource = dsetOverall.Tables[1];
        ListView1.DataBind();
    }
    protected string getDeptName(int id)
    {
        return dsetOverall.Tables[0].AsEnumerable().Where(w => w.Field<int>("DeptId") == id).Select(s => s.Field<string>("DeptName")).First().ToString();
    }
    protected string NocStatus(string id, int appid)
    {
        return dsetOverall.Tables[2].AsEnumerable().Where(w => w.Field<int>("Applicant_ID") == appid).Select(s => s.Field<bool>(id)).First().ToString();
    }
    public string getDatetime(string deptID, string applicationID, string a)
    {
        if (a == "True")
        {
            return dsetOverall.Tables[3].AsEnumerable().Where(w => w.Field<int>("DeptId") == Convert.ToInt32(deptID) && w.Field<int>("Applicant_ID") == Convert.ToInt32(applicationID)).Select(s => s.Field<DateTime>("Datetime")).First().ToLongDateString();
        }
        else return "";
    }
}