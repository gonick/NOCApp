using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
public partial class Citizen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
            
    }
    protected void ButtonShow_Click(object sender, EventArgs e)
    {
        try
        {
            home obj = new home();
            //DataSet dset = obj.listOFApp(TextBoxFrom.Text, TextBoxTo.Text);
            ////GridView1.DataSource = dset;
            ////GridView1.DataBind();
            //ListView1.DataSource = dset;
            //ListView1.DataBind();
            overview();

            appReceived.Text = "Total Applications Received : " + dsetOverall.Tables[1].Rows.Count.ToString();

           
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Citizen.aspx.cs-ButtonShow_Click");
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
    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        home obj = new home();
        DataSet dset = obj.listOFApp(TextBoxFrom.Text, TextBoxTo.Text);
        //GridView1.DataSource = dset;
        //GridView1.DataBind();
        ListView1.DataSource = dset;
        ListView1.DataBind();
    }

    public static DataSet dsetOverall;
    protected void overview()
    {
        string query = "select DeptId,DeptName from Departments;select a.Applicant_ID,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],a.Applicant_Name,u.Contact,a.LOC_Petrol_Pump,u.datetime,u.username,a.Oil_Company from applicantDepts ad inner join applicant a on a.Applicant_ID=ad.Applicant_ID inner join userLogin u on u.id=a.applicant_ID where a.Authorized='True' and (u.Datetime>='" + TextBoxFrom.Text + "' and u.Datetime<='" + TextBoxTo.Text + "' ) order by u.datetime desc;Select * from NOC_View;select * from NOC";
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