<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    offers
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="outter-wp">
								<!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">View offers</h2>
												<div class="graph">
														
																	
                                                             	<div class="form-body">
																			
               
               
                                            
                                                                                        
                                                                                 

                                                    
    <%try
      { %>
        <table class="table table-bordered">
            <tr>
                <th>SL.NO</th>
                <th>OFFER NAME</th>
                <th>DESCRIPTION</th>
                <th>OFFER TYPE</th>
                
              

            </tr>
            <%
          int i = 0;
          List<offer> flist = (List<offer>)ViewData["flist"];
          foreach (offer f in flist)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
              
                <td><%=f.offername%></td>
                <td><%=f.description%></td>
                <td><%=f.offertype%></td>
                <td>

 

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
