<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="TestParameters.aspx.cs" Inherits="digno.TestParameters" %>

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
              <h3 class="box-title">Parameters Details </h3>
                

         <div class="col-md-12">
                 <div class="box " >
                      <div class="box-header with-border">
                 
                 <div class="col-md-6
                  ">
                     <h4>Test Name:</h4>
                   <h4> <b> <asp:Label ID="Testname" class="agile-label"  runat="server" Text="Label"></asp:Label></b></h4>
                    <%-- <label class="agile-label" for="test-name" ID="Testname" runat="server"></label>
                 --%>    <asp:HiddenField ID="Testid" runat="server" />
                </div>
                          <div class="col-md-2">
                              <div data-toggle="modal" data-target="#Drmodel" style="float:right"> 
                                <a id="add" class="btn btn-primary" style="margin-top:25px">New Parametrs</a></div>
                    
                </div>
                 
                </div>
                     </div>
          </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">

                <hr /> 
                  <section class="content" style="min-height:100px !important">
      
                
              

                  
        <div >
            
           <asp:Repeater ID="Billrept" runat="server" >
                     <HeaderTemplate>
            <table class="table table-responsive" id="tb" style="width:100% ;">
             <thead>
                <tr>
                 <th style="width:10%">Slno</th>
                   
                 <th style="width:10%">Parameter Name</th>
                             
                <%--<th style="width:10%">Add Parameters</th>--%>
                <th style="width:10%">Method</th>
                     <th style="width:10%">Gender</th>
                     <th style="width:10%">Units</th>
                     <th style="width:10%">Details</th>
                      <th style="width:10% ;display:none">Pa ID</th>
                
               </tr>
            </thead>
       
      </HeaderTemplate>
                <ItemTemplate>
                     <tbody>
           <td><%# Container.ItemIndex + 1 %></td>
                 
                <td><%# Eval("Parameter_name") %></td>
                <td><%# Eval("Exam_method") %></td>
                <td><%# Eval("Gender") %></td>
                <td><%# Eval("Units") %></td>


                  <td>
                      
                       
                               
                      <div data-toggle="modal" data-target="#Testrangeid" style="float:right"  >
                     
                           <a class="btn btn-primary btn-xs"  runat="server" OnClientClick='Javascript:return setpid(<%# Eval("parameter_id") %>,<%# Eval("Parameter_name") %>);' >T Edit</a></div>
                           </div>
                      
                            <div data-toggle="modal" data-target="#Drmodel" style="float:right">
                        <a class="btn btn-primary btn-xs" > Edit</a></div>
                  </td>



                       <td style="display:none"><%# Eval("parameter_id") %></td>
                  
                  
                  
                 
                  
            
                          </tbody></ItemTemplate>
                <FooterTemplate>
        </table>
   </FooterTemplate>
                </asp:Repeater>
        </div>
                
         </section>
                </form>
              </div>
   </div>
              
               
                </div>
              </div>
            

        <div class="modal fade" id="Drmodel"  >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:620px">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Test Parameters</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="row" >
         <div class="col-xs-12"  ">
            <div class=" ">
            
                <div class="col-md-12">
                
                 <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Parameter Name</label>
                   <input class="form-control input-sm" type="text" id="parname" placeholder="Parameter Name"/>
                   
                 </div>
              </div>

                    <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Examintaion Method</label>
                   <select id="TC" class="form-control select2 " runat="server">
                     <option>Select Test</option>
                        <option>chemical exmition</option>
                        <option>Physical Ezmiation</option>
                        <option>test</option>
                        <option>Select Test</option>
                   </select>
                 </div>
              </div>
                    </div>
                 <div class="col-md-12">
            <div class="col-md-6">
              <div class="form-group">
                  <label for="exampleInputEmail1">Gender</label>
                   <select id="GN" class="form-control select2 " runat="server">
                     <option selected="">Male</option>
                       <option>Female</option>
                       <option>Both</option>
                   </select>
              </div>
            </div>
                     <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Units</label>
                   <select id="UN" class="form-control select2 " runat="server">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>
                
</div>
                
              

          </div>
                </div>
             </div>
          </div>
              </div>
             
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="Javascript:return Savetestparameters(this)">Save changes</button>
      </div>
      </div>
    </div>
  </div>


        <div class="modal fade" id="Testrange"  style="z-index: 1600;" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:620px">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Test Parameters Ranges</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="row" >
         <div class="col-xs-12"  ">
            <div class=" ">
            
                <div class="col-md-12">
                
                 <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Minmum Value</label>
                   <input class="form-control input-sm" type="text" id="Minval" placeholder="Minmum Value"/>
                   
                 </div>
              </div>

                    <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Maxmum Value</label>
                   <input class="form-control input-sm" type="text" id="Maxval" placeholder="Maxmum value"/>
                  
                 </div>
              </div>
                    <div>OR</div>
                    <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Text Value</label>
                   <input class="form-control input-sm" type="text" id="RTV" placeholder="Result"/>
                   
                 </div>
              </div>
                    </div>
                 <div class="col-md-12">
            <div class="col-md-6">
              <div class="form-group">
                  <label for="exampleInputEmail1">Gender</label>
                   <select id="Rsex" class="form-control select2 " runat="server">
                     <option selected="">Male</option>
                       <option>Female</option>
                       <option>Both</option>
                   </select>
              </div>
            </div>
                     <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Units</label>
                   <select id="RUIN" class="form-control select2 " runat="server">
                     <option>Select Test</option>
                   </select>
                 </div>
              </div>
                
</div>
                <div class="col-md-12">
            <div class="col-md-6">
              <div class="form-group">
                  <label for="exampleInputEmail1">Noraml values</label>
                    <input class="form-control input-sm" type="text" id="RNV" placeholder="Normal Value"/>
                
              </div>
            </div>
                     <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">Special Condition</label>
                   <input class="form-control input-sm" type="text" id="RSC" placeholder="Special Condition"/>
                 </div>
              </div>
                
</div>
                 <div class="col-md-12">
                      <div class="col-md-4">
                      <div class="form-group">
                  <label for="exampleInputEmail1">Minmum Age</label>
                   <input class="form-control input-sm" type="text" id="MinAg" placeholder="Minmum Age"/>
                  
                 </div>
                          </div>
                       <div class="col-md-4">
                      <div class="form-group">
                  <label for="exampleInputEmail1">Maxmum Age</label>
                   <input class="form-control input-sm" type="text" id="MaxAg" placeholder="Maxmum Age"/>
                  
                 </div>
                           </div>
                       <div class="col-md-4">
                     <div class="form-group">
                  <label for="exampleInputEmail1">Age Type</label>
                   <select id="AGETY" class="form-control select2 " runat="server">
                     <option selected="">Days</option>
                       <option>Month</option>
                       <option>Years</option>
                   </select>
              </div>
                           </div>
                     </div>
                
              

          </div>
                </div>
             </div>
          </div>
              </div>
             
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  onclick="Javascript:return SavetestparametersRange(this)" >Save changes</button>
      </div>
      </div>
    </div>
  </div>






        <div class="modal fade" id="Testrangeid" style="z-index: 1400;"  >
            <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:620px">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel11">Test Parameters Ranges</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="box-body">
          <div class="row">
              <div class="row" >
         <div class="col-xs-12"  ">
  <iframe id="testrangesid" src="abc.html" ></iframe>
             </div>
                  </div>
              </div>
             </div>
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
       function LoadTEST(categoryDD) {
           $.ajax({
               type: "POST",
               url: "TestParameters.aspx/GetTEST",
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
       }

       function setpid(pid, pname)
       {
        var parname = pname;
        var prid = pid;
        var testname = '<%= Testname.ClientID %>';
           var url = "testranges.aspx?pridval="+ prid +"&valparname="+ pname +"";
       
           $('#abc_frame').attr('src', url)
           return false;
<%--            $('#<%=btnSubmit.ClientID %>').click();--%>
       }

         function Savetestparameters(e) {

             var parname = document.getElementById("parname").value;
             var exmethod = '<%= TC.ClientID %>';
             var unit = '<%= UN.ClientID %>';
             var Gender = '<%= GN.ClientID %>';




        submitOK = "true";

        if (parname == "" ) {
            alert("PLEASE ENTER Parameter Name ");
            submitOK = "false";
            document.getElementById("parname").focus();
        }
        else if ($('#' + exmethod).val() == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("TC").focus();
        }
        else if ($('#' + unit).val() == "") {
            alert("PLEASE ENTER Unit");
            submitOK = "false";
            document.getElementById("UN").focus();
        }
        else if ($('#' + Gender).val() == "") {
            alert("PLEASE ENTER Gender");
            submitOK = "false";
            document.getElementById("GN").focus();
        }
        if (submitOK == "false") {

            return false;
        }
        if (submitOK == "true") {
            var cat = {};
            var Testid = '<%= Testid.ClientID %>';
            cat.tid = $('#' + Testid).val();
            cat.parname = parname;
            cat.exmtd = $('#' + exmethod).val();
            cat.unit = $('#' + unit).val();
            cat.gender = $('#' + Gender).val();
            
            $.ajax({
                type: 'POST',
                url: 'TestParameters.aspx/Saveparameters',
                data: '{cat: ' + JSON.stringify(cat) + '}',
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

<%--        <script type="text/javascript">
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

        
        sumadd();--%>
        
<%--</script>--%>

</asp:Content>
