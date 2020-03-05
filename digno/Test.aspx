<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>


<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <%--<script src="mynewjavaScript.js"></script>--%>

    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <section class="content">

             

      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box " >
            <div class="box-header with-border">
              <h3 class="box-title">New Bill(<input id="upins" type="hidden" value="<%= up %>" /><%= up %>)</h3>
         
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body" style="border:2px solid #f39c12;border-radius:10px; ">
                  <div class="col-md-2" >
                <div class="form-group">
                  <label for="exampleInputEmail1">Bill No.</label>
                   <%-- <asp:Label id="lblbill" runat="server"></asp:Label>--%>
                    <label id="billno" ><%= billno %><%= billno1 %></label>
                    <input id="Hiddbillno" type="hidden" value="<%= billno %><%= billno1 %>" />
                    <label for="exampleInputEmail1">PId:</label>
                    <label id="pid" ><%= pid %><%= Pid1 %></label>
                     <input id="Hiddenpid" type="hidden" value="<%= pid %><%= Pid1 %>" />
                   </div>
                 </div>

                  <div class="col-md-2">
                <div class="form-group">
                  <label for="exampleInputEmail1">Patient Name</label>
                     <input type="Name" class="form-control" id="txtname" placeholder="Enter Name" value="<%= Pname %>">
                 
                </div>
              </div>

                <div class="col-md-2">
                <div class="form-group">
                    
                  <label for="exampleInputPassword1">Mobile No</label>
                  <input type="text" class="form-control" id="txtmob" placeholder="Mobile" value="<%= PMobile %>">
                </div>
              </div>


             <div class="col-md-2">
                <div class="form-group">
                  <label for="exampleInputPassword1">Date</label>
                  <input type="date" name="date" id="date" class="form-control" required="" value="<%= Pdate %>" />  
                 </div>
              </div>


              <div class="col-md-2">
                <div class="form-group">
                  <label for="exampleInputPassword1">Age</label>
                  <input type="Age" class="form-control" id="age" placeholder="Age" value="<%= Page %>">
                </div>
              </div>

                 <div class="col-md-2">
                   <div class="form-group">
                     <label for="exampleInputPassword1">Dr.Name</label>
                     <select id="ddldoctor" class="form-control">
                                    </select>
                  </div>
                </div>
                  <div class="col-md-2">
                   <div class="form-group">
                     
                  </div>
                </div>
                  <div class="col-md-2">
                   <div class="form-group">
                     <label for="exampleInputPassword1">Gender</label>
                     <select id="Select1" class="form-control">
                     <option>Male</option>
                         <option>FeMale</option>
                    </select>
                  </div>
                </div>

             

           <div class="col-md-4">
             <div class="form-group">
               <label for="exampleInputEmail1">Address</label>
                  <input id="TextArea1"  class="form-control" value="<%= PAddress %>"></input>
              </div>
            </div>
</div>




                <section class="content" style="min-height:100px !important">
      <div class="row" >
         <div class="col-xs-12" style="border:2px solid #f39c12;border-radius:10px; ">
            <div class=" ">

                 <div class="col-md-4">
                <div class="form-group">
                  <label for="exampleInputEmail1">Test</label>
                   <select id="productCategory" class="form-control" onchange="LoadProduct(this.value)">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>

            <div class="col-md-4">
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
                 <th style="width:10%"></th>
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
          <div class="col-md-6">Total Amount :  <label id="amount">0.00</label>
       </div>
          
       <div class="col-md-6">  
          <button id="saveOrder" type="submit" class="btn btn-success">Save Bill</button>
          <button type="reset" class="btn btn-danger" data-dismiss="modal" id="close">Close</button>
       </div>
   </div>
              
          </form>
     <style >


           #tb {
    counter-reset: 0;
}

#tb tr {
    counter-increment: rowNumber;
    
}

#tb tr td:first-child::before {
   content: counter(rowNumber);
   min-width: 2em;
   margin-right: 1.5em;
  }
</style>

</div>
      </div>
       
        
      </div>

    </section>



    <script>




    </script>

    
  

             


         

 
      
                
                  
                 
      <script>
          $('#close').click(function () {

              window.location.href = 'Billmaster.aspx';
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
                var productItem = '<tr><td></td><td>' + productName + '</td><td class="hi">' + price + '</td><td style="visibility:hidden">' + tid + '</td><td><a data-itemId="0" href="#" class="deleteItem">Remove</a></td></tr>';
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


   <%-- <script type="text/javascript">
        $(document).ready(function () {
            sumadd();

        });


        </script>--%>

      <%-- <script>
           $(function () {
    $.ajax({
        type: "POST",
        url: "Test.aspx/GetAMT",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=productCategory]");


            ddlCustomers.empty();
            ddlCustomers.append($('<option/>').val('0').text('Select'));
            $.each(r.d, function () {
                ddlCustomers.append($('<option/>').val(this['Value']).text(this['Text']));

            })
          }
    });
           });

       </script>--%>

    <script type="text/javascript">
       
       var Categories = []
       function LoadProduct(categoryDD) {



           $.ajax({
               type: "POST",
               url: "Test.aspx/GetTestAmount",
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


    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "Test.aspx/GetDoctor",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var ddldoctor1 = $("[id*=ddldoctor]");


                    ddldoctor1.empty();
                    ddldoctor1.append($('<option/>').val('0').text('Select'));
                    $.each(r.d, function () {
                        ddldoctor1.append($('<option/>').val(this['Value']).text(this['Text']));

                    })
                }
            });
        });

       </script>





  <%-- <script type="text/javascript">
       $(function () {
           $.ajax({
               type: "POST",
               url: "Test.aspx/GetDoctor",
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {
                   var ddlCustomers = $("[id*=ddldoctor]");


                   ddlCustomers.empty();
                   ddlCustomers.append($('<option/>').val('0').text('Select'));
                   $.each(r.d, function () {
                       ddlCustomers.append($('<option></option>').val(this['Value']).text(this['Text']));

                   })
               }
           });
       });
</script>--%>


    


    
   <script type="text/javascript">
       var categories = []
       $(function () {
           $.ajax({
               type: "POST",
               url: "Test.aspx/GetAMT",
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
            $('#datepicker').datepicker({
                autoclose: true
            })
    </script> 









    <script>


    function saveOrder(data) {

    return $.ajax({
        
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        type: 'POST',
        url: "Test.aspx/SaveOrder",
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
    function update(data) {

        return $.ajax({

            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            type: 'POST',
            url: "Test.aspx/updateOrder",
            data: data,
            success: function (result) {
                alert("Data Saved Sucessfully");

                location.reload();
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
        name= $('#txtname').val();
        address= $('#TextArea1').val();
        billno = $('#Hiddbillno').val();
        mobil= $('#txtmob').val();
        pid = $('#Hiddenpid').val();
        if (name != '' && billno != '' && mobil != '' && pid != '') {



            $.each($("#tb tbody tr"), function () {
                orderArr.push({
                    TesteName: $(this).find('td:eq(1)').html(),
                    TestAmt: $(this).find('td:eq(2)').html(),
                    TId: $(this).find('td:eq(3)').html()

                });
            });
            if (orderArr.length > 0) {


                var data = JSON.stringify({
                    name: $('#txtname').val(),
                    address: $('#TextArea1').val(),
                    billno: $('#Hiddbillno').val(),
                    gen: $('#Select1').val(),
                    mobil: $('#txtmob').val(),
                    Dr: $("#ddldoctor option:selected").text(),
                    pid: $('#Hiddenpid').val(),
                    Page: $('#age').val(),
                    PTest: orderArr
                });
                var upis = $('#upins').val();
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
            alert("enter the Requerd filds Name/Mobile No");
        }

       
    
});
</script>



</asp:Content>

