<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editshopaction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

         	<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Edit shop details</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
											
                 
    
											
                 <%
                     List<shop> shoplist = (List<shop>)ViewData["shop"];
                foreach(shop s in shoplist)
                 {%> 
               
                                                 <% Html.BeginForm("editshopaction", "Admin", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">Enter customer name</td>
                                                            <td><input type="text" class="form-control" name="custname" value="<%=s.custname%>"/></td></tr>
                                                            <tr><td><input type="hidden" name="shopid" value="<%=s.shopid %>" /></td></tr>
                                                            <tr><td class="col-sm-4 control-label">Enter location</td>
                                                                
                                                            <td><input type="text" class="form-control"name="location" value="<%=s.location %>" /></td></tr>
                                                        <tr><td class="col-sm-4 control-label">Enter email</td>
                                                            <td><input type="email" class="form-control" name="email" value="<%=s.email %>" /></td>
                                                            <tr><td class="col-sm-4 control-label">Enter phoneno</td>
                                                                <td><input type="text"class="form-control" name="phoneno" value="<%=s.phoneno %>" /></td>
                                                            </tr>
                                                       <tr>
                                                           <td class="col-sm-4 control-label">Enter category</td>
                                                           <td><input type="text"class="form-control" name="category" value="<%=s.category %>" /></td>
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



