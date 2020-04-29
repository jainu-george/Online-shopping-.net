<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    changepassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 
<div class="outter-wp">
								<!--custom-widgets-->
												<div class="custom-widgets">
											 <div class="set-1">
																			<div class="col-md-12 graph-2">
																				<h3 class="inner-tittle two">  Change Password </h3>
																					 				<div class="form-body">
																			
               
                                                 <% Html.BeginForm("updatepassword", "employee", FormMethod.Post); %>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">Old password</td>
                                                          
                                                              <td><input type="password" class="form-control" name="oldpassword"/></td></tr>
                                                            <tr>
                                                            <td class="col-sm-4 control-label">New password</td>
                                                              <td><input type="password" class="form-control" name="newpassword"/></td></tr>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">Confirm password</td>
                                                              <td><input type="password" class="form-control" name="confirmpassword"   /></td>
                                                        </tr>
                                                        <tr>
                                                            <td> 
                                                            </td>
                                                            <td><input type="submit" value="submit" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   
                          </div>
                                                                                        </div>
                                                                                 
                                                 </div>
                                                    </div>
    </div>
</asp:Content>
