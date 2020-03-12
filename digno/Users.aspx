<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="digno.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
     <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default" style="margin-top:12px">
        <div class="box-header with-border">
          <h3 class="box-title">Add User</h3>

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
                <label>User Name</label>
                  <input  type="hidden" value="1" id="Actions" runat="server" />
                  <input  type="hidden" value="0" id="previousid" runat="server" />
                 <input id="inputun" class="form-control input-sm" type="text" placeholder="User Name"/ required>
              </div>
                    </div>

                   
               <div class="col-md-2">
              <div class="form-group">
                <label>Email</label>
                 <input  class="form-control input-sm" type="text"  id="inputemail"  placeholder="Email"/ required>
              </div>
                    </div>

                   <div class="col-md-2">
              <div class="form-group">
                <label>Mobile Number</label>
                 <input  class="form-control input-sm" type="text"  id="inputmn"  placeholder="Mobile Number"/ required>
              </div>
                    </div>

                   <div class="col-md-2">
              <div class="form-group">
                <label>Password</label>
                 <input  class="form-control input-sm" type="text"  id="inputp"  placeholder="Password"/ required>
              </div>
                    </div>

                  <div class="col-md-2">
              <div class="form-group">
                <label>Confirm Password</label>
                  <%--<input  type="hidden" value="0" id="previousid" runat="server" />--%>
                 <input  class="form-control input-sm" type="text"  id="inputcp"  placeholder="Confirm Password"/ required>
              </div>
                    </div>
                  <div class="col-md-2">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" id="savupdate"class="btn btn-primary"onclick="validateForm(this)"> <i class="fa fa-save"> </i> Save</button>                                         
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
                <asp:Repeater ID="Usersrpt" runat="server">
                     <HeaderTemplate>

              <table id="example1" class="table table-bordered table-striped">
              
                    
                <thead>
                <tr>
                   <th>Order</th>
                  <th>User Name</th>
                  <th>Email</th>
                  <th>Mobile Number</th>  
                   <th>Password</th>                  
                  <th style="text-align: center; vertical-align: middle;">Edit</th>
                    <th style="text-align: center; vertical-align: middle;">Active Status</th>
                </tr>
                </thead>
                </HeaderTemplate>
            <ItemTemplate>
                
                <tr>
                  <td><%# Container.ItemIndex + 1 %></td>
                  <td><%# Eval("User_name") %> </td>
                    <td><%# Eval("Email") %> </td>
                    <td><%# Eval("Mobile_no") %> </td>
                    <td><%# Eval("Password") %> </td>
                    <td style="text-align: center; vertical-align: middle;">
                    
              <i  usrname="<%# Eval("User_name") %>" email="<%# Eval("Email") %>" mobno="<%# Eval("Mobile_no") %>" pwd="<%#Eval("Password") %>" usrid="<%#Eval("User_id") %>" onclick ="javascript: return edit(this)" class="fa fa-edit"></i> Edit
              </td>   
                    <td style="text-align: center; vertical-align: middle;cursor:pointer"><i status="<%# Convert.ToInt32(Eval("Status")) %>" usrid="<%# Eval("User_id") %>"onclick="javascript: return ACTDEC(this)" class='<%# Eval("Status").ToString()  == "1" ? "fa fa-fw fa-toggle-off" : "fa fa-fw fa-toggle-on" %>'></i></td>      
                </tr>
                
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

 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
       
    <script type="text/javascript">
        $(document).ready(function () {


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
        $('#inputmn').keypress(function (event) {

            if (event.which != 10 && isNaN(String.fromCharCode(event.which))) {
                event.preventDefault(); //stop character from entering input
            }
        });

        function edit(obj) {
            $('[id$=inputun]').val($(obj).attr("usrname"));
            $('[id$=inputemail]').val($(obj).attr("email"));
            $('[id$=inputmn]').val($(obj).attr("mobno"));
            $('[id$=inputp]').val($(obj).attr("pwd"));
            $('[id$=inputcp]').val($(obj).attr("pwd"));
            $('[id$=previousid]').val($(obj).attr("usrid"));
            $('[id$=Actions]').val(1);
            $("#savupdate").html('<i class="fa fa-save"> </i> Update');
            document.getElementById("inputun").focus();
        }
    function  ACTDEC(ACTobj)
        {
        var cat = {};
        if ($(ACTobj).attr("status") == "0")
            cat.UStatus = 1;
        else
            cat.UStatus = 0;

        
        cat.PrevUID = $(ACTobj).attr("usrid");

        $.ajax({
            type: 'POST',
            url: 'Users.aspx/SaveUsers',
            data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + 2 + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (e) {
                
                window.location.reload();

               if( $(ACTobj).attr("status") =='0')
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

        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })

        function validateForm(e) {
            
            var Roletype = document.getElementById("inputrt").value;
            var Username = document.getElementById("inputun").value;
            var Email = document.getElementById("inputemail").value;
            var mobno = document.getElementById("inputmn").value;
            var Password = document.getElementById("inputp").value;
            var Confirmpassword = document.getElementById("inputcp").value;
            submitOK = "true";

            if (Password == "" && Confirmpassword == "") {
                alert("PLEASE ENTER Password");
                submitOK = "false";
                document.getElementById("inputp").focus();
                document.getElementById("inputcp").focus();
            }

            if (Password != Confirmpassword) {
                alert("PLEASE ENTER Same Password for Password and Confirm Password");
                submitOK = "false";
                document.getElementById("inputp").focus();
                document.getElementById("inputcp").focus();
            }

            if (Email == "") {
                alert("PLEASE ENTER CATEGORY NAME");
                submitOK = "false";
                document.getElementById("inputemail").focus();
            }
             if (Roletype == "") {
                alert("PLEASE ENTER ORDERBY");
                submitOK = "false";
                document.getElementById("inputrt").focus();
            }
            if (isNaN(mobno))
            {
                alert("Please enter valid mobile number");
                submitOK = "false";
                document.getElementById("inputmn").focus();
            }
            if (submitOK == "false") {

                return false;
            }
            if (submitOK == "true") {
                var cat = {};
                cat.Role_type = Roletype;
                cat.User_name = Username;
                cat.Email = Email;
                cat.Mobile = mobno;
                cat.Password = Password;

                var Actions = $('[id$=Actions]').val();
                cat.PrevUID = $('[id$=previousid]').val();
                $.ajax({
                    type: 'POST',
                    url: 'Users.aspx/SaveUsers',
                    data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + Actions + '}',
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

            </script>

</asp:Content>
