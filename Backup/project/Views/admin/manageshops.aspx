<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    manageshops
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 


    	<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Manage Shop</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             	<div class="form-body">
																			
               
                                                 <% Html.BeginForm("Saveshops", "Admin", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                       
                                                        <tr>

                                                            <td class="col-sm-4 control-label">CUSTOMER NAME</td>
                                                          
                                                              <td><input type="text" class="form-control" name="custname"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">LOCATION</td>
                                                              <td><input type="text"class="form-control" name="location"/></td></tr>
                                                        
                                                        <tr>
                                                            <td class="col-sm-4 control-label">PHONE NO</td>
                                                            <td><input type="text"class="form-control" name="phoneno" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">CATEGORY</td>
                                                            <td>
                                                                <select name="category" class="form-control">
                                                                    <option>Regular</option>
                                                                <option>Premium</option>
                                                                </select>
                                                                
                                                                                                                       </tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">USERNAME/EMAIL</td>
                                                            <td><input type="email" class="form-control" name="username" /></td>
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




																</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>

 


</asp:Content>
