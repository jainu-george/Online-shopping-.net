<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editshoporderAction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Edit shop order details</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
											
                 <%
                     List<shoporder> orderlist = (List<shoporder>)ViewData["shoporder"];
                foreach(shoporder h in orderlist)
                 {%> 
               
                                                 <% Html.BeginForm("editshoporderAction", "shopowner", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class ="col-sm-4 control-label">DATE</td>
                                                            <td><input type="date"class="form-control" name="date" value="<%=h.date%>"/></td></tr>
                                                            <tr><td><input type="hidden" name="shoporderid" value="<%=h.shoporderid%>" /></td></tr>
                                                        <tr><td><input type="hidden" name="shopid" value="<%=h.shopid%>" /></td></tr>

                                                            <tr><td class="col-sm-4 control-label">TOTAL AMOUNT</td>
                                                                
                                                            <td><input type="number" class="form-control" name="total_amount" value="<%=h.total_amount %>" /></td></tr>
                                                        <tr><td class="col-sm-4 control-label">STATUS</td>
                                                            <td><input type="text"class="form-control" name="status" value="<%=h.status %>" /></td>
                                                            </tr>
                                                        <tr><td class="col-sm-4 control-label">REMARKS</td>
                                                            <td><input type="text"class="form-control" name="remarks" value="<%=h.remarks %>" /></td>
                                                            </tr>
                                                       
                                                       
                                                        <tr>
                                                     
                                                            
                                                            <td><input type="submit" value="Update" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   <%
                                                   
                                                   } %>
                          </div>
                                                             			</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

</asp:Content>




</asp:Content>
