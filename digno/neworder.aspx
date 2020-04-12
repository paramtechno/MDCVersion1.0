<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="neworder.aspx.cs" Inherits="digno.neworder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
     <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
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

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">New Order</h3>

         
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row" >
               <section class="content" style="min-height:100px !important">

              <div class="col-xs-12" style="border:0.5px solid #d2d6de;border-radius:1px;  ">

              <div class="col-md-12" >
            <div class="col-md-1">
              <div class="form-group">
                <label>Initial</label>
                  <select id="IDini" class="form-control select2 ">
                      <option selected="selected">Mir</option>
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
                <label>Mobile*</label>
                <input class="form-control input-sm" type="text" id="IDmobile" placeholder=".input-sm"/>
              </div>
                        </div>
                  <div class="col-md-1">
              <div class="form-group">
                <label>Gender*</label>
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
                   <div class="col-md-2">
              <div class="form-group">
                <label>Ref Dr</label>
                  <select id="IDDr" class="form-control select2 " >
                      
                                    </select>
           
              </div>
                </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Ref Center</label>
                  <select id="IDref" class="form-control select2 ">
                      
                                    </select>
              
              </div>
                    </div>
                        </div>
                    <div class="col-md-12">
                          
                        <div class="col-md-4">
                          
                <div class="form-group">
                     
                  
                    <div class="col-md-2">
                   Years
                  <input type="Age" class="form-control" id="IDage" placeholder="Yrs" style="width:80px; " />

                    </div>
                     <div class="col-md-2" style="padding-left:60px">
                         Months
                     <input type="Age" class="form-control" id="Idyrs" placeholder="Months"  style="width:80px;"/></div>
                     <div class="col-md-2" style="padding-left:80px">
                         Days
                     <input type="Age" class="form-control" id="IDmonth" placeholder="Days" style="width:80px;" /></div>
                    <%-- <select id="IDagetype" class="form-control select2 ">
                      <option selected="selected">Year</option>
                  <option>Month</option>
                  <option>Year</option>
                          <option>Day's</option>
                                    </select>--%>
                         </div>
                </div>
             
            
                <div class="col-md-8" >
                     <div class="col-md-4">
              <div class="form-group" style="padding-top:15px">
             
                   <div data-toggle="modal" data-target="#Drmodel" style="float:right">     <i class="fa fa-fw fa-plus-square"></i> ADD Dr.</div>
              </div>
                    </div>
                    <div class="col-md-4" style="padding-top:15px">
              <div class="form-group">
                <div data-toggle="modal" data-target="#Refmodel" style="float:right">  <i class="fa fa-fw fa-plus-square" ></i> ADD Reff Center</div> 
              </div>
                        </div>
                </div>
                   
                  
           
                 
                        </div>
              <!-- /.form-group -->
              
              <!-- /.form-group -->
                  </div>
          </section>
            

            
            
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          <div class="row">
        <div class="col-xs-12">
          
              <section class="content" style="min-height:100px !important">
      <div class="row" >
         <div class="col-xs-12" style="border:0.5px solid #d2d6de;border-radius:1px; ">
            <div class=" ">

                <div class="col-md-3">
                <div class="form-group">
                  <label for="exampleInputEmail1">Test Category</label>
                   <select id="Testcateg" class="form-control select2 " runat="server" onchange="LoadTEST(this.value)">
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
          </div>

                  
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
                 <td class="hi"><%# Eval("TestAmt") %></td>
                 <td class="hi"><%# Eval("TestAmt") %></td>
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
             <div class="col-md-3">Paid Amount :  <input id="pamt" class="form-control input-sm" type="text" placeholder=""  value="0.0"  onkeyup="changebal()"/></div>
               <div class="col-md-3">Discount Amount :  <input id="disamt" class="form-control input-sm" type="text" placeholder=""   value="0.0"  onkeyup="changebal()"/></div>
                    <div class="col-md-3">Balance Amount :  <label id="Bamount" value="0.0">0.00</label></div>
      
          
       <div class="col-md-3">  
            <input  type="hidden" value="0" id="Actions" runat="server" />
          <button id="saveOrder" type="submit" class="btn btn-success">Save Bill</button>
          <button type="reset" class="btn btn-danger" data-dismiss="modal" id="close">Close</button>
          
             <%--  <button type="button"class="btn btn-primary" onclick="validateForm(this);"> <i class="fa fa-save"></i> Save</button>
                  
                <button type="submit" class="btn btn-danger"> <i class="fa fa-save"></i> Cancel</button>--%>
              
              
       </div>
              </div>
  
              
               
                
          
        
         </section>

         
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
             //   url: "neworder.aspx/GetRefcenter",
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
                    return true;
                }
            }
           
            </script>

    
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
               url: "neworder.aspx/SaveOrder",
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




           var init = document.getElementById("IDini").value;
           var name = document.getElementById("IDname").value;
           var sex = document.getElementById("IDgender").value;
           var mobile = document.getElementById("IDmobile").value;
           var refdr = document.getElementById("IDDr").value;
           var refcenter = document.getElementById("IDref").value;
           var age = document.getElementById("IDage").value;
           // var agetype = document.getElementById("IDagetype").value;
           var email = document.getElementById("IDemail").value;
           var Paidamt = document.getElementById("pamt").value; 
           var totalamt = document.getElementById("amount").value; 
           var Discount = document.getElementById("disamt").value;
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
               cat.Patient_name = name;
               cat.gender = sex;
               cat.mobile = mobile;
               cat.refdr = refdr;
               cat.refcenter = refcenter;
               cat.age = age;
              // cat.agetype = agetype;
               cat.email = email;

               cat.Paidamt = Paidamt;
               cat.totalamt = totalamt;
               cat.Discount = Discount;














               e.preventDefault();

               var orderArr = [];
               orderArr.length = 0;


            //   var pid = "";
            //   if (pid != '') {

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
                          
                           PTest: orderArr,
                           cat:cat
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


             //  }
            //   else {
            //       alert("enter the Requerd filds pid");
             //  }


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

           

            if (isAllValid) {
                var table = document.getElementById("tb");
               
                

                var sel = document.getElementById('productCategory');
                var opt = sel.options[sel.selectedIndex];
                var sel1 = document.getElementById('AMT');

           

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

        });
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

        
        
       
        
</script>
   </asp:Content>
