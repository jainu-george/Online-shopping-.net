<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    showorderitems
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Show product details</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
                                                                     <table class="table-bordered table">
                                                                         <tr>
                                                                             <th>SL NO.</th>
                                                                             <th>PRODUCT NAME</th>
                                                                              
                                                                             <th>PRICE</th>
                                                                             <th>QTY</th>
                                                                             <th>TOTAL</th> 
                                                                             
                                                                         </tr>
                                                                            
            <%
          int i = 0;
          int toatal = 0;
          foreach (var d in ViewData.Model)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                  <td><%=d.PStock.pname %></td>
           
                <td><%=d.Productdetail.price%></td>
                <td><%=d.Orderitem.quantity %></td>
                <td><%=d.Orderitem.quantity * d.Productdetail.price %></td>
                
            </tr>
            <%
              toatal += (d.Orderitem.quantity * d.Productdetail.price);
          }

   
             %>
              <tr>
                 <td></td>
                  <td colspan="3"></td>
                  <td><%= toatal %></td>
              </tr>
        </table>
   
</div>

																</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

 
</asp:Content>
