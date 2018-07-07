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
							
								<sf:textarea id="description" path="description" class="form-control"/>
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
								
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="categoryId">Select Category:</label>
							
							<sf:select class="form-control" id="categoryId" path="categoryId"
							items="${categories}"
							itemLabel="name"
							itemValue="id"
							/>
						
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
	<br><br><br><br><br><br><br>
</div>