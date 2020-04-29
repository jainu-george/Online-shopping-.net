<%@ Page Title="" Language="C#" MasterPageFile="~/Views/admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="project.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AddProductStock
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="outter-wp"> 
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
											<h2 class="inner-tittle">ADD PRODUCTS</h2>
												<div class="graph">
														 <div class="block-page">
																	
                                                             <form class="form-horizontal" method="post" action="../Admin/SaveProductStock" enctype='multipart/form-data'>
<fieldset>

<!-- Form Name -->
<legend>ADD PRODUCT</legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="catid">Category</label>
  <div class="col-md-4">
    <select id="catid" name="catid" class="form-control">
     <%
         List<category> clist = (List<category>)ViewData["clist"];
                foreach(category cc in clist)
                {
             %>

             <option value="<%=cc.catid %>"><%= cc.catname %></option>

             <%} %>



    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="txtpname">Product Name</label>  
  <div class="col-md-4">
  <input id="txtpname" name="txtpname" type="text" placeholder="Enter Product Name" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="description">Description</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="description" name="description">default text</textarea>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="picture">Picture</label>
  <div class="col-md-4">
    <input id="picture" name="picture" class="input-file" type="file">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price">Quantity</label>  
  <div class="col-md-4">
  <input id="qty" name="qty" type="text" placeholder="" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button -->
<div class="form-group"> 
  <div class="col-md-4">
    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">Add</button>
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
