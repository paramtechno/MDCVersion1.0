<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="GetTestPage.aspx.cs" Inherits="digno.GetTestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                 <div class="col-md-2">Bill No:
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
                 <%--<div class="col-md-2">
                     City :
                     <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </div>--%>
                 <div class="col-md-2">
                     Ref Dr.
                     <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
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
</asp:Content>
