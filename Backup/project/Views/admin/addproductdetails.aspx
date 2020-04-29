<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    addproductdetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">ADD PRODUCT DETAILS</h2>
												<div class="graph">
														 <div class="block-page">
    <form class="form-horizontal" method="post" action="../Admin/Saveproductdetails" enctype='multipart/form-data'>
<fieldset>

<!-- Form Name -->
<legend>Add product details</legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="pname">Product name</label>
  <div class="col-md-4">
    <select id="pname" name="productstockid" class="form-control">
        <% 

       List<productstock>slist = (List<productstock>)ViewData["slist"];
          foreach (productstock ps in slist)
            {
            %>
                     <option value="<%=ps.productstockid%>"><%=ps.pname %></option>

             <%} %>


    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="productcode">Product code</label>  
  <div class="col-md-4">
  <input id="productcode" name="productcode" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price">Price</label>  
  <div class="col-md-4">
  <input id="price" name="price" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="manufacturing_date">Manufacturing date</label>  
  <div class="col-md-4">
  <input id="manufacturing_date" name="manufacturing_date" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="Button1" name="singlebutton" class="btn btn-primary">Submit</button>
  </div>
</div>
</fieldset>
</form>
		</div>
												
										        </div>
											
										</div>
										<!--//graph-visual-->
									</div>
</asp:Content>
