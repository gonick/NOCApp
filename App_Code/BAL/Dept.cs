using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for Dept
/// </summary>
public class Dept
{
    private int appid;
    private int deptid;
    public int AppID
    {
        set { appid = value; }
        get { return appid; }
    }
    public int DeptID
    {
        set { deptid = value; }
        get { return deptid; }
    }
    public Dept()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string getDeptName(int id)
    {
        try
        {
            string query = "select DeptName from Departments where DeptId=" + id;
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset.Tables[0].Rows[0]["DeptName"].ToString();
            }
            else
            {
                return "Error Occured";
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-getDeptName");
            return "Exception Occured";
        }
    }
    public string uploadNOC(string NOC)
    {
        try
        {
            string query = "insert into NOC Values(" + DeptID + ",'" + NOC + "'," + AppID + ",'" + DateTime.Now + "')";
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-uploadNOC");
            return "Exception Occured";
        }
    }
    public string updateNocView()
    {
        try
        {
            string query = "update NOC_View set [" + DeptID + "]='" + true + "' where Applicant_ID=" + AppID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-updateNocView");
            return "Exception Occured";
        }
    }
    public DataSet retrieveAppData(int deptid)
    {
        try
        {
            //string query = "select u.Datetime,u.Name,a.Address,a.Applicant_ID,a.Oil_Company from applicant a inner join userLogin u on a.Applicant_ID=u.Id where Applicant_ID not in (select Applicant_ID from noc where deptid=" + DeptID + ") and Applicant_ID !=0";
            string query = "select v.["+deptid+"],u.Datetime,u.Name,a.LOC_Petrol_Pump,a.Applicant_ID,a.Oil_Company from applicant a inner join userLogin u on a.Applicant_ID=u.Id inner join noc_view v on v.applicant_ID=a.Applicant_ID inner join applicantDepts ad on a.applicant_ID=ad.Applicant_ID where a.Applicant_ID !=0 and a.authorized='True' and (ad.[1]="+deptid+" or ad.[2]="+deptid+" or ad.[3]="+deptid+" or ad.[4]="+deptid+" or ad.[5]="+deptid+" or ad.[6]="+deptid+" or ad.[7]="+deptid+" or ad.[8]="+deptid+" or ad.[9]="+deptid+" or ad.[10]="+deptid+" or ad.[11]="+deptid+" ) order by datetime desc";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset;
            }
            else
            {
                //    string query2 = "select u.Name,a.Address,a.Applicant_ID,a.Oil_Company from applicant a inner join userLogin u on a.Applicant_ID=u.Id";
                //    DataSet dset2 = obj.executeSelectStatemant(query2);
                //    if (dset2.Tables[0].Rows.Count > 0)
                //    {
                //        return dset2;
                //    }
                //    else
                //    {
                return dset;
                //}
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-retrieveAppData");
            return new DataSet();
        }
    }
    public string getNOClocation(int deptid, int appid)
    {
        try
        {
            string query = "select NOC_LOC from NOC where deptId=" + deptid + " and Applicant_ID=" + appid;
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset.Tables[0].Rows[0][0].ToString();
            }
            else
                return "error";

        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-getNOClocation");
            return "Exception Occured";
        }
    }

    public string getdeptId(string usn,string pass)
    {
        try
        {
            string query = "select DeptId from Departments where Username='" + usn + "' and Password='" + pass + "'";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset.Tables[0].Rows[0][0].ToString();
            }
            else
                return "Error Occured";

        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-getdeptId");
            return "Exception Occured";
        }
    }
    public string changePass(int id,string old, string newPass,string usn)
    {
        try 
        {
            string query = "select DeptId from Departments where DeptId=" + id + " and Password='" + old + "'";
            dbConnect obj = new dbConnect();
            if (obj.validate(query))
            {
                query = "update Departments set Password='" + newPass + "' where DeptId=" + id;
                if (obj.executeNonQuery(query).Contains("Error"))
                    return "Error Occured";
                else
                {
                    string query2 = "update userLogin set Password='" + newPass + "' where Username='" + usn + "'";
                    string result=obj.executeNonQuery(query2);
                    if(result.Contains("error") || Convert.ToInt32(result)<1)
                        return "Error Occured";
                    else
                        return "Password Changed";
                }
            }
            else
                return "Incorrect Password";
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-changePass");
            return "Exception Occured";
        }
    }
    public string sendMessage(string from, string message, string to)
    {
        try 
        {
            string query = "insert into Messages values('" + from + "','" + message + "','" + to + "','" + DateTime.Now + "',0)";
            dbConnect obj = new dbConnect();
            string result = obj.executeNonQuery(query);
            return result;
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-sendMessage");
            return "Exception Occured";
        }
    }
    public string uploadFile(string from,string filePath,string to)
    {
        try
        {
            string query = "insert into Files values('" + from + "','" + filePath + "','" + to + "','" + DateTime.Now + "')";
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-uploadFile");
            return "Exception Occured";
        }
    }

    public string deleteDeptFromUserLogin()
    {
        try 
        {
            string query = "select Username from Departments where DeptId=" + DeptID;
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                string usn = dset.Tables[0].Rows[0][0].ToString();
                query = "delete from userLogin where Username='" + usn + "' and Type=3";
                return obj.executeNonQuery(query);
            }
            else
                return "Error Occured";
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-deleteDeptFromUserLogin");
            return "Exception Occured";
        }
    }
    public string deleteDeptFromNOC_View()
    {
        try
        {
            //string query = "alter table NOC_View alter column NOC_View[" + DeptID + "] drop default";
            string query = "select name from sys.default_constraints where parent_object_id = object_id('NOC_VIEW') AND type = 'D' AND parent_column_id = (select column_id from sys.columns where object_id = object_id('NOC_VIEW') and name = '" + DeptID + "')";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                query = "alter table NOC_View drop constraint " + dset.Tables[0].Rows[0][0].ToString();
                string result = obj.executeNonQuery(query);
                if (!result.Contains("Occured"))
                {
                    query = "alter table NOC_View drop column [" + DeptID + "]";
                    return obj.executeNonQuery(query);
                }
                else
                    return "Error Occured";
            }
            else
                return "Error Occured";
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-deleteDeptFromNOC_View");
            return "Exception Occured";
        }
    }
    public string deleteDeptFromDepartments()
    {
        try
        {
            string query = "delete from Departments where DeptId=" + DeptID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Dept-deleteDeptFromDepartments");
            return "Exception Occured";
        }
    }

   
}