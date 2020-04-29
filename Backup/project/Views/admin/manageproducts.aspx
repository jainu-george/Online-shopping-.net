<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    manageproducts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
<div class="outter-wp">
								<!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage Products</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
               
               
                                                 <% Html.BeginForm("Saveproduct", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">product code</td>
                                                          
                                                              <td><input type="text" class="form-control" name="productcode"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">price</td>
                                                              <td><input type="text" class="form-control" name="price"/></td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">manufacturing_date</td>
                                                              <td><input type="text" class="form-control" name="manufacturing_date"   /></td>
                                                        </tr>
                                                        <tr>
                                                            <td> 
                                                            </td>
                                                            <td><input type="submit" value="add" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   
                          </div>
                                                             <hr />
                                                                                        
                                                                                 

                                                    
    <%try
      { %>
        <table class="table table-bordered">
            <tr>
                <th>SL.NO</th>
                <th>PRODUCTID</th>
                <th>PRODUCTCODE</th>
                <th>PRICE</th>
                <th>MANUFACTURE DATE</th>
                <th>ACTION</th>

            </tr>
            <%
          int i = 0;
          List<productdetail> plist = (List<productdetail>)ViewData["plist"];
          foreach (productdetail p in plist)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                <td><%=p.productid%></td>
                <td><%=p.productcode%></td>
                <td><%=p.price%></td>
                <td><%=p.manufacturing_date%></td>
                <td>
                  <%=Html.ActionLink("delete", "deleteproductdetail", "admin", new { productid = p.productid}, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editproductdetail", "admin", new { productid = p.productid},new { @class="btn red" } )
    %>

                </td>
            </tr>
            <%
          }

      }
      catch (Exception e)
      {
      }
             %>
        </table>
                                                             </div>
                                                    </div>
                                        </div>
  
												 
											<!--//graph-visual-->
									</div>

</asp:Content>
