<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css"/>
    <style>
        .message {
            padding:12px;
            border-radius:4px;
            border:2px solid green;
            margin-bottom:8px;
        }
         .message-a {
            padding:12px;
            border-radius:4px;
            border:2px solid green;
            margin-bottom:8px;
        }
        .timestamp {
            background-color:red;
            font-size:14px;
            text-decoration:wavy;
            color:#bbb7b7;
        }
        .decorationNone {
            color:white;
        }
        .messageContent {
            color:white;
        }
    </style>
</head>
<body style="background-image:url('images/back.jpg')">
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div style="width: 70%; margin: auto; color: white">
                    <center><h2>Sent Messages</h2></center>
                    <br />
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="message">
                                <table style="width: 98%; margin: auto">
                                    <tr>
                                        <td style="padding-right: 10px; text-align: left">
                                            <div class="messageContent">
                                                <%#Eval("Message") %>
                                            </div>
                                            <p class="timestamp"><span style="float: left; left: 10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%# GetName(Eval("To").ToString()) %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="ListView1">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Message], [To], [Datetime] FROM [Messages] WHERE ([From] = @From) ORDER BY [Datetime] DESC, [To]">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="q" Name="From" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="width: 70%; margin: auto; color: white">
                    <center><h2>Sent Files</h2></center>
                    <br />
                    <asp:ListView ID="ListView2" OnItemCommand="ListView2_ItemCommand" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="message">
                                <table style="width: 98%; margin: auto">
                                    <tr>
                                        <td style="padding-right: 10px; text-align: left">
                                            <div class="messageContent">
                                                <asp:LinkButton ID="LinkButton12" CssClass="decorationNone" CommandName="attachment" CommandArgument='<%#Eval("FilePath") %>' runat="server"><i class="fa fa-paperclip"></i>&nbsp;Download Attachment </asp:LinkButton>
                                            </div>
                                            <p class="timestamp"><span style="float: left; left: 10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%# GetName(Eval("To").ToString()) %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager2" runat="server" PageSize="20" PagedControlID="ListView2">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [From], [To], [Datetime], [FilePath] FROM [Files] WHERE ([From] = @From) ORDER BY [Datetime] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="q" Name="From" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
