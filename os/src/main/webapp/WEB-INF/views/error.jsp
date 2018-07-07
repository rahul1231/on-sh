<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta charset="UTF-8">
<meta name="author" content="">

<title>Online Shopping - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/shop-homepage.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="${contextRoot}/home">
					Home</a></div></nav>

				<div class="content">

				<div class="container">

					<div class="row">

						<div class="col-xs-12">

							<div class="jumbotron" style="width:800px;">

								<h1>${errorTitle}</h1>
								<hr/>

								<blockquote>${errorDescription}</blockquote>

							</div>

						</div>

					</div>

				</div>

				</div>

				<!-- Footer -->
				<%@include file="./shared/footer.jsp"%>

				<!-- Bootstrap core JavaScript -->
				<script src="${js}/jquery.min.js"></script>
				<script src="${js}/bootstrap.bundle.min.js"></script>

				<script src="${js}/bootstrap.min.js"></script>

				<!-- Datatable plugin -->
				<script src="${js}/jquery.dataTables.js"></script>


				<!-- Self coded js -->
				<script src="${js}/myapp.js"></script>

			</div>
</body>

</html>
