<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    showproductdetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Show product details</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
                                                                     <table class="table-bordered">
                                                                         <tr>
                                                                             <th>SL NO.</th>
                                                                             <th>PRODUCT NAME</th>
                                                                             <th>PRODUCT CODE</th>
                                                                             <th>PRICE</th>
                                                                             <th>MANUFACTURING DATE</th>
                                                                            
                                                                             <th>ACTION</th>
                                                                         </tr>
                                                                            
            <%
          int i = 0; 
          foreach (var d in ViewData.Model)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                  <td><%=d.PStock.pname %></td>
          
                <td><%=d.Productdetail.productcode%></td>
                <td><%=d.Productdetail.price%></td>
                <td><%=d.Productdetail.manufacturing_date %></td>
               
                <td>
                  <%=Html.ActionLink("delete", "deleteproductdetails", "admin", new { productid=d.Productdetail.productid }, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editproductdetails", "admin", new { productid=d.Productdetail.productid }, new { @class = "btn red" })
    %>

             </td>
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




