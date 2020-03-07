<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="DrCreation.aspx.cs" Inherits="digno.DrCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
    <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
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
                <label>Dr. Name*</label>
                  <input  type="hidden" value="0" id="Actions" runat="server" />
                  <input  type="hidden" value="0" id="previousid" runat="server" />
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Mobile*</label>
                <%-- <input class="form-control input-sm" type="text" placeholder=""/>--%>
                  <input title="afsf" type="tel" id="drphone" class="form-control input-sm" maxlength="10" name="phone"/>
              </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Clinic/Hospital Name</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" class="btn btn-primary" id="savupdate" onclick="validateForm(this)"> <i class="fa fa-save"></i> Save</button>
                  
               
              
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
                 <asp:Repeater ID="doctorrpt" runat="server">
                     <HeaderTemplate>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Dr.Name</th>
                  <th>Mobile</th>   
                    <th>Address</th>
                    <th>Clinic</th>               
                  <th>Edit</th>
                    <th>Active Status</th>
                </tr>
                </thead>
                    </HeaderTemplate>
                  <ItemTemplate>
                      <tr>
                  <td><%# Eval("drname") %></td>
                  <td><%# Eval("drphone") %></td>
                   <td><%# Eval("dradress") %></td>
                     <td><%# Eval("drclicnib") %></td>
                <td style="text-align: center; vertical-align: middle;">
                <i class="fa fa-edit" style="cursor:pointer" tstname="<%# Eval("Test_category_name") %>" orderby="<%# Eval("Order_by")%>" Category_id="<%# Eval("Category_id") %>"onclick ="javascript: return edit(this)"></i> Edit
              </td>   
                    <td style="text-align: center; vertical-align: middle;"><i status="<%# Convert.ToInt32(Eval("Status")) %>" Category_id="<%# Eval("Category_id") %>" onclick="javascript: return ACTDEC(this)" class='<%# Eval("Status").ToString()  == "True" ? "fa fa-fw fa-toggle-off" : "fa fa-fw fa-toggle-on" %>'></i></td>      
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

        $('#drphone').keypress(function (event) {

            if (event.which != 8 && isNaN(String.fromCharCode(event.which))) {
                event.preventDefault(); //stop character from entering input
            }

        });
        function edit(obj) {
            $('[id$=inputcategory]').val($(obj).attr("tstname"));
            $('[id$=inputorderby]').val($(obj).attr("orderby"));
            $('[id$=previousid]').val($(obj).attr("Category_id"));
            $('[id$=Actions]').val(1);
            $("#savupdate").html('<i class="fa fa-save"> </i> Update');
            document.getElementById("inputcategory").focus();
        }
        function ACTDEC(ACTobj) {
            var cat = {};
            if ($(ACTobj).attr("status") == "0")
                cat.status = 1;
            else
                cat.status = 0;
            $.ajax({
                type: 'POST',
                url: 'DrCreation.aspx/savedoctorinfo',
                data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + 2 + ',prevsid:' + $(ACTobj).attr("Category_id") + '}',
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

        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })
        function validateForm(e) {

            var categoryname = document.getElementById("inputcategory").value;
            var orderby = document.getElementById("inputorderby").value;
            submitOK = "true";

            if (categoryname == "" && orderby == "") {
                alert("PLEASE ENTER Category NAME");
                submitOK = "false";
                document.getElementById("inputcategory").focus();
            }
            else if (orderby != "" && categoryname == "") {
                alert("PLEASE ENTER CATEGORY NAME");
                submitOK = "false";
                document.getElementById("inputcategory").focus();
            }
            else if (categoryname != "" && orderby == "") {
                alert("PLEASE ENTER ORDERBY");
                submitOK = "false";
                document.getElementById("inputorderby").focus();
            }
            else if (isNaN(orderby)) {
                alert("Please enter valid orderby");
                submitOK = "false";
                document.getElementById("inputorderby").focus();
            }
            if (submitOK == "false") {

                return false;
            }
            if (submitOK == "true") {
                var cat = {};
                cat.categoryname = categoryname;
                cat.orderby = orderby;
                var Actions = $('[id$=Actions]').val();
                var previousid = $('[id$=previousid]').val();
                $.ajax({
                    type: 'POST',
                    url: 'DrCreation.aspx/savedoctorinfo',
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

            </script>


</asp:Content>
