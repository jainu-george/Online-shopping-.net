<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editproductdetail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

         	<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Edit product details</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
											
                 <%
                     List<productdetail> plist = (List<productdetail>)ViewData["productdetail"];
                foreach(productdetail p in plist)
                 {%> 
               
                                                 <% Html.BeginForm("editproductaction", "Admin", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class ="col-sm-4 control-label">Enter product code</td>
                                                            <td><input type="text"class="form-control" name="productcode" value="<%= p.productcode%>"/></td></tr>
                                                            <tr><td><input type="hidden" name="productid" value="<%=p.productid %>" /></td></tr>
                                                            <tr><td class="col-sm-4 control-label">Enter price</td>
                                                                
                                                            <td><input type="text" class="form-control" name="price" value="<%= p.price %>" /></td></tr>
                                                        <tr><td class="col-sm-4 control-label">Enter manufacturing date</td>
                                                            <td><input type="date"class="form-control" name="manufacturing_date" value="<%= p.manufacturing_date %>" /></td>
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


