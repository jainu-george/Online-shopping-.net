<%@ Page Title="" Language="C#" MasterPageFile="~/Views/employee.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    shoporder
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Show Orders</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
                                                                     <table class="table-bordered table">
                                                                         <tr>
                                                                             <th>SL NO.</th>
                                                                             <th>DATE</th>
                                                                             <th>SHOP</th>
                                                                              
                                                                             <th>AMOUNT</th>
                                                                             <th>STATUS</th>
                                                                             <th>ACTION</th>
                                                                             
                                                                         </tr>
                                                                            
            <%
          int i = 0;
          int toatal = 0;
          foreach (var d in ViewData.Model)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                  <td><%=d.Shoporder.date.ToShortDateString() %></td>
            <td><%=d.Shop.custname  %><br />
                       <%= d.Shop.location %><br />
                    <span class="glyphicon glyphicon-phone"></span>  
                    <%= d.Shop.phoneno %>


                 </td>
                <td><%=d.Shoporder.total_amount%></td>
                <td><%=d.Shoporder.status %></td> 
   <td>
       <a class="btn red btn-xs" href="../employee/showorderitems?shoporderid=<%=d.Shoporder.shoporderid %>">Show OrderItems</a>
<a class="btn red btn-xs" href="../employee/setdelivery?shoporderid=<%=d.Shoporder.shoporderid %>">Set Develivered</a>


   </td>
               
             
            </tr>
            <%
             }

   
             %>
               
</div>

																</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

 

</asp:Content>
