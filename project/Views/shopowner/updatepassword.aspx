<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    updatepassword
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="custom-widgets">
											
                 <%
                     List<Login> Loginlist = (List<Login>)ViewData["Login"];
                foreach(Login c in Loginlist)
                 {%> 
               
                                                 <% Html.BeginForm("updatepassword", "Shop", FormMethod.Post);%>   
                                                    
                                                    <table>
                                                        <tr>
                                                            <td class="col-sm-4 control-label">Enter password</td>
                                                            <td><input type="text" class="form-control" name="custname" value="<%=c.Password%>"/></td></tr>
                                                            

                                                     
                                                            <tr>
                                                            <td><input type="submit" value="Update" /></td>
                                                        </tr>
                                                    </table>
                                                    
                                                    <% Html.EndForm(); %>
                                                   <%
                                                   
                                                   } %>
                          </div>
</asp:Content>






