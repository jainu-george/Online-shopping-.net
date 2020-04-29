<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    orderitems
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">View ordered items</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
                                                                     <table class="table-bordered">
                                                                         <tr>
                                                                             <th>SL NO.</th>
                                                                             <th>PRODUCT NAME</th>
                                                                              
                                                                             
                                                                             <th>QUANTITY</th>
                                                                             <th>PRICE</th>
                                                                            
                                                                             <th>TOTAL AMOUNT</th>
                                                                         </tr>
                                                                            
            <%
          int i = 0; 
          foreach (var y in ViewData.Model)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                  <td><%=y.PStock.pname %></td>
            <td><%=y.Orderitem.quantity %></td>
                <td><%=y.Productdetail.price%></td>
                <td><%=y.Orderitem.quantity * y.Productdetail.price %></td>
             
   

         
            </tr>
            <%
          }

   
             %>
        </table>

</div>

																</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

 

</asp:Content>


