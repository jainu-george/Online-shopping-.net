<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ShowProductStock
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Show product stock</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
                                                                     <table class="table-bordered">
                                                                         <tr>
                                                                             <th>SL NO.</th>
                                                                             <th>CATEGORY</th>
                                                                             <th>PRODUCT NAME</th>
                                                                             <th>DESCRIPTION</th>
                                                                             <th>PICTURE</th>
                                                                             <th>QUANTITY</th>
                                                                             <th>ACTION</th>
                                                                         </tr>
                                                                            
            <%
          int i = 0;
         
          foreach (var ps in ViewData.Model)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                <td><%=ps.Category.catname%></td>
             <td><%=ps.PStock.pname %></td>
                  <td><%=ps.PStock.discription%></td>
                <td>
                    <img src="../../Uploads/<%=ps.PStock.picture %>" class="img-resposive img-thumbnail"  width="100" /></td>
                    <td><%=ps.PStock.stockquantity%></td>
               
                <td>
                  <%=Html.ActionLink("delete", "deleteproductstock", "admin", new { productstockid = ps.PStock.productstockid }, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editproductstock", "admin", new { productstockid=ps.PStock.productstockid }, new { @class = "btn red" })
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

