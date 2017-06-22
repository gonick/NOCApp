using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for home
/// </summary>
public class home
{
    private string feedback;
    public string Feedback
    {
        get { return feedback; }
        set { feedback = value; }
    }
	public home()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool insertFeedback()
    {
        try
        {
            string query = "insert into Feedbacks(Feedback,Datetime) Values('" + Feedback + "','" + DateTime.Now + "')";
            dbConnect obj = new dbConnect();
            string result = obj.executeNonQuery(query);
            if (result == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "home-insertFeedback");
            return false;
        }
    }
    public DataSet listOFApp(string from,string to)
    {
        try
        {
            string query = "SELECT n.[1], n.[2], n.[3], n.[4], n.[5], n.[6], n.[7], n.[8], n.[9], n.[10], n.[11], Applicant.Applicant_ID,userLogin.Name,userLogin.Datetime, Applicant.LOC_Petrol_Pump, Applicant.Oil_Company FROM userLogin INNER JOIN Applicant ON userLogin.Id = Applicant.Applicant_ID inner join NOC_View n on n.Applicant_ID=Applicant.Applicant_ID WHERE (Applicant.Complete = 1) AND (userLogin.Datetime >= '" + from + "') AND (userLogin.Datetime <='" + to + "')";
            dbConnect obj = new dbConnect();
            return obj.executeSelectStatemant(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "home-listOFApp");
            return new DataSet();
        }
    }
    public string NOCApplications(string from, string to)
    {
        try
        {
            string query = "select Applicant_ID from NOC_View INNER JOIN userLogin ON userLogin.Id=NOC_View.Applicant_ID where (userLogin.Datetime>='"+from+"' and userLogin.Datetime<='"+to+"') and ( [1]=" + 1 + " and [2]=" + 1 + " and [3]=" + 1 + " and [4]=" + 1 + " and [5]=" + 1 + " and [6]=" + 1 + " and [7]=" + 1 + " and [8]=" + 1 + " and [9]=" + 1 + " and [10]=" + 1 + " and [11]=" + 1+")";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            return dset.Tables[0].Rows.Count.ToString();
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "home-NOCApplications");
            return "Exception Occured";
        }
    }

    public string NoOfNOCgiven(int deptId,string from, string to)
    {
        try 
        {
            string query = "select NOC.Id from NOC INNER JOIN userLogin on userLogin.Id=NOC.Applicant_ID where (deptId=" + deptId + ") and (userLogin.Datetime>='" + from + "' and userLogin.Datetime<='" + to + "')";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            return dset.Tables[0].Rows.Count.ToString();

        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "home-NoOfNOCgiven");
            return "Exception Occured";
        }
    }
    public DataSet NoOfNOCnotGiven( int DeptId,string from,string to)
    {
        try
        {
            string query = "select  userLogin.Name,Applicant.LOC_Petrol_Pump,userLogin.Datetime,Applicant.Applicant_ID,Applicant.Oil_Company from userLogin inner join Applicant on userLogin.Id=Applicant.Applicant_ID where ( userLogin.Datetime>='" + from + "' and userLogin.Datetime<='" + to + "' and Applicant.Applicant_ID in (select NOC_View.Applicant_ID from NOC_View where NOC_View.[" + DeptId + "]=0))";
            dbConnect obj = new dbConnect();
            return obj.executeSelectStatemant(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "home-NoOfNOCnotGiven");
            return new DataSet();
        }
    }
}