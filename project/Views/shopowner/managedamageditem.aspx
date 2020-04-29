<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    managedamageditem
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage damaged items</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
               
                                                 <% Html.BeginForm("Savedamageditem", "shopowner", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                       
                                                        <tr>

                                                            <td class="col-sm-4 control-label">CUSTOMER NAME</td>
                                                          
                                                              <td><input type="text" class="form-control" name="custname"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">LOCATION</td>
                                                              <td><input type="text"class="form-control" name="location"/></td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">EMAIL</td>
                                                              <td><input type="email" class="form-control" name="email"   /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">PHONE NO</td>
                                                            <td><input type="number"class="form-control" name="phoneno" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">CATEGORY</td>
                                                            <td><input type="text" class="form-control" name="category" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">USERNAME</td>
                                                            <td><input type="text" class="form-control" name="username" /></td>
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
                <td><%=s.username %></td>
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

</asp:Content>
