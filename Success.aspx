<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" MasterPageFile="~/MasterPage.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <script type="text/javascript">
                // When the document is ready
                $(document).ready(function () {

                    $('.datepicker').datepicker({
                    });

                });
        </script>
    <style>
        
        #container{
	float:left;
	position:relative;
	min-height:100px;
	width:100%;
	margin-top:0px;
}

        body {
            padding:0px;
            margin:0px;
            background-image:url('images/bck.jpg')
        }

#header a:hover{
	text-shadow: 0 0px 10px #FFFFFF;
}

#header{
	position:absolute;
	top:0px;
	height:70px;
	width:100%;
	background-color:#333;
    font-weight:normal;

}
#name{
	position:absolute;
	top:7px;
	width:400px;
	left:50px;
	color:#CCC;
	font-size:20px;
    font-weight: normal;
}
/*.menu{
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	position:absolute;
	height:60px;
	width:800px;
	right:20px;
	left:620px;
	background-color:#63534C;
	top:5px;
    //width:500px;margin:0 auto;Uncomment this line to make the menu center-aligned.
    text-align:center;
	border:0px solid black;
    font-size:0;

}*/
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
    <center><div>
        <br />
    <h2>Registeration Successful!</h2>
        <p>Please <a href="Login.aspx">Login</a> to file your application.</p>
    </div>
        </center>
</asp:Content>
