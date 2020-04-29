<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    manageemployees
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage employees</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
                                                 <% Html.BeginForm("Saveemployee", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>

                                                        <tr>

                                                            <td class="col-sm-4 control-label">EMPLOYEE NAME</td>
                                                          
                                                              <td><input type="text" class="form-control" name="empname"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">DEPARTMENT</td>
                                                              <td>
                                                                  <select name="department">
                                                                      <option>Sales</option>

                                                                  </select> 


                                                              </td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">PHONE NO</td>
                                                              <td><input type="number" class="form-control" name="phoneno"   /></td>
                                                        </tr>
                                                        
                                                         <tr>
                                                            <td class="col-sm-4 control-label">USERNAME/EMAIL</td>
                                                            <td><input type="email" class="form-control" name="username" /></td>
                                                        </tr>
                                                         <tr>
                                                            <td class="col-sm-4 control-label">PASSWORD</td>
                                                            <td><input type="password" class="form-control" name="password" /></td>
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
              
                <th>EMPLOYEE NAME</th>
                <th>DEPARTMENT</th>
                <th>PHONE NO</th>
                <th>ACTION</th>

            </tr>
            <%
          int i = 0;
          List<employee>employeelist = (List<employee>)ViewData["employeelist"];
          foreach (employee e in employeelist)
          {
              i++;
                     %>
            <tr>
                <td><%=i %></td>
                
                <td><%=e.empname%></td>
                <td><%=e.department%></td>
                <td><%=e.phoneno%></td>
               
                <td>

                  <%=Html.ActionLink("delete", "deleteemployee", "admin", new {empid=e.empid},new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editemployee", "admin", new {empid=e.empid},new { @class="btn red" })
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


