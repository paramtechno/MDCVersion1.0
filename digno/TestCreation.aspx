<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="TestCreation.aspx.cs" Inherits="digno.TestCreation" %>
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
          <h3 class="box-title">New Test </h3>

          <%--<div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>--%>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
              <div class="col-md-12">
            
                <%--<div class="col-md-3">
              <div class="form-group">
                <label>Type</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>--%>
                       <div class="col-md-2">
              <div class="form-group">
                <label>Test Category</label>
                  <select id="Testcateg" class="form-control select2 " runat="server">
                      <option selected="selected">Select Test</option>
                  <option>test1</option>
                  <option>test2</option>
                                    </select>
              </div>
                </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Test</label>
                 <input class="form-control input-sm" id="subtest" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Amount</label>
                 <input class="form-control input-sm only-numeric" id="tstamount" maxlength="5" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" class="btn btn-primary" onclick="Savsubtest(this)"> <i class="fa fa-save"></i> Save</button>
                  
               
              
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
                 <asp:Repeater ID="subtestrept" runat="server">
                     <HeaderTemplate>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>TestType</th>
                  <th>Test Name</th>   
                    <th>Amount</th>               
                  <th style="text-align: center; vertical-align: middle;">Edit</th>
                    <th style="text-align: center; vertical-align: middle;">Active Status</th>
                </tr>
                </thead>
                   </HeaderTemplate>
            <ItemTemplate>        
                    <tr>
                  <td><%# Container.ItemIndex + 1 %></td>
                  <td><%# Eval("Test_id") %> </td>
                  <td><%# Eval("Test_name") %> </td>
                    <td><%# Eval("Amount") %> </td>
                  <%--  <td><%# Eval("Test") %> </td>
                    <td><%# Eval("Order_by") %> </td>--%>
                <td style="text-align: center; vertical-align: middle;">
                <i class="fa fa-edit"></i> Edit
              </td>   
                    <td style="text-align: center; vertical-align: middle;"><i class="fa fa-fw fa-toggle-on"></i></td>      
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
    $(document).ready(function() {
      $(".only-numeric").bind("keypress", function (e) {

          var keyCode = e.which ? e.which : e.keyCode
          if (!(keyCode >= 48 && keyCode <= 57)) {

            $(".error").css("display", "inline");

            return false;

          }else{

            $(".error").css("display", "none");

          }

      });

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
   
    function Savsubtest(e) {

        var subtest = document.getElementById("subtest").value;
        var tstamount = document.getElementById("tstamount").value;
        submitOK = "true";

        if (subtest == "" && tstamount == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("inputcategory").focus();
        }
        else if (tstamount != "" && subtest == "") {
            alert("PLEASE ENTER CATEGORY NAME");
            submitOK = "false";
            document.getElementById("inputcategory").focus();
        }
        else if (subtest != "" && tstamount == "") {
            alert("PLEASE ENTER ORDERBY");
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
            var isupate = $('[id$=isupdate]').val();
            var previousid = $('[id$=previousid]').val();
            $.ajax({
                type: 'POST',
                url: 'Testtype.aspx/SaveType',
                data: '{cat: ' + JSON.stringify(cat) + ',isupdate:' + isupate + ',prevsid:' + previousid + '}',
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
            $('[id$=isupdate]').val(0);
        }
    }


        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })

            </script>


</asp:Content>
