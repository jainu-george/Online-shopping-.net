<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    manageCategory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
 	<div class="outter-wp">
								
      <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage Category</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
												<div class="custom-widgets">
											 
               
                                                 <% Html.BeginForm("saveCategory", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">ENTER CATEGORY NAME</td>
                                                            <td><input type="text" class="form-control" name="catname"   /></td>
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
    
        <table class="table table-bordered">
            <tr>
                <th>SL NO.</th>
                <th>CATEGORY NAME</th>
                <th>ACTION</th>
            </tr>
            <%
                int i = 0;
                List<category> clist = (List<category>)ViewData["clist"];
                foreach(category cc in clist)
                {
                    i++;
                     %>
            <tr>
                <td><%=i %></td>
                <td><%=cc.catname %></td>
                <td>
                  <%=Html.ActionLink("delete","deleteCategory","admin",new{catid=cc.catid}, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editCategory", "admin", new { catid = cc.catid }, new { @class = "btn red" })
    %>

                </td>
            
            <%
            }
             %>
        </table>
                                                                     </div>
  
												 
																										</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									
									</div>

</asp:Content>
