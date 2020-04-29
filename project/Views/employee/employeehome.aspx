<%@ Page Title="" Language="C#" MasterPageFile="~/Views/employee.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    employeehome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Your Schedule</h2>
												<div class="graph">
														 <div class="block-page">
															
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






																</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

</asp:Content>





