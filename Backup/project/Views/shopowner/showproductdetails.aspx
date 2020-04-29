<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shopowner.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    showproductdetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


     <div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">Show product details</h2>
												<div class="graph" style="overflow:auto">
														 <div class="block-page1">
																	
                                                              
                                                                    
                                                                            
            <%
          int i = 0; 
          foreach (var d in ViewData.Model)
          {
              i++;
                     %>

           <div class="col-md-3">
                   <form name="" method="post" action="../shopowner/saveshop_order" >
                                                
               <figure>
<img src="../../Uploads/<%=d.PStock.picture %>" width="200" height="200" />
                   <figcaption><%=d.PStock.pname %></figcaption>
                   <input required class="form-control" placeholder="Qty" type="number" name="qty" />
                   
                   <input type="hidden" name="productcode" value="<%= d.Productdetail.productcode  %>" />
                   <input type="submit" value="ADD" />
               </figure>
               </form>
           </div>


        
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






