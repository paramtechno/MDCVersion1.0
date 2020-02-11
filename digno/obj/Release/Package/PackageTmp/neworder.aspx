<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="neworder.aspx.cs" Inherits="digno.neworder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>

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
                  <select id="Select1" class="form-control select2 ">
                      <option selected="selected">Select Test</option>
                  <option>Mr.</option>
                  <option>Miss</option>
                                    </select>
              </div>
                </div>
                <div class="col-md-2">
              <div class="form-group">
                <label>Name</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                    <div class="col-md-2">
              <div class="form-group">
                <label>Mobile</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>
              </div>
                        </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Gender</label>
                <select id="Select2" class="form-control select2">
                    <option selected="selected">Male</option>
                  <option>Female</option>
                  <option></option>
                                    </select>
              </div>
                        </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label>Patient No</label>
                <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                        </div>
                  <div class="col-md-2">
              
              <div class="form-group">
                <label>Email</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>
              </div>
              </div>
                        </div>
                   
              <!-- /.form-group -->
              
              <!-- /.form-group -->
            </div>
            <div class="row">
              <div class="col-md-12">
            <div class="col-md-6">
               <div class="col-md-2">
              <div class="form-group">
                <label>age</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>y
              </div></div>
                        <div class="col-md-2">
              <div class="form-group">
                <label></label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>m
              </div>
                  </div>
                  <div class="col-md-2">
              <div class="form-group">
                <label></label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>D
              </div>
                  </div>
                </div>
               <div class="col-md-6">
            <div class="col-md-4">
              <div class="form-group">
                <label>Initial</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                </div>
                <div class="col-md-4">
              <div class="form-group">
                <label>Name</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                    <div class="col-md-4">
              <div class="form-group">
                <label>Mobile</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>
              </div>
                        </div>
                  
                  
                  
                        </div>
                  
                        </div>
                   
              <!-- /.form-group -->
              
              <!-- /.form-group -->
                
            </div>
            <div class="col-md-12">
            <div class="col-md-4">
              <div class="form-group">
                <label>Type</label>
                  <select id="ddldoctor" class="form-control select2">
                                    </select>
              </div>
                </div>
                <div class="col-md-4">
              <div class="form-group">
                <label>TEST Name</label>
                <select class="form-control select2" style="width: 100%;">
                  <option selected="selected">Select Test</option>
                  <option>Alaska</option>
                  <option>California</option>
                  <option>Delaware</option>
                  <option>Tennessee</option>
                  <option>Texas</option>
                  <option>Washington</option>
                </select>
              </div>
                    </div>
                    <div class="col-md-2">
              <div class="form-group">
                <label>Amount</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>
              </div>
                        </div>
                  
                  <div class="col-md-2">
              <div class="form-group">
               <button type="submit" class="btn btn-primary">add</button>
              </div>
                        </div>
                  
                        </div>
             <div class="col-md-12"  >
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
          <button id="saveOrder" type="submit" class="btn btn-success">Save Order</button>
          <button type="reset" class="btn btn-danger" data-dismiss="modal" id="close">Close</button>
       </div>
   </div>
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        
        
      
        </section>
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
    <script type="text/javascript">
       


            $(function () {
                //Initialize Select2 Elements
                $('.select2').select2()
            })
           
            </script>
   </asp:Content>
