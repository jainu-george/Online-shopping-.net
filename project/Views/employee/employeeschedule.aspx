<%@ Page Title="" Language="C#" MasterPageFile="~/Views/employee.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    employeeschedule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="outter-wp">
								<!--custom-widgets-->
												<div class="custom-widgets">
											 <div class="set-1">
																			<div class="col-md-12 graph-2">
																				<h3 class="inner-tittle two"> Employee Schedules </h3>
																					 				<div class="form-body">
																			
                                    
    <%try
      { %>
        <table class="table table-bordered">
           <tr>
               
                <th>EMPLOYEE NAME</th>
                <th>SHOP</th>
                <th>DATE</th> 

            </tr>
         <%
             
             foreach(var q in ViewData.Model)
             {
                 %>
            <tr>
                <td><%= q.Employee.empname %>
                  

                </td>
                 <td><%=q.Shop.custname  %><br />
                       <%= q.Shop.location %><br />
                    <span class="glyphicon glyphicon-phone"></span>  
                    <%= q.Shop.phoneno %>


                 </td>
                 <td><%= q.Employeeschedule.date.ToShortDateString() %></td>
                
            </tr>
            
            <%
          }

      }
      catch (Exception e)
      {
      }
             %>
        </table>
  
												 
										<!--//outer-wp-->
									</div>

</asp:Content>


