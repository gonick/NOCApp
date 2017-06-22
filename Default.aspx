<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="home/style.css"/>
    <title>HOME</title>
    <style>
                #UpdatePanel1 {
                    max-height:300px;
                    overflow:auto;
                }
        #listviewsnap {
            padding:2px 5px 0px 5px;
            height:285px;
            overflow:auto
        }
         .notification {
            width: auto;
            display: block;
            position: fixed;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 35px 20px 35px;
            top:100px;
            left:20px;
            color:white;
            font-size:18px;
            border-radius: 10px;
            background-color: #15ce2d;
            animation: notification 0.5s ease 1 normal;
            -webkit-animation: notification 0.5s ease 1 normal;
            animation-fill-mode: forwards;
            animation-delay: 3s;
            -webkit-animation-delay: 3s; /* Safari and Chrome */
            -webkit-animation-fill-mode: forwards;
            z-index:999;
        }
        .overflow {
            overflow:auto;
            max-height:10px;
            height:10px;
        }
         @keyframes notification{
    from {opacity :1;}
    to {opacity :0;}
}

@-webkit-keyframes notification{
    from {opacity :1;}
    to {opacity :0;}
}
        .blur {
            background-image:url(home/b.jpg);
           
        }
        .post {
            padding:10px;
            border:none;
            background-color:#0266C8;
            color:white;
            cursor:pointer;
            margin-left:5px;
            margin-top:-10px;
        }
            .post:hover {
                background-color:white;
                color:#0266C8;
            }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div id="main">

            <div id="left">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                         <section id="feedbackListview">
                    <center><div id="feed">
                    <p>FEEDBACKS</p>
                </div></center>
                    <div id="listviewsnap">
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="color:white">
                                <td>
                                    <asp:Label Text='<%# Eval("Feedback") %>' runat="server" ID="FeedbackLabel" /></td>
                            </tr>
                            <tr>
                                <td> <hr /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width:100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="width:100%" border="0">
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT top 10 [Feedback] FROM [Feedbacks] ORDER BY [Datetime] DESC"></asp:SqlDataSource>
                        </div>
                </section>


                <div id="post">
                    <asp:Button ID="Button1" runat="server" ValidationGroup="post" CssClass="post" Text="Post" OnClick="Button1_Click" />
                </div>


                <div id="postfeed">
                    <asp:TextBox ID="TextBoxFeedback" TextMode="MultiLine" required="required" runat="server" CssClass="resize"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="post" ControlToValidate="TextBoxFeedback" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
               

            </div>
            
            <div id="middle">

                <p class="updatestext">LATEST UPDATES</p>
                <div id="updatesnotice" style="padding-left:40px;padding-right:45px;overflow-y:auto;max-height:290px;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" />
                        </Triggers>
                        <ContentTemplate>
                      <%--  <asp:ListView ID="ListView1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource1">
                            <edititemtemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NoticeTextBox" runat="server" Text='<%# Bind("Notice") %>' />
                                    </td>
                                </tr>
                            </edititemtemplate>
                            <emptydatatemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </emptydatatemplate>
                            <insertitemtemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NoticeTextBox" runat="server" Text='<%# Bind("Notice") %>' />
                                    </td>
                                </tr>
                            </insertitemtemplate>
                            <itemtemplate>
                                <tr style="">
                                    <td>
                                        <asp:Label ID="NoticeLabel" runat="server" Text='<%# Eval("Notice") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td><hr style="color:black;width:100%" /></td>

                                </tr>

                            </itemtemplate>
                            <layouttemplate>
                                <table runat="server" style="width:400px">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer"  runat="server" border="0" style="width:100%">
                                                
                                                <tr id="itemPlaceholder" runat="server" style="width:100%">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="">
                                            <asp:DataPager ID="DataPager1"  runat="server" PageSize="5">
                                                <Fields>
                                                    <asp:NumericPagerField />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </layouttemplate>
                            <selecteditemtemplate>
                                <tr style="">
                                    <td>
                                        <asp:Label ID="NoticeLabel" runat="server" Text='<%# Eval("Notice") %>' />
                                    </td>
                                    
                                </tr>
                            </selecteditemtemplate>
                        </asp:ListView>--%>
                            <asp:GridView ID="GridView1" PageSize="3" Width="370px" CssClass="overflow" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Red" GridLines="Horizontal" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="Notice" HeaderText="Notice" SortExpression="Notice"></asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Notice] FROM [Notices] ORDER BY [Datetime] Desc"></asp:SqlDataSource>
                            </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </div>
            </div>


            <div id="right" style="overflow: hidden; padding: 10px;">
<iframe width="500" height="400 frameborder=0"
src="https://www.youtube.com/embed/jrnAl9D2dK0?autohide=1&loop=1" frameborder="0" allowfullscreen>
</iframe>
               // <video height="400px" width="500px;" controls>
               //     <source src="testing.mp4" type="video/mp4">
              //  </video>
            </div>

            <div id="bottom">
                <a href="Citizen.aspx">
                    <div class="leftb">
                        <p>CITIZENS' CORNER</p>
                    </div>
                </a>


                <a href="Report.aspx">
                    <div class="cenb">
                        <p>REPORTS SECTION</p>

                    </div>
                </a>


                <a href="login.aspx">
                    <div class="rightb">
                        <p>STATUS CHECK</p>
                    </div>
                </a>

            </div>

        </div>


        <div id="footer">
            <p class="leftfoo">© COPYRIGHT PUSSGRC, Hoshiarpur</p>
            <p class="rightfoo">DEVELOPED BY GONICK NALWA,ANKUSH BHATIA,SACHIN SHARMA</p>
        </div>

    </div>



</form>
</asp:Content>