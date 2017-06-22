<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplicantNOC.aspx.cs" Inherits="ApplicantNOC" MasterPageFile="~/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <link  rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link href="home/style.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('.True').addClass("fa fa-check");
            $('.fa-close').click(function () {
                $('#black').hide();
            });
            $('.rply').click(function (e) {
                e.preventDefault();
                var a = $(this).attr('href');
                $('#HiddenFieldTo').val(a);
                $('#black').show();
            });
            $('#LinkButtonUploadFile').click(function(e){
                var filepath = $('#FileUpload1').attr('value');
                if (filepath != '') {
                    $('#LabelLoader').show();
                }
                else {
                    e.preventDefault();
                    alert("select a file first");
                }
            });
        });
    </script>
    <style>
        .rply {
            cursor:pointer;
        }
        .True {
            color:green;
            font-size:larger;
        }
        table,td {
            text-align:center;
        }
        body {
            background-image:url('images/back.jpg');
            color:white;
        }
         #container {
            min-height:100px;
            top:0px;
        }
        .blur {
            display:none;
        }
        .h,.h2 {
            font-size:18px;
        }
        a {
            color:#0094ff;
        }
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
         .textDec {
           background-color:#15ce2d;
           text-decoration:none;
           padding:10px;
           color:white;
           border-radius:2px;
        }
          .uploadfile {
            padding:10px;
            color:white;
            text-decoration:none;
            background-color:#0094ff;
            border-radius:2px;
        }
        #userUpload {
            background-color:rgba(0,0,0,0,0.8);
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
            z-index:9999;
            position: fixed;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 35px 20px 35px;
            top:20px;
            left:20px;
            color:white;
            border-radius: 10px;
            animation: notification 2s ease 1 normal;
            -webkit-animation: notification 2s ease 1 normal;
            animation-fill-mode: forwards;
            animation-delay: 3s;
            -webkit-animation-delay: 3s; /* Safari and Chrome */
            -webkit-animation-fill-mode: forwards;
            font-size:17px;
        }
               @keyframes notification{
    from {opacity :1;}
    to {opacity :0;}
}

@-webkit-keyframes notification{
    from {opacity :1;}
    to {opacity :0;}
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenFieldTo" ClientIDMode="Static" runat="server" />
           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><div style="border-bottom:3px solid #0026ff ;background-color:#0094ff;color:white;padding:10px 15px 10px 15px;float:right;margin-right:20px;display:block;cursor:pointer;margin-top:-15px">
        Logout
    </div>
    </asp:LinkButton>
       <br /><br/><br /><br/><br /><br/><br /><br/>
    <div style="position:relative;">
         
        <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            
             <table runat="server" style="width:90%;margin:auto">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" style=" width:100%;margin:auto;text-align:left" border="1" align="center" cellpadding="10" cellspacing="1">
                               
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        </LayoutTemplate>
        <ItemTemplate>
                <span class="h"><%# Eval("Applicant_Name") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="h2"> Dated: <%#Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %></span><br />
            <tr>
                <td colspan="11" style="text-align: center">NOC STATUS</td>
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
            <tr ><td colspan="11"><p style="margin:0px;border:3px dashed white"></p></td></tr>
        </ItemSeparatorTemplate>
            <EmptyDataTemplate>
               <div style="width:80%;margin:auto;font-size:18px">
                   
                   &nbsp;<b>Note:</b> Please submit your documents in the <Strong>Suvidha Center</strong>. After your documents are verified this view will be visible to you. 
               </div>
            </EmptyDataTemplate>
    </asp:ListView>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanelMessages" runat="server">
            <ContentTemplate>
                <div style="width:80%;margin:auto">
                    
                    <center><h2><asp:Label ID="Label1" runat="server" Text="Messages"></asp:Label></h2></center>
                    <br />
                    <asp:Repeater ID="Repeater1" runat="server">
                        
                        <ItemTemplate>
                            <div class="message">
                                <table>
                                    <tr>
                                        <td style="width:92%; border-right: 1px solid white; padding-right: 10px;text-align:left">
                                            <div class="messageContent">
                                                <%#Eval("Message") %>
                                            </div>
                                            <p class="timestamp"><span style="float:left;left:10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%#Eval("From") %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                        </td>
                                        <td style="width:100px">
                                            <a class="rply" style="text-decoration:none;color:white" href='<%#Eval("From") %>'>Reply</a>
                                        </td>
                                    </tr>
                                </table>
                               
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <center><h2><asp:Label ID="Label2" runat="server" Text="Files"></asp:Label></h2></center>
                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                        <ItemTemplate>
                            <div class="message-a">
                                <table>
                                    <tr>
                                        <td style="width:92%; border-right: 1px solid white; padding-right: 10px;text-align:left">
                                            <div class="messageContent">
                                                <asp:LinkButton ID="LinkButton12" CssClass="decorationNone" CommandName="attachment" CommandArgument='<%#Eval("FilePath") %>' runat="server"><i class="fa fa-paperclip"></i>&nbsp;Download Attachment </asp:LinkButton>
                                            </div>
                                            <p class="timestamp"><span style="float:left;left:10px;"><i class="fa fa-envelope-o"></i>&nbsp;<%#Eval("From") %></span><span style="float: right; right: 10px; bottom: 5px"><i class="fa fa-clock-o"></i>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongDateString() %>&nbsp;<%# Convert.ToDateTime(Eval("Datetime").ToString()).ToLongTimeString() %></span></p>
                                        </td>
                                        <td style="width:100px">
                                            <a class="rply" style="text-decoration:none;color:white" href='<%#Eval("From") %>'>Reply</a>
                                        </td>
                                    </tr>
                                </table>
                               
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div id="black" style="background-color:rgba(0,0,0,0.8);width:100%;height:100%;top:0px;position:fixed;z-index:999;display:none;">
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
                                        <asp:RequiredFieldValidator ControlToValidate="TextBoxMessage" ValidationGroup="send" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:LinkButton CssClass="textDec" ValidationGroup="send" ID="Send" OnClick="Send_Click" runat="server"><i class="fa fa-send"></i><span>&nbsp;Send</span></asp:LinkButton>
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
                                         <asp:Label runat="server" ID="LabelLoader" ClientIDMode="Static" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="2" style="padding-top:40px">
                                        <asp:LinkButton ID="LinkButtonUploadFile" ClientIDMode="Static" OnClick="LinkButtonUploadFile_Click" CssClass="uploadfile" runat="server"><i class="fa fa-upload"></i><span>&nbsp;Upload</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
                </center>
        </div>
    </div>
    </form>
</asp:Content>