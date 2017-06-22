using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for Applicant
/// </summary>
public class ApplicantReg
{
    private string username;
    private int applicantID;
    public int ApplicantID
    {
        set { applicantID = value; }
        get { return applicantID; }
    }
    public string Username
    {
        set { username = value; }
        get { return username; }
    }
	public ApplicantReg()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string insertApplicantId()
    {
        try
        {
            string query = "insert into Applicant(Applicant_ID) Values(" + ApplicantID + ")";
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-insertApplicantId");
            return "Exception Occured";
        }
    }

    public DataSet retrieveData()
    {
        try 
        {
            string query = "select Id from userLogin where Username='" + Username + "'";
            dbConnect obj = new dbConnect();
            DataSet dset = obj.executeSelectStatemant(query);
            if (dset.Tables[0].Rows.Count > 0)
            {
                ApplicantID = Convert.ToInt32(dset.Tables[0].Rows[0]["Id"]);
                string query2 = "select * from Applicant where Applicant_ID=" + Convert.ToInt32(dset.Tables[0].Rows[0]["Id"]);
                return obj.executeSelectStatemant(query2);
            }
            else
            {
                throw new Exception();
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-retrieveData");
            return new DataSet();
        }
    }
    public DataSet retrieveData(int id)
    {
        try
        {
            string query2 = "select * from Applicant where Applicant_ID=" + id;
            dbConnect obj = new dbConnect();
            return obj.executeSelectStatemant(query2);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-retrieveData");
            return new DataSet();
        }
    }
    public string saveAffidavit(string affi)
    {
        try 
        {
            string query = "update Applicant set Affidavit='"+affi+"' where Applicant_ID="+ApplicantID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveAffidavit");
            return "Exception Occured";
        }
    }
    public string saveSitePlan(string site)
    {
        try
        {
            string query = "update Applicant set Site_Plan='" + site + "' where Applicant_ID=" + ApplicantID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveSitePlan");
            return "Exception Occured";
        }
    }
    public string saveSajra(string sajra)
    {
        try
        {
            string query = "update Applicant set Aks_Sajra='" + sajra + "' where Applicant_ID=" + ApplicantID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveSajra");
            return "Exception Occured";
        }
    }
    public string saveLOE(string LOE)
    {
        try
        {
            string query = "update Applicant set Letter_of_Entitlement='" + LOE + "' where Applicant_ID=" + ApplicantID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveLOE");
            return "Exception Occured";
        }
    }
    public string saveFard(string fard)
    {
        try
        {
            string query = "update Applicant set Fard='" + fard + "' where Applicant_ID=" + ApplicantID;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveFard");
            return "Exception Occured";
        }
    }
    public DataSet viewNOC_Status(int id)
    {
        try
        {
            string query = "SELECT n.Id, n.Applicant_ID, n.[1], n.[2], n.[3], n.[4], n.[5], n.[6], n.[7], n.[8], n.[9], n.[10], n.[11], userLogin.Username, userLogin.Name,userLogin.Datetime, userLogin.Contact, userLogin.Id AS Expr1 FROM NOC_View AS n INNER JOIN userLogin ON userLogin.Id = n.Applicant_ID AND userLogin.Id =" + id;
            dbConnect obj = new dbConnect();
            return obj.executeSelectStatemant(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveFard");
            return new DataSet();
        }
    }
    public string addAppIDtoNOC_View(int appid)
    {
        try
        {
            string query = "insert into NOC_View(Applicant_ID) Values(" + appid + ")";
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveFard");
            return "Exception Occured";
        }
    }
    public DataSet applicationComplete()
    {
        string query = "select Complete from Applicant where Applicant_ID=" + applicantID;
        dbConnect obj = new dbConnect();
        return obj.executeSelectStatemant(query);
    }
    public string saveData(string oilCompany,string applicantName,string swd,string address,string subdivision,string district,string loc,int app)
    {
         try
        {
            string query = "update Applicant set Oil_Company ='" + oilCompany + "',Applicant_Name='" + applicantName + "',SWD='" + swd + "',Address='" + address + "',Sub_Division='" + subdivision + "',District='" + district + "',LOC_Petrol_Pump='" + loc + "' where Applicant_ID=" + app;
            dbConnect obj = new dbConnect();
            return obj.executeNonQuery(query);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant-saveData");
            return "Exception Occured";
        }
    }
}