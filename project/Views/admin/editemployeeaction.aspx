<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editemployeeaction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage Shop</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
    
											
                 <%
                     List<employee> employeelist = (List<employee>)ViewData["employee"];
                foreach(employee e in employeelist)
                 {%> 
               
                                                 <% Html.BeginForm("editemployeeaction", "Admin", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            
                                                            
                                                            <td class="col-sm-4 control-label">Enter employee name</td>
                                                            <td><input type="text" class="form-control" name="empname" value="<%=e.empname%>"/></td></tr>
                                                            <tr><td><input type="hidden" name="empid" value="<%=e.empid %>" /></td></tr>
                                                            <tr><td class="col-sm-4 control-label">Enter department</td>
                                                                
                                                            <td><input type="text" class="form-control" name="department" value="<%=e.department %>" /></td></tr>
                                                        <tr><td class="col-sm-4 control-label">Enter phoneno</td>
                                                            <td><input type="number" class="form-control" name="phoneno" value="<%=e.phoneno %>" /></td>
                                                           
                                                            
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


