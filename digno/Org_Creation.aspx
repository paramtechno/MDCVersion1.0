<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Org_Creation.aspx.cs" Inherits="digno.Org_Creation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css"/>
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
            
                <div class="col-md-3">
              <div class="form-group">
                <label>Type</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Test</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                   <div class="col-md-3">
              <div class="form-group">
                <label>Amount</label>
                 <input class="form-control input-sm" type="text" placeholder=""/>
              </div>
                    </div>
                  <div class="col-md-3">
              <div class="form-group" style="margin-top:23px">
               <button type="submit" class="btn btn-primary"> <i class="fa fa-save"></i> Save</button>
                  
               
              
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
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>TestType</th>
                  <th>Test Name</th>   
                    <th>Amount</th>               
                  <th>Edit</th>
                    <th>Active Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>OPD </td>
                   <td>blood sugar</td>
                     <td>100</td>
                  <td><span class="label label-success">Approved</span></td>
                          <td>
                <i class="fa fa-edit"></i> Edit
              </td>   
                    <td><i class="fa fa-fw fa-toggle-on"></i></td>      
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
