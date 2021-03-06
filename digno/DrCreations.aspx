﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="DrCreations.aspx.cs" Inherits="digno.DrCreations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">New Doctor Information</h3>

          <%--<div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>--%>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
              <div class="col-md-12">
            
                <div class="col-md-2">
              <div class="form-group">
                <label>Doctor Name</label>
                 <input id="inputRefname" class="form-control input-sm" type="text" placeholder="Ref Center Name"/>
              </div>
                    </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Doctor Address</label>
                 <input id="inputRefaddress" class="form-control input-sm" type="text" placeholder="Address"/>
              </div>
                    </div>
                   <div class="col-md-2">
              <div class="form-group">
                <label>Doctor Mobile Number</label>
                 <input id="inputRefmobi" class="form-control input-sm" type="text" placeholder="Mobile Number"/>
              </div>
                    </div>
                   <div class="col-md-2">
              <div class="form-group">
                <label>Doctor Email</label>
                 <input id="inputRefperson" class="form-control input-sm" type="text" placeholder="Contact Person Name"/>
              </div>
                    </div>
               
                  <div class="col-md-2">
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
                <asp:Repeater ID="Repeaters" runat="server">
                     <HeaderTemplate>

              <table id="example1" class="table table-bordered table-striped">
              
                    
                     <thead>
                <tr>
                  <th>Doctor Name</th>
                  <th>Doctor Address</th>
                  <th>Doctor Mobile Number</th>                  
                  <th>Doctor Email</th>
                    <th>Doctor Joined Date</th>
                    <th>Approve Status</th>
                    <th>Edit</th>
                    <th>Enable/Disable</th>
                 
                </tr>
                </thead>
                 </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                <tr>
                  <td><%#Eval("Dr_name")%></td>
                  <td><%#Eval("Dr_address")%> </td>
                  <td><%#Eval("Dr_mobno")%> </td>
                  <td><%#Eval("Dr_email")%></td>
                    <td><%#Eval("Created_date")%></td>
                  
                  
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
            
            var Drname = document.getElementById("inputRefname").value;
            var Draddress = document.getElementById("inputRefaddress").value;
            var Drmobi = document.getElementById("inputRefmobi").value;
            var Dremail = document.getElementById("inputRefperson").value;
            
            submitOK = "true";

            if (Drname == "") {
                alert("PLEASE ENTER RefCenter NAME");
                submitOK = "false";
            }

            if (Draddress == "") {
                alert("Please enter the Address");
                submitOK = "false";
            }

            if (Drmobi.length != 10) {
                alert("Please enter Correct mobile number");
                submitOK = "false";
            }

            if (Dremail == "") {
                alert("Please enter the Person Name");
                submitOK = "false";
            }

            

            if (submitOK == "false") {

                return false;
            }
            if (submitOK == "true") {
                var cat = {};
                cat.Drname = Drname;
                cat.Draddress = Draddress;
                cat.Drmobi = Drmobi;
                cat.Dremail = Dremail;
               
          
                $.ajax({
                    type: 'POST',
                    url: 'DrCreations.aspx/saveRefCenter',
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
