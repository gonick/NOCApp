using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using AjaxControlToolkit;
public partial class Applicant : System.Web.UI.Page
{
    public static int applicantID;
    public static string affidavit, aks, loe, site, fard, gmap = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == null)
        {
            Session["noti"] = "Session Timed out";
            Response.Redirect("Default.aspx");
        }
        //AsyncFileUpload1.UploaderStyle = AjaxControlToolkit.AsyncFileUpload.UploaderStyleEnum.Modern;
        AsyncFileUpload1.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedComplete);
        AsyncFileUpload1.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedFileError);
        AsyncFileUploadFard.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadFard_UploadedComplete);
        AsyncFileUploadFard.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedFileError);
        AsyncFileUploadAks.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadAks_UploadedComplete);
        AsyncFileUploadAks.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedFileError);
        AsyncFileUploadSite.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadSite_UploadedComplete);
        AsyncFileUploadSite.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedFileError);
        AsyncFileUploadAffi.UploadedComplete += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUploadAffi_UploadedComplete);
        AsyncFileUploadAffi.UploadedFileError += new EventHandler<AsyncFileUploadEventArgs>(AsyncFileUpload1_UploadedFileError);
        if (!IsPostBack)
        {
            if (Session["type"]!=null && Session["type"].ToString() == "1" )
            {
                ApplicantReg obj = new ApplicantReg();
                obj.Username = Session["unm"].ToString();
                DataSet dset = obj.retrieveData();
                applicantID = obj.ApplicantID;
                if (!phase1(obj))
                {
                    loadData(dset);
                }
                else
                {
                    Session["appID"] = applicantID;
                    Response.Redirect("ApplicantNOC.aspx");
                }
            }
            else
            {
                Session["noti"] = "Session Timed out";
                Response.Redirect("Default.aspx");
            }
        }
    }
    protected bool phase1(ApplicantReg obj)
    {
        obj.ApplicantID = applicantID;
        DataSet dset = obj.applicationComplete();
        if (dset.Tables[0].Rows.Count > 0)
        {
            return Convert.ToBoolean(dset.Tables[0].Rows[0]["Complete"].ToString());
        }
        return false;
    }
    protected void loadData(DataSet dset)
    {
        
        if (dset.Tables[0].Rows.Count > 0)
        {
            TextBoxOliCompany.Text = dset.Tables[0].Rows[0]["Oil_Company"].ToString();
            TextBoxApplicant_Name.Text = dset.Tables[0].Rows[0]["Applicant_Name"].ToString();
            TextBoxSWD.Text = dset.Tables[0].Rows[0]["SWD"].ToString();
            TextBoxAddress.Text = dset.Tables[0].Rows[0]["Address"].ToString();
            //DropDownListSubDivision.SelectedValue = Convert.ToInt32(dset.Tables[0].Rows[0]["Sub_Division"]).ToString();
            //DropDownListDistrict.SelectedValue = Convert.ToInt32(dset.Tables[0].Rows[0]["District"]).ToString();
            TextBoxLOCPetrolPump.Text = dset.Tables[0].Rows[0]["LOC_Petrol_Pump"].ToString();
            if (dset.Tables[0].Rows[0]["Affidavit"] != null && dset.Tables[0].Rows[0]["Affidavit"].ToString() != "")
            {
                LabelAff.CssClass = "fa fa-check";
               // LinkButtonAffidavit.Text = "Upload Again";
                affidavit = dset.Tables[0].Rows[0]["Affidavit"].ToString();
            }
            if (dset.Tables[0].Rows[0]["Aks_Sajra"] != null && dset.Tables[0].Rows[0]["Aks_Sajra"].ToString() != "")
            {
                LabelAks.CssClass = "fa fa-check";
                //LinkButtonAksSajra.Text = "Upload Again";
                aks = dset.Tables[0].Rows[0]["Aks_Sajra"].ToString();
            }
            if (dset.Tables[0].Rows[0]["Letter_of_Entitlement"] != null && dset.Tables[0].Rows[0]["Letter_of_Entitlement"].ToString()!="")
            {
                LabelLOE.CssClass = "fa fa-check";
                //LinkButtonLetterOfEnt.Text = "Upload Again";
                loe = dset.Tables[0].Rows[0]["Letter_of_Entitlement"].ToString();
            }
            if (dset.Tables[0].Rows[0]["Site_Plan"] != null && dset.Tables[0].Rows[0]["Site_Plan"].ToString() != "")
            {
                LabelSite.CssClass = "fa fa-check";
                //LinkButtonSitePlan.Text = "Upload Again";
                site = dset.Tables[0].Rows[0]["Site_Plan"].ToString();
            }
            if (dset.Tables[0].Rows[0]["Fard"] != null && dset.Tables[0].Rows[0]["Fard"].ToString() != "")
            {
                LabelFard.CssClass = "fa fa-check";
                //LinkButtonFard.Text = "Upload Again";
                fard = dset.Tables[0].Rows[0]["Fard"].ToString();
            }
            if (dset.Tables[0].Rows[0]["GoogleMap"] != null && dset.Tables[0].Rows[0]["GoogleMap"].ToString() != "")
            {
                LabeMapCheck.CssClass = "fa fa-check";
                //LinkButtonAksSajra.Text = "Upload Again";
                gmap = dset.Tables[0].Rows[0]["GoogleMap"].ToString();
            }
        }
        else
        {
            Response.Write("<script>No Data Retrieved</script>");
        }
    }
    void AsyncFileUploadAffi_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        if (AsyncFileUploadAffi.HasFile)
        {
            string extension = Path.GetExtension(AsyncFileUploadAffi.PostedFile.FileName);
            string filename = "Applicant-" + applicantID + "-Affidavit" + extension;
            string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (affidavit != null)
                File.Delete(Server.MapPath(affidavit));
            AsyncFileUploadAffi.SaveAs(path + "/" + filename);
            ApplicantReg obj = new ApplicantReg();
            obj.ApplicantID = applicantID;
            obj.saveAffidavit("Applicant_Data/applicant-" + applicantID + "/" + filename);
            DataSet dset = obj.retrieveData(applicantID);
            loadData(dset);
        }
    }
     void AsyncFileUploadSite_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        if (AsyncFileUploadSite.HasFile)
        {
            string extension = Path.GetExtension(AsyncFileUploadSite.PostedFile.FileName);
            string filename = "Applicant-" + applicantID + "-Site Plan" + extension;
            string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (site != null)
                File.Delete(Server.MapPath(site));
            AsyncFileUploadSite.SaveAs(path + "/" + filename);
            ApplicantReg obj = new ApplicantReg();
            obj.ApplicantID = applicantID;
            obj.saveSitePlan("Applicant_Data/applicant-" + applicantID + "/" + filename);
            DataSet dset = obj.retrieveData(applicantID);
            loadData(dset);
        }
    }
    void AsyncFileUploadAks_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        if (AsyncFileUploadAks.HasFile)
        {
            string extension = Path.GetExtension(AsyncFileUploadAks.PostedFile.FileName);
            string filename = "Applicant-" + applicantID + "-Aks Sajra" + extension;
            string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (aks != null)
                File.Delete(Server.MapPath(aks));
            AsyncFileUploadAks.SaveAs(path + "/" + filename);
            ApplicantReg obj = new ApplicantReg();
            obj.ApplicantID = applicantID;
            obj.saveSajra("Applicant_Data/applicant-" + applicantID + "/" + filename);
            DataSet dset = obj.retrieveData(applicantID);
            loadData(dset);
        }
    }
    //protected void LinkButtonLetterOfEnt_Click(object sender, EventArgs e)
    //{
    //    if (FileUploadLetterOfEnt.HasFile)
    //    {
    //        string extension = Path.GetExtension(FileUploadLetterOfEnt.PostedFile.FileName);
    //        string filename = "Applicant-" + applicantID + "-Letter Of Entitlement" + extension;
    //        string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
    //        if (!Directory.Exists(path))
    //        {
    //            Directory.CreateDirectory(path);
    //        }
    //        if (loe != null)
    //            File.Delete(Server.MapPath(loe));
    //        FileUploadLetterOfEnt.SaveAs(path + "/" + filename);
    //        ApplicantReg obj = new ApplicantReg();
    //        obj.ApplicantID = applicantID;
    //        obj.saveLOE("Applicant_Data/applicant-" + applicantID + "/" + filename);
    //        DataSet dset = obj.retrieveData(applicantID);
    //        loadData(dset);
    //    }
    //}
    void AsyncFileUploadFard_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        if (AsyncFileUploadFard.HasFile)
        {
            string extension = Path.GetExtension(AsyncFileUploadFard.PostedFile.FileName);
            string filename = "Applicant-" + applicantID + "-Fard" + extension;
            string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (fard != null)
                File.Delete(Server.MapPath(fard));
            AsyncFileUploadFard.SaveAs(path + "/" + filename);
            ApplicantReg obj = new ApplicantReg();
            obj.ApplicantID = applicantID;
            obj.saveFard("Applicant_Data/applicant-" + applicantID + "/" + filename);
            DataSet dset = obj.retrieveData(applicantID);
            loadData(dset);
        }
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            ApplicantReg obj = new ApplicantReg();
            DataSet dset = obj.retrieveData(applicantID);
            if (dset.Tables[0].Rows[0]["Affidavit"].ToString().Length > 1 && dset.Tables[0].Rows[0]["Aks_Sajra"].ToString().Length > 1 && dset.Tables[0].Rows[0]["Letter_of_Entitlement"].ToString().Length > 1 && dset.Tables[0].Rows[0]["Site_Plan"].ToString().Length > 1 && dset.Tables[0].Rows[0]["Fard"].ToString().Length > 1)
            {
                //string oilCompany = TextBoxOliCompany.Text.Trim();
                //string applicantName = TextBoxApplicant_Name.Text.Trim();
                //string temp = null;
                //if (RadioButtonSO.Checked == true)
                //    temp = "S/o";
                //else if (RadioButtonWO.Checked == true)
                //    temp = "W/o";
                //else
                //    temp = "D/o";
                //string swd = temp + " " + TextBoxSWD.Text.Trim();
                //string address = TextBoxAddress.Text.Trim();
                //string subdivision = DropDownListSubDivision.SelectedItem.ToString();
                //string district = DropDownListDistrict.SelectedItem.ToString();
                //string loc = TextBoxLOCPetrolPump.Text.Trim();
                //ApplicantReg obj = new ApplicantReg();
                //string result = obj.saveData(oilCompany, applicantName, swd, address, subdivision, district, loc,applicantID);
                //if (result == "Exception Occured")
                //    Response.Write("<script>alert(" + result + ")</script>");
                //else if (Convert.ToInt32(result) > 0)
                //{
                //    result = obj.addAppIDtoNOC_View(applicantID);
                //    if (result.Contains("Occured"))
                //    {
                //        Response.Write("<script>alert(" + result + ")</script>");
                //    }
                //    else
                //        Response.Redirect("Receipt.aspx?r=" + applicantID);
                //}
                //else
                //    Response.Write("<script>alert('error occured!')</script>");

                string query = "update Applicant set Complete=1 where Applicant_ID=" + applicantID;
                dbConnect d = new dbConnect();
                string result = d.executeNonQuery(query);
                if (result.Contains("Occured"))
                {
                    Response.Write("<script>alert(" + result + ")</script>");
                }
                else if(Convert.ToInt32(result)>0)
                {
                    result = obj.addAppIDtoNOC_View(applicantID);
                    if (result.Contains("Occured"))
                    {
                        Response.Write("<script>alert(" + result + ")</script>");
                    }
                    else
                    {
                        Email em = new Email();
                        em.SendEmail(Session["unm"].ToString(), "Success", "Dear Applicant, \r\n We have successfully received your application. Your reference number is " + applicantID + " You may submit your application in Suwidha Centre along with all original documents mentioned at the time of registration within one week after the generation of this receipt.");
                        Response.Redirect("Receipt.aspx?r=" + applicantID, false);
                    }
                }
            }
            else
                Response.Write("<script>alert(\"Please upload all the documents\")</script>");
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant.aspx.cs=ButtonSubmit_Click");
        }
    }

    void AsyncFileUpload1_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "size", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Uploaded size: " + AsyncFileUpload1.FileBytes.Length.ToString() + "';", true);

        // Uncomment to save to AsyncFileUpload\Uploads folder.
        // ASP.NET must have the necessary permissions to write to the file system.
        string extension = Path.GetExtension(AsyncFileUpload1.PostedFile.FileName);
        string filename = "Applicant-" + applicantID + "-Letter Of Entitlement" + extension;
        string path = Server.MapPath("/Applicant_Data/applicant-" + applicantID);
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        if (loe != null)
            File.Delete(Server.MapPath(loe));
        AsyncFileUpload1.SaveAs(path + "/" + filename);
        ApplicantReg obj = new ApplicantReg();
        obj.ApplicantID = applicantID;
        obj.saveLOE("Applicant_Data/applicant-" + applicantID + "/" + filename);
        DataSet dset = obj.retrieveData(applicantID);
        loadData(dset);
        //string savePath = MapPath("Uploads/" + Path.GetFileName(e.filename));
        //AsyncFileUpload1.SaveAs(savePath);
    }

    void AsyncFileUpload1_UploadedFileError(object sender, AsyncFileUploadEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "error", "top.$get(\"" + uploadResult.ClientID + "\").innerHTML = 'Error: " + e.statusMessage + "';", true);
    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        string oilCompany = TextBoxOliCompany.Text.Trim();
        string applicantName = TextBoxApplicant_Name.Text.Trim();
        string temp = null;
        if (RadioButtonSO.Checked == true)
            temp = "S/o";
        else if (RadioButtonWO.Checked == true)
            temp = "W/o";
        else
            temp = "D/o";
        string swd;
        if (TextBoxSWD.Text.Trim().Contains("S/o") || TextBoxSWD.Text.Trim().Contains("W/o") || TextBoxSWD.Text.Trim().Contains("D/o"))
        {
            swd = TextBoxSWD.Text.Trim();
        }
        else
        {
            swd = temp + " " + TextBoxSWD.Text.Trim();
        }
        string address = TextBoxAddress.Text.Trim();
        string subdivision = DropDownListSubDivision.SelectedItem.ToString();
        string district = DropDownListDistrict.SelectedItem.ToString();
        string loc = TextBoxLOCPetrolPump.Text.Trim();
        ApplicantReg obj = new ApplicantReg();
        string result = obj.saveData(oilCompany, applicantName, swd, address, subdivision, district, loc, applicantID);
        if (result == "Exception Occured")
            Response.Write("<script>alert(" + result + ")</script>");
        else if (Convert.ToInt32(result) > 0)
        {
            //result = obj.addAppIDtoNOC_View(applicantID);
            //if (result.Contains("Occured"))
            //{
            //    Response.Write("<script>alert(" + result + ")</script>");
            //}
            //else
                MultiView1.ActiveViewIndex = 1;
        }
        else
            Response.Write("<script>alert('error occured!')</script>");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["noti"] = "You have successfully logged out!";
        Response.Redirect("Default.aspx");
    }
    protected void save_encoded_Click(object sender, EventArgs e)
    {
        string map = HiddenMap.Value;
        string mapCenter = HiddenCenter.Value;
        string mapZoom = HiddenZoom.Value;
        try
        {
            if (map != "")
            {
                string query = "update Applicant set GoogleMap='" + map + "', MapCenter='" + mapCenter + "' , MapZoom='" + mapZoom + "' where Applicant_ID=" + applicantID;
                dbConnect obj = new dbConnect();
                string result = obj.executeNonQuery(query);
                if (!result.Contains("Occured"))
                {
                    Response.Write("<div class='notification green'>Success</div>");
                }
                else
                {
                    Response.Write("<div class='notification red'>" + result + "</div>");
                    throw new Exception("Could not save maps");
                }
            }
            else
            {
                Response.Write("<div class='notification red'>No Data</div>");
            }
        }
        catch (Exception ex)
        {
            writeException obj = new writeException();
            obj.WriteExceptionToFile(ex, "Applicant.aspx.cs-save_encoded_Click");
        }
    }
  
}