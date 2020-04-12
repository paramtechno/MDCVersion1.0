<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bills.aspx.cs" Inherits="digno.bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
 <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
    
     `
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <section class="content">
      <div class="row">
          <hr />
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:-29px">
          
          <!-- /.box -->

          <div class="box box-primary">
           
          
           
            <div class="row">
        <div class="col-xs-12">
          
            

          <div class="box">
            <div class="box-header">
              
                <div class="col-md-12 col-sm-12 col-sx-12" >
                <h3 class="box-title">BILL'S LIST</h3>
              <%-- <a class="btn btn-success pull-right" href="../neworder.aspx" ><i class="fa fa-plus">Add New Bill</i></a>   --%>
                    </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <%--  <asp:Repeater ID="Billrept" runat="server">
                     <HeaderTemplate>--%>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Name</th>
                     
                  <th>Ref Dr.</th>
                  <th>Ref Center</th>
                    <th>Bill No</th>
                    <th>Bill Type</th>
                    <th>Bill Date</th>
                    <th>Paid/Due</th>
                     <th>Status</th>
                    <th>Total Amount</th>
                    <th>Action</th>
                </tr>
                </thead>
                 <%-- </HeaderTemplate>--%>
            <%--<ItemTemplate>  --%>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>OP </td>
                  <td>asdf</td>
                  <td>asd</td>
                  <td>aa</td>
                    <td>aaa
                  </td>
                  <td>450.00</td>
                  <td> print</td>
                  <td>print</td>
                    <td> print</td>
                  <td>print</td>
                </tr>
                </tbody>
                  <%-- </ItemTemplate>--%>
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
                  <%-- <FooterTemplate>--%>
        </table>
   <%-- </FooterTemplate>
                    </asp:Repeater>--%>
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
       var categories = []
       function LoadTEST(categoryDD) {
           $.ajax({
               type: "POST",
               url: "GetTestPage.aspx/GetTEST",
               data: '{categoryid: "' + categoryDD + '"}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                   categories = r;
                   var ddlCustomers = $("[id*=productCategory]");
                   ddlCustomers.empty().append('<option selected="selected" value="0">Please select</option>');
                   $.each(r.d, function () {
                       ddlCustomers.append($("<option></option>").val(this['Value']).html(this['Text']));
                   });
               }
           });
           };
     </script>  
       
    <script type="text/javascript">
       
       var Categories = []
       function LoadProduct(categoryDD) {
           $.ajax({
               type: "POST",
               url: "GetTestPage.aspx/GetTestAmount",
               data: '{testid: "' + categoryDD + '"}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                  
                   if (r.d != '') {
                      
                       var user = JSON.parse(r.d);
                       var sel = document.getElementById('AMT');
                       sel.value = user.amount;
                      // $('#lblId').html(user.Id);
                      // $('#lblName').html(user.Name);
                   }
                  // else {
                     //  $('#lblId').html('no datafound');
                      // $('#lblName').html('');
                  // }
               }
           });
       }



       function changebal() {
           var billamt = document.getElementById('amount').value;
           var paidamt = document.getElementById('pamt').value;
           var discount = document.getElementById('disamt').value;
           var balance = parseInt(billamt) - (parseInt(paidamt) + parseInt(discount));
           var bal = isNaN(balance) ? 0 : parseInt(balance);
           document.getElementById('Bamount').value = bal;
           document.getElementById('Bamount').innerHTML = bal;
       }
       function saveOrder(data) {

           return $.ajax({

               contentType: 'application/json; charset=utf-8',
               dataType: 'json',
               type: 'POST',
               url: "GetTestPage.aspx/SaveOrder",
               data: data,
               success: function (result) {
                   alert("Data Saved Sucessfully");
                   window.location.href = "Billmaster.aspx";

               },
               error: function (result) {
                   alert(result)
               }
           });
       }


       $("#saveOrder").click(function (e) {






           e.preventDefault();

           var orderArr = [];
           orderArr.length = 0;


           var pid = "";
              
           if (pid != '') {

               $.each($("#tb tbody tr"), function () {
                   orderArr.push({
                       TesteName: $(this).find('td:eq(1)').html(),
                       TestAmt: $(this).find('td:eq(2)').html(),
                       TId: $(this).find('td:eq(4)').html(),
                       catId: $(this).find('td:eq(5)').html()
                   });
               });
               if (orderArr.length > 0) {


                   var data = JSON.stringify({
                       paid: $('#pamt').val(),
                       totalamt: $('#amount').val(),
                       discount: $('#disamt').val(),
                       pid:pid,
                       PTest: orderArr
                   });
                  // var upis = $('#Actions').val();
                   var upis = "insert";
                   if (upis == "insert") {
                       $.when(saveOrder(data)).then(function (response) {

                           console.log(response);
                       }).fail(function (err) {
                           console.log(err);
                       });
                   }
                   else {
                       $.when(update(data)).then(function (response) {

                           console.log(response);

                       }).fail(function (err) {
                           console.log(err);
                       });
                   }
               }
               else {
                   alert("Select Atleast One Test");
               }


           }
           else {
               alert("enter the Requerd filds pid");
           }



       });



   </script>
       <script type="text/javascript">
       
        $('#add').click(function () {
            //validation and add order items







            var isAllValid = true;
            // alert($('#productCategory').val())

            if ($('#productCategory').val() == "0") {
                isAllValid = false;
                $('#productCategory').siblings('span.error').css('visibility', 'visible');
            }
            else {
                $('#productCategory').siblings('span.error').css('visibility', 'hidden');
            }

            if ($('#AMT').val() == "0" || $('#AMT').val() == "") {
                isAllValid = false;
                $('#AMT').siblings('span.error').css('visibility', 'visible');
            }
            else {
                $('#AMT').siblings('span.error').css('visibility', 'hidden');
            }

            //if (!($('#quantity').val().trim() != '' && (parseInt($('#quantity').val()) || 0))) {
            //    isAllValid = false;
            //    $('#quantity').siblings('span.error').css('visibility', 'visible');
            //}
            //else {
            //    $('#quantity').siblings('span.error').css('visibility', 'hidden');
            //}

            //if (!($('#rate').val().trim() != '' && !isNaN($('#rate').val().trim()))) {
            //    isAllValid = false;
            //    $('#rate').siblings('span.error').css('visibility', 'visible');
            //}
            //else {
            //    $('#rate').siblings('span.error').css('visibility', 'hidden');
            //}

            if (isAllValid) {
                var table = document.getElementById("tb");
                //var row = table.insertRow(1);


                //var cell1 = row.insertCell(0);
                //var cell2 = row.insertCell(1);
                

            var sel = document.getElementById('productCategory');
            var opt = sel.options[sel.selectedIndex];
            var sel1 = document.getElementById('AMT');

            //cell1.innerHTML = opt.text;
            //cell2.innerHTML = sel1.value;


                var productName = opt.text,
                    tid=opt.value,
              price = sel1.value,

                detailsTableBody = $("#tb tbody");
                var productItem = '<tr><td></td><td>' + productName + '</td><td class="hi">' + price + '</td><td><a data-itemId="0" href="#" class="deleteItem">Remove</a></td> <td style="display:none">' + tid + '</td></tr>';
            detailsTableBody.append(productItem);
            sumadd();
            changebal();
            clearItem();




        }
            function sumadd() {
                var sum = 0;
                var table = document.getElementById("tb");
                var ths = table.getElementsByTagName('th');
                var tds = table.getElementsByClassName('hi');
                for (var i = 0; i < tds.length; i++) {
                    sum += isNaN(tds[i].innerText) ? 0 : parseInt(tds[i].innerText);
                }

                //var row = table.insertRow(table.rows.length);
                //var cell = row.insertCell(0);
                //cell.setAttribute('colspan', ths.length);

                //var totalBalance = document.createTextNode('Total Balance ' + sum);
                //cell.appendChild(totalBalance);
                document.getElementById('amount').innerHTML = sum;
                document.getElementById('amount').value = sum;
            }


            function clearItem() {
                $("#productName").val('');
                $("#price").val('');
                $("#quantity").val('');
            }
            // After Add A New Order In The List, If You Want, You Can Remove It.
            $(document).on('click', 'a.deleteItem', function (e) {
                e.preventDefault();
                var $self = $(this);
                if ($(this).attr('data-itemId') == "0") {
                    $(this).parents('tr').css("background-color", "#ff6347").fadeOut(800, function () {
                        $(this).remove();
                        sumadd();
                    });
                }
            });

          })

        
        sumadd();
        
</script>

     
    <script type="text/javascript">



        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })








            </script>

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
