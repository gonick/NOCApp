using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for dbConnect
/// </summary>
public class dbConnect
{
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataReader sdr;
    private SqlDataAdapter sda;
    private DataSet dset;
	public dbConnect()
	{
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
		//
		// TODO: Add constructor logic here
		//
	}
    public string executeNonQuery(string query)
    {
        try 
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = System.Data.CommandType.Text;
            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return rowsAffected.ToString();
        }
        catch (Exception ex)
        {
            if (ex.Message.Contains("UNIQUE KEY") || ex.Message.Contains("unique key"))
                return "Unique Key";
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "dbConnect-executeNonQuery");
            con.Close();
            return "Exception Occured";
        }
    }
    public bool validate(string query)
    {
        try
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;
            cmd.CommandType = System.Data.CommandType.Text;
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "dbConnect-validate");
            con.Close();
            return false;
        }
    }

    public DataSet executeSelectStatemant(string query)
    {
        try
        {
            cmd = new SqlCommand(query, con);
            sda = new SqlDataAdapter(cmd);
            dset = new DataSet();
            sda.Fill(dset);
            return dset;
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "dbConnect-executeSelectStatement");
            return dset;
        }
    }
}