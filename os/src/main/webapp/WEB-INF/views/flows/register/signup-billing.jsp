<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<%@include file="../shared/flows-header.jsp" %>
	
	<div class="container">
			
		<div class="row">
	
		<div class="col-md-offset-6 col-md-3">
		
			<div class="card card-primary" style="width:1000px;">
			
				<div class="card-header" style="text-align:center;">
				
					<h4>Sing Up - Address</h4>
				
				</div>
				
				<div class="card-body">
				
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" id="billingForm"
					modelAttribute="billing"
					 method="POST"
					>
					
						<div class="form-group">
					
							<label class="control-label col-md-4" for="addressLineOne">Address Line One</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="addressLineOne" placeholder="Enter Address Line One" class="form-control"/>
																
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="addressLineTwo">Address Line Two</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="addressLineTwo" placeholder="Enter Address Line Two" class="form-control"/>
																
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="city">City</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="city" placeholder="Enter City Name" class="form-control"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="postalCode">Postal Code</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="postalCode" placeholder="XXXXXX" class="form-control"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="state">State</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="state" placeholder="Enter State Name" class="form-control"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="country">Country</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="country" placeholder="Enter Country Name" class="form-control"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<div class="col-md-offset-4 col-md-8">
							
								<center><button type="submit" class="btn btn-primary" name="_eventId_personal">
									<span class="fa fa-angle-left"></span>Previous - Personal 
								</button></center>
								<center><button type="submit" class="btn btn-primary" name="_eventId_confirm">
									Next - Confirm <span class="fa fa-angle-right"></span>
								</button></center>
								
							</div>
						
						</div>
						
					</sf:form>
				
					
				</div>
			
			</div>
		
		</div>
	
	</div>
				<br><br><br>
			</div>
	
<%@include file="../shared/flows-footer.jsp" %>

</body>

</html>
