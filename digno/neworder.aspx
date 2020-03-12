<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="neworder.aspx.cs" Inherits="digno.neworder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
     <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">New Order</h3>

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
                <label>Initial</label>
                  <select id="IDini" class="form-control select2 ">
                      <option selected="selected">Select Prifix</option>
                 <option value="Ms"> Ms </option> 
    <option value="Miss"> Miss </option> 
    <option value="Mrs"> Mrs </option> 
    <option value="Mr"> Mr </option> 
                                    </select>
              </div>
                </div>
                <div class="col-md-2">
              <div class="form-group">
                <label>Name</label>
                 <input class="form-control input-sm" type="text" id="IDname" placeholder=""/>
              </div>
                    </div>
                    <div class="col-md-2">
              <div class="form-group">
                <label>Mobile</label>
                <input class="form-control input-sm" type="text" id="IDmobile" placeholder=".input-sm"/>
              </div>
                        </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Gender</label>
                <select id="IDgender" class="form-control select2">
                    <option selected="selected">Male</option>
                  <option>Female</option>
                  <option>Other</option>
                                    </select>
              </div>
                        </div>
           
                  <div class="col-md-2">
              
              <div class="form-group">
                <label>Email</label>
                <input class="form-control input-sm" type="text" id="IDemail" placeholder=".input-sm"/>
              </div>
              </div>
                   
                        </div>
                    <div class="col-md-12">
                        <div class="col-md-2">
                <div class="form-group">
                  <label for="exampleInputPassword1">Age</label>
                  <input type="Age" class="form-control" id="IDage" placeholder="Age" />
                     <select id="IDagetype" class="form-control select2 ">
                      <option selected="selected">Year</option>
                  <option>Month</option>
                  <option>Year</option>
                          <option>Day's</option>
                                    </select>
                </div>
              </div>
            <div class="col-md-2">
              <div class="form-group">
                <label>Ref Dr</label>
                  <select id="IDDr" class="form-control select2 " >
                      
                                    </select>
             <div data-toggle="modal" data-target="#Drmodel">     <i class="fa fa-fw fa-plus-square"></i> ADD Dr.</div>
              </div>
                </div>
                <div class="col-md-2">
              <div class="form-group">
                <label>Ref Center</label>
                  <select id="IDref" class="form-control select2 ">
                      
                                    </select>
               <div data-toggle="modal" data-target="#Refmodel">  <i class="fa fa-fw fa-plus-square" ></i> ADD Reffrence Center</div> 
              </div>
                    </div>
                    <div class="col-md-4">
              <div class="form-group">
               <div class="form-group" style="margin-top:23px">
               <button type="button"class="btn btn-primary" onclick="validateForm(this);"> <i class="fa fa-save"></i> Save</button>
                  
                <button type="submit" class="btn btn-danger"> <i class="fa fa-save"></i> Cancel</button>
              
              </div>
              </div>
                        </div>
                  
           
                 
                        </div>
              <!-- /.form-group -->
              
              <!-- /.form-group -->
            </div>
            
            

            
            
            <!-- /.col -->
            
            <!-- /.col -->
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
                  <th>No</th>
                  <th>Patient Details</th>
                   
                  <th>Mobile</th> 
                     <th>Ref Dr</th>                  
                  <th style="text-align: center; vertical-align: middle;">Edit</th>
                    <th style="text-align: center; vertical-align: middle;">Active Status</th>
                </tr>
                </thead>
                </HeaderTemplate>
            <ItemTemplate>
                
                <tr>
                  <td>0</td>
                  <td> Name:<b> <%# Eval("Patient_name") %></b><br />Patient Id: <b>
                      <%# Eval("Patient_id") %></b><br />Age: <b><%# Eval("age") %> <%# Eval("Age_type") %><b>/<i class="<%# Eval("sex").ToString().Trim() == "Male" ? " fa fa-fw fa-male" : " fa fa-fw fa-female" %>"></i></td>
                 
                    <td><%# Eval("Mobile") %> </td>
                    <td><%# Eval("Ref_DR") %></td>
                   
                          <td style="text-align: center; vertical-align: middle;">
                <div class="fa fa-edit" style="cursor:pointer" tstname="" orderby="" Category_id=""onclick ="javascript: return edit(this)"></div>
              </td>   
                    <td style="text-align: center; vertical-align: middle;"><i class="<%# Eval("Status").ToString() == "0" ? "fa fa-fw fa-toggle-off" : "fa fa-fw fa-toggle-on" %>"></i> </td>      

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
          <!-- /.row -->
        </div>


        <div class="modal fade" id="Drmodel"  >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">New Doctor Creation</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="col-md-12">
            
                <div class="col-md-12">
              <div class="form-group">
                <label>Dr. Name*</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-12">
              <div class="form-group">
                <label>Mobile*</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-12">
              <div class="form-group">
                <label>Clinic/Hospital Name</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                  </div>
              </div>
             </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



        <div class="modal fade" id="Refmodel"  >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel1">Refrence Center Creation</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="col-md-12">
            
                <div class="col-md-12">
              <div class="form-group">
                <label>Dr. Name*</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-12">
              <div class="form-group">
                <label>Mobile*</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-12">
              <div class="form-group">
                <label>Clinic/Hospital Name</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                  </div>
              </div>
             </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
        <!-- /.box-body -->
         <div class="modal fade" id="modal-default" >
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Successfully Registered</h4>
              </div>
              <div class="modal-body">
                <!--<p>One fine body&hellip;</p>-->
              Patient ID :    <label id="pid"></label><br />
              Patient Name : <label id="pnm"></label>
                  
              </div>
                
                  <input type="hidden" id="pid1" name="user" value="" />
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="redirect(this)">Take Patient Tests</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        
      
        </section>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
       
    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "neworder.aspx/GetDoctor",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddldoctor1 = $("[id*=IDDr]");


                    ddldoctor1.empty();
                    ddldoctor1.append($('<option/>').val('0').text('Select'));
                    $.each(r.d, function () {
                        ddldoctor1.append($('<option/>').val(this['Value']).text(this['Text']));

                    })
                }
            });
        });

        $(function () {
            $.ajax({
                type: "POST",
                url: "neworder.aspx/GetRefcenter",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddldoctor1 = $("[id*=IDref]");


                    ddldoctor1.empty();
                    ddldoctor1.append($('<option/>').val('0').text('Select'));
                    $.each(r.d, function () {
                        ddldoctor1.append($('<option/>').val(this['Value']).text(this['Text']));

                    })
                }
            });
        });

       </script>
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

            $(function () {
                //Initialize Select2 Elements
                $('.select2').select2()
            })

            function redirect(e)
            {
                var pid = document.getElementById("pid1").value;
                window.location.href = "GetTestPage.aspx?pid="+ pid ;
            }
            function validateForm(e) {

                var init = document.getElementById("IDini").value;
                var name = document.getElementById("IDname").value;
                var sex = document.getElementById("IDgender").value;
                var mobile = document.getElementById("IDmobile").value;
                var refdr = document.getElementById("IDDr").value;
                var refcenter = document.getElementById("IDref").value;
                var age = document.getElementById("IDage").value;
                var agetype = document.getElementById("IDagetype").value;
                var email = document.getElementById("IDemail").value;
                
                submitOK = "true";

                if (name == "") {
                    alert("PLEASE ENTER requred filelds");
                    submitOK = "false";
                    document.getElementById("IDname").focus();
                }
               
                else if (sex == "") {
                    alert("PLEASE ENTER requred filelds");
                    submitOK = "false";
                    document.getElementById("IDgender").focus();
                }
                else if (mobile == "") {
                    alert("PLEASE ENTER requred filelds");
                    submitOK = "false";
                    document.getElementById("IDmobile").focus();
                }
                else if (age == "") {
                    alert("PLEASE ENTER requred filelds");
                    submitOK = "false";
                    document.getElementById("IDage").focus();
                }
                else if (isNaN(age)) {
                    alert("Please enter valid age");
                    submitOK = "false";
                    document.getElementById("IDage").focus();
                }
                if (submitOK == "false") {

                    return false;
                }
                if (submitOK == "true") {
                    var cat = {};
                    

                    cat.initial = init;
                    cat.name = name;
                    cat.gender = sex;
                    cat.mobile = mobile;
                    cat.refdr = refdr;
                    cat.refcenter = refcenter;
                    cat.age = age;
                    cat.agetype=agetype
                    cat.email = email;
                  //  var isupate = $('[id$=isupdate]').val();
                   // var previousid = $('[id$=previousid]').val();
                    $.ajax({
                        type: 'POST',
                        url: 'neworder.aspx/Saveneworder',
                        data: '{cat: ' + JSON.stringify(cat) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (e) {
                           
                            $('#pid').html(e.d[0]);
                            $('#pnm').html(e.d[1]);
                            $('#pid1').attr('value', e.d[0]);
                            $('#modal-default').modal('show');
                            
                        },
                        error: function (err) {
                            
                            console.log(err);
                        }
                    });
                   // $('[id$=isupdate]').val(0);
                }
            }
           
            </script>
   </asp:Content>
