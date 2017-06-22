<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="datepicker/css/bootstrap-datepicker.standalone.min.css" />
    <script src="datepicker/js/bootstrap-datepicker.min.js"></script>
    <script>
        $(document).on("ready", function () {
            $(".True").addClass("fa fa-check");

            $(".showDownload").click(function (e) {
                e.preventDefault();
                var loc = $(this).attr("href");
                $("#viewDownloadPage").show();
                $("iframe").attr("src", "download.aspx?id=" + loc);
                $("iframe").load();
            });
            $(".fa-close").click(function () {
                $("#viewDownloadPage").slideUp();
            });
            $("#TextBoxDatetime,#TextBox3").datepicker("show");
            $('link[href="style1.css"]').attr('href', 'style2.css');

            $('.button').click(function () {
                var $this = $(this);
                $('.button').each(function () {
                    $(this).removeClass('border');
                });
                $this.addClass('border');
            });
            $('.accordian').accordion({
                active: false,
                collapsible: true
            });
        });
    </script>
    <script language="javascript" type="text/javascript">
        function load() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jsFunctions);
        }
        function jsFunctions() {
            $(".True").addClass("fa fa-check");
            $(".showDownload").click(function (e) {
                e.preventDefault();
                var loc = $(this).attr("href");
                $("#viewDownloadPage").show();
                $("iframe").attr("src", "download.aspx?id=" + loc);
                $("iframe").load();
            });
            $(".fa-close").click(function () {
                $("#viewDownloadPage").slideUp();
            });
            $('.button').click(function () {
                var $this = $(this);
                $('.button').each(function () {
                    $(this).removeClass('border');
                });
                $this.addClass('border');

            });
            $('.accordian').accordion({
                active: false,
                collapsible: true
            });
        }
    </script>
    <title></title>
    <style>
        .accordian {
            width: 80%;
            padding: 2px;
        }

        .red {
            background-color: #FF0000;
        }

        .green {
            background-color: #15ce2d;
        }

        .notification {
            width: auto;
            display: block;
            position: fixed;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 35px 20px 35px;
            top: 20px;
            left: 20px;
            color: white;
            border-radius: 10px;
            animation: notification 0.5s ease 1 normal;
            -webkit-animation: notification 0.5s ease 1 normal;
            animation-fill-mode: forwards;
            animation-delay: 3s;
            -webkit-animation-delay: 3s; /* Safari and Chrome */
            -webkit-animation-fill-mode: forwards;
            font-size: 16px;
        }

        @keyframes notification {
            from {
                opacity: 1;
            }

            to {
                opacity: 0;
            }
        }

        @-webkit-keyframes notification {
            from {
                opacity: 1;
            }

            to {
                opacity: 0;
            }
        }
    </style>
    <style type="text/css">
        body {
            color: black; /*#FFF;*/
            text-align: center;
        }

        td, th {
            text-align: center;
        }

        body {
            background-image: url(images/bck.jpg);
            text-align: center;
        }

        table {
            width: 95%;
            margin: auto;
        }

            table td {
                max-width: 20px;
                min-width: 20px;
                font-size: 17px;
            }

        .True {
            color: green;
            font-size: larger;
        }

        .LFalse {
            display: none;
        }

        a {
            color: #0094ff;
        }

        #viewDownloadPage {
            display: none;
            position: fixed;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.8);
            z-index:99999;
        }

        #iframeContainer {
            top: 20px;
            width: 620px;
            position: relative;
            background-color: white;
        }

            #iframeContainer i {
                position: fixed;
                top: 30px;
                color: #ff006e;
                cursor: pointer;
            }

        #GridViewFeedbacks td, #GridViewNotices td {
            color: black;
        }

            #GridViewFeedbacks td:nth-child(2n+1) {
                width: 80%;
            }

            #GridViewNotices td:first-child {
                width: 70%;
            }

        .button {
            border: none;
            padding: 10px 15px 10px 15px;
            background-color: #b14949;
            color: white;
            cursor: pointer;
            text-decoration: none;
            font-size: larger;
            margin-right: 30px;
            border: 1px solid #b14949;
        }

            .button i {
                font-size: x-large;
                color: white;
            }

        .border {
            position: relative;
        }

            .border:after {
                position: absolute;
                content: '';
                border-right: 10px solid transparent;
                border-left: 10px solid transparent;
                border-bottom: 10px solid transparent;
                border-top: 10px solid #823537;
                bottom: -21px;
                left: -1px;
            }

        .reminder {
            background-color: #419f41;
            color: white;
            padding: 5px 10px 5px 10px;
        }

            .reminder i {
                color: white !important;
            }

        i {
            color: #b14949;
            padding: 2px;
           
        }

        .ButtonUpdatePass {
            border: none;
            padding: 10px 15px 10px 15px;
            text-decoration: none;
            color: white;
            background-color: #419f41;
        }

            .ButtonUpdatePass i {
                color: white !important;
            }

        .applicationQueue {
            float: right;
            margin-right: 50px;
        }

        .authorize {
            border: none;
            background-color: #b14949;
            color: white;
            padding: 5px 8px 5px 8px;
            cursor: pointer;
        }

        #ApplicationGridViewContainer table {
            width: 100%;
            margin: auto;
            text-align: center;
            border: none;
            border-color: transparent;
            border-bottom: 1px solid #ddd !important;
        }

            #ApplicationGridViewContainer table tr:first-child {
                background-color: #b14949;
                color: white !important;
            }

        #assignDepartments {
            width: 75%;
            min-height: 60%;
            max-height: 80%;
            margin: auto;
            background-color: white;
            box-shadow: 0px 0px 10px 1px #A79696;
            padding: 10px;
            border-radius: 5px;
            display: none;
            position: fixed;
            top: 10%;
            left: 12.5%;
            right: 12.5%;
            overflow: auto;
        }

        .fa-close {
            cursor: pointer;
        }
         .inboxCount1 {
                color: #0266C8;
    background-color: white;
    padding: 1px 5px 1px 3px;
    border-radius: 100%;
    font-weight: bold;
    /*margin-left: 5px;*/

        }
    </style>
    <style>
        .fa-close {
            cursor: pointer;
        }

        .message {
            padding: 12px;
            border-radius: 4px;
            border: 2px solid #2CC185;
            margin-bottom: 8px;
        }

        .message-a {
            padding: 12px;
            border-radius: 4px;
            border: 2px solid green;
            margin-bottom: 8px;
        }

        .timestamp {
            font-size: 14px;
            color: #777777!important;
        }
        .timestamp i {
            color: #777777!important;
        }

        .decorationNone {
            color: black;
        }

        .messageContent {
            color: black;
        }
    </style>
    <script>
        function inboxCount() {
            $.ajax({
                type: "POST",
                url: "AjaxRequests.aspx/inboxCountAdmin",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    data = JSON.stringify(data);
                    data = JSON.parse(data);
                    if (data.d >= 0)
                        $('.inboxCount').html("&nbsp;<span class='inboxCount1'>" + data.d + "</span>");
                },
                dataType: "json"
            });
        }
        var $this;
        $(document).ready(function () {
                setInterval(function () {
                    inboxCount();
                }, 900000);
                inboxCount();
            $('.authorize').click(function (e) {
                e.preventDefault();
                $this = $(this);
                $("#deptNoti").text("");
                $("#assignDepartments").show();
                $("#applicantName").text($($this).attr("data-name"));
            });

            $(".Acc").accordion({
                collapsible: true,
                active: false
            });

            //expand
            $('.messageH2').click(function () {
                // $('.messagesShow').slideToggle();
                var count = [];
                var $messages = $(".messagesShow .message");
                $messages.each(function (index, element) {
                    if ($(element).attr("data-seen") == "False") {
                        count.push($(element).attr("data-id"));
                        $(element).attr("data-seen", "Processed");
                    }
                });
                if (count != '') {
                    $.ajax({
                        type: "POST",
                        url: "AjaxRequests.aspx/updateSeen",
                        cache: false,
                        data: '{ids:' + JSON.stringify(count) + ',table: "Messages" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { inboxCount(); }
                    });
                }
            });
            $('.fileH2').click(function () {
                // $('.filesShow').slideToggle();
                var count = [];
                var $messages = $(".filesShow .message");
                $messages.each(function (index, element) {
                    if ($(element).attr("data-seen") == "False") {
                        count.push($(element).attr("data-id"));
                        $(element).attr("data-seen", "Processed");
                    }
                });
                if (count != '') {
                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: "AjaxRequests.aspx/updateSeen",
                        data: '{ids:' + JSON.stringify(count) + ',table: "Files" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { inboxCount(); }
                    });

                }
            });
        });
        function closePopup() {
            $("#assignDepartments").hide();
        }
        function finishAssigningDepartments()
        {
            var array = [];
            for (var i = 1; i <= 11; i++)
            {
                var value = $("#DropDownListDept" + i).val();
                if (array.indexOf(value) == -1)
                    array.push(value);
                else
                {
                    $("#deptNoti").text("Please select different departments for each field");
                    break;
                }
            }
            $($this).unbind('click').click();
        }
       
    </script>
</head>
<body onload="load()">

    <section id="viewDownloadPage">
        <center>
            <div id="iframeContainer">
                <i class="fa fa-2x fa-close"></i>
                <iframe width="600" height="300" style="border:none;overflow:auto"></iframe>
            </div>
        </center>
    </section>
    <form id="form1" runat="server">
        <p style="text-align: center">
            <h1>Admin Panel</h1>
        </p>
        <asp:LinkButton ID="LinkButtonOverview" OnClick="LinkButtonOverview_Click" ClientIDMode="Static" runat="server" ><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:20px;display:block;cursor:pointer;margin-top:-15px">
        Overview
    </div></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonApplicationQueue" OnClick="LinkButtonApplicationQueue_Click" ClientIDMode="Static" runat="server" ><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:30px;display:block;cursor:pointer;margin-top:-15px">
        Application Queue
    </div></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonInbox" OnClick="LinkButtonInbox_Click" OnClientClick="inboxCount" ClientIDMode="Static" runat="server" ><div  style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:30px;display:block;cursor:pointer;margin-top:-15px">
        Inbox <span class="inboxCount"></span>
    </div></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonLogout" OnClick="LinkButtonLogout_Click" runat="server"><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:right;margin-right:20px;display:block;cursor:pointer;margin-top:-15px">
        Logout
    </div>
        </asp:LinkButton>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="accordian" style="display: inline-block;">
                                <h2 style="cursor: pointer; text-align: left; border-bottom: 2px solid #419f41;"><i class="fa fa-send-o"></i>Send Reminder</h2>
                                <div style="width: 100%; border: 1px solid green; padding: 10px">
                                    <div style="display: inline-block; border-right: 1px solid white; padding: 5px; width: 45%; margin-left: 0px;">
                                        <table style="float: left; text-align: left">
                                            <tr>
                                                <td style="text-align: left; width: 80px">To:</td>
                                                <td style="text-align: left">
                                                    <asp:DropDownList ID="DropDownListDeptList1" runat="server" DataSourceID="SqlDataSourceDDL" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSourceDDL" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ProviderName="System.Data.SqlClient" SelectCommand="SELECT [DeptId], [DeptName] FROM [Departments]"></asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                    <td style="text-align:left;width:80px">Subject:</td>
                                    <td style="text-align:left">
                                        <asp:TextBox ID="TextBoxSubject" Width="300" Height="25" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBoxSubject" ValidationGroup="message" runat="server" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>--%>
                                            <tr>
                                                <td style="text-align: left; width: 80px">Message:</td>
                                                <td style="text-align: left">
                                                    <asp:TextBox ID="TextBoxMessage" TextMode="MultiLine" Rows="10" Columns="40" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBoxMessage" ValidationGroup="message" runat="server" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:LinkButton ID="LinkButtonMessageReminder" ValidationGroup="message" OnClick="LinkButtonMessageReminder_Click" CssClass="reminder" runat="server"><i class="fa fa-send"></i>SEND REMINDER</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="display: inline-block; line-height: 70px; padding: 5px; width: 50%; top: 0px; vertical-align: top">

                                        <table>
                                            <tr>
                                                <td style="width: 60px">For:</td>
                                                <td>
                                                    <label for="select">Applicant Id:</label>
                                                    <asp:TextBox ID="TextBoxAppID" Width="50" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="rem" runat="server" ControlToValidate="TextBoxAppID" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 60px">To:</td>
                                                <td>
                                                    <label for="select2">Department</label>:
                                        <asp:DropDownList ID="DropDownListDeptList" runat="server" DataSourceID="SqlDataSourceDDL" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:LinkButton ID="LinkButtonSendReminder" ValidationGroup="rem" OnClick="LinkButtonSendReminder_Click" CssClass="reminder" runat="server"><i class="fa fa-send"></i>SEND REMINDER</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <p>&nbsp;</p>
                <asp:LinkButton ID="ButtonDashboard" runat="server" CssClass="button border" OnClick="ButtonDashboard_Click"><i class="fa fa-coffee"></i> Dashboard</asp:LinkButton>
                <asp:LinkButton ID="ButtonFeedback" runat="server" CssClass="button" OnClick="ButtonFeedback_Click"><i class="fa fa-comments"></i> Feedbacks</asp:LinkButton>
                <asp:LinkButton ID="ButtonNotices" runat="server" CssClass="button" OnClick="ButtonNotices_Click"><i class="fa fa-list-alt"></i> Notices</asp:LinkButton>
                <asp:LinkButton ID="ButtonDepartments" runat="server" CssClass="button" OnClick="ButtonDepartments_Click"><i class="fa fa-group"></i> Manage Departments</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonChangePassword" runat="server" CssClass="button" OnClick="LinkButtonChangePassword_Click"><i class="fa fa-key"></i> Change Password</asp:LinkButton>
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="LabelNoti" runat="server" Text=""></asp:Label>
                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                            <asp:View ID="view3" runat="server">
                                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                                <asp:ListView ID="ListView1" runat="server">
                                    <LayoutTemplate>
                                        <table runat="server" style="width: 90%; margin: auto;">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="itemPlaceholderContainer" runat="server" style="width: 100%; margin: auto; text-align: left" border="1" align="center" cellpadding="10" cellspacing="1">

                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="">
                                                    <asp:DataPager ID="DataPager1"  PagedControlID="ListView1" runat="server" PageSize="1" OnPreRender="DataPager1_PreRender">
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
                                    <ItemTemplate>
                                        <tr align="center" valign="middle">
                                            <td>Applicant Id</td>
                                            <td colspan="2">Date Filed</td>
                                            <td colspan="2">Applicant Name</td>
                                            <td colspan="1">Mobile No</td>
                                            <td colspan="2">Email Id</td>
                                            <td colspan="2">Petrol Pump Location</td>
                                            <td colspan="1">Documents </td>
                                        </tr>
                                        <tr>
                                            <td><%# Eval("Applicant_ID") %></td>
                                            <td colspan="2"><%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %></td>
                                            <td width="158" colspan="2"><%# Eval("Applicant_Name") %></td>
                                            <td width="117" colspan="1"><%# Eval("Contact") %></td>
                                            <td width="155" colspan="2"><%# Eval("Username") %></td>
                                            <td colspan="2"><%#Eval("LOC_Petrol_Pump") %></td>
                                            <td width="149" colspan="1" style="color: #FFF">
                                                <p><a href='<%#Eval("Applicant_ID") %>' class="showDownload">VIEW DOCUMENTS</a></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="11" style="text-align: center">
                                                <center>NOC STATUS</center>
                                                <span style="float: right; margin-right: 35px; margin-top: -20px; cursor: pointer"><a target="_blank" href='<%#"GoogleMap.aspx?q="+Eval("Applicant_ID") %>'>View on Google Map</a></span></td>
                                        </tr>
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

                                    </ItemTemplate>
                                    <ItemSeparatorTemplate>
                                        <tr>
                                            <td colspan="11">
                                                <p style="margin: 0px; border: 3px dashed white"></p>
                                            </td>
                                        </tr>
                                    </ItemSeparatorTemplate>
                                </asp:ListView>
                                <%--<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ProviderName="System.Data.SqlClient" SelectCommand="SELECT n.Id, n.Applicant_ID, n.[1], n.[2], n.[3], n.[4], n.[5], n.[6], n.[7], n.[8], n.[9], n.[10], n.[11], userLogin.Datetime,userLogin.Username,Applicant.LOC_Petrol_Pump ,Applicant.Applicant_Name as Name, userLogin.Contact, userLogin.Id AS Expr1 FROM NOC_View AS n INNER JOIN userLogin ON userLogin.Id = n.Applicant_ID  inner join Applicant on Applicant.Applicant_ID=userLogin.Id order by userLOgin.Datetime desc"></asp:SqlDataSource>--%>
                            </asp:View>
                            <asp:View ID="view4" runat="server">
                                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                                <asp:GridView ID="GridViewFeedbacks" runat="server" AutoGenerateColumns="False" PageSize="10" DataSourceID="SqlDataSourceFeedbacks" AllowPaging="True" AllowSorting="True" BackColor="white" BorderColor="#CCCCCC" ForeColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                    <Columns>
                                        <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback"></asp:BoundField>
                                        <asp:BoundField DataField="Datetime" HeaderText="Datetime" SortExpression="Datetime"></asp:BoundField>
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceFeedbacks" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Feedback], [Datetime] FROM [Feedbacks] ORDER BY [Datetime] DESC"></asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View5" runat="server">
                                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                                <asp:GridView ID="GridViewNotices" OnRowCommand="GridViewNotices_RowCommand" PageSize="10" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataSourceID="SqlDataSourceNotices" AllowPaging="True" AllowSorting="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Notice" SortExpression="Notice">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="7" Columns="30" runat="server" Text='<%# Bind("Notice") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Notice") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBoxNotice" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxDatetime" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Datetime" SortExpression="Datetime">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Datetime")%>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToDateTime(Eval("Datetime")).ToLongDateString() %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBoxDatetime" data-provide="datepicker" ClientIDMode="Static" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxDatetime" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:LinkButton ID="LinkButtonInsert" runat="server" CausesValidation="true" ValidationGroup="insert" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                            </FooterTemplate>
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

                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceNotices" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Notice], [Datetime], [Id] FROM [Notices] ORDER BY [Datetime] DESC" DeleteCommand="DELETE FROM [Notices] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Notices] ([Notice], [Datetime]) VALUES (@Notice, @Datetime)" UpdateCommand="UPDATE [Notices] SET [Notice] = @Notice, [Datetime] = @Datetime WHERE [Id] = @Id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Notice" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Datetime" Type="DateTime"></asp:Parameter>
                                        <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View6" runat="server">
                                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                                <asp:GridView ID="GridViewDepts" runat="server" OnRowDeleting="GridViewDepts_RowDeleting" AutoGenerateColumns="False" DataKeyNames="DeptId" DataSourceID="SqlDataSourceDepts" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                        <asp:BoundField DataField="DeptId" HeaderText="DeptId" ReadOnly="True" ControlStyle-Width="10" ItemStyle-Width="10" InsertVisible="False" SortExpression="DeptId"></asp:BoundField>
                                        <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName"></asp:BoundField>
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                                        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact"></asp:BoundField>
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
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
                                <asp:SqlDataSource ID="SqlDataSourceDepts" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [DeptId], [DeptName], [Address], [Contact], [Email] FROM [Departments]" DeleteCommand="" InsertCommand="INSERT INTO [Departments] ([DeptName], [Address], [Contact], [Email]) VALUES (@DeptName, @Address, @Contact, @Email)" UpdateCommand="UPDATE [Departments] SET [DeptName] = @DeptName, [Address] = @Address, [Contact] = @Contact, [Email] = @Email WHERE [DeptId] = @DeptId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="DeptId" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DeptName" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Contact" Type="Int64"></asp:Parameter>
                                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DeptName" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Contact" Type="Int64"></asp:Parameter>
                                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="DeptId" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View7" runat="server">
                                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                                <center>
                            <div style="padding:15px; font-size:18px;width:600px;">
                                <table>
                                    <tr>
                                        <td style="text-align:right;">Old Password : </td>
                                        <td><asp:TextBox ID="TextBoxOld" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td style="text-align:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxOld" ValidationGroup="update"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;">New Password : </td>
                                        <td><asp:TextBox ID="TextBoxNewPass" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td style="text-align:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxNewPass" ValidationGroup="update"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right;">Confirm Password : </td>
                                        <td><asp:TextBox ID="TextBoxConfirmPass" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td style="text-align:left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxConfirmPass" ValidationGroup="update"></asp:RequiredFieldValidator>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="padding-bottom:5px"><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ForeColor="Red" ControlToCompare="TextBoxNewPass" ControlToValidate="TextBoxConfirmPass"></asp:CompareValidator></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align:center">
                                            <asp:LinkButton ID="ButtonUpdatePass" CssClass="ButtonUpdatePass" ValidationGroup="update" runat="server" OnClick="ButtonUpdatePass_Click"><i class="fa fa-lock"></i> Change Password</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </center>
                            </asp:View>
                        </asp:MultiView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ButtonDashboard" />
                        <asp:AsyncPostBackTrigger ControlID="ButtonFeedback"></asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="ButtonNotices"></asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="ButtonDepartments"></asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="LinkButtonChangePassword" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ButtonFeedback" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ButtonNotices" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                <h2 style="color: #b14949">Application Status</h2>
                <asp:Label ID="LabelApplicantStatus" runat="server" Text=""></asp:Label>
                <div id="ApplicationGridViewContainer" style="width: 90%; margin: auto">
                    <asp:GridView ID="GridView1" PageSize="20" runat="server" OnRowCommand="GridView1_RowCommand" CellPadding="10" CellSpacing="1" BorderStyle="None" BorderWidth="0px" border AlternatingRowStyle-BorderStyle="None" AlternatingRowStyle-BorderWidth="0" EditRowStyle-BorderStyle="None" FooterStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" RowStyle-BorderStyle="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BorderStyle="None" BorderWidth="0px" />
                        <Columns>
                            <asp:TemplateField HeaderText="Authorize">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" data-id='<%# Eval("Applicant_ID") %>' data-name='<%# Eval("Name") %>' CommandArgument='<%# Eval("Applicant_ID") %>' CommandName="Authorize" CssClass="authorize" Text="Authorize" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <%#Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Applicant ID">
                                <ItemTemplate>
                                    <%#Eval("Applicant_ID") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Filed">
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("Date Filed").ToString()).ToLongDateString() %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Oil Company">
                                <ItemTemplate>
                                    <%#Eval("Oil COmpany") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate >
                            <center>
                                No pending application
                            </center>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <div id="assignDepartments">
                    <i class="fa fa-close" onclick="closePopup()" style="float: right"></i>
                    <h2 style="color: #b14949">Assign Departments to <span id="applicantName"></span></h2>
                    <div style="width: 100%">
                        <table cellpadding="12">
                            <tr>
                                <td>Dept 1 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept1" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td>Dept 2 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept2" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td>Dept 3 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept3" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Dept 4 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept4" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td>Dept 5 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept5" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList></td>
                                <td>Dept 6 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept6" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Dept 7 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept7" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td>Dept 8 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept8" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td>Dept 9 &nbsp; :
                                    <asp:DropDownList ID="DropDownListDept9" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Dept 10 :
                                    <asp:DropDownList ID="DropDownListDept10" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList></td>
                                <td>
                                    Dept 11 :
                                    <asp:DropDownList ID="DropDownListDept11" runat="server" DataSourceID="SqlDataSourceDepartments" DataTextField="DeptName" DataValueField="DeptId"></asp:DropDownList>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <br />
                        <center><span id="finishAssigningDepartments" onclick="finishAssigningDepartments()" style="padding:7px 10px 7px 10px;background-color:#b14949;color:white;cursor:pointer">Done</span></center>
                        <br />
                        <span id="deptNoti"></span>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSourceDepartments" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [DeptName], [DeptId] FROM [Departments]"></asp:SqlDataSource>
                </div>
            </asp:View>
            <asp:View ID="View8" runat="server">
                <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
                 <p style="text-align: start; font-size: 18px"><i style="margin-left: 15px">Inbox:</i></p>
                        <div style="width: 80%; margin: auto">
                           <div class="Acc">
                                <h2 class="messageH2" style="background-color: #0266C8; cursor: pointer; padding: 8px; border-radius: 5px ;color:white">Messages <span style="float:right;"><i class="fa fa-caret-down" style="color:white!important"></i></span></h2>
                            <div class="messagesShow" style="display: none;height:auto">
                                <asp:ListView ID="ListViewMessages" runat="server">
                                    <ItemTemplate>
                                        <div class="message" data-id='<%# Eval("Id") %>' data-seen='<%# Eval("Seen") %>' >
                                            <table style="width: 100%; margin: auto">
                                                <tr>
                                                    <td style="padding-right: 15px; text-align: left; border-right: 1px solid #ddd;">
                                                        <div class="messageContent">
                                                            <%#Eval("Message") %>
                                                        </div>
                                                        <p class="timestamp"><span style="float: left; left: 10px;"><i class="fa fa-envelope-o"></i> <%# Eval("[From]").ToString() %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i> <%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                                    </td>
                                                    <td style="width: 80px">
                                                        <a class="rply" style="text-decoration: none;  color: darkslategrey;font-weight: bold;" href='<%#Eval("[From]") %>'>Reply</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                   No messages
            </EmptyDataTemplate>
                                </asp:ListView>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="ListViewMessages">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                           </div>

                            <div class="Acc">
                                <h2 class="fileH2" style="background-color: #0266C8; cursor: pointer; padding: 8px; border-radius: 5px ;color:white">Files <span style="float:right;"><i class="fa fa-caret-down" style="color:white!important"></i></span></h2>
                            <div class="filesShow" style="display: none">
                                <asp:ListView ID="ListViewFiles" runat="server" OnItemCommand="ListViewFiles_ItemCommand">
                                    <ItemTemplate>
                                        <div class="message"  data-id='<%# Eval("Id") %>' data-seen='<%# Eval("Seen") %>'>
                                            <table style="width: 100%; margin: auto">
                                                <tr>
                                                    <td style="padding-right: 15px; text-align: left; border-right: 1px solid #ddd;">
                                                        <div class="messageContent">
                                                            <asp:LinkButton ID="LinkButton12" CssClass="decorationNone" CommandName="attachment" CommandArgument='<%#Eval("FilePath") %>' runat="server"><i class="fa fa-paperclip"></i>&nbsp;Download Attachment </asp:LinkButton>
                                                        </div>
                                                        <p class="timestamp"><span style="float: left; left: 10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%# Eval("[From]").ToString() %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                                    </td>
                                                    <td style="width: 80px">
                                                        <a class="rply" style="text-decoration: none; color: darkslategray;font-weight:bold" href='<%#Eval("[From]") %>'>Reply</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        No files
                                    </EmptyDataTemplate>
                                </asp:ListView>
                                <asp:DataPager ID="DataPager2" runat="server" PageSize="20" PagedControlID="ListViewFiles">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            </div>
                        </div>



            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
