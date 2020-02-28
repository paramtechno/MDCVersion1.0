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
                  <select id="Select3" class="form-control select2 ">
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
                <select id="Select4" class="form-control select2">
                    <option selected="selected">Male</option>
                  <option>Female</option>
                  <option></option>
                                    </select>
              </div>
                        </div>
           
                  <div class="col-md-2">
              
              <div class="form-group">
                <label>Email</label>
                <input class="form-control input-sm" type="text" placeholder=".input-sm"/>
              </div>
              </div>
                   
                        </div>
                    <div class="col-md-12">
                        <div class="col-md-2">
                <div class="form-group">
                  <label for="exampleInputPassword1">Age</label>
                  <input type="Age" class="form-control" id="age" placeholder="Age" />
                     <select id="Select2" class="form-control select2 ">
                      <option selected="selected">Select type</option>
                  <option>Month</option>
                  <option>Year</option>
                          <option>Day's</option>
                                    </select>
                </div>
              </div>
            <div class="col-md-2">
              <div class="form-group">
                <label>Ref Dr</label>
                  <select id="Select2" class="form-control select2 ">
                      <option selected="selected">Select Dr.</option>
                  <option>Mr.</option>
                  <option>Miss</option>
                                    </select>
                  <i class="fa fa-fw fa-plus-square"></i> ADD Dr.
              </div>
                </div>
                <div class="col-md-2">
              <div class="form-group">
                <label>Ref Center</label>
                  <select id="Select1" class="form-control select2 ">
                      <option selected="selected">Select Dr.</option>
                  <option>Mr.</option>
                  <option>Miss</option>
                                    </select>
                  <i class="fa fa-fw fa-plus-square"></i> ADD Reffrence Center
              </div>
                    </div>
                    <div class="col-md-4">
              <div class="form-group">
               <div class="form-group" style="margin-top:23px">
               <button type="button"class="btn btn-primary" data-toggle="modal" data-target="#modal-default" > <i class="fa fa-save"></i> Save</button>
                  
                <button type="submit" class="btn btn-danger"> <i class="fa fa-save"></i> Cancel</button>
              
              </div>
              </div>
                        </div>
                  
           
                 
                        </div>
              <!-- /.form-group -->
              
              <!-- /.form-group -->
            </div>
            
            
            
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
         <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Default Modal</h4>
              </div>
              <div class="modal-body">
                <p>One fine body&hellip;</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Take Patient Tests</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        
      
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
