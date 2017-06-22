<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Citizen.aspx.cs" Inherits="Citizen" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="datepicker/css/bootstrap-datepicker.standalone.min.css" />
    <script src="datepicker/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
  <%-- <link rel="stylesheet" href="home/style.css" />--%>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('.datepicker').datepicker({
                });
                $('.details').accordion({
                    active: false,
                    collapsible:true

                });
                $(".True").addClass("fa fa-check");
                $(".False").text("Pending")//.addClass("fa fa-minus");
            });
        </script>
    <style>
        .True {
            color:#15ce2d;
            font-size:larger;
        }
        .False {
            color:#ff0000;
            font-size:larger;
        }
        #container{
	float:left;
	position:relative;
	min-height:100px;
	width:100%;
	margin-top:0px;
}

        body {
            padding:0px;
            margin:0px;
            top:-10px;
            background-image:url('images/bck.jpg')
        }

#header a:hover{
	text-shadow: 0 0px 10px #FFFFFF;
}

#header{
	position:absolute;
	top:-21px;
	height:70px;
	width:100%;
	background-color:#333;
    font-weight:normal;

}
#name{
	position:absolute;
	top:7px;
	width:400px;
	left:50px;
	color:#CCC;
	font-size:20px;
    font-weight: normal;
}
/*.menu{
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	position:absolute;
	height:60px;
	width:800px;
	right:20px;
	left:620px;
	background-color:#63534C;
	top:5px;
    //width:500px;margin:0 auto;Uncomment this line to make the menu center-aligned.
    text-align:center;
	border:0px solid black;
    font-size:0;

}*/
.menu{
    text-decoration:none;
    font-weight: normal;
	-moz-border-radius:10px;

	-webkit-border-radius:10px;

	position:absolute;

	height:60px;

	width:800px;

right:60px;

	left:560px;

	background-color:#0266C8;

	top:5px;

    /*width:500px;margin:0 auto;*//*Uncomment this line to make the menu center-aligned.*/

    text-align:center;

	border:0px solid black;

    font-size:0;



}

.menu a
{
	display: inline-block;
	padding: 15px 20px;
	color: White;
	text-decoration: none;
	line-height: 32px;
	font-size: 22px;
	font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, sans-serif;
	font-weight: normal;
}
  
    </style>
    <style>
        #updatePanel table {
            width:500px;
        }
             
     .post {
            padding:10px 15px 10px 15px;
            border:none;
            background-color:#15ce2d;
            color:white;
            cursor:pointer;
            border-bottom:3px solid #4c9a22
        }
            .post:hover {
                background-color:white;
                color:#4c9a22;
            }

        .details .clr td  {
            border:2px solid #b14949;
        }
        .noc {
            border:2px solid #b14949;
        }
        .noc table td{
            border:1px solid white
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server" style=""><center>
        <div style="top:0px;margin-top:0px;min-height:400px;z-index:9999;">
            
            <h1>Citizens' Corner</h1>
            <table class="tableDate">
                <tr>
                    <th colspan="2"><h2>Select a date</h2></th>
                </tr>
                <tr>
                    <td>From: &nbsp; <asp:TextBox ID="TextBoxFrom" data-provide="datepicker" CssClass="datepicker" runat="server" ></asp:TextBox></td>
                    <td>To: &nbsp; <asp:TextBox ID="TextBoxTo" data-provide="datepicker" CssClass="datepicker" runat="server" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="ButtonShow" CssClass="post" runat="server" Text="Show" OnClick="ButtonShow_Click"></asp:Button>
                    </td>
                </tr>
            </table>
                       <%-- <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False"  AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="15">

                        <Columns>
                            <asp:TemplateField HeaderText="Applicant Name" SortExpression="Name">
   <ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("Name") %>' id="Label1"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Petrol Pump Location" SortExpression="Location">
<ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("Location") %>' id="Label2"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Filed" SortExpression="Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>' id="Label1"></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>

</Columns>
<FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

<PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

<RowStyle ForeColor="#000066"></RowStyle>

<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

<SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
</asp:GridView>--%>
                
             <asp:ListView ID="ListView1" runat="server"  OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
           
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
          
            <ItemTemplate>
                <div class="details" style="margin:auto;width:90%">
                    <table class="clr" style="width: 100%; margin: auto; text-align: center;cursor:pointer"cellpadding="10">
                        <tr align="center" valign="middle" title="Click to show">

                            <td style="width:105px">
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Applicant_Name") %>' />
                            </td>
                            <%--<td style="width:69px">
                                <asp:Label ID="Applicant_IDLabel" runat="server" Text='<%# Eval("Applicant_ID") %>' />
                            </td>--%>
                            <td style="width:120px">
                                <asp:Label ID="DateFilled" runat="server" Text='<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>' />
                            </td>
                            <td style="width:190px">
                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("LOC_Petrol_Pump") %>' />
                            </td>
                            <td style="width:80px">
                                <%#Eval("Oil_Company") %>
                            </td>
                           
                        </tr>
                    </table>
                    <section class="s2" style="border:0px 1px 1px 1px solid black;background-color:#ddd;">
                       
                        <div style="vertical-align:central;padding:15px; text-align:center;">
                            <center>
                                <span style="padding:10px; background-color:#15ce2d; color:white;border-radius:2px">NOC Status</span>
                            </center>
                            <span style="float:right;margin-right:35px;margin-top:-20px;cursor:pointer"><a target="_blank" href='<%#"GoogleMap.aspx?q="+Eval("Applicant_ID") %>'>View Location on Google Map</a></span>
                            <br />
                           <table class="noc" cellspaceing="0" style="text-decoration:none;">
                                           <tr>
                                            <td>
                                                <label>
                                                   <%# getDeptName(Convert.ToInt32(Eval("[1]"))) %>
                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                     <%# getDeptName(Convert.ToInt32(Eval("[2]"))) %>
                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[3]"))) %>
                                                    </label>
                                            </td>
                                            <td>
                                                <label>
                                                     <%# getDeptName(Convert.ToInt32(Eval("[4]"))) %>

                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[5]"))) %></label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[6]"))) %>
                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[7]"))) %></label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[8]"))) %></label>
                                            </td>
                                            <td>
                                                <label>
                                                    <%# getDeptName(Convert.ToInt32(Eval("[9]"))) %></label>
                                            </td>
                                            <td>
                                                <label>
                                                     <%# getDeptName(Convert.ToInt32(Eval("[10]"))) %></label>
                                            </td>
                                            <td>
                                                <label>
                                                     <%# getDeptName(Convert.ToInt32(Eval("[11]"))) %></label>
                                            </td>


                                        </tr>
                                       <tr>
                                            <td>
                                                <span class='<%#NocStatus(Eval("[1]").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("1").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("1").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("[2]").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("2").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("2").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>

                                            <td>
                                                <span class='<%#NocStatus(Eval("3").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("3").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("3").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("4").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("4").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("4").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("5").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("5").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("5").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("6").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("6").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("6").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("7").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("7").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("7").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("8").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("8").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("8").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("9").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("9").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("9").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("10").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("10").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("10").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                            <td>
                                                <span class='<%#NocStatus(Eval("11").ToString(),Convert.ToInt32(Eval("Applicant_ID"))) %>' title='<%# getDatetime(Eval("11").ToString(),Eval("Applicant_ID").ToString(),NocStatus(Eval("11").ToString(),Convert.ToInt32(Eval("Applicant_ID"))).ToString()) %>'></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("1").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton1" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[1]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("2").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[2]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("3").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton3" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[3]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("4").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton4" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[4]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("5").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton5" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[5]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("6").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton6" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[6]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("7").ToString(),Convert.ToInt32(Eval("Applicant_ID"))))%>' ID="LinkButton7" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[7]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("8").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton8" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[8]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server"  Visible='<%#Convert.ToBoolean(NocStatus(Eval("9").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton9" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[9]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server" Visible='<%#Convert.ToBoolean(NocStatus(Eval("10").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton10" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[10]") %>' OnClick="download"></asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton runat="server"  Visible='<%#Convert.ToBoolean(NocStatus(Eval("11").ToString(),Convert.ToInt32(Eval("Applicant_ID")))) %>' ID="LinkButton11" Text="Download NOC" CommandArgument='<%#Eval("Applicant_ID")+"-"+Eval("[11]") %>' OnClick="download"></asp:LinkButton></td>
                                        </tr>
                           </table>
                            <br />
                       </div>
                               
                    </section>
                </div>
            </ItemTemplate>
            <LayoutTemplate>

                <table runat="server" style="width:100%;margin:auto">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" style=" width:90%;margin:auto;text-align:left;border:2px solid #b14949" align="center" cellpadding="10">
                                <tr runat="server" style=" background-color:#b14949;color:white" align="center" valign="middle">
                                    <th runat="server" style="width:104px;">Applicant</th>
                                    <%--<th runat="server" style="width:72px">Applicant ID</th>--%>
                                    <th runat="server" style="width:120px">Date Filed</th>
                                    <th runat="server" style="width:190px">Petrol Pump Location</th>
                                    <th style="width:80px">Oil Company</th>
                                    <%--<th style="width:20px">NOC Given</th>--%>
                                   <%-- <th>Files</th>
                                    <th>Upload</th>--%>

                                </tr>
                              
                            </table>
                        </td>
                    </tr>
                    </table>
                <div id="itemPlaceholder" runat="server">
                   
                </div>
                <table>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="15">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>

            </LayoutTemplate>
     
        </asp:ListView>
                   <br />
                        <asp:Label ID="appReceived" runat="server"></asp:Label>     
        
        </div>
        </center>
    </form>
</asp:Content>
