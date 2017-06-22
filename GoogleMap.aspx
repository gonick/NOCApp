<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleMap.aspx.cs" Inherits="GoogleMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing"></script>
   
    <style>
        html, body
  {
      padding: 0;
      margin: 0;
      height: 100%;
  }
  .map{height:550px;}

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

    </style>
</head>
<body>
    <form id="form1" runat="server">
            <asp:HiddenField ID="HiddenMap" ClientIDMode="Static"  runat="server" />
        <asp:HiddenField ID="HiddenZoom" ClientIDMode="Static"  runat="server" />
        <asp:HiddenField ID="HiddenCenter" ClientIDMode="Static"  runat="server" />
    <div>
        <h2 style="text-align:center">
            Applicant: <asp:Label ID="LabelName" runat="server"></asp:Label>
        </h2>
     <section class="showMap" style="width: 100%; height: 100%; margin: auto;top:0px;">
                        <div style="width:90%;height:80%;margin:auto;margin-top:2%">
                            <%--<div class="map" id="map_in"></div>--%>
                            <div style="text-align: center">
                                <%--<a href="http://jsfiddle.net/doktormolle/EdZk4/">[source]</a>--%>
                                <%--<input id="clear_shapes" value="clear shapes" type="button" />
                                <input type="button" id="save_encoded" value="Save" />--%>
                                <%--<asp:Button ID="SaveMap" ClientIDMode="Static" OnClick="save_encoded_Click" runat="server" Text="Save" hidden />--%>
                                <%--<input id="save_raw" value="save raw(IO.IN(shapes,false))" type="button" />
                                <asp:TextBox ID="data" ClientIDMode="Static" style="width: 100%"  runat="server"  Text='[{"type":"POLYGON","id":null,"geometry":["wml_EwinnMOPKODCKGEFCGLOPN"]}]'></asp:TextBox>--%>
                                <input id="restore" value="restore(IO.OUT(array,map))" hidden type="button" />
                            </div>
                            <div class="map" id="map_out"></div>
                        </div>
                    </section>
                                     
                     <script>
                         function initialize() {
                             var a = $('#HiddenZoom').val();
                             var b = parseInt(a);
                             var latlong = $('#HiddenCenter').val();
                             latlong = latlong.replace('(', '').replace(')', '');
                             latlong = latlong.split(',');
                             var lat = parseFloat(latlong[0]);
                             var long = parseFloat(latlong[1]);
                             var goo = google.maps,
                                 //map_in = new goo.Map(document.getElementById('map_in'),
                                 //                              {
                                 //                                  zoom: 12,
                                 //                                  center: new goo.LatLng(31.5300, 75.9200)
                                 //                              }),
                                 map_out = new goo.Map(document.getElementById('map_out'),
                                                               {
                                                                   zoom: b,
                                                                   center: new goo.LatLng(lat, long)
                                                               }),
                                 shapes = [],
                                 selected_shape = null,
                                 //drawman = new goo.drawing.DrawingManager({ map: map_in }),
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
                             //map_out.center = $('#HiddenCenter').val().replace('(','').replace(')','');
                             //map_out.zoom = $('#HiddenZoom').val();
                             //alert(map_out.zoom);
                             //var abc = document.getElementById("HiddenZoom");
                             //alert(abc);
                             //goo.event.addListener(drawman, 'overlaycomplete', function (e) {
                             //    var shape = e.overlay;
                             //    shape.type = e.type;
                             //    goo.event.addListener(shape, 'click', function () {
                             //        setSelection(this);
                             //    });
                             //    setSelection(shape);
                             //    shapes.push(shape);
                             //});

                             //goo.event.addListener(map_in, 'click', clearSelection);
                             //goo.event.addDomListener(byId('clear_shapes'), 'click', clearShapes);
                             //goo.event.addDomListener(byId('save_encoded'), 'click', function () {
                             //    var data = IO.IN(shapes, true); byId('data').value = JSON.stringify(data);
                             //    $('#HiddenMap').val($('#data').val());
                             //    //$('#SaveMap').queue(function (nxt) {
                             //    //    $(this).click();
                             //    //    nxt();
                             //    //});
                             //});
                             //goo.event.addDomListener(byId('save_raw'), 'click', function () {
                             //    var data = IO.IN(shapes, false); byId('data').value = JSON.stringify(data);
                             //});
                             goo.event.addDomListener(byId('restore'), 'click', function () {
                                 if (this.shapes) {
                                     for (var i = 0; i < this.shapes.length; ++i) {
                                         this.shapes[i].setMap(null);
                                     }
                                 }
                                 this.shapes = IO.OUT(JSON.parse(byId('HiddenMap').value), map_out);
                             });

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
                         initialize();
                         $('#restore').click();

    </script>
                
        <%-- <asp:HiddenField ID="HiddenCenter" ClientIDMode="Static" runat="server" />
                    <asp:HiddenField ID="HiddenZoom" ClientIDMode="Static" runat="server" />--%>

    </div>
    </form>
</body>
</html>
