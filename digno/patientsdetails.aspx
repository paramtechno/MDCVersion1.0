<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="patientsdetails.aspx.cs" Inherits="digno.patientsdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
     <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Patients Details</h3>

         
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
              <div class="col-md-12" style="border:1px solid #f4f4f4"  >
            
              
                       <div class="col-md-12" >
                           
               <div class="col-md-3">
              <div class="form-group">
                <label>Name</label>
                      </div>
                    </div>
                            <div class="col-md-3">
              <div class="form-group">
                <label>Age</label>
                      </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Gender</label>
                      </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
                   
               <label>Mobile:</label>

              
              </div>
                        </div>

                </div>
                  <div class="col-md-12" >
               <div class="col-md-3">
              <div class="form-group">
                <label>Name</label>
                      </div>
                    </div>
                            <div class="col-md-3">
              <div class="form-group">
                <label>Age</label>
                      </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Gender</label>
                      </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
                   
               <label>Mobile:</label>

              
              </div>
                        </div>

                </div>
                        
                   </div>
              <!-- /.form-group -->
              
              <!-- /.form-group -->
            </div>
            
          
            
            
            <div class="row">
        
        <div class="box-body">
            <h3 class="box-title">Test Details</h3>


            <div class="col-md-8">
          <div class="box box-default collapsed-box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Expandable</h3>

              <div class="box-tools pull-right">
                 <div data-toggle="modal" data-target="#Testrangeid" style="float:right">
                      <a class="btn btn-block btn-warning btn-sm" > ADD Test Result</a></div>
                       <div data-toggle="modal" data-target="#Testrangeid" style="float:right">
                      <a class="btn btn-block btn-success btn-sm" > Show Result</a></div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              The body of the box
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
            

            
                 <asp:Repeater ID="subtestrept" runat="server">
                     <HeaderTemplate>
                         </HeaderTemplate>
                     <ItemTemplate>   

                         </ItemTemplate>
                     <FooterTemplate>
     
    </FooterTemplate>
                    </asp:Repeater>
                    
      </div>
             
        
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        
        <div class="modal fade" id="Testrangeid" style="z-index: 1400;"  >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:950px !important">
      <div class="modal-header">
         
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add Test Result</h4>
             
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="col-xs-12 " >
                  <div class="col-md-3">Test Name:sd dshd dsadjasd sdashgdhasd asdhas</div>
            <div class="col-md-3">Patient ID:PID0000123</div>
                    <div class="col-md-3">Age:26 yesr</div>
                    <div class="col-md-3">Gender:femlae</div>
            <div >
            
           <%--<asp:Repeater ID="Billrept" runat="server">
                     <HeaderTemplate>--%>
            <table class="table table-responsive" id="tb" >
             <thead>
                <tr>
                 <th style="width:10%">Slno</th>
                   
                 <th style="width:10%">Parameters</th>
                             
                <%--<th style="width:10%">Add Parameters</th>--%>
                <th style="width:10%">Result</th>
                     <th style="width:10%">Unit</th>
                     <th style="width:10%">Refrence Range</th>
                    
                      <th style="width:10% ;display:none">1</th>
                
               </tr>
            </thead>
       
       <%-- </HeaderTemplate>
                <ItemTemplate>--%>
                     <tbody>
                         <tr>
           <td>1</td>
                 
                  <td>A1</td>
                         <td> <input class="form-control input-sm" type="text" id="pn" placeholder="Parameter Name"/>
                   
               </td>
                         <td>Male</td>
                         <td>MGdl</td>


                  



                       <td style="display:none">1</td>
                  
                  </tr>
                  
                 
                  
            
                          </tbody><%--</ItemTemplate>--%>
                <%-- <FooterTemplate>--%>
        </table>
    <%--</FooterTemplate>
                </asp:Repeater>--%>
        </div>
                
                
               
                    </div>
                
                
              

          
               
             </div>
          </div>
              
             
          
      </div>
      <div class="modal-footer">
          <div class="col-md-12" >
               <div class="col-md-3">
           <div class="form-group">
                  <label for="exampleInputEmail1" style="text-align:left !important" >Coments</label>
                   <input class="form-control input-sm" type="text" id="pn" placeholder="Parameter Name"/>
                   
                 </div>
                   </div>
              <div class="col-md-3">
           <div class="form-group">
                  <label for="exampleInputEmail1" style="text-align:left !important" >Other Refrence</label>
                   <input class="form-control input-sm" type="text" id="pn" placeholder="Parameter Name"/>
                   
                 </div>
                  </div>
              <div class="col-md-6">
                   <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
                  </div>
              </div>
      </div>
      </div>
    </div>
  </div>
      
        </section>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <%--<script type="text/javascript">
        var categrid;
    $(document).ready(function() {
           $(function () {
                $('#example1').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                })
            })

    });
    $('#tstamount').keypress(function (event) {

        if (event.which != 8 && isNaN(String.fromCharCode(event.which))) {
            event.preventDefault(); //stop character from entering input
        }

    });
    function edit(obj) {
        $('[id$=subtest]').val($(obj).attr("subtest"));
        $('[id$=tstamount]').val($(obj).attr("Amount"));
        $('[id$=previousid]').val($(obj).attr("tstid"));
        categrid = $(obj).attr("testcatid");
        $('[id$=Actions]').val(1);
        $("#saveupdate").html('<i class="fa fa-save"> </i> Update');
        document.getElementById("subtest").focus();
    }
    function ACTDEC(ACTobj) {
        var cat = {};
        if ($(ACTobj).attr("status") == "0")
            cat.status = 1;
        else
            cat.status = 0;
        cat.categoryid = $(ACTobj).attr("testcatid");
        $.ajax({
            type: 'POST',
            url: 'TestCreation.aspx/savesubtest',
            data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + 2 + ',prevsid:' + $(ACTobj).attr("tstid") + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (e) {

                window.location.reload();

                if ($(ACTobj).attr("status") == '0')
                    alert("Dectivated");
                else
                    alert("Activated");
            },
            error: function (err) {
                alert("notok");
                console.log(err);
            }
        });
    }

   
    function Savsubtest(e) {

        var subtest = document.getElementById("subtest").value;
        var tstamount = document.getElementById("tstamount").value;
        submitOK = "true";

        if (subtest == "" && tstamount == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("subtest").focus();
        }
        else if (tstamount != "" && subtest == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("subtest").focus();
        }
        else if (subtest != "" && tstamount == "") {
            alert("PLEASE ENTER AMOUNT");
            submitOK = "false";
            document.getElementById("tstamount").focus();
        }
        if (submitOK == "false") {

            return false;
        }
        if (submitOK == "true") {
            var cat = {};
            var categid = '<%= Testcateg.ClientID %>';
            cat.subtestname = subtest;
            cat.tstamount = tstamount;
            if ($('[id$=Actions]').val() == 1)
                cat.categoryid = categrid;
            else
                cat.categoryid = $('#' + categid).val();

            var Actions = $('[id$=Actions]').val();
            var previousid = $('[id$=previousid]').val();
            $.ajax({
                type: 'POST',
                url: 'TestCreation.aspx/savesubtest',
                data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + Actions + ',prevsid:' + previousid + '}',
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
            $('[id$=Actions]').val(0);
        }
    }


        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })

            </script>--%>

</asp:Content>
