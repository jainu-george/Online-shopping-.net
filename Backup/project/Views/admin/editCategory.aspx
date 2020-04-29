<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editCategory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    
					<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Edit category</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">						
                 <%
                List<category> clist = (List<category>)ViewData["clist"];
                foreach(category cc in clist)
                 {%> 
               
                                                 <% Html.BeginForm("editCategoryAction", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td>ENTER CATEGORY NAME</td>
                                                            <td><input type="text" name="catname1" value="<%= cc.catname%>"/></td>
                                                            <td><input type="hidden" name="catid" value="<%=cc.catid %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td> 
                                                            </td>
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
