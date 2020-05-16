<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="signature.aspx.cs" Inherits="digno.signature" %>
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
          <h3 class="box-title">New Signature </h3>

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
                <label>Intial</label>
                  <select id="Testcateg" class="form-control select2 " runat="server">
                      <option selected="selected">Dr.</option>
                
                                    </select>
              </div>
                </div>
                   <div class="col-md-2">
              <div class="form-group">
                <label>Name</label>
                   <input  type="hidden" value="0" id="Actions" runat="server" />
                  <input  type="hidden" value="0" id="previousid" runat="server" />
                 <input class="form-control input-sm" id="subtest" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-2">
              <div class="form-group">
                <label>Qualification</label>
                 <input class="form-control input-sm" id="tstamount" maxlength="5" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Designation</label>
                 <input class="form-control input-sm" id="tstamount" maxlength="5" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Position</label>
                 <input class="form-control input-sm" id="tstamount" maxlength="5" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Heading of sign</label>
                 <input class="form-control input-sm" id="tstamount" maxlength="5" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" id="exampleInputFile">

                  <p class="help-block">Example block-level help text here.</p>
                </div>
                   <div class="form-group">
                <label>Signature Belongs To</label>

                       </div>
                  <div class="col-md-2">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" class="btn btn-primary" id="saveupdate" onclick="Javascript:return Savsubtest(this)"> <i class="fa fa-save"></i> Save</button>
                  
               
              
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
                  <th>Test code</th>
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
                  <td><%# Eval("Test_category_name") %> </td>
                        <td><%# Eval("Test_code") %></td>
                  <td><%# Eval("Test_name") %> </td>
                    <td><%# Eval("Amount") %> </td>
                  <%--  <td><%# Eval("Test") %> </td>
                    <td><%# Eval("Order_by") %> </td>--%>
                <td style="text-align: center; vertical-align: middle;cursor:pointer">
                <i  subtest="<%# Eval("Test_name") %>" testcatid="<%# Eval("Category_id") %>" amount="<%# Eval("Amount") %>" tstid="<%#Eval("Test_id") %>" onclick ="javascript: return edit(this)" class="fa fa-edit"></i> Edit
              </td>   
                    <td style="text-align: center; vertical-align: middle;cursor:pointer"><i status="<%# Convert.ToInt32(Eval("Status")) %>" tstid="<%#Eval("Test_id") %>" testcatid="<%# Eval("Category_id") %>"onclick="javascript: return ACTDEC(this)" class='<%# Eval("Status").ToString()  == "True" ? "fa fa-fw fa-toggle-off" : "fa fa-fw fa-toggle-on" %>'></i></td>      
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
        var categrid;
    $(document).ready(function() {
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
    $('#tstamount').keypress(function (event) {

        if (event.which != 8 && isNaN(String.fromCharCode(event.which))) {
            event.preventDefault(); //stop character from entering input
        }

    });
    function edit(obj) {
        $('[id$=subtest]').val($(obj).attr("subtest"));
        $('[id$=tstamount]').val($(obj).attr("Amount"));
        $('[id$=previousid]').val($(obj).attr("tstid"));
        categrid = $(obj).attr("testcatid");
        $('[id$=Actions]').val(1);
        $("#saveupdate").html('<i class="fa fa-save"> </i> Update');
        document.getElementById("subtest").focus();
    }
    function ACTDEC(ACTobj) {
        var cat = {};
        if ($(ACTobj).attr("status") == "0")
            cat.status = 1;
        else
            cat.status = 0;
        cat.categoryid = $(ACTobj).attr("testcatid");
        $.ajax({
            type: 'POST',
            url: 'TestCreation.aspx/savesubtest',
            data: '{cat: ' + JSON.stringify(cat) + ',Actions:' + 2 + ',prevsid:' + $(ACTobj).attr("tstid") + '}',
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

   
    function Savsubtest(e) {

        var subtest = document.getElementById("subtest").value;
        var tstamount = document.getElementById("tstamount").value;
        submitOK = "true";

        if (subtest == "" && tstamount == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("subtest").focus();
        }
        else if (tstamount != "" && subtest == "") {
            alert("PLEASE ENTER TEST");
            submitOK = "false";
            document.getElementById("subtest").focus();
        }
        else if (subtest != "" && tstamount == "") {
            alert("PLEASE ENTER AMOUNT");
            submitOK = "false";
            document.getElementById("tstamount").focus();
        }
        if (submitOK == "false") {

            return false;
        }
        if (submitOK == "true") {
            var cat = {};
            var categid = '<%= Testcateg.ClientID %>';
            cat.subtestname = subtest;
            cat.tstamount = tstamount;
            if ($('[id$=Actions]').val() == 1)
                cat.categoryid = categrid;
            else
                cat.categoryid = $('#' + categid).val();

            var Actions = $('[id$=Actions]').val();
            var previousid = $('[id$=previousid]').val();
            $.ajax({
                type: 'POST',
                url: 'TestCreation.aspx/savesubtest',
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


        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()
        })

            </script>

</asp:Content>
