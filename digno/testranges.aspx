<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testranges.aspx.cs" Inherits="digno.testranges" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>

  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css"/>

  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css"/>

  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css"/>

  <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>

  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css"/>
      <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>

  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
 
    <asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>
    <style> .LockOn {
  display: block;
  visibility: visible;
  position: absolute;
  z-index: 999;
  top: 0px;
  left: 0px;
  width: 105%;
  height: 105%;
  background-color:white;
  vertical-align:bottom;
  padding-top: 20%;
  filter: alpha(opacity=75);
  opacity: 0.75;
  font-size:large;
  color:blue;
  font-style:italic;
  font-weight:400;
  background-image: url("../Common/loadingGIF.gif");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  }</style>

    <style>
        body
{
    counter-reset: Serial;          
}

table
{
    border-collapse: separate;
}

        tr td:first-child:before {
            counter-increment: Serial;
            content:  counter(Serial);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="modal fade" id="Testrange"  style="z-index: 1600;" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:620px">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Test Parameters Ranges</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="row" >
         <div class="col-xs-12">
            <div class=" ">
            
                <div class="col-md-12">
                
                 <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Minmum Value</label>
                   <input class="form-control input-sm" type="text" id="Minval" placeholder="Minmum Value"/>
                   
                 </div>
              </div>

                    <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Maxmum Value</label>
                   <input class="form-control input-sm" type="text" id="Maxval" placeholder="Maxmum value"/>
                  
                 </div>
              </div>
                    <div>OR</div>
                    <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Text Value</label>
                   <input class="form-control input-sm" type="text" id="RTV" placeholder="Result"/>
                   
                 </div>
              </div>
                    </div>
                 <div class="col-md-12">
            <div class="col-md-6">
              <div class="form-group">
                  <label for="exampleInputEmail1">Gender</label>
                   <select id="Rsex" class="form-control select2 " runat="server">
                     <option selected="">Male</option>
                       <option>Female</option>
                       <option>Both</option>
                   </select>
              </div>
            </div>
                     <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Units</label>
                   <select id="RUIN" class="form-control select2 " runat="server">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>
                
</div>
                <div class="col-md-12">
            <div class="col-md-6">
              <div class="form-group">
                  <label for="exampleInputEmail1">Noraml values</label>
                    <input class="form-control input-sm" type="text" id="RNV" placeholder="Normal Value"/>
                
              </div>
            </div>
                     <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Special Condition</label>
                   <input class="form-control input-sm" type="text" id="RSC" placeholder="Special Condition"/>
                 </div>
              </div>
                
</div>
                 <div class="col-md-12">
                      <div class="col-md-4">
                      <div class="form-group">
                  <label for="exampleInputEmail1">Minmum Age</label>
                   <input class="form-control input-sm" type="text" id="MinAg" placeholder="Minmum Age"/>
                  
                 </div>
                          </div>
                       <div class="col-md-4">
                      <div class="form-group">
                  <label for="exampleInputEmail1">Maxmum Age</label>
                   <input class="form-control input-sm" type="text" id="MaxAg" placeholder="Maxmum Age"/>
                  
                 </div>
                           </div>
                       <div class="col-md-4">
                     <div class="form-group">
                  <label for="exampleInputEmail1">Age Type</label>
                   <select id="AGETY" class="form-control select2 " runat="server">
                     <option selected="">Days</option>
                       <option>Month</option>
                       <option>Years</option>
                   </select>
              </div>
                           </div>
                     </div>
                
              

          </div>
                </div>
             </div>
          </div>
              </div>
             
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  onclick="Javascript:return SavetestparametersRange(this)" >Save changes</button>
      </div>
      </div>
    </div>
  </div>






        
      
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="col-xs-12 " >
                  <div class="col-xs-6">
                      
                      <p>Test Name:<h4> <b> <asp:Label ID="Label1" class="agile-label"  runat="server" Text="Label"></asp:Label></b></h4></p>
                      
                      
                      <p>Paramerter Name:<h4> <b> <asp:Label ID="Label2" class="agile-label"  runat="server" Text="Label"></asp:Label></b></h4></p>
             <asp:HiddenField ID="parid" runat="server" />
                       </div>
                  <div class="col-xs-6">
            <div style="float:right;padding-right:10px">  <button data-toggle="modal" data-target="#Testrange"   type="button" class="btn btn-primary">ADD New</button> </div> 
         </div>
                  </div>
                  <div class="col-xs-12 " >
            
            <div >
            
           <asp:Repeater ID="Rangerept" runat="server">
                     <HeaderTemplate>
            <table class="table table-responsive" id="tb" style="width:100% ;">
             <thead>
                <tr>
                 <th style="width:10%">Slno</th>
                   
                 <th style="width:10%">Age ranges</th>
                             
                <%--<th style="width:10%">Add Parameters</th>--%>
                <th style="width:10%">min Range</th>
                     <th style="width:10%">Max Range</th>
                     <th style="width:10%">Gender</th>
                     <th style="width:10%">Normal Values</th>
                      <th style="width:10%">Special Condition</th>
                      <th style="width:10% ;display:none">1</th>
                
               </tr>
            </thead>
       
       </HeaderTemplate>
                <ItemTemplate>
                     <tbody>
                         <tr>
           <td>1</td>
                 
                  <td>A1</td>
                         <td>Tube</td>
                         <td>Male</td>
                         <td>MGdl</td>


                  <td>
                       
                                
                      
                            
                  </td>



                       <td style="display:none">1</td>
                  
                  </tr>
                  
                 
                  
            
                          </tbody></ItemTemplate>
                 <FooterTemplate>
        </table>
   </FooterTemplate>
                </asp:Repeater>
        </div>
                
                
               
                    </div>
                
                
              

          
               
             </div>
          </div>
              
             
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
     
    </div>
    </form>

     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

</body>
    <script>
         function SavetestparametersRange(e) {
         var Testid = '<%= parid.ClientID %>';
            var pid = '<%= parid.ClientID %>';
             var tid = $('#' + Testid).val();
             var parid = $('#' + pid).val();
            var minval = document.getElementById("Minval").value;
            var maxval = document.getElementById("Maxval").value;
            var ValType = document.getElementById("RTV").value;

             var unit = '<%= RUIN.ClientID %>';
             var Gender = '<%= Rsex.ClientID %>';
           //  var unit = document.getElementById("RUIN").value;
          //   var Gender = document.getElementById("Rsex").value;
             var minvalday =document.getElementById("MinAg").value;
             var maxvalday = document.getElementById("MaxAg").value;
             var Normalval = document.getElementById("RNV").value;
             var splcon = document.getElementById("RSC").value;
            // var agetype = document.getElementById("AGETY").value;
             var agetype = '<%= AGETY.ClientID %>';


        submitOK = "true";

        if ($('#' + Gender).val() == "" ) {
            alert("PLEASE ENTER Parameter Name ");
            submitOK = "false";
            document.getElementById("parname").focus();
        }
        else if (minvalday == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("TC").focus();
        }
        else if ($('#' + unit).val() == "") {
            alert("PLEASE ENTER Unit");
            submitOK = "false";
            document.getElementById("UN").focus();
        }
        else if (maxvalday == "") {
            alert("PLEASE ENTER Gender");
            submitOK = "false";
            document.getElementById("GN").focus();
        }
       


        if (submitOK == "false") {

            return false;
        }
        if (submitOK == "true") {
            var cat = {};
           
            cat.Minval = minval;
            cat.Maxval = maxval;
            cat.textval = ValType;
            cat.unit = $('#' + unit).val();
            cat.gender = $('#' + Gender).val();
            cat.narval = Normalval;
            cat.SC=  splcon ;
            cat.minAg= minvalday;
            cat.maxAg=maxvalday;
            cat.agetype =agetype;
            cat.tid=tid;
            cat.parid = parid;

           



            $.ajax({
                type: 'POST',
                url: 'TestParameters.aspx/Saveparametersranges',
                data: '{cat: ' + JSON.stringify(cat) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (e) {
                    alert("Record effected");
                },
                error: function (err) {
                    alert("notok");
                    console.log(err);
                }
            });
           
        }
    }


    </script>
</html>
