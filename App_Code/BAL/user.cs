using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for user
/// </summary>
public class user
{
    private string unm;
    private string encryptedPass;
    private string name;
    private long contact;

    public string Username
    {
        set { unm = value; }
        get { return unm; }
    }
    public string Password
    {
        set { encryptedPass = value; }
        get { return encryptedPass; }
    }
    public string Name
    {
        set { name = value; }
        get { return name; }
    }
    public long Contact
    {
        set { contact = value; }
        get { return contact; }
    }
	public user()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool autenticateUser()
    {
        try
        {
            string query = "select * from userLogin where Username='" + Username + "'and Password='" + Password + "'";
            dbConnect obj = new dbConnect();
            return obj.validate(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "user-authenticateUser");
            return false;
        }
    }
    public string registerApplicant() 
    {
        try
        {
            string query = "insert into userLogin (Username,Password,Type,Name,Contact,Datetime) Values('" + Username + "','" + encryptedPass + "'," + 1 + ",'" + Name + "'," + Contact + ",'"+DateTime.Now+"')";
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "user-registerApplicant");
            return "Exception Occured";
        }
    }
    public string getAccessType()
    {
        try
        {
            string query = "select Type from userLogin where Username='" + Username + "'and Password='" + Password + "'";
            dbConnect obj = new dbConnect();
            DataSet dset=obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset.Tables[0].Rows[0]["Type"].ToString();
            }
            else
                return null;
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "user-authenticateUser");
            return "Exception Occured";
        }
    }
    public string getApplicantID()
    {
        try
        {
            string query = "select Id from userLogin where Username='" + Username + "'and Password='" + Password + "'";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                return dset.Tables[0].Rows[0]["Id"].ToString();
            }
            else
            {
                return "Exception Occured";
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "user-getApplicantID");
            return "Exception Occured";
        }
    }
    public string updateAdminPass(string old)
    {
        try 
        {
            string query = "update userLogin set Password='" + Password + "' where Username='" + Username + "' and Type=" + 2 + " and Password='" + old + "'";
            dbConnect obj = new dbConnect();
            string result = obj.executeNonQuery(query);
            if (result.Contains("Occured") || result.Contains("Exception") || result.Contains("Error"))
                return result;
            else if (Convert.ToInt32(result) == 1)
                return "Password Changed";
            else
                return "Incorect Password";

        }
        catch(Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "user-updateAdminPass");
            return "Exception Occured";
        }
    }
}