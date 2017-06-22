using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["type"].ToString() == "files")
            MultiView1.ActiveViewIndex = 1;
        else
            MultiView1.ActiveViewIndex = 0;
    }
    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("attachment"))
        {
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(e.CommandArgument.ToString()));
            Response.WriteFile(e.CommandArgument.ToString());
            Response.End();
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
}