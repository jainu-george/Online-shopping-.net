<%@ Page Title="" Language="C#" MasterPageFile="~/Views/employee.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    editscheduleAction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>editscheduleAction</h2>
       <div class="custom-widgets">
											
                 <%
                     List<employeeschedule> emplist = (List<employeeschedule>)ViewData["employeeschedule"];
                foreach(employeeschedule e in emplist)
                 {%> 
               
                                                 <% Html.BeginForm("editscheduleAction", "employee", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class ="col-sm-4 control-label">Enter empid</td>
                                                            <td><input type="number"class="form-control" name="empid" value="<%= e.empid%>"/></td></tr>
                                                            <tr><td><input type="hidden" name="scheduleid" value="<%=e.scheduleid %>" /></td></tr>
                                                            <tr><td class="col-sm-4 control-label">Enter date</td>
                                                                
                                                            <td><input type="date" class="form-control" name="date" value="<%= e.date %>" /></td></tr>
                                                        <tr><td class="col-sm-4 control-label">Enter shopid</td>
                                                            <td><input type="number"class="form-control" name="shopid" value="<%=e.shopid %>" /></td>
                                                            </tr>
                                                       
                                                        <tr>
                                                     
                                                            
                                                            <td><input type="submit" value="Update" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   <%
                                                   
                                                   } %>
                          </div>
</asp:Content>

