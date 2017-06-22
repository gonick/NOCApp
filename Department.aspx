<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="Department" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <link rel="stylesheet" href="home/style.css" />
    <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
    <style type="text/css">
        body, td {
            color: black; /*#FFF;*/
            text-align: center;
        }

        th {
            color: white;
        }

        tr {
            cursor: pointer;
        }

        body {
            background-image: url(images/bck.jpg);
            background-repeat: repeat;
            text-align: center;
        }

        a {
            color: red;
        }

        #close {
            cursor: pointer;
        }

        #container {
            min-height: 100px;
            top: -21px;
        }

        .blur {
            display: none;
        }
        
</style>
    <style type="text/css">
        .s2 {
            display: none;
            padding: 10px;
        }

        .textDec {
            background-color: #15ce2d;
            text-decoration: none;
            padding: 10px;
            color: white;
            border-radius: 2px;
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
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        function inboxCount() {
            $.ajax({
                type: "POST",
                url: "AjaxRequests.aspx/inboxCount",
                data: '{ id:' + JSON.stringify(location.href.split("=")[1]) + '}',
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
        function load() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jsFunctions);
        }
        $(document).ready(function () {
            $('.messageAdmin').click(function (e) {
                e.preventDefault();
                $('#HiddenFieldTo').val("Admin");
                $('#replyOptions').show();
            });

            $('.accordion').accordion();
            $('.upload').click(function (e) {
                e.preventDefault();
                var id = $(this).attr('href');
                $('#LabelAppID').text(id);
                $('#HiddenField1').val(id);
                $('#black').show();
            });
            $('#close').click(function () {
                $('#black').hide();
            });
            $('.showDownload').click(function (e) {
                e.preventDefault();
                var loc = $(this).attr('href');
                $('#viewDownloadPage').show();
                $('iframe').attr('src', 'download.aspx?id=' + loc);
                $('iframe').load();
            });
            $(".fa-close").click(function () {
                $("#viewDownloadPage").slideUp();
            });
            $('.border').children().addClass('border');
            $('#LinkButtonOverview,#LinkButtonInbox').click(function () { load(); });
            //slide
            
            $(".details").accordion({
                collapsible: true,
                active: false
            });
            $(".Acc").accordion({
                collapsible: true,
                active: false
            });
            $('body').css('margin-top', '20px');

            
            //add tick
            $(".True").addClass("fa fa-check");

            // loader
            $('.b').click(function (e) {
                $this = $(this);
                var id = $(this).attr('id');
                id = id.split('-');
                id = id[1];
                var fileupload = $('.f-' + id);
                var filePath = fileupload.attr('value');
                if (filePath != '') {
                    $('.l-' + id).show();
                    $(this).trigger('click');
                    
                }
                else {
                    e.preventDefault();
                    alert('No File Selected.');
                }
            });
            //loader for upload noc
            $('#ButtonUpload').click(function (e) {
                var filePath = $('#FileUploadNOC').attr('value');
                if (filePath != '') {
                    $('#LabelLoader').show();
                    $(this).trigger('click');
                }
                else {
                    e.preventDefault();
                    alert('No File Selected.');
                }

            });

            //expand
            $('.messageH2').click(function () {
                //$('.messagesShow').slideToggle();
                var count=[];
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
                        cache:false,
                        data: '{ids:' + JSON.stringify(count) + ',table: "Messages" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { inboxCount();}
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
          
            //inbox count
            
            inboxCount();
            //rply
            $('.rply').click(function (e) {
                e.preventDefault();
                var a = $(this).attr('href');
                $('#HiddenFieldTo').val(a);
                $('#replyOptions').show();
            });
            $('.fa-close').click(function () {
                $('#replyOptions').hide();
            });
            $('#LinkButtonUploadFile').click(function (e) {
                var filepath = $('#FileUpload1').attr('value');
                if (filepath != '') {
                    $('#LabelLoaderReply').show();
                }
                else {
                    e.preventDefault();
                    alert("select a file first");
                }
            });
        });
        function jsFunctions() {
            setInterval(function () {
                inboxCount();
            }, 900000);
            
                $('.upload').click(function (e) {
                    e.preventDefault();
                    var id = $(this).attr('href');
                    $('#LabelAppID').text(id);
                    $('#HiddenField1').val(id);
                    $('#black').show();
                });
                $('#close').click(function () {
                    $('#black').hide();
                });
                $('.showDownload').click(function (e) {
                    e.preventDefault();
                    var loc = $(this).attr('href');
                    $('#viewDownloadPage').show();
                    $('iframe').attr('src', 'download.aspx?id=' + loc);
                    $('iframe').load();
                });
                $(".fa-close").click(function () {
                    $("#viewDownloadPage").slideUp();
                });
                $('.border').children().addClass('border');
                $('#LinkButtonUpdatePassword,#LinkButtonOverview').click(function () { load(); });
            //slide

                $(".details").accordion({
                    collapsible: true,
                    active: false
                });
                $(".Acc").accordion({
                    collapsible: true,
                    active: false
                });
            //add tick
                $(".True").addClass("fa fa-check");
            // loader
                $('.b').click(function (e) {
                    $this = $(this);
                    var id = $(this).attr('id');
                    id = id.split('-');
                    id = id[1];
                    var fileupload = $('.f-' + id);
                    var filePath = fileupload.attr('value');
                    if (filePath != '') {
                        $('.l-' + id).show();
                        $(this).trigger('click');

                    }
                    else {
                        e.preventDefault();
                        alert('No File Selected.');
                    }
                });

            //loader for upload noc
                $('#ButtonUpload').click(function (e) {
                    var filePath = $('#FileUploadNOC').attr('value');
                    if (filePath != '') {
                        $('#LabelLoader').show();
                        $(this).trigger('click');
                    }
                    else {
                        e.preventDefault();
                        alert('No File Selected.');
                    }

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
            //update inboxCounter on inbox button click
                $("#LinkButtonInbox").click(function () { inboxCount();});
                $('.messageAdmin').click(function (e) {
                    e.preventDefault();
                    $('#HiddenFieldTo').val("Admin");
                    $('#replyOptions').show();
                });
           
        }
    </script>
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
            color: #777777;
        }

        .decorationNone {
            color: black;
        }

        .messageContent {
            color: black;
        }
    </style>
    <style>
        #viewDownloadPage {
            display: none;
            position: fixed;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.8);
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

        .ButtonUpdatePass {
            border: none;
            font-size: 16px;
            padding: 10px 15px 10px 15px;
            background-color: #0026ff;
            color: white;
            cursor: pointer;
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
            z-index: 9999;
            position: fixed;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 35px 20px 35px;
            top: 20px;
            left: 20px;
            color: white;
            border-radius: 10px;
            animation: notification 2s ease 1 normal;
            -webkit-animation: notification 2s ease 1 normal;
            animation-fill-mode: forwards;
            animation-delay: 3s;
            -webkit-animation-delay: 3s; /* Safari and Chrome */
            -webkit-animation-fill-mode: forwards;
            font-size: 17px;
        }

        body {
            margin: 0px;
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

        .uploadfile {
            padding: 10px;
            color: white;
            text-decoration: none;
            background-color: #0094ff;
            border-radius: 2px;
        }

        .True {
            color: green;
            font-size: larger;
        }

        .LFalse {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="viewDownloadPage">
        <center>
            <div id="iframeContainer">
                <i class="fa fa-2x fa-close"></i>
                <iframe width="600" height="300" style="border:none;overflow:auto"></iframe>
            </div>
        </center>
    </section>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenFieldTextArea" ClientIDMode="Static" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:LinkButton ID="LinkButtonUpdatePassword" ClientIDMode="Static" runat="server" OnClick="LinkButtonUpdatePassword_Click"><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:20px;display:block;cursor:pointer;margin-top:-15px">
        Change Password
    </div></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonOverview" CssClass="border" ClientIDMode="Static" runat="server" OnClick="LinkButtonOverview_Click"><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:30px;display:block;cursor:pointer;margin-top:-15px">
        Overview
    </div></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonInbox" CssClass="border"  ClientIDMode="Static" runat="server" OnClick="LinkButtonInbox_Click"><div  style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:left;margin-left:30px;display:block;cursor:pointer;margin-top:-15px">
        Inbox <span class="inboxCount"></span>
    </div></asp:LinkButton>
        <i class="fa fa-at">&nbsp;<a href="" style="color:black" class="messageAdmin">Message Admin</a></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <i class="fa fa-envelope-o"></i>&nbsp;<a href='<%= "Messages.aspx?q="+getDeptName()+"&type=messages" %>' target="_blank" style="color:black">Sent Messages</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fa fa-paperclip"></i>&nbsp;<a href='<%= "Messages.aspx?q="+getDeptName()+"&type=files" %>' target="_blank" style="color:black">Sent Files</a>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><div style="background-color:#0266C8;color:white;padding:10px 15px 10px 15px;float:right;margin-right:20px;display:block;cursor:pointer;margin-top:-15px">
        Logout
    </div>
        </asp:LinkButton>
        <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
        <div id="black" style="background-color: rgba(0,0,0,0.8); width: 100%; height: 100%; top: 0px; position: fixed; z-index: 999; display: none;">
            <center>
                <div style="background-color:white;top:30%;box-shadow:0px 0px 10px 2px #ddd;padding:30px 20px 30px 20px;width:400px;color:black">
                    Applicant ID = <asp:Label ID="LabelAppID" ClientIDMode="Static" runat="server"></asp:Label><br /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ClientIDMode="Static" ControlToValidate="FileUploadNOC" ValidationGroup="up" runat="server" ForeColor="Red" Font-Size="Larger" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="FileUploadNOC" ClientIDMode="Static" runat="server"></asp:FileUpload>
                     <asp:Label runat="server" ID="LabelLoader" ClientIDMode="Static" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>
                    <br /><br /><br />
                    <asp:LinkButton ID="ButtonUpload" ClientIDMode="Static" ValidationGroup="up" OnClick="ButtonUpload_Click" runat="server" CssClass="uploadfile"><i class="fa fa-upload"></i> Upload</asp:LinkButton>
                   &nbsp;&nbsp;&nbsp;&nbsp; <a id="close">Close</a>
                </div>
            </center>
        </div>
        <h2>
            <asp:Label ID="LabelDept" runat="server" Text="Department - "></asp:Label>
        </h2>
        <div>
        </div>
       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiView1_ActiveViewChanged">

                    <asp:View ID="View1" runat="server">
                        <p style="text-align: start; font-size: 18px"><i style="margin-left: 15px">Overview:</i></p>
                        <asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemCommand="ListView1_ItemCommand">

                            <EmptyDataTemplate>
                                <center>
                                        No applicant
                                    </center>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <div class="details" style="margin: auto; width: 90%">
                                    <table style="width: 100%; margin: auto; text-align: center; border-bottom: 1px solid #ddd" cellpadding="10" cellspacing="1">
                                        <tr align="center" valign="middle">

                                            <td style="width: 105px">
                                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                            </td>
                                            <td style="width: 69px">
                                                <asp:Label ID="Applicant_IDLabel" runat="server" Text='<%# Eval("Applicant_ID") %>' />
                                            </td>
                                            <td style="width: 120px">
                                                <asp:Label ID="DateFilled" runat="server" Text='<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>' />
                                            </td>
                                            <td style="width: 190px">
                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("LOC_Petrol_Pump") %>' />
                                            </td>
                                            <td style="width: 80px">
                                                <%#Eval("Oil_Company") %>
                                            </td>
                                            <td style="width: 42px">
                                                <i class='<%#Eval(Request.QueryString["deptid"]) %>'></i>
                                            </td>
                                        </tr>
                                    </table>
                                    <section class="s2" style="background-color:#eee">
                                        <table style="width: 60%; margin: auto">
                                            <tr>
                                                <td>
                                                    <a href='<%# Eval("Applicant_Id") %>' class="showDownload">View files</a>
                                                </td>
                                                <td>
                                                    <a class="upload" href='<%#Eval("Applicant_Id") %>'>Upload NOC</a>
                                                </td>
                                                <td>
                                                    <a href='<%#"GoogleMap.aspx?q="+Eval("Applicant_Id") %>' target="_blank">View Location on Map</a>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <div style="display: inline-block; vertical-align: central; border-right: 1px solid black; margin-left: 15px; float: left; padding-right: 30px">
                                            <table>
                                                <tr>
                                                    <td>Send Message to <%# Eval("Name") %> : &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td class="add">
                                                        <asp:TextBox ID="TextBox1" ClientIDMode="AutoID" TextMode="MultiLine" Rows="9" Columns="40" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton CssClass="textDec" ID="Send" OnClientClick="fun()" CommandName="Send" CommandArgument='<%#Eval("Applicant_Id") %>' runat="server"><i class="fa fa-send"></i><span>&nbsp;Send</span></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="display: inline-block; padding-left: 15px; vertical-align: central; height: 100px;">
                                            <table>
                                                <tr>
                                                    <td>Upload a file: &nbsp;</td>
                                                    <td>
                                                        <%--<asp:FileUpload  ID="FileUpload1" runat="server" />--%>
                                                        <%-- <asp:AsyncFileUpload 
                                            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
                                            runat="server" ID="AsyncFileUpload" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional"
                                            UploadingBackColor="#CCFFFF" ThrobberID="Label3" />&nbsp;--%>
                                                        <asp:FileUpload ID="FileUpload1" CssClass='<%#"f-"+Eval("Applicant_ID").ToString() %>' ClientIDMode="AutoID" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup='<%#Eval("Applicant_ID") %>' runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                                        <asp:Label runat="server" ID="Label3" CssClass='<%#"l-"+Eval("Applicant_ID").ToString() %>' Style="display: none;"><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="padding-top: 40px">
                                                        <span id='<%#"b-"+Eval("Applicant_ID").ToString() %>' class="b">
                                                            <asp:LinkButton ID="LinkButtonUploadFile" CommandArgument='<%#Eval("Applicant_ID") %>' CommandName="Upload" ValidationGroup='<%#Eval("Applicant_ID") %>' CssClass="uploadfile" runat="server"><i class="fa fa-upload"></i><span>&nbsp;Upload</span></asp:LinkButton>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </section>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>

                                <table runat="server" style="width: 100%; margin: auto">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" style="width: 90%; margin: auto; text-align: left; background-color: #b14949; color: white!important" align="center" cellpadding="10" cellspacing="1">
                                                <tr runat="server" style="" align="center" valign="middle">
                                                    <th runat="server" style="width: 104px">Applicant</th>
                                                    <th runat="server" style="width: 72px">Applicant ID</th>
                                                    <th runat="server" style="width: 120px">Date Filed</th>
                                                    <th runat="server" style="width: 190px">Petrol Pump Address</th>
                                                    <th style="width: 80px">Oil Company</th>
                                                    <th style="width: 20px">NOC Given</th>
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
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
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
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <p style="text-align: start; font-size: 18px"><i style="margin-left: 15px">Change Password:</i></p>
                        <center>
                            <div style="padding:15px; font-size:18px">
                                <table>
                                    <tr>
                                        <td>Old Password : </td>
                                        <td><asp:TextBox ID="TextBoxOld" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxOld" ValidationGroup="update"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>New Password : </td>
                                        <td><asp:TextBox ID="TextBoxNewPass" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxNewPass" ValidationGroup="update"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>Confirm Password : </td>
                                        <td><asp:TextBox ID="TextBoxConfirmPass" TextMode="Password" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="red" Font-Size="Larger" ControlToValidate="TextBoxConfirmPass" ValidationGroup="update"></asp:RequiredFieldValidator>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ForeColor="Red" ControlToCompare="TextBoxNewPass" ControlToValidate="TextBoxConfirmPass"></asp:CompareValidator></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="ButtonUpdatePass" CssClass="ButtonUpdatePass" ValidationGroup="update" runat="server" Text="Update" OnClick="ButtonUpdatePass_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </center>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <p style="text-align: start; font-size: 18px"><i style="margin-left: 15px">Inbox:</i></p>
                        <div style="width: 80%; margin: auto">
                           <div class="Acc">
                                <h2 class="messageH2" style="background-color: #0266C8; cursor: pointer; padding: 8px; border-radius: 5px ;color:white">Messages <span style="float:right;"><i class="fa fa-caret-down"></i></span></h2>
                            <div class="messagesShow" style="display: none">
                                <asp:ListView ID="ListViewMessages" runat="server">
                                    <ItemTemplate>
                                        <div class="message" data-id='<%# Eval("Id") %>' data-seen='<%# Eval("Seen") %>' >
                                            <table style="width: 100%; margin: auto">
                                                <tr>
                                                    <td style="padding-right: 15px; text-align: left; border-right: 1px solid #ddd;">
                                                        <div class="messageContent">
                                                            <%#Eval("Message") %>
                                                        </div>
                                                        <p class="timestamp"><span style="float: left; left: 10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%# Eval("[From]").ToString() %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                                    </td>
                                                    <td style="width: 80px">
                                                        <a class="rply" style="text-decoration: none;  color: darkslategrey;font-weight: bold;" href='<%#Eval("[From]") %>'>Reply</a>
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
                            </div>
                           </div>

                            <div class="Acc">
                                <h2 class="fileH2" style="background-color: #0266C8; cursor: pointer; padding: 8px; border-radius: 5px ;color:white">Files <span style="float:right;"><i class="fa fa-caret-down"></i></span></h2>
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
                                </asp:ListView>
                                <asp:DataPager ID="DataPager2" runat="server" PageSize="20" PagedControlID="ListView1">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            </div>
                        </div>



                    </asp:View>
                </asp:MultiView>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="LinkButtonUpdatePassword" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonOverview" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonInbox" />
            </Triggers>
        </asp:UpdatePanel>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Applicant_ID], [Oil_Company], [Applicant_Name], [Address], [LOC_Petrol_Pump] FROM [Applicant] WHERE ([Complete] = @Complete)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="Complete" Type="Boolean"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>

        <%--Reply Option  --%>
        <div id="replyOptions" style="background-color: rgba(0,0,0,0.8); width: 100%; height: 100%; top: 0px; position: fixed; z-index: 999; display: none;">
            <asp:HiddenField ID="HiddenFieldTo" ClientIDMode="Static" runat="server" />
            <center>
            <div style="width:900px;height:220px;background-color:#ddd;position:fixed;left:200px;top:200px;padding-left:20px">
                <i class="fa fa-close" style="float:right;color:red;margin-right:10px;margin-top:10px;font-size:18px"></i>
                <br />
                <table style="width:100%;margin:auto;color:black">
                    <tr>
                        <td style="border-right:1px solid black;width:450px">
                            <table>
                                <tr>
                                    <td class="add" style="color:black">
                                        <center>Send Message</center>
                                        <asp:TextBox ID="TextBoxMessage"  TextMode="MultiLine" Rows="9" Columns="40" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="TextBoxMessage" ValidationGroup="send" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:LinkButton CssClass="textDec" ValidationGroup="send" ID="Send" OnClick="Send_Click"  runat="server"><i class="fa fa-send"></i><span>&nbsp;Send</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="padding-left:20px">
                             <table>
                                 <tr>
                                     <td style="color:black">
                                         <center>Upload File</center>
                                     </td>
                                 </tr>
                                <tr>
                                    <td style="color:black">
                                         <asp:FileUpload ID="FileUpload1" ClientIDMode="Static" runat="server"></asp:FileUpload>
                                         <asp:Label runat="server" ID="LabelLoaderReply" ClientIDMode="Static" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" style="padding-top:40px">
                                        <asp:LinkButton ID="LinkButtonUploadFile" ClientIDMode="Static" OnClick="LinkButtonUploadFile_Click"  CssClass="uploadfile" runat="server"><i class="fa fa-upload"></i><span>&nbsp;Upload</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
                </center>
        </div>
    </form>

</asp:Content>
