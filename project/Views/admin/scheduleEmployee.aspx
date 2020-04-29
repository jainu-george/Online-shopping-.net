<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    scheduleEmployee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage employees</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
                                                 <% Html.BeginForm("SaveemployeeSchedule", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>

                                                        <tr>

                                                            <td class="col-sm-4 control-label">EMPLOYEE NAME</td>
                                                          
                                                              <td>
                                                                 <select name="empid" class="form-control">
                                                                     <%
                                                                         
                                                                          List<employee>employeelist = (List<employee>)ViewData["employeelist"];
                                                                      foreach (employee e in employeelist)
                                                                      {
                                                                          %>
                                                                     <option value="<%= e.empid %>"><%= e.empname %></option>
                                                                
                                                                     <%} %>
                                                                     
                                                                      </select>
                                                                  
                                                                  
                                                               <tr>
                                                            <td class="col-sm-4 control-label">SHOP</td>
                                                              <td>
                                                                  <select name="shopid"  class="form-control">
                                                                     <%
                                                                         
                                                                         List<shop> shoplist = (List<shop>)ViewData["shop"];
                                                                         foreach (shop s in shoplist)
                                                                          {
                                                                          %>
                                                                     <option value="<%= s.shopid %>"><%= s.custname %></option>
                                                                
                                                                     <%} %>
                                                                      
                                                                  </select> 


                                                              </td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">Date</td>
                                                              <td><input type="text" class="form-control" name="date" placeholder="DD-MM-YYYY"  /></td>
                                                        </tr>
                                                        
                                                         
                                                        
                                                        
                                                        
                                                        <tr>
                                                            <td> 
                                                            </td>
                                                            <td><input type="submit" value="ADD" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   
                          </div>
                                                             <hr />
                                                                                       
                                                                                 

        
        <table class="table table-bordered">
            <tr>
               
                <th>EMPLOYEE NAME</th>
                <th>SHOP</th>
                <th>DATE</th>
                <th>ACTION</th>

            </tr>
         <%
             
             foreach(var q in ViewData.Model)
             {
                 %>
            <tr>
                <td><%= q.Employee.empname %></td>
                 <td><%=q.Shop.custname  %></td>
                 <td><%= q.Employeeschedule.date %></td>
                 <td><a href="../Admin/deleteEmpSchedule?empshid=<%= q.Employeeschedule.scheduleid %>" >Delete</a></td>

            </tr>
            
            <%
             }
             
           
           
            %>
        </table>
  
												 
																								</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>
									


</asp:Content>
