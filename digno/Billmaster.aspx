<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Billmaster.aspx.cs" Inherits="Billmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
 <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
     </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    

    <section class="content">
      <div class="row">
          
        <hr />
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:-29px">
          
          <!-- /.box -->

          <div class="box box-primary">
            <%--<div class="box-header box-primary">
             
        <%--<div class="row">
            
                <div class="col-md-8 col-sm-8 col-sx-4">
       
                        
                            <input type="text"  id="search" name="search" value="" class="form-control"  placeholder="Search By BillNo,Name,Date" />
                        
                    
            </div>

            <div class="col-sm-2 col-md-2 col-sx-4" >
                
              <button type="submit" value="Search" class="btn btn-success">Search</button>
                   </div>
                 
            </div>
      
            </div>--%>
            <!-- /.box-header -->
            <div class="row">
        <div class="col-xs-12   alert-info">
          
            

          <div class="box">
            <div class="box-header">
              
                <div class="col-md-12 col-sm-12 col-sx-12" >
                <h3 class="box-title">TODAY'S ORDERS</h3>
               <a class="btn btn-success pull-right" href="../neworder.aspx" ><i class="fa fa-plus">Add New Bill</i></a>   
                    </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
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
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>OPD
                  </td>
                  <td>202001</td>
                  <td> praveean</td>
                  <td>dd</td>
                    <td>10234
                  </td>
                  <td>450.00</td>
                  <td> print</td>
                  <td>print</td>
                </tr>
                </tbody>
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
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
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
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })




              

              //$("#example1").on('click', '#Del', function () {
              //    var currentRow = $(this).closest("tr");
              //    var col1 = currentRow.find("td:eq(0)").html();
              //    var col2 = currentRow.find("td:eq(1)").html();
              //    var col3 = currentRow.find("td:eq(2)").html();

              //    var billno = col2.trim();

              //    $("#coverScreen").show();
              //    $.ajax({
              //        type: "POST",
              //        contentType: "application/json; charset=utf-8",
              //        url: "Billmaster.aspx/DeleteCustomer",
              //        data: "{'PId':'" + billno + "'}",
              //        dataType: "json",
              //        success: function (data) {
              //            var obj = data.d;

              //            alert("Deleted Successfully");
              //            $("#coverScreen").hide();

              //        },
              //        error: function (result) {
              //            alert("Error");
              //        }
              //    });

              //});
          });
   </script>

    

    <script src="applicationJS/BillMasterJS.js"></script>
<%--<script>
    $(document).ready(function () {
        $('#example1').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
    $(function () {
        
        $('#example1').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': true
        })
    })
</script>--%>
</asp:Content>

