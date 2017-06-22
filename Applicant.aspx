<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Applicant.aspx.cs" Inherits="Applicant" MasterPageFile="~/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta charset="utf-8">
<title>Application Form</title>
    <%--<link rel="stylesheet" href="home/style.css" />--%>
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
            top:0px;
            background-image:url('images/bck.jpg');
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
    text-decoration:none;
}
#SectionHead #name{
	position:absolute;
	top:7px;
	width:400px;
	left:50px;
	color:#CCC;
	font-size:20px;
    font-weight: normal;
    font-family:'Times New Roman';
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
}
  
    </style>

    <script src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.min.css" />
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCucgFZxOmnSdNOfNIVIbRypwZ8Jk2UMKg&libraries=drawing"
  type="text/javascript"></script>
    <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing"></script>--%>
   
    <style>
        html, body
  {
      padding: 0;
      margin: 0;
      height: 100%;
  }
  .map{height:450px;}
    </style>
    <style>
        table td {
            padding:0px 20px 0px 20px;
        }
        .hidden {
            display:none;
        }
        .fa {
            color:#18b43d;
        }
        .uploading {
            color:red;
            display:normal;
        }
        input[type="text"] {
            padding:10px;
        }
        textarea {
            padding:5px;
        }
        .save {
            border:none;
            background-color:#18b43d;
            border-bottom:4px solid #10872d;
            padding:10px 15px 10px 15px;
            color:white;
            cursor:pointer;
            font-size:17px;
        }
    </style>
     <script type="text/javascript">
         function fillCell(row, cellNumber, text) {
             var cell = row.insertCell(cellNumber);
             cell.innerHTML = text;
             cell.style.borderBottom = cell.style.borderRight = "solid 1px #aaaaff";
         }
         function addToClientTable(name, text) {
             var table = document.getElementById("<%= clientSide.ClientID %>");
            var row = table.insertRow(0);
            fillCell(row, 0, name);
            fillCell(row, 1, text);
            if (text.search("<span")>=0)
            {
                fillCell(row, 2, "Error");
            }
            else
            fillCell(row, 2, "File Uploaded");
        }

        function uploadError(sender, args) {
            addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
        }
        function uploadComplete(sender, args) {
            var contentType = args.get_contentType();
            var text = args.get_length() + " bytes";
            if (contentType.length > 0) {
                text += ", '" + contentType + "'";
            }
            addToClientTable(args.get_fileName(), text);
        }
       
    </script>
    <style>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <br /><br /><br /><br />
    <div id="" style="width:90%;margin:auto">
            <section id="content">
                <form runat="server" id="dc_form">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><div style="border-bottom:3px solid #0026ff ;background-color:#0094ff;color:white;padding:10px 15px 10px 15px;float:right;margin-right:20px;display:block;cursor:pointer;margin-top:-15px">
        Logout
    </div></asp:LinkButton>
                    <asp:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
                    <h1 style="color: red;text-align:center">Application Form</h1>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View1" runat="server">
                             <div style="border:10px solid white;padding:10px;width:80%;margin:auto">

                                <table>
                                    <tr>
                                        <td>
                                            <b>Name of oil Company</b>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxOliCompany" placeholder="Name of oil Company" required="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBoxOliCompany" ValidationGroup="sub" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <b>Name of applicant</b>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxApplicant_Name" placeholder="Name of applicant" required="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBoxApplicant_Name" ValidationGroup="sub" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>
                                                <b>
                                                    <asp:RadioButton ID="RadioButtonSO" Text="S/o" runat="server" GroupName="a" Checked="true" />
                                                    <asp:RadioButton ID="RadioButtonWO" Text="W/o" runat="server" GroupName="a" />
                                                    <asp:RadioButton ID="RadioButtonDO" Text="D/o" runat="server" GroupName="a" />
                                                </b>
                                            </label>
                                        </td>
                                        <td>
                                             <asp:TextBox ID="TextBoxSWD" placeholder="S/o,w/o,d/o" required="" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxSWD" ValidationGroup="sub" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                             <b>Permanent address </b>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxAddress" TextMode="MultiLine" Rows="5" Columns="40" placeholder="Permanent address" required="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBoxAddress" ValidationGroup="sub" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td>
                                            <b>District</b>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListDistrict" runat="server" required="">
                            <asp:ListItem Value="0">Hoshiarpur</asp:ListItem>
                        </asp:DropDownList>
                                        </td>
                                        <td>
                                            <b>Sub Division</b>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSubDivision" runat="server" required="">
                            <asp:ListItem Value="0">Dasuya</asp:ListItem>
                            <asp:ListItem Value="1">Mukerian</asp:ListItem>
                            <asp:ListItem Value="2">Garhshankar</asp:ListItem>
                            <asp:ListItem Value="3">Hoshiarpur</asp:ListItem>
                        </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="padding:15px;font-size:18px">
                                            <center>
                                            <b>Address of location where petrol pump is to be installed </b>
                                            </center>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                             <center><asp:TextBox ID="TextBoxLOCPetrolPump" Columns="50" Rows="7" TextMode="MultiLine" placeholder="Address of location where petrol pump is to be installed" required="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBoxLOCPetrolPump" ValidationGroup="sub" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                 </center>

                                        </td>
                                    </tr>
                                </table>

                                 <h3 class="gMap" style="color:#357ec6;cursor:pointer;border-bottom:3px solid #ff6a00;display:inline-block"><i class="fa fa-map-marker" style="color:#0266C8"></i> Mark Location on Google Maps?</h3>&nbsp;&nbsp;&nbsp; <h2 style="display:inline-block"><asp:Label ID="LabeMapCheck" runat="server" Text=""></asp:Label></h2>
                                    
                                
                        <p style="text-align:center">
                            <asp:Button ID="ButtonSave" runat="server" Text="Save & Continue" CssClass="save" ValidationGroup="sub" OnClick="ButtonSave_Click" /></p>
                    </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div style="border:10px solid white;padding:10px;width:80%;margin:auto">
                    <div>
                        <i style="color: blue">Attachments- Time required to upload a file depends upon the size of the file being uploaded.</i> <br>
                    </div>
                    <br>
                    <div>
                                <table>
                            <tr>
                                <td>Affidavit</td>
                               <td>
                                     <asp:AsyncFileUpload
            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
            runat="server" ID="AsyncFileUploadAffi" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional" 
            UploadingBackColor="#CCFFFF" ThrobberID="Label4"
             />&nbsp;<asp:Label runat="server" ID="Label4" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label></td>
                                <td></td>
                                <td>
                                            <asp:Label ID="LabelAff" runat="server" CssClass="hidden" Text="Uploaded"></asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Site Plan</td>
                               <td>
                                     <asp:AsyncFileUpload
            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
            runat="server" ID="AsyncFileUploadSite" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional" 
            UploadingBackColor="#CCFFFF" ThrobberID="Label3"
             />&nbsp;<asp:Label runat="server" ID="Label3" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label></td>
                                <td></td>
                                 <td>
                                    <asp:Label ID="LabelSite" runat="server" CssClass="hidden" Text="Uploaded"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Aks Sajra</td>
                                <td>
                                     <asp:AsyncFileUpload
            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
            runat="server" ID="AsyncFileUploadAks" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional" 
            UploadingBackColor="#CCFFFF" ThrobberID="Label2"
             />&nbsp;<asp:Label runat="server" ID="Label2" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label></td>
                                <td></td>
                                 <td>
                                    <asp:Label ID="LabelAks" runat="server" CssClass="hidden" Text="Uploaded"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Letter of entitlement</td>
                                <td>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="FileUploadLetterOfEnt" ValidationGroup="LOE" runat="server" Font-Size="X-Large" ForeColor="red" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                    <asp:AsyncFileUpload
            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
            runat="server" ID="AsyncFileUpload1" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional" 
            UploadingBackColor="#CCFFFF" ThrobberID="myThrobber"
             />&nbsp;<asp:Label runat="server" ID="myThrobber" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label>

                                </td>
                                <td></td>
                                 <td>
                                    <asp:Label ID="LabelLOE" runat="server" CssClass="hidden" Text="Uploaded"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Fard/Jamabandi</td>
                                <td>
                                     <asp:AsyncFileUpload
            OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" 
            runat="server" ID="AsyncFileUploadFard" ClientIDMode="AutoID" Width="400px" UploaderStyle="Traditional" 
            UploadingBackColor="#CCFFFF" ThrobberID="Label1"
             />&nbsp;<asp:Label runat="server" ID="Label1" style="display:none;" ><img align="absmiddle" alt="" src="uploading.gif" /></asp:Label></td>
                                <td></td>
                                 <td>
                                    <asp:Label ID="LabelFard" runat="server" CssClass="hidden" Text="Uploaded"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        
                        </div>
                    
                    <br>
                    <br>
                    <br>
                    
        <div><strong>The latest Server-side event:</strong></div>
        <asp:Label runat="server" Text="&nbsp;" ID="uploadResult" />
        <br /><br />
        <div><strong>Client-side events:</strong></div>
        <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;" runat="server" cellpadding="3" id="clientSide" />
                    <center><div id="submit_application">
                        <asp:Button ID="ButtonSubmit" ValidationGroup="sub" CssClass="save" runat="server" OnClick="ButtonSubmit_Click" Text="Submit your application" />

                    </div>
                        </center>
                        </div>
                        </asp:View>
                    </asp:MultiView>
                    <section class="showMap" style="position: fixed; width: 100%; height: 100%; margin: auto;top:0px;background-color:rgba(0,0,0,0.8);left:0px;display:none">
                        <i class="fa fa-2x fa-close" style="cursor:pointer;color:red; float:right;margin-right:50px;margin-top:7%;"></i>
                        <div style="width:90%;height:70%;margin:auto;margin-top:10%">
                            <div class="map" id="map_in"></div>
                            <div style="text-align: center">
                                <%--<a href="http://jsfiddle.net/doktormolle/EdZk4/">[source]</a>--%>
                                <input id="clear_shapes" value="clear shapes" type="button" />
                                <%--<input type="button" id="save_encoded" value="Save" />--%>
                                <asp:Button ID="SaveMap" ClientIDMode="Static" OnClick="save_encoded_Click" runat="server" Text="Save" hidden />
                                <input id="save_raw" value="save" type="button" />
                                <asp:TextBox ID="data" ClientIDMode="Static" style="width: 100%" readonly runat="server" hidden></asp:TextBox>
                                <%--<input id="restore" value="restore(IO.OUT(array,map))" type="button" />--%>
                            </div>
                            <%--<div class="map" id="map_out"></div>--%>
                        </div>
                    </section>
                                     
                     <script>
                         function initialize() {
                             var goo = google.maps,
                                 map_in = new goo.Map(document.getElementById('map_in'),
                                                               {
                                                                   zoom: 12,
                                                                   center: new goo.LatLng(31.5300, 75.9200)
                                                               }),
                                 //map_out = new goo.Map(document.getElementById('map_out'),
                                 //                              {
                                 //                                  zoom: 12,
                                 //                                  center: new goo.LatLng(32.344, 51.048)
                                 //                              }),
                                 shapes = [],
                                 selected_shape = null,
                                 drawman = new goo.drawing.DrawingManager({ map: map_in }),
                                 byId = function (s) { return document.getElementById(s) },
                                 clearSelection = function () {
                                     if (selected_shape) {
                                         selected_shape.set((selected_shape.type
                                                             ===
                                                             google.maps.drawing.OverlayType.MARKER
                                                            ) ? 'draggable' : 'editable', false);
                                         selected_shape = null;
                                     }
                                 },
                                 setSelection = function (shape) {
                                     clearSelection();
                                     selected_shape = shape;

                                     selected_shape.set((selected_shape.type
                                                         ===
                                                         google.maps.drawing.OverlayType.MARKER
                                                        ) ? 'draggable' : 'editable', true);

                                 },
                                 clearShapes = function () {
                                     for (var i = 0; i < shapes.length; ++i) {
                                         shapes[i].setMap(null);
                                     }
                                     shapes = [];
                                 };
                             //map_in.bindTo('center', map_out, 'center');
                             //map_in.bindTo('zoom', map_out, 'zoom');

                             goo.event.addListener(drawman, 'overlaycomplete', function (e) {
                                 var shape = e.overlay;
                                 shape.type = e.type;
                                 goo.event.addListener(shape, 'click', function () {
                                     setSelection(this);
                                 });
                                 setSelection(shape);
                                 shapes.push(shape);
                             });

                             goo.event.addListener(map_in, 'click', clearSelection);
                             goo.event.addDomListener(byId('clear_shapes'), 'click', clearShapes);
                             //goo.event.addDomListener(byId('save_encoded'), 'click', function () {
                             //    var data = IO.IN(shapes, true); byId('data').value = JSON.stringify(data);
                             //    $('#HiddenMap').val($('#data').val());
                             //    $('#SaveMap').queue(function (nxt) {
                             //        $(this).click();
                             //        nxt();
                             //    });
                             //});
                             goo.event.addDomListener(byId('save_raw'), 'click', function () {
                                 var data = IO.IN(shapes, false); byId('data').value = JSON.stringify(data);
                                 $('#HiddenMap').val($('#data').val());
                                 $('#HiddenCenter').val(map_in.getCenter());
                                 $('#HiddenZoom').val(map_in.getZoom());
                                     $('#SaveMap').queue(function (nxt) {
                                         $(this).click();
                                         nxt();
                                     });
                             });
                             //goo.event.addDomListener(byId('restore'), 'click', function () {
                             //    if (this.shapes) {
                             //        for (var i = 0; i < this.shapes.length; ++i) {
                             //            this.shapes[i].setMap(null);
                             //        }
                             //    }
                             //    this.shapes = IO.OUT(JSON.parse(byId('data').value), map_out);
                             //});

                         }


                         var IO = {
                             //returns array with storable google.maps.Overlay-definitions
                             IN: function (arr,//array with google.maps.Overlays
                                         encoded//boolean indicating whether pathes should be stored encoded
                                         ) {
                                 var shapes = [],
                                     goo = google.maps,
                                     shape, tmp;

                                 for (var i = 0; i < arr.length; i++) {
                                     shape = arr[i];
                                     tmp = { type: this.t_(shape.type), id: shape.id || null };


                                     switch (tmp.type) {
                                         case 'CIRCLE':
                                             tmp.radius = shape.getRadius();
                                             tmp.geometry = this.p_(shape.getCenter());
                                             break;
                                         case 'MARKER':
                                             tmp.geometry = this.p_(shape.getPosition());
                                             break;
                                         case 'RECTANGLE':
                                             tmp.geometry = this.b_(shape.getBounds());
                                             break;
                                         case 'POLYLINE':
                                             tmp.geometry = this.l_(shape.getPath(), encoded);
                                             break;
                                         case 'POLYGON':
                                             tmp.geometry = this.m_(shape.getPaths(), encoded);

                                             break;
                                     }
                                     shapes.push(tmp);
                                 }

                                 return shapes;
                             },
                             //returns array with google.maps.Overlays
                             OUT: function (arr,//array containg the stored shape-definitions
                                          map//map where to draw the shapes
                                          ) {
                                 var shapes = [],
                                     goo = google.maps,
                                     map = map || null,
                                     shape, tmp;

                                 for (var i = 0; i < arr.length; i++) {
                                     shape = arr[i];

                                     switch (shape.type) {
                                         case 'CIRCLE':
                                             tmp = new goo.Circle({ radius: Number(shape.radius), center: this.pp_.apply(this, shape.geometry) });
                                             break;
                                         case 'MARKER':
                                             tmp = new goo.Marker({ position: this.pp_.apply(this, shape.geometry) });
                                             break;
                                         case 'RECTANGLE':
                                             tmp = new goo.Rectangle({ bounds: this.bb_.apply(this, shape.geometry) });
                                             break;
                                         case 'POLYLINE':
                                             tmp = new goo.Polyline({ path: this.ll_(shape.geometry) });
                                             break;
                                         case 'POLYGON':
                                             tmp = new goo.Polygon({ paths: this.mm_(shape.geometry) });

                                             break;
                                     }
                                     tmp.setValues({ map: map, id: shape.id })
                                     shapes.push(tmp);
                                 }
                                 return shapes;
                             },
                             l_: function (path, e) {
                                 path = (path.getArray) ? path.getArray() : path;
                                 if (e) {
                                     return google.maps.geometry.encoding.encodePath(path);
                                 } else {
                                     var r = [];
                                     for (var i = 0; i < path.length; ++i) {
                                         r.push(this.p_(path[i]));
                                     }
                                     return r;
                                 }
                             },
                             ll_: function (path) {
                                 if (typeof path === 'string') {
                                     return google.maps.geometry.encoding.decodePath(path);
                                 }
                                 else {
                                     var r = [];
                                     for (var i = 0; i < path.length; ++i) {
                                         r.push(this.pp_.apply(this, path[i]));
                                     }
                                     return r;
                                 }
                             },

                             m_: function (paths, e) {
                                 var r = [];
                                 paths = (paths.getArray) ? paths.getArray() : paths;
                                 for (var i = 0; i < paths.length; ++i) {
                                     r.push(this.l_(paths[i], e));
                                 }
                                 return r;
                             },
                             mm_: function (paths) {
                                 var r = [];
                                 for (var i = 0; i < paths.length; ++i) {
                                     r.push(this.ll_.call(this, paths[i]));

                                 }
                                 return r;
                             },
                             p_: function (latLng) {
                                 return ([latLng.lat(), latLng.lng()]);
                             },
                             pp_: function (lat, lng) {
                                 return new google.maps.LatLng(lat, lng);
                             },
                             b_: function (bounds) {
                                 return ([this.p_(bounds.getSouthWest()),
                                         this.p_(bounds.getNorthEast())]);
                             },
                             bb_: function (sw, ne) {
                                 return new google.maps.LatLngBounds(this.pp_.apply(this, sw),
                                                                     this.pp_.apply(this, ne));
                             },
                             t_: function (s) {
                                 var t = ['CIRCLE', 'MARKER', 'RECTANGLE', 'POLYLINE', 'POLYGON'];
                                 for (var i = 0; i < t.length; ++i) {
                                     if (s === google.maps.drawing.OverlayType[t[i]]) {
                                         return t[i];
                                     }
                                 }
                             }

                         }
                        

                         $('.fa-close').click(function () {
                             $('.showMap').slideUp();
                         });
                         $('.gMap').click(function () {
                             $('.showMap').slideDown();
                             //google.maps.event.addDomListener(window, 'load', initialize);
                             initialize();
                         });
                         //$(document).ready(function () {
                         //    $('.showMap').slideUp(1);
                         //});

    </script>
                    <asp:HiddenField ID="HiddenMap" ClientIDMode="Static" runat="server" />
                    <asp:HiddenField ID="HiddenCenter" ClientIDMode="Static" runat="server" />
                    <asp:HiddenField ID="HiddenZoom" ClientIDMode="Static" runat="server" />
                </form>
            </section>
        </div>
</asp:Content>