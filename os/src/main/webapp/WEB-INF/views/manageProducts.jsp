<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">
	<c:if test="${not empty message}">
	<div class="col-md-offset-2 col-md-8">
	
		<div class="alert alert-dismissible alert-success">
		
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			${message}
		
		</div>
	
	</div>
	</c:if>
	<div class="row">
	
		<div class="col-md-offset-2 col-md-8">
		
			<div class="card card-primary" style="width:1000px;">
			
				<div class="card-header" style="text-align:center;">
				
					<h4>Product Management</h4>
				
				</div>
				
				<div class="card-body">
				
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product"
					action="${contextRoot}/manage/products" method="POST"
					enctype="multipart/form-data">
					
						<div class="form-group">
					
							<label class="control-label col-md-4" for="name">Enter Product Name:</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" id="name" path="name" placeholder="Product Name" class="form-control"/>
								<sf:errors path="name" cssClass="help-block" element="em"/>
																
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="brand">Enter Brand Name:</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" id="brand" path="brand" placeholder="Brand Name" class="form-control"/>
								<sf:errors path="brand" cssClass="help-block" element="em"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="description">Enter Product Description:</label>
							
							<div class="col-md-8">
							
								<sf:textarea id="description" path="description" placeholder="Product Description" class="form-control"/>
								<sf:errors path="description" cssClass="help-block" element="em"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price:</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" id="unitPrice" path="unitPrice" placeholder="Unit Price" class="form-control"/>
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="quantity">Quantity Available:</label>
							
							<div class="col-md-8">
							
								<sf:input type="number" id="quantity" path="quantity" class="form-control"/>
								<sf:errors path="quantity" cssClass="help-block" element="em"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="file">Select an Image:</label>
							
							<div class="col-md-8">
							
								<sf:input type="file" id="file" path="file" class="form-control"/>
								<sf:errors path="file" cssClass="help-block" element="em"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="categoryId">Select Category:</label>
							
							<sf:select class="form-control" id="categoryId" path="categoryId"
							items="${categories}"
							itemLabel="name"
							itemValue="id"
							/>
							<c:if test="${product.id==0}">
								<div class="text-right">
									<br>
									<button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning btn-xs">Add Category</button>
								</div>
							</c:if>
						
						</div>
						
						<div class="form-group">
					
							<div class="col-md-offset-4 col-md-8">
							
								<input type="submit" name="submit" id="submit" value="Submit" class="form-control"/>
								<sf:hidden path="id"/>
								<sf:hidden path="code"/>
								<sf:hidden path="supplierId"/>
								<sf:hidden path="active"/>
								<sf:hidden path="purchases"/>
								<sf:hidden path="views"/>
								
							</div>
						
						</div>
						
					</sf:form>
				
					
				</div>
			
			</div>
		
		</div>
	
	</div>
	
	<div class="row">
	
		<div class="col-lg-12 col-xs-12">
		
			<h3>Available Products</h3>
		
		</div>
		
		<div class="col-lg-12 col-xs-12">
		
			<div style="overflow:auto">
			
				<table id="adminProductsTable" class="table table-striped table-bordered">
				
					<thead>
					
						<tr>
							<td>ID</td>
							<td>&nbsp;</td>
							<td>Brand</td>
							<td>Name</td>
							<td>Quantity</td>
							<td>Unit Price</td>
							<td>Active</td>
							<td>Edit</td>
						</tr>
					
					</thead>
					
					<tfoot>
					
						<tr>
							<td>ID</td>
							<td>&nbsp;</td>
							<td>Brand</td>
							<td>Name</td>
							<td>Quantity</td>
							<td>Unit Price</td>
							<td>Active</td>
							<td>Edit</td>
						</tr>
					
					</tfoot>
				
				</table>
			
			</div>
		
		</div>
		
	</div>
	
	<div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Add New Category</h4>
				</div>
				<div class="modal-body">
					<!-- Category Form -->
					<sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="category_name" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="category_description" class="control-label col-md-4">Category Description</label>
							<div class="col-md-8">
								<sf:textarea cols="" rows="5" path="description" id="category_description" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" class="btn btn-primary" value="Add Category"/>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br>
</div>