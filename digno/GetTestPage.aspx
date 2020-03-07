<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="GetTestPage.aspx.cs" Inherits="digno.GetTestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="content">

             

      <div class="row">
        <!-- left column -->
        <div class="col-md-12" style="margin-top:12px">
          <!-- general form elements -->
          <div class="box " >
            <div class="box-header with-border">
              <h3 class="box-title">Patient Details </h3>
         <div class="col-md-12">
                 <div class="box " >
                      <div class="box-header with-border">
                 <div class="col-md-2">Patient Id:
                     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> 
                </div>
                 <div class="col-md-2">
                     Name:
                     <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </div>
                 <div class="col-md-2">
                     Age :
                     <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </div>
                 
                 <div class="col-md-2">
                     Refered DrName:
                     <asp:Label ID="Label4" runat="server" Text="Label" ></asp:Label>
                </div>
                </div>
                     </div>
          </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">

                <hr /> 
                  <section class="content" style="min-height:100px !important">
      <div class="row" >
         <div class="col-xs-12" style="border:0.5px solid #f39c12;border-radius:10px; ">
            <div class=" ">

                <div class="col-md-3">
                <div class="form-group">
                  <label for="exampleInputEmail1">Test Category</label>
                   <select id="Testcateg" class="form-control select2 " runat="server" onchange="LoadProduct1(this.value)">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>
                 <div class="col-md-3">
                <div class="form-group">
                  <label for="exampleInputEmail1">Test</label>
                   <select id="productCategory" class="form-control" onchange="LoadProduct(this.value)">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>

            <div class="col-md-3">
              <div class="form-group">
                   <label for="exampleInputEmail1"><%# Eval("tid") %></label>
                 <label for="exampleInputEmail1">Amount</label>
                 <input type="text" class="form-control" id="AMT" placeholder="Amount">
              </div>
            </div>

                <div class="col-md-2">
                <div class="form-group">
                  <a id="add" class="btn btn-primary" style="margin-top:25px">add</a>
               
                </div>




                      </div>
                </div>
             </div>
          </div></section>

                  
        <div >
            <table class="table table-responsive" id="tb" style="width:100% ;">
             <thead>
                <tr>
                 <th style="width:10%">Slno</th>
                 <th >Test Name</th>
                 <th style="width:20%">Test Amout</th>
                 <th style="width:10%">Delete</th>
               </tr>
            </thead>
        <tbody>
            <asp:Repeater ID="rptCustomers" runat="server">
    <HeaderTemplate>
        </HeaderTemplate>
                <ItemTemplate>
            <tr style="visibility:visible">
            <td></td>
            <td><%# Eval("TesteName") %></td>
            <td class="hi"><%# Eval("TestAmt") %></td>
                <td><a data-itemId="0" href="#" class="deleteItem">Remove</a></td>
                </tr></ItemTemplate>
                </asp:Repeater>
   </tbody>



            </table>
            <span id="orderItemError" style="color:red"></span>
        </div>
                  <div style="padding:10px 0; text-align:left" class="col-md-12">
                      <div class="col-md-3">Total Amount :  <label id="amount">0.00</label></div>

                      </div>
        <div style="padding:10px 0; text-align:left" class="col-md-12">
             <div class="col-md-3">Paid Amount :  <input class="form-control input-sm" type="text" placeholder=""/></div>
               <div class="col-md-3">Discount Amount :  <input class="form-control input-sm" type="text" placeholder=""/></div>
                    <div class="col-md-3">Balance Amount :  <label id="amount">0.00</label></div>
      
          
       <div class="col-md-3">  
          <button id="saveOrder" type="submit" class="btn btn-success">Save Bill</button>
          <button type="reset" class="btn btn-danger" data-dismiss="modal" id="close">Close</button>
       </div>
              </div>
   </div>
              
                </form>
                </div>
              </div>
            </div>
          </div>
         </section>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

        <script type="text/javascript">
       var categories = []
       $(function () {
           $.ajax({
               type: "POST",
               url: "GetTestPage.aspx/GetTEST",
               data: '{}',
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
           });
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
</asp:Content>
