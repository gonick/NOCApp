using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GoogleMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["q"];
        string query = "select Applicant_Name,MapZoom,GoogleMap,MapCenter from Applicant where Applicant_ID=" + id;
        dbConnect db = new dbConnect();
        DataSet dset=db.executeSelectStatemant(query);
        if(!dset.HasErrors && dset.Tables[0].Rows.Count>0)
        {
            HiddenCenter.Value = dset.Tables[0].Rows[0]["MapCenter"].ToString();
            HiddenZoom.Value = dset.Tables[0].Rows[0]["MapZoom"].ToString();
            HiddenMap.Value = dset.Tables[0].Rows[0]["GoogleMap"].ToString();
            LabelName.Text = dset.Tables[0].Rows[0]["Applicant_Name"].ToString();
            if (HiddenCenter.Value == "" || HiddenZoom.Value == "" || HiddenMap.Value == "")
            {
                Response.Write("<div class='notification red'>Sorry, " + LabelName.Text + " has not marked the location on map.</div>");
            }
            HiddenMap.DataBind();
            HiddenZoom.DataBind();
            HiddenCenter.DataBind();
        }

    }
}