using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonShow_Click(object sender, EventArgs e)
    {
        home obj = new home();
        LabelNOCgiven.Text = "NOC given : " + obj.NoOfNOCgiven(Convert.ToInt32(DropDownListDept.SelectedValue), TextBoxFrom.Text, TextBoxTo.Text);

        DataSet dset = obj.NoOfNOCnotGiven(Convert.ToInt32(DropDownListDept.SelectedValue), TextBoxFrom.Text, TextBoxTo.Text);
        LabelNOCgiven.Text += "&nbsp;&nbsp;&nbsp;&nbsp; Pending NOC: " + dset.Tables[0].Rows.Count;
        ListView1.DataSource = dset;
        ListView1.DataBind();
        if (dset.Tables[0].Rows.Count > 0)
        {
            LabelList.Text = "List of pending NOC's";
            LabelList.ForeColor = System.Drawing.Color.Red;
            LabelList.Font.Size = 16;
        }
    }
    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        home obj = new home();
        DataSet dset = obj.NoOfNOCnotGiven(Convert.ToInt32(DropDownListDept.SelectedValue), TextBoxFrom.Text, TextBoxTo.Text);
        //GridView1.DataSource = dset;
        //GridView1.DataBind();
        ListView1.DataSource = dset;
        ListView1.DataBind();
    }
    
}