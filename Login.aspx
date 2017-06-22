<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <style>
        #SectionHead #container{
	float:left;
	position:relative;
	width:100%;
}

#SectionHead #header a:hover{
	text-shadow: 0 0px 10px #FFFFFF;
}

#SectionHead  #header{
	position:absolute;
	top:-200px;
	height:70px;
	width:100%;
	background-color:#333;
}
#SectionHead  #name{
	position:absolute;
	top:27px;
	width:400px;
	left:50px;
	color:#CCC;
	font-size:20px;
    font-family:'Times New Roman';
}
#SectionHead .menu{
    text-decoration:none;
    font-weight: normal;
	-moz-border-radius:10px;

	-webkit-border-radius:10px;

	position:absolute;

	height:60px;

	width:800px;

right:60px;

	left:520px;

	background-color:#0266C8;

	top:5px;

    /*width:500px;margin:0 auto;*//*Uncomment this line to make the menu center-aligned.*/

    text-align:center;

	border:0px solid black;

    font-size:0;



}

#SectionHead .menu a
{
	display: inline-block;
	padding: 15px 20px;
	color: White;
	text-decoration: none;
	line-height: 32px;
	font-size: 22px;
	font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, sans-serif;
	font-weight: normal;
    text-decoration:none;
}
    </style>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>
        .notification {
            width: auto;
            display: block;
            position: fixed;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 35px 20px 35px;
            top:80px;
            left:20px;
            color:white;
            border-radius: 10px;
            background-color: #FF0000;
            animation: notification 0.5s 1;
            -webkit-animation: notification 0.5s 1;
            animation-fill-mode: forwards;
            animation-delay: 3s;
            -webkit-animation-delay: 3s; /* Safari and Chrome */
            -webkit-animation-fill-mode: forwards;
            z-index:999;
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
    <div class="container">
         
	<section id="content" >
           <form id="form1" runat="server">
			<h1>Login Form</h1>
			<div>
				<%--<input type="text" placeholder="please enter your Email" required="" id="username" />--%>
        <asp:TextBox ID="username"  placeholder="Email ID or Username " required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="username" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>

			</div>
			<div>
				<%--<input type="password" placeholder="Please enter your Password" required="" id="password" />--%>
            <asp:TextBox TextMode="Password" ID="password" placeholder="Please enter your Password" required="" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="password" ValidationGroup="submit" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
			</div>
<h5 style="color:#0266C8">Click login to proceed</h5>
<br><br><h4>If you have not registered yet, click register<h4>
			<div>
				<%--<input type="submit" value="Log in" /--%>
                <asp:Button ID="ButtonLogin" ValidationGroup="submit" OnClick="ButtonLogin_Click" runat="server" Text="Log in" />
				<a href="Forgot-Password.aspx">Forgot password?</a>
				<a href="Register.aspx">Register</a>
			</div>

    </form>
	</section>
       <div style="display:block;float:left;position:absolute;top:250px;font-size:18px;  background-color: rgba(64,64,64,.2); margin-top:-200px; margin-right:420px;padding:10px">
                <ul style="color:#444">
                   <br> 
                        <h3 style="color:#0266C8"><i>Before you log in, you must register yourself<br>
                        </i></h3>
                    
                    <br>
                    <li>
                        Login to file application.
                    </li>
                    <li>
                        Login to check NOC status/ application status.
                    </li>

                </ul>
        </div>
</div>
</asp:Content>