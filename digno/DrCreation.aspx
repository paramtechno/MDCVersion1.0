<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="DrCreation.aspx.cs" Inherits="digno.DrCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">New Dr. </h3>

          <%--<div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>--%>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
              <div class="col-md-12">
            
                <div class="col-md-3">
              <div class="form-group">
                <label>Dr. Name</label>
                 <input id="DR_name" class="form-control input-sm" type="text" placeholder="NAME"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>DR Address</label>
                 <input id="DR_address" class="form-control input-sm" type="text" placeholder="Address"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Dr mobile number</label>
                 <input id="Dr_mob" class="form-control input-sm" type="text" placeholder="Mobile Number"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Dr Email</label>
                 <input id="Dr_email" class="form-control input-sm" type="text" placeholder="Email"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Dr Reference id</label>
                 <input id="Dr_Refid" class="form-control input-sm" type="text" placeholder="Reference Id"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Date</label>
                 <input id="Created_date" class="form-control input-sm" type="text" placeholder="yyyy-mm-dd"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Is Deleted</label>
                 <input id="Isdeleted" class="form-control input-sm" type="text" placeholder="True or False"/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group">
                <label>Status</label>
                 <input id="Status" class="form-control input-sm" type="text" placeholder="True or False"/>
              </div>
                    </div>
                
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" class="btn btn-primary" onclick="validateForm(this)"> <i class="fa fa-save"></i> Save</button>
                  
               
              
              </div>
                        </div>
                        </div>
                   
              <!-- /.form-group -->
              
              <!-- /.form-group -->
            </div>
            
          <div class="row">
        <div class="col-xs-12">
          
            

          <div class="box">
            
            <!-- /.box-header -->
            <div class="box-body">
                <asp:Repeater ID="Repeater1" runat="server">
                     <HeaderTemplate>

              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Dr ID</th>
                  <th>Dr.Name</th>
                  <th>Address</th>   
                    <th>Mobile</th>
                    <th>Dr.email</th>  
                    <th>created date</th> 
                    <th>Dr.referenece id</th> 
                    <th>deleted</th>   
                    <th>Status</th>              
                  <th>Edit</th>
                    <th>Active Status</th>
                </tr>
                </thead>
                  </HeaderTemplate>
                    <ItemTemplate>
                <tbody>
                <tr>
                  <td><%#Eval("Dr_id")%></td>
                    <td><%#Eval("Dr_name")%></td>
                  <td><%#Eval("Dr_address")%> </td>
                  <td><%#Eval("Dr_mobno")%> </td>
                  <td><%#Eval("Dr_email")%></td>
                  <td><%#Eval("Created_date")%></td>
                  <td><%#Eval("Dr_Ref_id")%></td>
                  <td><%#Eval("Isdeleted")%></td>
                  <td><%#Eval("Status")%></td>
                  <td><span class="label label-success">Approved</span></td>
                          <td>
                <i class="fa fa-edit"></i> Edit
              </td>   
                    <td><i class="fa fa-fw fa-toggle-on"></i></td>      
                </tr>
                </tbody>
                        </ItemTemplate>
                <%--<tfoot>
                <tr>
                  <th>No</th>
                  <th>Type</th>
                  <th>Regno</th>
                  <th>Ref Dr.</th>
                  <th>Ref Center</th>
                    <th>Bill No</th>
                    <th>Bill Amt</th>
                    <th>Bill Print</th>
                    <th>Report Print</th>
                </tr>
                </tfoot>--%>
            <FooterTemplate>
        </table>
    </FooterTemplate>
                     </asp:Repeater>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
             
        
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        
        
      
        </section>
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
    <script type="text/javascript">



        $(function () {
            //Initialize Select2 Elements

            $('.select2').select2()
        })
        function validateForm(e) {

            var DR_name = document.getElementById("DR_name").value;
            var DR_address = document.getElementById("DR_address").value;
            var Dr_mob = document.getElementById("Dr_mob").value;
            var at = document.getElementById("Dr_email").value.indexOf("@");
            var Dr_email = document.getElementById("Dr_email").value;
            var Dr_Refid = document.getElementById("Dr_Refid").value;
            var Created_date = document.getElementById("Created_date").value;
            var Isdeleted = document.getElementById("Isdeleted").value;
            var Status = document.getElementById("Status").value;
            submitOK = "true";

            if (DR_name == "") {
                alert("PLEASE ENTER Doctor NAME");
                submitOK = "false";
            }

            if (DR_address == "") {
                alert("Please enter the Address");
                submitOK = "false";
            }

            if (Dr_mob.length != 10) {
                alert("Please enter Correct mobile number");
                submitOK = "false";
            }

            if (Dr_Refid == "") {
                alert("Please enter the Reference id");
                submitOK = "false";
            }

            if (Created_date == "") {
                alert("Please enter the today's Date");
                submitOK = "false";
            }

            if (Dr_email.Indexof == "" || at == -1) {
                alert("Please enter valid email id");
                submitOK = "false";
            }

            if (Isdeleted == "") {
                alert("Please enter the Deleted is True Or False");
                submitOK = "false";
            }

            if (Status == "") {
                alert("Please enter the Status is True Or False");
                submitOK = "false";
            }

            if (submitOK == "false") {

                return false;
            }
            if (submitOK == "true") {
                var cat = {};
                cat.DR_name = DR_name;
                cat.DR_address = DR_address;
                cat.Dr_mob = Dr_mob;
                cat.Dr_Refid = Dr_Refid;
                cat.Created_date = Created_date;
                cat.Dr_email = Dr_email;
                cat.Isdeleted = Isdeleted;
                cat.Status = Status;

                $.ajax({
                    type: 'POST',
                    url: 'DrCreation.aspx/saveDRinfo',
                    data: '{cat: ' + JSON.stringify(cat) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        alert("test type");
                    },
                    error: function (err) {
                        alert("notok");
                        console.log(err);
                    }
                });



            }




        }
            </script>


</asp:Content>
