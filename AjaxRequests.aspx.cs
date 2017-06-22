using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjaxRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    
    public static void updateSeen(string[] ids, string table)
    {
        try
        {
            foreach (string id in ids)
            {
                string query = "update " + table + " set Seen='True' where Id=" + id;
                dbConnect obj = new dbConnect();
                obj.executeNonQuery(query);
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "AjaxRequests-updateSeem");
        }
    }

    [WebMethod]
    public static int inboxCount(int id)
    {
        int count = 0;
        try
        {
            string query = "select count(id) from Files where Files.[To]='Dept-" + id + "' and Seen='False'";
            dbConnect obj = new dbConnect();
            DataSet result = obj.executeSelectStatemant(query);
            if (!result.HasErrors && result.Tables[0].Rows.Count > 0)
            { 
                count += Convert.ToInt32(result.Tables[0].Rows[0][0]);
            }
            query = "select count(id) from Messages where Messages.[To]='Dept-" + id + "' and Seen='False'";
            result.Dispose();
            result = obj.executeSelectStatemant(query);
            if (!result.HasErrors && result.Tables[0].Rows.Count > 0)
            {
                count += Convert.ToInt32(result.Tables[0].Rows[0][0]);
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "AjaxRequests-inboxCount");
        }

        return count;
    }
     [WebMethod]
    public static int inboxCountAdmin()
    {
        int count = 0;
        try
        {
            string query = "select count(id) from Files where Files.[To]='Admin' and Seen='False'";
            dbConnect obj = new dbConnect();
            DataSet result = obj.executeSelectStatemant(query);
            if (!result.HasErrors && result.Tables[0].Rows.Count > 0)
            {
                count += Convert.ToInt32(result.Tables[0].Rows[0][0]);
            }
            query = "select count(id) from Messages where Messages.[To]='Admin' and Seen='False'";
            result.Dispose();
            result = obj.executeSelectStatemant(query);
            if (!result.HasErrors && result.Tables[0].Rows.Count > 0)
            {
                count += Convert.ToInt32(result.Tables[0].Rows[0][0]);
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "AjaxRequests-inboxCount");
        }

        return count;
    }
     //protected void Button1_Click(object sender, EventArgs e)
     //{
     //    string query = "select * from Departments";
     //    dbConnect obj = new dbConnect();
     //    DataSet dset = obj.executeSelectStatemant(query);
     //    for (int i = 0; i < dset.Tables[0].Rows.Count; i++)
     //    {
     //        string username = dset.Tables[0].Rows[i]["Username"].ToString();
     //        string password = dset.Tables[0].Rows[i]["Password"].ToString();
     //        string name = dset.Tables[0].Rows[i]["DeptName"].ToString();
     //        string type = "3";
     //        query = "insert into userLogin(Username,Password,Name,Type,Datetime) values('" + username + "','" + password + "','" + name + "'," + type + ",'" + DateTime.Now + "')";
     //        obj.executeNonQuery(query);
     //    }
     //}
}