using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
	public Email()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void SendEmail(string mailid,string subject,string body)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("admin@noconlinepunjab.com", "admin@noconlinepunjab.com");
            message.To.Add(new MailAddress(mailid));
            message.Subject = subject;
            message.Body = body;

            SmtpClient smtp = new SmtpClient("mail.noconlinepunjab.com");
            smtp.Credentials = new System.Net.NetworkCredential("admin@noconlinepunjab.com", "drkarthik");
            smtp.Port = 25;
            smtp.EnableSsl = false;
            smtp.Send(message);
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Email-SendEmail");
        }
    }            
}