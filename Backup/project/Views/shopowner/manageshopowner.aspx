<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    manageshopowner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage Shopowner</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
               
                                                 <% Html.BeginForm("Saveshoporder", "shopowner", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                       
                                                        <tr>

                                                            <td class="col-sm-4 control-label">DATE</td>
                                                          
                                                              <td><input type="date" class="form-control" name="date"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">TOTAL AMOUNT</td>
                                                              <td><input type="number"class="form-control" name="total_amount"/></td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">STATUS</td>
                                                              <td><input type="text" class="form-control" name="status"   /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">REMARKS</td>
                                                            <td><input type="text"class="form-control" name="remarks" /></td>
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
                <th>SL NO.</th>
                <th>DATE</th>
                <th>TOTAL AMOUNT</th>
                <th>STATUS</th>
                <th>REMARKS</th>
                
 <th>ACTION</th>

            </tr>
            <%
          int i = 0;
          List<shoporder>orderlist = (List<shoporder>)ViewData["orderlist"];
          foreach (shoporder h in orderlist)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                <td><%=h.date%></td>
                <td><%=h.total_amount%></td>
                <td><%=h.status%></td>
                <td><%=h.remarks %></td>
                  
                <td>
                  <%=Html.ActionLink("delete", "deleteshoporder", "shopowner", new { shoporderid =h.shoporderid }, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editshoporder", "shopowner", new { shoporderid =h.shoporderid}, new { @class = "btn red" })
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


