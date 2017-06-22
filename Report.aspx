<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="datepicker/css/bootstrap-datepicker.standalone.min.css" />
    <script src="datepicker/js/bootstrap-datepicker.min.js"></script>
    <link href="home/style.css" rel="stylesheet" />
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('.datepicker').datepicker({
                });

            });
        </script>
    <style>
        body {
            background-image:url('images/bck.jpg')
        }
        #SectionUpdate table {
            min-width:500px;
        }
            #SectionUpdate table td {
                text-align:center;
            }
        #container {
            min-height:100px;
            top:-21px;
        }
        .blur {
            display:none;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <center>
    <div style="height:500px">
        <h1>Report Section</h1>
        <table class="tableDate">
            <tr>
                <th colspan="2">
                    <h2>Select a date</h2>
                </th>
            </tr>
            <tr>
                <td>From: &nbsp;
                    <asp:TextBox ID="TextBoxFrom" data-provide="datepicker" CssClass="datepicker" runat="server"></asp:TextBox></td>
                <td>To: &nbsp;
                    <asp:TextBox ID="TextBoxTo" data-provide="datepicker" CssClass="datepicker" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    Choose Department: &nbsp;
                    <asp:DropDownList ID="DropDownListDept" runat="server" DataSourceID="SqlDataSourceDept" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [DeptName], [DeptId] FROM [Departments]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="ButtonShow" CssClass="post" runat="server" Text="Show" OnClick="ButtonShow_Click"></asp:Button>
                </td>
            </tr>
        </table>

        <section id="SectionUpdate">
            <asp:Label ID="LabelNOCgiven" runat="server"></asp:Label>
            <br /><br />
            <asp:Label ID="LabelList" runat="server"></asp:Label>
           <%-- <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"><FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

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
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
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

        </section>
    </div>
            </center>
    </form>
</asp:Content>
