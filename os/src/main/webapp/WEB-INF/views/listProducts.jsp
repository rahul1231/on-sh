<div class="container">

	<div class="row">

		<div class="col-md-3">

			<!-- Would be to display the sidebar -->
			<%@include file="./shared/sidebar.jsp"%>

		</div>

		<div class="col-md-9">

			<!-- Would be to display the actual products -->

			<div class="row">
				<!-- Added breadcrumb component -->
				<div class="col-lg-12">
					<!-- Display only if user click view products -->
					<c:if test="${userClickAllProducts==true}">
					
					<script>
						window.categoryId='';
					</script>
					
						<ol class="breadcrumb">

							<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							<li class="breadcrumb-item">All Products</li>

						</ol>
					</c:if>
					<c:if test="${userClickCategoryProducts==true}">
					
						<script>
							window.categoryId='${category.id}';
						</script>
					
						<ol class="breadcrumb">

							<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							<li class="active breadcrumb-item">Category</li>
							<li class="active breadcrumb-item">${category.name}</li>

						</ol>
					</c:if>

				</div>

			</div>



			<div class="row">

				<div class="col-xs-12">

					<table id="productListTable"
						class="table table-striped table-bordered">

						<thead>

							<tr>

								<th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Qty. Available</th>
								<th style="width:100px;"></th>
								
							</tr>

						</thead>
						
						<tfoot>

							<tr>
								
								<th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Qty. Available</th>
								<th style="width:100px;"></th>
								
							</tr>

						</tfoot>
						
					</table>

				</div>

			</div>

		</div>


	</div>

</div>