<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<%@include file="../shared/flows-header.jsp" %>
	
			<div class="container">
			
				<div class="row">
	
		<div class="col-md-offset-2 col-md-8">
		
			<div class="card card-primary" style="width:1000px;">
			
				<div class="card-header" style="text-align:center;">
				
					<h4>Sing Up</h4>
				
				</div>
				
				<div class="card-body">
				
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" id="registerForm"
					modelAttribute="user" method="POST"
					>
					
						<div class="form-group">
					
							<label class="control-label col-md-4" for="firstName">First Name</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="firstName" placeholder="First Name" class="form-control"/>
																
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="lastName">Last Name:</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="lastName" placeholder="Last Name" class="form-control"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="email">Email</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="email" placeholder="abc@xyz.com" class="form-control"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="contactNumber">Contact Number</label>
							
							<div class="col-md-8">
							
								<sf:input type="text" path="contactNumber" placeholder="xxxxxxxxxx" maxlength="10" class="form-control"/>
							
							</div>
						
						</div>
						
						<div class="form-group">
					
							<label class="control-label col-md-4" for="password">Password</label>
							
							<div class="col-md-8">
							
								<sf:input type="password" path="password" class="form-control"/>
								
							</div>
						
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Select Role</label>
							<div class="col-md-8">
								<label class="radio-inline">
									<sf:radiobutton path="role" value="USER" checked="checked"/>User
								</label>
								<label class="radio-inline">
									<sf:radiobutton path="role" value="SUPPLIER"/>Supplier
								</label>
							</div>
						</div>	
						
						<div class="form-group">
					
							<div class="col-md-offset-4 col-md-8">
							
								<center><button type="submit" class="btn btn-primary" name="_eventId_billing">
									Next - Billing <span class="fa fa-angle-right"></span>
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
