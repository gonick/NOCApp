<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Receipt.aspx.cs" Inherits="Receipt" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <style>
        .div {
            width: 620px;
            border: 1px solid black;
            padding: 10px;
            margin-top: 100px;
            font-size: 18px;
        }

        span {
            padding: 10px;
            text-decoration: underline;
            font-weight: bold;
        }

        .login {
            border: none;
            margin-top: 0px;
        }

        body {
            background-image: url('images/bck.jpg');
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
            top: -100px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <div class="div">
            <p style="text-align:left">Dear Applicant,</p>
            <p style="text-align:left;padding-left:10px">
                Your application has been successfully submitted with reference no.<asp:Label ID="Label1" runat="server"></asp:Label>. You may submit your application in <b>Suwidha Centre</b> alongwith all documents in original mentioned at the time of registration within one week after the generation of this receipt.
            </p>
        </div>
        <div class="div login">
            <p><a href="Login.aspx">Login</a> to your account to check application status.</p>
        </div>
    </center>
</asp:Content>
