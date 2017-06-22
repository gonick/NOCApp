using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
/// <summary>
/// Summary description for writeException
/// </summary>
public class writeException
{
	public writeException()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void WriteExceptionToFile(Exception ex, string functionName)
    {
        string filePath = HttpContext.Current.Server.MapPath("~/Error.txt");

        using (StreamWriter writer = new StreamWriter(filePath, true))
        {
            writer.WriteLine("Function Name: " + functionName + " <br/>" + Environment.NewLine + "Message :" + ex.Message + "<br/>" + Environment.NewLine + "StackTrace :" + ex.StackTrace +
               "" + Environment.NewLine + "Date :" + DateTime.Now.ToString());
            writer.WriteLine(Environment.NewLine + "-----------------------------------------------------------------------------" + Environment.NewLine);
        }
    }
}