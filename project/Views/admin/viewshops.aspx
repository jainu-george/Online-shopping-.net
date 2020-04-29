<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    viewshops
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">SHOW PRODUCTS</h2>
												<div class="graph">
														 <div class="block-page">
						

                                                             
                                                              <%try
      { %>
        <table class="table table-bordered">
            <tr>
                <th>SL NO.</th>
                <th>CUSTOMER NAME</th>
                <th>LOCATION</th>
                <th>EMAIL</th>
                <th>PHONE</th>
                <th>CATEGORY</th>
                <th>USERNAME</th>
 <th>ACTION</th>

            </tr>
            <%
          int i = 0;
          List<shop>shoplist = (List<shop>)ViewData["shoplist"];
          foreach (shop s in shoplist)
          {
              i++;
                     %>
            <tr>
                <td><%=i%></td>
                <td><%=s.custname%></td>
                <td><%=s.location%></td>
                <td><%=s.email%></td>
                <td><%=s.phoneno %></td>
                    <td><%=s.category %></td> 
                <td>
                  <%=Html.ActionLink("delete", "deleteshop", "admin", new { shopid = s.shopid }, new { @class="btn red" })
    %>
  <%=Html.ActionLink("edit", "editshop", "admin", new { shopid = s.shopid }, new { @class = "btn red" })
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
