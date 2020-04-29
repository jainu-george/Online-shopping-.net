<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    offers
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<div class="outter-wp">
								<!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage offers</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
               
               
                                                 <% Html.BeginForm("Saveoffer", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">OFFER NAME</td>
                                                          
                                                              <td><input type="text" class="form-control" name="offername"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">DESCRIPTION</td>
                                                              <td><input type="text" class="form-control" name="description"/></td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">OFFER TYPE</td>
                                                              <td><input type="text" class="form-control" name="offertype"   /></td>
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
                <th>SL.NO</th>
                <th>OFFER NAME</th>
                <th>DESCRIPTION</th>
                <th>OFFER TYPE</th>
                
                <th>ACTION</th>

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
                  <%=Html.ActionLink("delete", "deleteoffer", "admin", new {offerid=f.offerid}, new { @class="btn red" })
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

