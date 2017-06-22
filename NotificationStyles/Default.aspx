<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="NotificationStyles_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .tn-box {
	width: 360px;
	position: relative;
	margin: 0 auto 20px auto;
	padding: 25px 15px;
	text-align: left;
	border-radius: 5px;
    box-shadow: 
		0 1px 1px rgba(0,0,0,0.1), 
		inset 0 1px 0 rgba(255,255,255,0.6);  
	opacity: 0;
	cursor: default;
	display: none;
}

.tn-box-color-1{
	background: #ffe691;
	border: 1px solid #f6db7b;
}
@keyframes fadeOut {
	0% 	{ opacity: 0; }
	10% { opacity: 1; }
	90% { opacity: 1; transform: translateY(0px);}
	99% { opacity: 0; transform: translateY(-30px);}
	100% { opacity: 0; }
}
.tn-box.tn-box-hoverpause:hover, 
.tn-box.tn-box-hoverpause:hover .tn-progress{
	animation-play-state: paused;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    </div>
    </form>
</body>
</html>
