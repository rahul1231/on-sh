<%@include file="../shared/flows-header.jsp" %>
	
		<div class="row">
	
		<div class="col-sm-6">
		
			<div class="card card-primary" style="width:1000px;">
			
				<div class="card-header" style="text-align:center;">
				
					<h4>Personal Details</h4>
				
				</div>
				
				<div class="card-body">
					
					<!-- code to  display the personal details -->
				
					
				</div>
				
				<div class="card-footer">
					
					<!-- anchor to move to the edit of personal details -->
					<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
					
				</div>
				
			</div>
		
		</div>
		
		<div class="col-sm-6">
		
			<div class="card card-primary" style="width:1000px;">
			
				<div class="card-header" style="text-align:center;">
				
					<h4>Billing Address</h4>
				
				</div>
				
				<div class="card-body">
					
					<!-- code to  display the communication address -->
				
					
				</div>
				
				<div class="card-footer">
					
					<!-- anchor to move to the edit of address -->
					<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
					
				</div>
				
			</div>
		
		</div>
		
		<!-- to provide the confirm button after displaying the details -->
		<div class="row">
			
			<div class="col-sm-4 col-sm-offset-4 col-lg-offset-4">
			
				<div class="confirmPosition">
					<a href="${flowExecutionUrl}&_eventId_success" class="btn btn-primary">Confirm</a>
				</div>
			
			</div>
		
		</div>
	
	</div>
	
<%@include file="../shared/flows-footer.jsp" %>

</body>

</html>
