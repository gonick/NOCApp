<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<meta charset="utf-8">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="style.css" />
    <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="home/style.css" />
    <style>
             #container{
	float:left;
	position:relative;
	min-height:100px;
	width:100%;
	margin-top:0px;
}

#header a:hover{
	text-shadow: 0 0px 10px #FFFFFF;
}

#header{
	position:absolute;
	top:-200px;
	height:70px;
	width:100%;
	background-color:#333;
}
#name{
	position:absolute;
	top:27px;
	width:400px;
	left:50px;
	color:#CCC;
	font-size:20px;
    font-family:'Times New Roman';

}
.menu{
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	position:absolute;
	height:60px;
	width:800px;
	right:20px;
	left:520px;
	background-color:#0266C8;
	top:5px;
    /*width:500px;margin:0 auto;*//*Uncomment this line to make the menu center-aligned.*/
    text-align:center;
	border:0px solid black;
    font-size:0;

}
        h1 {
            margin-top:-50px;
            top:-50px;
            position:relative;
            height:10px;
        }
        h1:before {
            margin-top:62px;
            margin-left:-18px;
        }
        h1:after {
            margin-top:63px;
            margin-right:-18px;
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

/*::-webkit-input-placeholder::before {
            font-family:'FontAwesome';
            color:#777;
            font-size:18px;
            padding-right:15px;
            padding-left:10px;
        }
::-moz-placeholder::before  { font-family: fontAwesome;  color: #69f } /* firefox 19+ */
/*:-ms-input-placeholder::before  { font-family: fontAwesome; color: #69f } /* ie */
/*input:-moz-placeholder::before  { font-family: fontAwesome;  color: #69f }
        .name ::-webkit-input-placeholder::before{
            content:'\f007';
        }
        .name ::-moz-placeholder::before{
            content:'\f007';
        }
        .name :-ms-input-placeholder::before{
            content:'\f007';
        }*/
        .fa {
            color:#808080;
        }
        .fa-mobile-phone {
            color:#808080;
            font-size:x-large;
        }
        
    </style>
    <SCRIPT language="Javascript">
       <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
    </SCRIPT>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<section id="content">

		<form runat="server">
			<h1>Registration Form</h1>
			<div class="name">
                <i class="fa fa-user"></i>
                <asp:TextBox ID="TextBoxName"  placeholder="Name" required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxName" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
			</div>
			<div>
                <i class="fa fa-mobile-phone"></i>
                <asp:TextBox ID="TextBoxContact" placeholder="Contact Number" onkeypress="return isNumberKey(event)" MaxLength="10" required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxContact" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
			</div>
						
			<div>
                <i class="fa fa-envelope-o"></i>
                <asp:TextBox ID="TextBoxEmail" placeholder="Email Address" required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBoxEmail" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
			</div>
			<%--<div>
                    <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>
				<input type="text" placeholder="Username" required="" id="username" />

			</div>--%>
			<div>
                <i class="fa fa-key"></i>
                <asp:TextBox ID="TextBoxPassword" placeholder="Password" required="" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBoxPassword" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
			</div>
			<div>
                <i class="fa fa-key"></i>
                        <asp:TextBox ID="TextBoxConfirmPass" TextMode="Password" placeholder="Confirm Password" required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBoxConfirmPass" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TextBoxConfirmPass" ControlToCompare="TextBoxPassword" runat="server" ErrorMessage="Password Does not match" ValidationGroup="submit" ForeColor="Red" Font-Size="Larger"></asp:CompareValidator>
			</div>
			<div>
				<asp:Button ID="ButtonSubmit" ValidationGroup="submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
				<a href="Login.aspx">Login?			</a></div>
		</form>
       
	</section>
    
</asp:Content>
