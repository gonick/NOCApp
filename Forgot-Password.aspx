<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forgot-Password.aspx.cs" Inherits="Forgot_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
        

        body {
            background-image: url('images/bck.jpg');
            font-size:18px
        }

        #container {
            float: left;
            position: relative;
            min-height: 100px;
            width: 100%;
            margin-top: 0px;
        }

        body {
            padding: 0px;
            margin: 0px;
        }

        #header a:hover {
            text-shadow: 0 0px 10px #FFFFFF;
        }

        #header {
            position: absolute;
            top: 0px;
            height: 70px;
            width: 100%;
            background-color: #333;
        }

        #name {
            position: absolute;
            top: 7px;
            width: 400px;
            left: 50px;
            color: #CCC;
            font-size: 20px;
        }

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
    .resetPassword {
        border:none;
        padding:15px;
        color:white;
        background-color:#419f41;
        border-radius:4px;
font-size:16px;
cursor:pointer;
    }
    </style>
    <style>
        input[type='text'] {
    width: 200px;
    height: 22px;
    border-radius: 3px;
    border: 1px solid #ddd;
    box-shadow: 0px 0px 5px 0px #eee inset;
    padding-left: 5px;
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
        body {
            margin:0px;
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
    <form runat="server" id="Form12">
        <center>
        <section id="sectionForgot">
            <table>
                <tr>
                    <td>
                        Username or Email id : 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxUsername" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile Number : 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxMobile" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxMobile" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            
            
            <br />
            <asp:Button ID="ButtonResetPassword" runat="server" CssClass="resetPassword" OnClick="ButtonResetPassword_Click" Text="Reset Password"></asp:Button>
        </section>
    </center>
    </form>
</asp:Content>

